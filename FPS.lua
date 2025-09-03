local coregui = game:GetService("CoreGui")
local runservice = game:GetService("RunService")
local stats = game:GetService("Stats")
local textservice = game:GetService("TextService")
local tweenservice = game:GetService("TweenService")
local userinputservice = game:GetService("UserInputService")

local padding = 8
local min_size = 15
local text_size = 18

local fps_box = nil

local function addfpsbox()
    if fps_box then return end

    local screengui = Instance.new("ScreenGui")
    screengui.IgnoreGuiInset = false
    screengui.ResetOnSpawn = false
    screengui.Name = "fps_screengui"
    screengui.Parent = coregui

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0,220,0,120)
    frame.Position = UDim2.new(0,0,0,0)
    frame.AnchorPoint = Vector2.new(0,0)
    frame.BackgroundColor3 = Color3.fromRGB(255,255,255)
    frame.Active = true
    frame.Parent = screengui

    local uicorner = Instance.new("UICorner")
    uicorner.CornerRadius = UDim.new(0,10)
    uicorner.Parent = frame

    local gradient = Instance.new("UIGradient")
    gradient.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(45,45,45)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15,15,15))
    }
    gradient.Rotation = 0
    gradient.Parent = frame

    local uiscale = Instance.new("UIScale")
    uiscale.Scale = 1
    uiscale.Parent = frame

    local uistroke = Instance.new("UIStroke")
    uistroke.Color = Color3.fromRGB(255,255,255)
    uistroke.Transparency = 0.5
    uistroke.Thickness = 2
    uistroke.Parent = frame

    local strokegradient = Instance.new("UIGradient")
    strokegradient.Color = gradient.Color
    strokegradient.Rotation = 45
    strokegradient.Parent = uistroke

    local statslabel = Instance.new("TextLabel")
    statslabel.AnchorPoint = Vector2.new(0,0)
    statslabel.Position = UDim2.new(0,padding,0,padding)
    statslabel.BackgroundTransparency = 1
    statslabel.RichText = true
    statslabel.TextWrapped = false
    statslabel.TextScaled = false
    statslabel.TextXAlignment = Enum.TextXAlignment.Left
    statslabel.TextYAlignment = Enum.TextYAlignment.Top
    statslabel.Font = Enum.Font.SourceSansLight
    statslabel.TextSize = text_size
    statslabel.TextColor3 = Color3.fromRGB(255,255,255)
    statslabel.Parent = frame

    local dragging = false
    local drag_start = Vector2.new()
    local start_pos = UDim2.new()
    local drag_input

    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            drag_start = input.Position
            start_pos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                    local corners = {
                        UDim2.new(0,0,0,0),
                        UDim2.new(0.82,0,0,0),
                        UDim2.new(0,0,0.45,0),
                        UDim2.new(0.82,0,0.45,0)
                    }
                    local snap_distance = 20
                    for _, corner in ipairs(corners) do
                        local corner_pos = Vector2.new(
                            corner.X.Scale * screengui.AbsoluteSize.X + corner.X.Offset,
                            corner.Y.Scale * screengui.AbsoluteSize.Y + corner.Y.Offset
                        )
                        local frame_pos = Vector2.new(
                            frame.Position.X.Scale * screengui.AbsoluteSize.X + frame.Position.X.Offset,
                            frame.Position.Y.Scale * screengui.AbsoluteSize.Y + frame.Position.Y.Offset
                        )
                        if (frame_pos - corner_pos).Magnitude <= snap_distance then
                            tweenservice:Create(frame,TweenInfo.new(0.2,Enum.EasingStyle.Quad),{Position=corner}):Play()
                            break
                        end
                    end
                end
            end)
        end
    end)

    frame.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            drag_input = input
        end
    end)

    userinputservice.InputChanged:Connect(function(input)
        if dragging and input == drag_input then
            local delta = input.Position - drag_start
            frame.Position = UDim2.new(
                start_pos.X.Scale,
                start_pos.X.Offset + delta.X,
                start_pos.Y.Scale,
                start_pos.Y.Offset + delta.Y
            )
        end
    end)

    local frame_count = 0
    local fps = 0
    local last_fps_time = tick()
    runservice.RenderStepped:Connect(function()
        frame_count = frame_count + 1
    end)

    local hb_sum = 0
    local hb_count = 0
    runservice.Heartbeat:Connect(function(dt)
        hb_sum = hb_sum + dt
        hb_count = hb_count + 1
    end)

    local function get_color(value,type_str)
        if type_str=="FPS" then
            if value>=60 then return "0,255,0"
            elseif value>=30 then return "255,255,0"
            elseif value>=12 then return "255,165,0"
            else return "255,0,0" end
        elseif type_str=="Ping" then
            if value<50 then return "0,255,0"
            elseif value<=150 then return "255,255,0"
            else return "255,0,0" end
        elseif type_str=="Memory" then
            if value<500 then return "0,255,0"
            elseif value<=1000 then return "255,255,0"
            else return "255,0,0" end
        elseif type_str=="CPU" then
            if value<40 then return "0,255,0"
            elseif value<=70 then return "255,255,0"
            else return "255,0,0" end
        elseif type_str=="GPU" then
            if value<40 then return "0,255,0"
            elseif value<=70 then return "255,255,0"
            else return "255,0,0" end
        end
        return "255,255,255"
    end

    local function to_percent(val)
        if not val then return 0 end
        if type(val)~="number" then return 0 end
        if val>=0 and val<=1 then return val*100 else return val end
    end

    local function autosize_and_set_text(rich_text,plain_lines)
        local max_w=0
        local total_h=0
        for i,line in ipairs(plain_lines) do
            local size=textservice:GetTextSize(line,text_size,statslabel.Font,Vector2.new(2000,2000))
            if size.X>max_w then max_w=size.X end
            total_h=total_h+size.Y
        end
        total_h=total_h+(#plain_lines-1)*2
        local final_w=math.max(math.ceil(max_w)+padding*2,min_size)
        local final_h=math.max(math.ceil(total_h)+padding*2,min_size)
        statslabel.Size=UDim2.new(0,math.max(0,math.ceil(max_w)),0,math.ceil(total_h))
        frame.Size=UDim2.new(0,final_w,0,final_h)
        statslabel.Text=rich_text
    end

    spawn(function()
        while fps_box do
            wait(1)
            local now=tick()
            local dt=now-last_fps_time
            if dt>0 then fps=math.floor(frame_count/dt+0.5) else fps=0 end
            frame_count=0
            last_fps_time=now

            local ping=0
            pcall(function()
                local item=stats.Network and stats.Network.ServerStatsItem and stats.Network.ServerStatsItem["Data Ping"]
                if item then
                    local val=item:GetValue()
                    if type(val)=="number" then ping=math.floor(val+0.5) end
                end
            end)

            local memory=0
            pcall(function()
                local ok,mval=pcall(function() return stats:GetTotalMemoryUsageMb() end)
                if ok and type(mval)=="number" then memory=math.floor(mval+0.5) end
            end)

            local cpu_percent=0
            local gpu_percent=0
            pcall(function()
                local perf=stats.PerformanceStats
                if perf then
                    local raw_cpu=perf.CPU or perf.CPUPercent or perf.CPUUsage or perf.CPUTime
                    local raw_gpu=perf.GPU or perf.GPUPercent or perf.GPUUsage or perf.GPUTime
                    if raw_cpu and type(raw_cpu)=="number" then cpu_percent=math.floor(to_percent(raw_cpu)+0.5) end
                    if raw_gpu and type(raw_gpu)=="number" then gpu_percent=math.floor(to_percent(raw_gpu)+0.5) end
                end
            end)

            if cpu_percent==0 then
                local avg_dt=0
                if hb_count>0 then avg_dt=hb_sum/math.max(hb_count,1) end
                hb_sum=0
                hb_count=0
                local baseline=1/60
                cpu_percent=math.floor(math.clamp((avg_dt/baseline)*100,0,100)+0.5)
            end

            if gpu_percent==0 then
                if fps>0 then gpu_percent=math.floor(math.clamp((1-math.min(fps/120,1))*100,0,100)+0.5) else gpu_percent=0 end
            end

            local fps_color=get_color(fps,"FPS")
            local ping_color=get_color(ping,"Ping")
            local mem_color=get_color(memory,"Memory")
            local cpu_color=get_color(cpu_percent,"CPU")
            local gpu_color=get_color(gpu_percent,"GPU")

            local rich_text=
                "<font color='rgb(255,255,255)'>FPS: </font><u><font color='rgb("..fps_color..")'>"..fps.." frames/sec</font></u>\n"..
                "<font color='rgb(255,255,255)'>Ping: </font><u><font color='rgb("..ping_color..")'>"..ping.." ms</font></u>\n"..
                "<font color='rgb(255,255,255)'>Memory: </font><u><font color='rgb("..mem_color..")'>"..memory.." MB used</font></u>\n"..
                "<font color='rgb(255,255,255)'>CPU: </font><u><font color='rgb("..cpu_color..")'>"..cpu_percent.."%%</font></u>\n"..
                "<font color='rgb(255,255,255)'>GPU: </font><u><font color='rgb("..gpu_color..")'>"..gpu_percent.."%%</font></u>"

            local plain_lines={
                "FPS: "..fps.." frames/sec",
                "Ping: "..ping.." ms",
                "Memory: "..memory.." MB used",
                "CPU: "..cpu_percent.."%", 
                "GPU: "..gpu_percent.."%"
            }

            autosize_and_set_text(rich_text,plain_lines)
        end
    end)

    fps_box = screengui
end

local function removefpsbox()
    if fps_box then
        fps_box:Destroy()
        fps_box = nil
    end
end

return {
    AddFPSBox = addfpsbox,
    RemoveFPSBox = removefpsbox
}
end
