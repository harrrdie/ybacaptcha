getgenv().AutoCaptcha = true

repeat task.wait() until game:IsLoaded()
-- wait for the game be loaded

local plr = game:GetService("Players").LocalPlayer

repeat task.wait() until plr:FindFirstChildOfClass("PlayerGui")
-- wait for the PlayerGui gui to exist
local plrgGui = plr.PlayerGui

local function bypass(new)
    print("bypassing")
    for i,v in next, new:GetDescendants() do
        if v:IsA("ImageButton") then
            local text = v:FindFirstChildOfClass("TextLabel")
            if text and text.Text ~= "X" then
                warn(v)
                print(text.TextColor3)
                repeat
                    task.wait()
                until text.TextColor3 ~= Color3.fromRGB(255,255,255)
                warn("after :", text.TextColor3)
                if text.TextColor3 == Color3.fromRGB(0, 255, 0) then -- its god
                    print("Good : " .. text.Text .."\n")
                    firesignal(v.MouseEnter) -- it require this one
                    firesignal(v.MouseButton1Up)
                    firesignal(v.MouseButton1Click)
                    firesignal(v.Activated)

                elseif text.TextColor3 == Color3.fromRGB(255, 0, 0) then -- its a bad
                    warn("Bad : " .. text.Text .."\n")
                end
            end
        end
    end
end

plrgGui.ChildAdded:Connect(function(new)
    if not getgenv().AutoCaptcha then return end
    if new:IsA("ScreenGui")
    and new.Name == "ScreenGui" and new.DisplayOrder == 100 then
        print("New captcha incoming")
        bypass(new)
    end
end)

warn("executed")
