local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local StarterGui = game:GetService("StarterGui")

local plr = Players.LocalPlayer
local flying = false
local speed = 50
local bv, bg

-- GUI
local gui = Instance.new("ScreenGui", game.CoreGui)

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,200,0,140)
frame.Position = UDim2.new(0.15,0,0.75,0)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.Active = true
frame.Draggable = true

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1,0,0,30)
title.BackgroundColor3 = Color3.fromRGB(80,0,150)
title.Text = "Fly GUI"
title.TextColor3 = Color3.new(1,1,1)
title.TextSize = 22

local flyBtn = Instance.new("TextButton", frame)
flyBtn.Size = UDim2.new(0.8,0,0,35)
flyBtn.Position = UDim2.new(0.1,0,0.3,0)
flyBtn.Text = "Toggle Fly"
flyBtn.BackgroundColor3 = Color3.fromRGB(80,0,150)
flyBtn.TextColor3 = Color3.new(1,1,1)
flyBtn.TextSize = 20

local subBtn = Instance.new("TextButton", frame)
subBtn.Size = UDim2.new(0.8,0,0,30)
subBtn.Position = UDim2.new(0.1,0,0.65,0)
subBtn.Text = "Sub To Dev"
subBtn.BackgroundColor3 = Color3.fromRGB(60,0,120)
subBtn.TextColor3 = Color3.new(1,1,1)
subBtn.TextSize = 18

-- Fly Function
local function startFly()
    local char = plr.Character
    local hrp = char:WaitForChild("HumanoidRootPart")

    bv = Instance.new("BodyVelocity", hrp)
    bv.MaxForce = Vector3.new(1e9,1e9,1e9)
    bv.Velocity = Vector3.new(0,0,0)

    bg = Instance.new("BodyGyro", hrp)
    bg.MaxTorque = Vector3.new(1e9,1e9,1e9)
    bg.CFrame = hrp.CFrame

    flying = true

    game:GetService("RunService").RenderStepped:Connect(function()
        if flying then
            local cam = workspace.CurrentCamera
            bv.Velocity = cam.CFrame.LookVector * speed
            bg.CFrame = cam.CFrame
        end
    end)
end

local function stopFly()
    flying = false
    if bv then bv:Destroy() end
    if bg then bg:Destroy() end
end

flyBtn.MouseButton1Click:Connect(function()
    if not flying then
        startFly()
    else
        stopFly()
    end
end)

-- Sub Button
subBtn.MouseButton1Click:Connect(function()
    setclipboard("https://youtube.com/@chobietsuatienguoi")
    StarterGui:SetCore("SendNotification",{
        Title = "Thông báo",
        Text = "copied link!",
        Duration = 3
    })
end)
