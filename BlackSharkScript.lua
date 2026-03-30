-- ================================================
-- BLACK SHARK V3 - ULTIMATE EDITION
-- Copyright © 2026 DhaaankMK - Todos os direitos reservados.
-- 
-- Este script é PROIBIDA a redistribuição sem créditos,
-- venda, modificação ou republicação sem autorização expressa.
-- Qualquer violação será rastreada e denunciada.
-- ================================================

local Players        = game:GetService("Players")
local RunService     = game:GetService("RunService")
local UIS            = game:GetService("UserInputService")
local TweenService   = game:GetService("TweenService")
local Lighting       = game:GetService("Lighting")
local HttpService    = game:GetService("HttpService")
local SoundService   = game:GetService("SoundService")
local Camera         = workspace.CurrentCamera
local LocalPlayer    = Players.LocalPlayer

--====================================
-- CONFIGURAÇÃO GLOBAL
--====================================

local Config = {
    -- ESP
    ESPEnabled        = false,
    Boxes             = true,
    BoxStyle          = "Full",     -- "Full" | "Corner"
    FilledBox         = false,
    FilledBoxAlpha    = 0.15,
    Names             = true,
    Distance          = true,
    Tracers           = false,
    TracerOrigin      = "Bottom",   -- "Bottom" | "Center" | "Top"
    HealthBars        = true,
    ShowHPText        = false,
    Skeleton          = false,
    TeamCheck         = false,
    VisibleOnly       = false,
    BoxColor          = Color3.fromRGB(255, 0, 0),
    TeamColor         = false,
    ChamsEnabled      = false,
    HighlightEnabled  = false,
    ShowTools         = true,
    ShowHead          = true,
    ShowLookDirection = false,
    ShowTeamName      = false,
    OffscreenArrows   = false,
    MaxESPDist        = 1000,
    ESPFontSize       = 14,
    ESPTransparency   = 0.3,
    ItemESP           = false,
    ItemESPRange      = 200,

    -- Combat
    Aimbot            = false,
    AimbotFOV         = 200,
    AimbotSmoothing   = 100,  -- slider 0-100 (real = valor/1000); 100 = suavização 0.1
    dummy_cv          = 35,   -- volume interno do clique (não remover)
    AimbotTarget      = "Head",     -- Head | Torso | Random
    AimbotPriority    = "Distance", -- Distance | Health
    SilentAim         = false,
    TriggerBot        = false,
    PredictMovement   = false,
    IgnoreWalls       = false,
    AutoShoot         = false,
    RapidFire         = false,
    NoRecoil          = false,
    HitboxExpander    = false,
    HitboxSize        = 5,

    -- Player
    WalkSpeed         = 16,
    JumpPower         = 50,
    InfiniteJump      = false,
    NoClip            = false,
    Fly               = false,
    FlySpeed          = 50,
    God               = false,
    AntiRagdoll       = false,
    AntiSlowdown      = false,
    AntiKnockback     = false,
    PlatformEnabled   = false,
    SuperJump         = false,
    Invisible         = false,
    AutoRespawn       = false,

    -- Visual
    Fullbright        = false,
    RemoveFog         = false,
    Crosshair         = false,
    FOVCircle         = false,
    RainbowMode       = false,
    FPSBoost          = false,
    NightMode         = false,
    WireframeMode     = false,
    ShowFPS           = true,
    ShowPing          = true,
    CustomHUD         = false,

    -- Teleport
    ClickTP           = false,
    TeleportType      = "Instant",
    SavedPositions    = {},

    -- Server
    AntiKick          = false,
    AntiVoid          = false,
    ChatSpam          = false,
    ChatSpamMessage   = "Test",

    -- Misc
    SpinBot           = false,
    AntiAFK           = true,
    BTools            = false,
    ClickDelete       = false,
    RemotesSpy        = false,
    AutoClicker       = false,
    AutoClickerCPS    = 10,
    SoundOnClick      = true,

    -- Theme
    CurrentTheme      = "Dark",  -- Dark | Neon | Light

    -- Performance
    OptimizedESP      = true,
}

--====================================
-- TEMAS
--====================================

local Themes = {
    Dark = {
        BG         = Color3.fromRGB(10, 10, 12),
        TitleBG    = Color3.fromRGB(15, 15, 18),
        TabBG      = Color3.fromRGB(15, 15, 18),
        ItemBG     = Color3.fromRGB(20, 20, 25),
        Accent     = Color3.fromRGB(0, 200, 255),
        Accent2    = Color3.fromRGB(180, 50, 220),
        Text       = Color3.fromRGB(230, 230, 230),
        SubText    = Color3.fromRGB(160, 160, 160),
        Hover      = Color3.fromRGB(40, 40, 50),
        Border     = Color3.fromRGB(0, 255, 255),
        SliderFill = Color3.fromRGB(0, 200, 255),
        ToggleOn   = Color3.fromRGB(50, 210, 100),
        ToggleOff  = Color3.fromRGB(50, 50, 60),
    },
    Neon = {
        BG         = Color3.fromRGB(5, 0, 15),
        TitleBG    = Color3.fromRGB(10, 5, 25),
        TabBG      = Color3.fromRGB(10, 5, 25),
        ItemBG     = Color3.fromRGB(20, 5, 40),
        Accent     = Color3.fromRGB(255, 0, 220),
        Accent2    = Color3.fromRGB(0, 255, 200),
        Text       = Color3.fromRGB(255, 220, 255),
        SubText    = Color3.fromRGB(200, 150, 220),
        Hover      = Color3.fromRGB(50, 10, 80),
        Border     = Color3.fromRGB(255, 0, 255),
        SliderFill = Color3.fromRGB(255, 0, 220),
        ToggleOn   = Color3.fromRGB(255, 0, 200),
        ToggleOff  = Color3.fromRGB(60, 10, 80),
    },
    Light = {
        BG         = Color3.fromRGB(230, 235, 245),
        TitleBG    = Color3.fromRGB(200, 210, 230),
        TabBG      = Color3.fromRGB(210, 215, 230),
        ItemBG     = Color3.fromRGB(240, 242, 250),
        Accent     = Color3.fromRGB(30, 100, 220),
        Accent2    = Color3.fromRGB(150, 30, 200),
        Text       = Color3.fromRGB(20, 20, 40),
        SubText    = Color3.fromRGB(80, 80, 120),
        Hover      = Color3.fromRGB(190, 200, 220),
        Border     = Color3.fromRGB(30, 100, 220),
        SliderFill = Color3.fromRGB(30, 100, 220),
        ToggleOn   = Color3.fromRGB(30, 180, 80),
        ToggleOff  = Color3.fromRGB(160, 160, 180),
    },
}

local function T() return Themes[Config.CurrentTheme] end

--====================================
-- VARIÁVEIS DE CONTROLE
--====================================

local ESPObjects       = {}
local FOVCircle        = Drawing.new("Circle")
local Crosshair        = {}
local FlyConnection
local NoClipConnection
local SpinBotConnection
local AimbotConnection
local AutoClickerConn
local ItemESPObjects   = {}
local HUDObjects       = {}

local ChamsFolder = Instance.new("Folder")
ChamsFolder.Name = "BSv3_Chams"
ChamsFolder.Parent = game.CoreGui

local HighlightCache  = {}
local SavedPositions  = {}
local PlatformPart    = nil
local AntiVoidPart    = nil
local WireframeParts  = {}

--====================================
-- SISTEMA DE LOGS
--====================================

local LogSystem = { Logs = {} }

function LogSystem:Add(text, logType)
    local entry = {
        Text = text,
        Type = logType or "Info",
        Time = os.date("%H:%M:%S"),
    }
    table.insert(self.Logs, entry)
    if #self.Logs > 200 then table.remove(self.Logs, 1) end
end

--====================================
-- SISTEMA DE SONS
--====================================

local ClickSound = Instance.new("Sound")
ClickSound.SoundId = "rbxassetid://6042053626"
ClickSound.Volume   = 0.35
ClickSound.Parent   = SoundService

local NotifySound = Instance.new("Sound")
NotifySound.SoundId = "rbxassetid://5982466487"
NotifySound.Volume   = 0.3
NotifySound.Parent   = SoundService

local function PlayClick()
    if Config.SoundOnClick then
        ClickSound:Play()
    end
end

--====================================
-- SISTEMA DE ESTATÍSTICAS
--====================================

local Stats = {
    StartTime = tick(),
    Kills     = 0,
    Deaths    = 0,
    Teleports = 0,
    Collected = 0,
}

function Stats:Uptime()
    local u = tick() - self.StartTime
    return string.format("%02d:%02d:%02d",
        math.floor(u/3600),
        math.floor((u%3600)/60),
        math.floor(u%60)
    )
end

--====================================
-- NOTIFICAÇÕES
--====================================

local NotifyGui = Instance.new("ScreenGui")
NotifyGui.Name = "BSv3_Notifications"
NotifyGui.ResetOnSpawn = false
NotifyGui.IgnoreGuiInset = true
NotifyGui.Parent = game.CoreGui

local NotifyContainer = Instance.new("Frame")
NotifyContainer.Size = UDim2.new(0, 280, 1, 0)
NotifyContainer.Position = UDim2.new(1, -295, 0, 0)
NotifyContainer.BackgroundTransparency = 1
NotifyContainer.Parent = NotifyGui

local NotifyLayout = Instance.new("UIListLayout")
NotifyLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifyLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifyLayout.Padding = UDim.new(0, 6)
NotifyLayout.Parent = NotifyContainer

local notifyCount = 0

local function Notify(message, duration, notifType)
    notifType   = notifType or "Info"
    duration    = duration or 3
    notifyCount = notifyCount + 1
    NotifySound:Play()

    local colors = {
        Info    = Color3.fromRGB(0, 180, 255),
        Success = Color3.fromRGB(50, 200, 80),
        Warning = Color3.fromRGB(255, 180, 0),
        Error   = Color3.fromRGB(255, 60, 60),
    }
    local icons = { Info = "ℹ️", Success = "✅", Warning = "⚠️", Error = "❌" }
    local accentColor = colors[notifType] or colors.Info

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 0, 0)
    frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
    frame.ClipsDescendants = true
    frame.LayoutOrder = -notifyCount
    frame.Parent = NotifyContainer

    local fCorner = Instance.new("UICorner")
    fCorner.CornerRadius = UDim.new(0, 10)
    fCorner.Parent = frame

    local fStroke = Instance.new("UIStroke")
    fStroke.Color = accentColor
    fStroke.Thickness = 1.5
    fStroke.Transparency = 0.3
    fStroke.Parent = frame

    local bar = Instance.new("Frame")
    bar.Size = UDim2.new(0, 4, 1, 0)
    bar.BackgroundColor3 = accentColor
    bar.BorderSizePixel = 0
    bar.Parent = frame

    local barCorner = Instance.new("UICorner")
    barCorner.CornerRadius = UDim.new(0, 4)
    barCorner.Parent = bar

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -20, 1, 0)
    lbl.Position = UDim2.new(0, 16, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = (icons[notifType] or "ℹ️") .. "  " .. message
    lbl.TextColor3 = Color3.fromRGB(230, 230, 230)
    lbl.Font = Enum.Font.GothamBold
    lbl.TextSize = 13
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.TextWrapped = true
    lbl.Parent = frame

    local timer = Instance.new("Frame")
    timer.Size = UDim2.new(1, 0, 0, 3)
    timer.Position = UDim2.new(0, 0, 1, -3)
    timer.BackgroundColor3 = accentColor
    timer.BorderSizePixel = 0
    timer.Parent = frame

    local timerCorner = Instance.new("UICorner")
    timerCorner.CornerRadius = UDim.new(0, 2)
    timerCorner.Parent = timer

    -- Expand animation
    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
        Size = UDim2.new(1, 0, 0, 50)
    }):Play()

    -- Progress bar shrink
    task.delay(0.3, function()
        TweenService:Create(timer, TweenInfo.new(duration, Enum.EasingStyle.Linear), {
            Size = UDim2.new(0, 0, 0, 3)
        }):Play()
    end)

    -- Dismiss
    task.delay(duration + 0.3, function()
        TweenService:Create(frame, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
            Size = UDim2.new(1, 0, 0, 0),
            BackgroundTransparency = 1
        }):Play()
        task.delay(0.3, function() frame:Destroy() end)
    end)

    LogSystem:Add(message, notifType)
end

--====================================
-- FUNÇÕES ESP
--====================================

local function CreateBox()
    -- Corner box lines (8 = 4 corners × 2 lines each)
    local corners = {}
    for i = 1, 8 do
        local l = Drawing.new("Line")
        l.Thickness = 2
        l.Visible   = false
        corners[i]  = l
    end

    -- Skeleton bone lines (14 bones)
    local bones = {}
    for i = 1, 14 do
        local l = Drawing.new("Line")
        l.Thickness = 1
        l.Visible   = false
        l.Color     = Color3.fromRGB(255, 255, 255)
        bones[i]    = l
    end

    local box = {
        Square          = Drawing.new("Square"),
        FilledBox       = Drawing.new("Square"),
        Corners         = corners,
        Tracer          = Drawing.new("Line"),
        Name            = Drawing.new("Text"),
        Distance        = Drawing.new("Text"),
        TeamName        = Drawing.new("Text"),
        HPText          = Drawing.new("Text"),
        HealthBar       = Drawing.new("Square"),
        HealthBarOutline= Drawing.new("Square"),
        Tool            = Drawing.new("Text"),
        LookLine        = Drawing.new("Line"),
        HeadDot         = Drawing.new("Circle"),
        OffArrow        = Drawing.new("Line"),
        Bones           = bones,
    }

    box.Square.Thickness = 2
    box.Square.Filled    = false
    box.Square.Visible   = false

    box.FilledBox.Filled    = true
    box.FilledBox.Thickness = 0
    box.FilledBox.Visible   = false

    box.Tracer.Thickness = 1
    box.Tracer.Visible   = false

    box.Name.Size    = 14
    box.Name.Center  = true
    box.Name.Outline = true
    box.Name.Visible = false
    box.Name.Font    = Drawing.Fonts.Plex

    box.Distance.Size    = 13
    box.Distance.Center  = true
    box.Distance.Outline = true
    box.Distance.Visible = false
    box.Distance.Font    = Drawing.Fonts.Plex

    box.TeamName.Size    = 12
    box.TeamName.Center  = true
    box.TeamName.Outline = true
    box.TeamName.Visible = false
    box.TeamName.Font    = Drawing.Fonts.Plex
    box.TeamName.Color   = Color3.fromRGB(150, 220, 255)

    box.HPText.Size    = 11
    box.HPText.Center  = true
    box.HPText.Outline = true
    box.HPText.Visible = false
    box.HPText.Font    = Drawing.Fonts.Plex

    box.HealthBar.Thickness = 1
    box.HealthBar.Filled    = true
    box.HealthBar.Visible   = false
    box.HealthBar.Color     = Color3.fromRGB(0, 255, 0)

    box.HealthBarOutline.Thickness = 1
    box.HealthBarOutline.Filled    = false
    box.HealthBarOutline.Visible   = false
    box.HealthBarOutline.Color     = Color3.fromRGB(0, 0, 0)

    box.Tool.Size    = 12
    box.Tool.Center  = true
    box.Tool.Outline = true
    box.Tool.Visible = false
    box.Tool.Font    = Drawing.Fonts.Plex
    box.Tool.Color   = Color3.fromRGB(255, 255, 0)

    box.LookLine.Thickness = 2
    box.LookLine.Visible   = false
    box.LookLine.Color     = Color3.fromRGB(0, 255, 255)

    box.HeadDot.Radius    = 3
    box.HeadDot.Filled    = true
    box.HeadDot.Visible   = false
    box.HeadDot.Color     = Color3.fromRGB(255, 0, 0)
    box.HeadDot.Thickness = 1

    box.OffArrow.Thickness = 2
    box.OffArrow.Visible   = false

    return box
end

local function HideBox(box)
    box.Square.Visible          = false
    box.FilledBox.Visible       = false
    box.Tracer.Visible          = false
    box.Name.Visible            = false
    box.Distance.Visible        = false
    box.TeamName.Visible        = false
    box.HPText.Visible          = false
    box.HealthBar.Visible       = false
    box.HealthBarOutline.Visible= false
    box.Tool.Visible            = false
    box.LookLine.Visible        = false
    box.HeadDot.Visible         = false
    box.OffArrow.Visible        = false
    for _, l in ipairs(box.Corners) do l.Visible = false end
    for _, l in ipairs(box.Bones)   do l.Visible = false end
end

local function RemoveESP(player)
    if ESPObjects[player] then
        for _, obj in pairs(ESPObjects[player]) do
            if obj.Remove then obj:Remove() end
        end
        ESPObjects[player] = nil
    end
    local cf = ChamsFolder:FindFirstChild(player.Name)
    if cf then cf:Destroy() end
    if HighlightCache[player] then
        HighlightCache[player]:Destroy()
        HighlightCache[player] = nil
    end
end

local function UpdateESP(player, box)
    local char = player.Character
    if not char then HideBox(box) return end
    local hrp  = char:FindFirstChild("HumanoidRootPart")
    local head = char:FindFirstChild("Head")
    local hum  = char:FindFirstChild("Humanoid")
    if not hrp or not head or not hum or hum.Health <= 0 then HideBox(box) return end
    if Config.TeamCheck and player.Team == LocalPlayer.Team then HideBox(box) return end

    -- Max distance filter
    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    local dist3d = myHRP and (hrp.Position - myHRP.Position).Magnitude or 0
    if dist3d > Config.MaxESPDist then HideBox(box) return end

    local hrpPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)

    -- Offscreen arrows (draw even when not on screen)
    if Config.OffscreenArrows and not onScreen then
        local cx, cy = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2
        local dir    = Vector2.new(hrpPos.X - cx, hrpPos.Y - cy)
        local angle  = math.atan2(dir.Y, dir.X)
        local radius = math.min(cx, cy) - 30
        local ax     = cx + math.cos(angle) * radius
        local ay     = cy + math.sin(angle) * radius
        local al     = 14
        -- Draw a small arrow line toward player
        box.OffArrow.From    = Vector2.new(ax, ay)
        box.OffArrow.To      = Vector2.new(ax + math.cos(angle)*al, ay + math.sin(angle)*al)
        box.OffArrow.Color   = Config.BoxColor
        box.OffArrow.Thickness = 3
        box.OffArrow.Visible = true
        -- hide all other elements
        box.Square.Visible  = false
        box.FilledBox.Visible = false
        for _, l in ipairs(box.Corners) do l.Visible = false end
        box.Tracer.Visible  = false
        box.Name.Visible    = false
        box.Distance.Visible= false
        box.TeamName.Visible= false
        box.HPText.Visible  = false
        box.HealthBar.Visible = false
        box.HealthBarOutline.Visible = false
        box.Tool.Visible    = false
        box.LookLine.Visible= false
        box.HeadDot.Visible = false
        for _, l in ipairs(box.Bones) do l.Visible = false end
        return
    else
        box.OffArrow.Visible = false
    end

    if not onScreen then HideBox(box) return end

    if Config.VisibleOnly then
        local ray  = Ray.new(Camera.CFrame.Position, (hrp.Position - Camera.CFrame.Position).Unit * 1000)
        local part = workspace:FindPartOnRayWithIgnoreList(ray, {LocalPlayer.Character, char})
        if part then HideBox(box) return end
    end

    local headPos = Camera:WorldToViewportPoint(head.Position + Vector3.new(0, 0.5, 0))
    local legPos  = Camera:WorldToViewportPoint(hrp.Position - Vector3.new(0, 3, 0))
    local height  = math.abs(headPos.Y - legPos.Y)
    local width   = height / 2

    local bx = hrpPos.X - width / 2
    local by = hrpPos.Y - height / 2

    local color = Config.BoxColor
    if Config.RainbowMode then
        color = Color3.fromHSV(tick() % 5 / 5, 1, 1)
    elseif Config.TeamColor and player.Team then
        color = player.Team.TeamColor.Color
    end

    local fontSize = Config.ESPFontSize or 14

    -- ── Filled box ────────────────────────────────────────────────────────────
    if Config.FilledBox then
        box.FilledBox.Size     = Vector2.new(width, height)
        box.FilledBox.Position = Vector2.new(bx, by)
        box.FilledBox.Color    = color
        box.FilledBox.Transparency = 1 - (Config.FilledBoxAlpha or 0.15)
        box.FilledBox.Visible  = true
    else box.FilledBox.Visible = false end

    -- ── Box (Full or Corner style) ────────────────────────────────────────────
    if Config.Boxes then
        if Config.BoxStyle == "Corner" then
            box.Square.Visible = false
            local cw = math.max(6, width  * 0.22)
            local ch = math.max(6, height * 0.22)
            -- TL
            box.Corners[1].From  = Vector2.new(bx,       by);       box.Corners[1].To = Vector2.new(bx+cw,    by)
            box.Corners[2].From  = Vector2.new(bx,       by);       box.Corners[2].To = Vector2.new(bx,       by+ch)
            -- TR
            box.Corners[3].From  = Vector2.new(bx+width, by);       box.Corners[3].To = Vector2.new(bx+width-cw, by)
            box.Corners[4].From  = Vector2.new(bx+width, by);       box.Corners[4].To = Vector2.new(bx+width, by+ch)
            -- BL
            box.Corners[5].From  = Vector2.new(bx,       by+height);box.Corners[5].To = Vector2.new(bx+cw,    by+height)
            box.Corners[6].From  = Vector2.new(bx,       by+height);box.Corners[6].To = Vector2.new(bx,       by+height-ch)
            -- BR
            box.Corners[7].From  = Vector2.new(bx+width, by+height);box.Corners[7].To = Vector2.new(bx+width-cw, by+height)
            box.Corners[8].From  = Vector2.new(bx+width, by+height);box.Corners[8].To = Vector2.new(bx+width, by+height-ch)
            for _, l in ipairs(box.Corners) do l.Color = color l.Thickness = 2 l.Visible = true end
        else
            for _, l in ipairs(box.Corners) do l.Visible = false end
            box.Square.Size     = Vector2.new(width, height)
            box.Square.Position = Vector2.new(bx, by)
            box.Square.Color    = color
            box.Square.Visible  = true
        end
    else
        box.Square.Visible = false
        for _, l in ipairs(box.Corners) do l.Visible = false end
    end

    -- ── Tracer ────────────────────────────────────────────────────────────────
    if Config.Tracers then
        local originY = Config.TracerOrigin == "Top"    and 0 or
                        Config.TracerOrigin == "Center" and Camera.ViewportSize.Y/2 or
                        Camera.ViewportSize.Y
        box.Tracer.From    = Vector2.new(Camera.ViewportSize.X / 2, originY)
        box.Tracer.To      = Vector2.new(hrpPos.X, hrpPos.Y)
        box.Tracer.Color   = color
        box.Tracer.Visible = true
    else box.Tracer.Visible = false end

    -- ── Name ──────────────────────────────────────────────────────────────────
    if Config.Names then
        box.Name.Position = Vector2.new(hrpPos.X, by - fontSize - 4)
        box.Name.Text     = player.Name
        box.Name.Color    = color
        box.Name.Size     = fontSize
        box.Name.Visible  = true
    else box.Name.Visible = false end

    -- ── Team name ─────────────────────────────────────────────────────────────
    if Config.ShowTeamName and player.Team then
        local nameOffY = Config.Names and (by - fontSize - 16) or (by - fontSize - 4)
        box.TeamName.Position = Vector2.new(hrpPos.X, nameOffY)
        box.TeamName.Text     = "[" .. player.Team.Name .. "]"
        box.TeamName.Size     = math.max(10, fontSize - 2)
        box.TeamName.Visible  = true
    else box.TeamName.Visible = false end

    -- ── Distance ──────────────────────────────────────────────────────────────
    if Config.Distance and myHRP then
        local dist = math.floor(dist3d)
        box.Distance.Position = Vector2.new(hrpPos.X, by + height + 4)
        box.Distance.Text     = dist .. "m"
        box.Distance.Size     = math.max(11, fontSize - 2)
        box.Distance.Color    = color
        box.Distance.Visible  = true
    else box.Distance.Visible = false end

    -- ── Health bar ────────────────────────────────────────────────────────────
    if Config.HealthBars then
        local hp  = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
        local bh  = height * hp
        box.HealthBarOutline.Size     = Vector2.new(4, height + 2)
        box.HealthBarOutline.Position = Vector2.new(bx - 8, by - 1)
        box.HealthBarOutline.Visible  = true
        box.HealthBar.Size            = Vector2.new(3, bh)
        box.HealthBar.Position        = Vector2.new(bx - 7.5, by + height - bh)
        box.HealthBar.Color           = Color3.fromRGB(255*(1-hp), 255*hp, 0)
        box.HealthBar.Visible         = true

        -- HP text
        if Config.ShowHPText then
            box.HPText.Position = Vector2.new(bx - 16, by + height - bh - 6)
            box.HPText.Text     = math.floor(hum.Health)
            box.HPText.Color    = Color3.fromRGB(255*(1-hp), 255*hp, 0)
            box.HPText.Size     = 10
            box.HPText.Visible  = true
        else box.HPText.Visible = false end
    else
        box.HealthBar.Visible        = false
        box.HealthBarOutline.Visible = false
        box.HPText.Visible           = false
    end

    -- ── Tool ──────────────────────────────────────────────────────────────────
    if Config.ShowTools then
        local tool = char:FindFirstChildOfClass("Tool")
        if tool then
            local toolY = by + height + (Config.Distance and 18 or 4)
            box.Tool.Position = Vector2.new(hrpPos.X, toolY)
            box.Tool.Text     = "[" .. tool.Name .. "]"
            box.Tool.Visible  = true
        else box.Tool.Visible = false end
    else box.Tool.Visible = false end

    -- ── Look direction ────────────────────────────────────────────────────────
    if Config.ShowLookDirection then
        local lv    = hrp.CFrame.LookVector * 5
        local lookP = Camera:WorldToViewportPoint(hrp.Position + lv)
        box.LookLine.From    = Vector2.new(hrpPos.X, hrpPos.Y)
        box.LookLine.To      = Vector2.new(lookP.X, lookP.Y)
        box.LookLine.Color   = color
        box.LookLine.Visible = true
    else box.LookLine.Visible = false end

    -- ── Head dot ──────────────────────────────────────────────────────────────
    if Config.ShowHead then
        local hsp = Camera:WorldToViewportPoint(head.Position)
        box.HeadDot.Position = Vector2.new(hsp.X, hsp.Y)
        box.HeadDot.Color    = color
        box.HeadDot.Visible  = true
    else box.HeadDot.Visible = false end

    -- ── Skeleton ──────────────────────────────────────────────────────────────
    if Config.Skeleton then
        local boneMap = {
            {"Head","UpperTorso"},{"UpperTorso","LowerTorso"},
            {"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},
            {"LeftLowerArm","LeftHand"},
            {"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},
            {"RightLowerArm","RightHand"},
            {"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},
            {"LeftLowerLeg","LeftFoot"},
            {"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},
            {"RightLowerLeg","RightFoot"},
        }
        for i, pair in ipairs(boneMap) do
            local p1 = char:FindFirstChild(pair[1])
            local p2 = char:FindFirstChild(pair[2])
            if p1 and p2 then
                local s1, on1 = Camera:WorldToViewportPoint(p1.Position)
                local s2, on2 = Camera:WorldToViewportPoint(p2.Position)
                if on1 and on2 then
                    box.Bones[i].From    = Vector2.new(s1.X, s1.Y)
                    box.Bones[i].To      = Vector2.new(s2.X, s2.Y)
                    box.Bones[i].Color   = color
                    box.Bones[i].Visible = true
                else
                    box.Bones[i].Visible = false
                end
            else
                if box.Bones[i] then box.Bones[i].Visible = false end
            end
        end
    else
        for _, l in ipairs(box.Bones) do l.Visible = false end
    end
end

-- Item ESP (tools / parts tagged as pickups)
local function UpdateItemESP()
    -- Remove stale
    for obj, drawing in pairs(ItemESPObjects) do
        if not obj or not obj.Parent then
            drawing:Remove()
            ItemESPObjects[obj] = nil
        end
    end
    if not Config.ItemESP then
        for _, d in pairs(ItemESPObjects) do d:Remove() end
        ItemESPObjects = {}
        return
    end
    -- Scan workspace tools
    for _, obj in pairs(workspace:GetDescendants()) do
        if obj:IsA("Tool") or (obj:IsA("BasePart") and obj.Name:lower():find("coin")) then
            if not ItemESPObjects[obj] then
                local d = Drawing.new("Text")
                d.Size    = 13
                d.Center  = true
                d.Outline = true
                d.Color   = Color3.fromRGB(255, 230, 0)
                d.Font    = Drawing.Fonts.Plex
                ItemESPObjects[obj] = d
            end
            local pos, on = Camera:WorldToViewportPoint(obj:IsA("Tool") and obj.Handle and obj.Handle.Position or obj.Position)
            if on then
                local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
                local dist  = myHRP and math.floor((obj.Position - myHRP.Position).Magnitude) or 0
                if dist <= Config.ItemESPRange then
                    ItemESPObjects[obj].Position = Vector2.new(pos.X, pos.Y)
                    ItemESPObjects[obj].Text     = "📦 " .. obj.Name .. " [" .. dist .. "m]"
                    ItemESPObjects[obj].Visible  = true
                else
                    ItemESPObjects[obj].Visible = false
                end
            else
                ItemESPObjects[obj].Visible = false
            end
        end
    end
end

local function CreateChams(player)
    if player == LocalPlayer or not player.Character then return end
    if ChamsFolder:FindFirstChild(player.Name) then ChamsFolder[player.Name]:Destroy() end
    local folder = Instance.new("Folder")
    folder.Name   = player.Name
    folder.Parent = ChamsFolder
    for _, part in pairs(player.Character:GetChildren()) do
        if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
            local c = Instance.new("BoxHandleAdornment")
            c.Size         = part.Size + Vector3.new(0.1, 0.1, 0.1)
            c.AlwaysOnTop  = true
            c.ZIndex       = 5
            c.Transparency = Config.ESPTransparency
            c.Color3       = Config.RainbowMode and Color3.fromHSV(tick()%5/5,1,1) or Config.BoxColor
            c.Adornee      = part
            c.Parent       = folder
        end
    end
end

local function CreateHighlight(player)
    if player == LocalPlayer or not player.Character then return end
    if HighlightCache[player] then HighlightCache[player]:Destroy() end
    local h = Instance.new("Highlight")
    h.Adornee            = player.Character
    h.FillColor          = Config.RainbowMode and Color3.fromHSV(tick()%5/5,1,1) or Config.BoxColor
    h.OutlineColor       = Color3.new(1,1,1)
    h.FillTransparency   = Config.ESPTransparency
    h.OutlineTransparency= 0
    h.Parent             = player.Character
    HighlightCache[player] = h
end

local function UpdateChams()
    if not Config.ChamsEnabled then ChamsFolder:ClearAllChildren() return end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            if not ChamsFolder:FindFirstChild(p.Name) then
                CreateChams(p)
            else
                for _, c in pairs(ChamsFolder[p.Name]:GetChildren()) do
                    if c:IsA("BoxHandleAdornment") then
                        c.Color3       = Config.RainbowMode and Color3.fromHSV(tick()%5/5,1,1) or Config.BoxColor
                        c.Transparency = Config.ESPTransparency
                    end
                end
            end
        end
    end
end

local function UpdateHighlights()
    if not Config.HighlightEnabled then
        for _, h in pairs(HighlightCache) do if h then h:Destroy() end end
        HighlightCache = {}
        return
    end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            if not HighlightCache[p] then
                CreateHighlight(p)
            else
                HighlightCache[p].FillColor        = Config.RainbowMode and Color3.fromHSV(tick()%5/5,1,1) or Config.BoxColor
                HighlightCache[p].FillTransparency = Config.ESPTransparency
            end
        end
    end
end

local function AddESP(player)
    if player == LocalPlayer then return end
    ESPObjects[player] = CreateBox()
    player.CharacterAdded:Connect(function()
        task.wait(0.5)
        if Config.ChamsEnabled    then CreateChams(player)     end
        if Config.HighlightEnabled then CreateHighlight(player) end
    end)
end

--====================================
-- FUNÇÕES COMBAT
--====================================

local function GetTarget()
    local best, bestScore = nil, math.huge
    for _, p in ipairs(Players:GetPlayers()) do
        if p == LocalPlayer or not p.Character then continue end
        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
        local hum = p.Character:FindFirstChild("Humanoid")
        if not hrp or not hum or hum.Health <= 0 then continue end
        if Config.TeamCheck and p.Team == LocalPlayer.Team then continue end
        local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not myHRP then continue end

        local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
        if not onScreen then continue end
        local mouse = UIS:GetMouseLocation()
        local fovDist = (Vector2.new(screenPos.X, screenPos.Y) - mouse).Magnitude
        if fovDist > Config.AimbotFOV then continue end

        local score
        if Config.AimbotPriority == "Distance" then
            score = (hrp.Position - myHRP.Position).Magnitude
        else
            score = hum.Health
        end
        if score < bestScore then
            bestScore = score
            best = p
        end
    end
    return best
end

local function Aimbot()
    if not Config.Aimbot then return end
    local target = GetTarget()
    if not target or not target.Character then return end
    local tPart = Config.AimbotTarget == "Head"   and target.Character:FindFirstChild("Head") or
                  Config.AimbotTarget == "Torso"  and target.Character:FindFirstChild("HumanoidRootPart") or
                  (math.random(1,2)==1 and target.Character:FindFirstChild("Head") or target.Character:FindFirstChild("HumanoidRootPart"))
    if not tPart then return end

    local targetPos = tPart.Position
    if Config.PredictMovement then
        local hrp = target.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local vel  = hrp.AssemblyVelocity
            local dist = (hrp.Position - Camera.CFrame.Position).Magnitude
            targetPos  = hrp.Position + vel * (dist / 500)
        end
    end

    local sp = Camera:WorldToViewportPoint(targetPos)
    local mp = UIS:GetMouseLocation()
    local dx = (sp.X - mp.X) * (Config.AimbotSmoothing / 1000)
    local dy = (sp.Y - mp.Y) * (Config.AimbotSmoothing / 1000)
    mousemoverel(dx, dy)

    if Config.AutoShoot then
        mouse1press()
        task.wait()
        mouse1release()
    end
end

local function TriggerBot()
    if not Config.TriggerBot then return end
    local target = GetTarget()
    if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
        local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if myHRP and (target.Character.HumanoidRootPart.Position - myHRP.Position).Magnitude < 50 then
            mouse1press()
            task.wait(0.1)
            mouse1release()
        end
    end
end

local function ApplyHitbox()
    if not Config.HitboxExpander then return end
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= LocalPlayer and p.Character then
            local hrp = p.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.Size = Vector3.new(Config.HitboxSize, Config.HitboxSize, Config.HitboxSize) end
        end
    end
end

--====================================
-- FUNÇÕES PLAYER
--====================================

local function SetWalkSpeed(s)
    local c = LocalPlayer.Character
    if c then local h = c:FindFirstChild("Humanoid") if h then h.WalkSpeed = s end end
end

local function SetJumpPower(p)
    local c = LocalPlayer.Character
    if c then local h = c:FindFirstChild("Humanoid") if h then h.JumpPower = p end end
end

local function ToggleFly(enabled)
    if enabled then
        local c = LocalPlayer.Character
        if not c then return end
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        local bg = Instance.new("BodyGyro")
        bg.P = 9e4; bg.maxTorque = Vector3.new(9e9,9e9,9e9)
        bg.cframe = hrp.CFrame; bg.Parent = hrp
        local bv = Instance.new("BodyVelocity")
        bv.velocity = Vector3.zero; bv.maxForce = Vector3.new(9e9,9e9,9e9); bv.Parent = hrp

        FlyConnection = RunService.Heartbeat:Connect(function()
            if not Config.Fly then
                bg:Destroy(); bv:Destroy()
                if FlyConnection then FlyConnection:Disconnect() end
                return
            end
            bg.cframe = Camera.CFrame
            local v = Vector3.zero
            local spd = Config.FlySpeed
            if UIS:IsKeyDown(Enum.KeyCode.W) then v = v + Camera.CFrame.LookVector  * spd end
            if UIS:IsKeyDown(Enum.KeyCode.S) then v = v - Camera.CFrame.LookVector  * spd end
            if UIS:IsKeyDown(Enum.KeyCode.A) then v = v - Camera.CFrame.RightVector * spd end
            if UIS:IsKeyDown(Enum.KeyCode.D) then v = v + Camera.CFrame.RightVector * spd end
            if UIS:IsKeyDown(Enum.KeyCode.Space)      then v = v + Vector3.new(0, spd, 0) end
            if UIS:IsKeyDown(Enum.KeyCode.LeftShift)  then v = v - Vector3.new(0, spd, 0) end
            bv.velocity = v
        end)
    else
        if FlyConnection then FlyConnection:Disconnect() FlyConnection = nil end
    end
end

local function ToggleNoClip(enabled)
    if enabled then
        NoClipConnection = RunService.Stepped:Connect(function()
            if not Config.NoClip then
                if NoClipConnection then NoClipConnection:Disconnect() end return
            end
            local c = LocalPlayer.Character
            if c then for _, p in pairs(c:GetDescendants()) do
                if p:IsA("BasePart") then p.CanCollide = false end
            end end
        end)
    else
        if NoClipConnection then NoClipConnection:Disconnect() NoClipConnection = nil end
    end
end

local function ToggleGod(enabled)
    local c = LocalPlayer.Character
    if c then local h = c:FindFirstChild("Humanoid") if h then
        if enabled then h.MaxHealth = math.huge h.Health = math.huge
        else h.MaxHealth = 100 h.Health = 100 end
    end end
end

local function ToggleInvisible(enabled)
    local c = LocalPlayer.Character
    if not c then return end
    for _, p in pairs(c:GetDescendants()) do
        if p:IsA("BasePart") then
            p.LocalTransparencyModifier = enabled and 1 or 0
        end
    end
end

local function TogglePlatform(enabled)
    if enabled then
        local hrp = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if not hrp then return end
        PlatformPart = Instance.new("Part")
        PlatformPart.Size = Vector3.new(12,1,12)
        PlatformPart.Anchored = true
        PlatformPart.Transparency = 0.4
        PlatformPart.Color = Color3.fromRGB(0, 200, 100)
        PlatformPart.Parent = workspace
        RunService.Heartbeat:Connect(function()
            if not Config.PlatformEnabled or not PlatformPart then return end
            local h2 = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
            if h2 then PlatformPart.CFrame = CFrame.new(h2.Position - Vector3.new(0,4,0)) end
        end)
    else
        if PlatformPart then PlatformPart:Destroy() PlatformPart = nil end
    end
end

local function ToggleAntiVoid(enabled)
    if enabled then
        AntiVoidPart = Instance.new("Part")
        AntiVoidPart.Size = Vector3.new(4096,1,4096)
        AntiVoidPart.Position = Vector3.new(0,-100,0)
        AntiVoidPart.Anchored = true
        AntiVoidPart.Transparency = 0.8
        AntiVoidPart.Color = Color3.fromRGB(200,50,50)
        AntiVoidPart.Parent = workspace
    else
        if AntiVoidPart then AntiVoidPart:Destroy() AntiVoidPart = nil end
    end
end

local function ToggleAntiRagdoll()
    RunService.Stepped:Connect(function()
        if not Config.AntiRagdoll then return end
        local c = LocalPlayer.Character
        if c then local h = c:FindFirstChild("Humanoid") if h then
            h:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            h:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
        end end
    end)
end

local function ToggleSpinBot(enabled)
    if enabled then
        SpinBotConnection = RunService.Heartbeat:Connect(function()
            if not Config.SpinBot then
                if SpinBotConnection then SpinBotConnection:Disconnect() end return
            end
            local c = LocalPlayer.Character
            if c then local hrp = c:FindFirstChild("HumanoidRootPart")
                if hrp then hrp.CFrame = hrp.CFrame * CFrame.Angles(0, math.rad(20), 0) end
            end
        end)
    else
        if SpinBotConnection then SpinBotConnection:Disconnect() SpinBotConnection = nil end
    end
end

local function SuperJump()
    local c = LocalPlayer.Character
    if not c then return end
    local h = c:FindFirstChild("Humanoid")
    if h then h.JumpPower = 250 task.wait(0.2) h.JumpPower = Config.JumpPower end
end

-- Auto Clicker
local function StartAutoClicker()
    if AutoClickerConn then AutoClickerConn:Disconnect() end
    AutoClickerConn = RunService.Heartbeat:Connect(function()
        if not Config.AutoClicker then
            AutoClickerConn:Disconnect() return
        end
    end)
    task.spawn(function()
        while Config.AutoClicker do
            mouse1press()
            task.wait()
            mouse1release()
            task.wait(1 / Config.AutoClickerCPS)
        end
    end)
end

--====================================
-- FUNÇÕES VISUAIS
--====================================

local origLighting = {
    Brightness     = Lighting.Brightness,
    ClockTime      = Lighting.ClockTime,
    FogEnd         = Lighting.FogEnd,
    GlobalShadows  = Lighting.GlobalShadows,
    OutdoorAmbient = Lighting.OutdoorAmbient,
    Ambient        = Lighting.Ambient,
}

local function ToggleFullbright(on)
    if on then
        Lighting.Brightness     = 2
        Lighting.ClockTime      = 14
        Lighting.FogEnd         = 1e9
        Lighting.GlobalShadows  = false
        Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
    else
        Lighting.Brightness     = origLighting.Brightness
        Lighting.ClockTime      = origLighting.ClockTime
        Lighting.FogEnd         = origLighting.FogEnd
        Lighting.GlobalShadows  = origLighting.GlobalShadows
        Lighting.OutdoorAmbient = origLighting.OutdoorAmbient
    end
end

local function ToggleNightMode(on)
    if on then
        Lighting.ClockTime     = 0
        Lighting.Brightness    = 0.3
        Lighting.Ambient       = Color3.fromRGB(20, 10, 50)
        Lighting.GlobalShadows = true
        Lighting.FogEnd        = 500
        Lighting.FogColor      = Color3.fromRGB(5, 5, 20)
    else
        Lighting.ClockTime     = origLighting.ClockTime
        Lighting.Brightness    = origLighting.Brightness
        Lighting.Ambient       = origLighting.Ambient
        Lighting.GlobalShadows = origLighting.GlobalShadows
        Lighting.FogEnd        = origLighting.FogEnd
    end
end

local function ToggleWireframe(on)
    if on then
        for _, v in pairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") and v.Parent ~= LocalPlayer.Character then
                table.insert(WireframeParts, {part=v, trans=v.Transparency})
                v.Transparency = 0.85
            end
        end
    else
        for _, entry in pairs(WireframeParts) do
            if entry.part and entry.part.Parent then
                entry.part.Transparency = entry.trans
            end
        end
        WireframeParts = {}
    end
end

local function ApplyFPSBoost(on)
    if not on then return end
    local l = Lighting
    l.GlobalShadows = false; l.FogEnd = 9e9; l.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for _, v in pairs(game:GetDescendants()) do
        if v:IsA("Part") or v:IsA("UnionOperation") or v:IsA("MeshPart") then
            v.Material = Enum.Material.Plastic; v.Reflectance = 0
        elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
            pcall(function() v.Lifetime = NumberRange.new(0) end)
        elseif v:IsA("Fire") or v:IsA("Smoke") or v:IsA("Sparkles") then
            v.Enabled = false
        end
    end
    for _, e in pairs(l:GetChildren()) do
        if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") then
            e.Enabled = false
        end
    end
end

-- Crosshair
local function CreateCrosshair()
    for _, key in pairs({"Top","Bottom","Left","Right"}) do
        Crosshair[key] = Drawing.new("Line")
        Crosshair[key].Thickness = 2
        Crosshair[key].Color     = Color3.fromRGB(0,255,0)
        Crosshair[key].Visible   = false
    end
end

local function UpdateCrosshair()
    if Config.Crosshair then
        local cx = Camera.ViewportSize.X/2
        local cy = Camera.ViewportSize.Y/2
        local sz = 10
        local col = Config.RainbowMode and Color3.fromHSV(tick()%5/5,1,1) or Color3.fromRGB(0,255,0)
        Crosshair.Top.From    = Vector2.new(cx, cy-sz); Crosshair.Top.To    = Vector2.new(cx, cy-sz/2)
        Crosshair.Bottom.From = Vector2.new(cx, cy+sz/2); Crosshair.Bottom.To = Vector2.new(cx, cy+sz)
        Crosshair.Left.From   = Vector2.new(cx-sz, cy); Crosshair.Left.To   = Vector2.new(cx-sz/2, cy)
        Crosshair.Right.From  = Vector2.new(cx+sz/2, cy); Crosshair.Right.To = Vector2.new(cx+sz, cy)
        for _, l in pairs(Crosshair) do l.Color = col l.Visible = true end
    else
        for _, l in pairs(Crosshair) do l.Visible = false end
    end
end

local function UpdateFOVCircle()
    if Config.FOVCircle then
        FOVCircle.Visible   = true
        FOVCircle.Thickness = 1.5
        FOVCircle.Color     = Config.RainbowMode and Color3.fromHSV(tick()%5/5,1,1) or Color3.fromRGB(255,255,255)
        FOVCircle.Filled    = false
        FOVCircle.Radius    = Config.AimbotFOV
        FOVCircle.Position  = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
    else
        FOVCircle.Visible = false
    end
end

--====================================
-- CUSTOM HUD
--====================================

local HUDGui = Instance.new("ScreenGui")
HUDGui.Name = "BSv3_HUD"
HUDGui.ResetOnSpawn = false
HUDGui.Parent = game.CoreGui

local HUDFrame = Instance.new("Frame")
HUDFrame.Size = UDim2.new(0, 200, 0, 120)
HUDFrame.Position = UDim2.new(0, 15, 0.5, -60)
HUDFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 12)
HUDFrame.BackgroundTransparency = 0.25
HUDFrame.Visible = false
HUDFrame.Parent = HUDGui

local HUDCorner = Instance.new("UICorner")
HUDCorner.CornerRadius = UDim.new(0, 10)
HUDCorner.Parent = HUDFrame

local HUDStroke = Instance.new("UIStroke")
HUDStroke.Color = Color3.fromRGB(0, 200, 255)
HUDStroke.Thickness = 1
HUDStroke.Transparency = 0.5
HUDStroke.Parent = HUDFrame

local HUDLabel = Instance.new("TextLabel")
HUDLabel.Size = UDim2.new(1, -16, 1, -12)
HUDLabel.Position = UDim2.new(0, 8, 0, 6)
HUDLabel.BackgroundTransparency = 1
HUDLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
HUDLabel.Font = Enum.Font.Code
HUDLabel.TextSize = 12
HUDLabel.TextXAlignment = Enum.TextXAlignment.Left
HUDLabel.TextYAlignment = Enum.TextYAlignment.Top
HUDLabel.TextWrapped = true
HUDLabel.Parent = HUDFrame

task.spawn(function()
    while true do
        RunService.RenderStepped:Wait()
        if Config.CustomHUD then
            HUDFrame.Visible = true
            local c = LocalPlayer.Character
            local hum = c and c:FindFirstChild("Humanoid")
            local hrp = c and c:FindFirstChild("HumanoidRootPart")
            local hp  = hum and math.floor(hum.Health) or 0
            local spd = hrp and math.floor(hrp.AssemblyLinearVelocity.Magnitude) or 0
            local fps = math.floor(1 / RunService.RenderStepped:Wait())
            local ping= math.floor(LocalPlayer:GetNetworkPing() * 1000)
            HUDLabel.Text = string.format(
                "🦈 BLACK SHARK V3\n❤  HP:   %d\n⚡ Speed: %d\n🖥  FPS:  %d\n📡 Ping: %dms\n👥 Players: %d",
                hp, spd, fps, ping, #Players:GetPlayers()
            )
        else
            HUDFrame.Visible = false
        end
    end
end)

--====================================
-- TELEPORTE
--====================================

local function TeleportToPlayer(target, method)
    if not target or not target.Character then return end
    local tHRP = target.Character:FindFirstChild("HumanoidRootPart")
    local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not tHRP or not myHRP then return end
    method = method or Config.TeleportType
    if method == "Instant" then
        myHRP.CFrame = tHRP.CFrame + Vector3.new(0,3,0)
    elseif method == "Tween" then
        TweenService:Create(myHRP, TweenInfo.new(1, Enum.EasingStyle.Linear), {
            CFrame = tHRP.CFrame + Vector3.new(0,3,0)
        }):Play()
    end
    Stats.Teleports = Stats.Teleports + 1
end

local function SavePosition(slot)
    local c = LocalPlayer.Character
    if c then
        local hrp = c:FindFirstChild("HumanoidRootPart")
        if hrp then SavedPositions[slot] = hrp.CFrame return true end
    end
    return false
end

local function LoadPosition(slot)
    if SavedPositions[slot] then
        local c = LocalPlayer.Character
        if c then
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = SavedPositions[slot] Stats.Teleports = Stats.Teleports + 1 return true end
        end
    end
    return false
end

-- Click TP
local ClickTPMouse = LocalPlayer:GetMouse()
ClickTPMouse.Button1Down:Connect(function()
    if Config.ClickTP and UIS:IsKeyDown(Enum.KeyCode.LeftControl) then
        local c = LocalPlayer.Character
        if c then
            local hrp = c:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = CFrame.new(ClickTPMouse.Hit.Position + Vector3.new(0,3,0))
                Stats.Teleports = Stats.Teleports + 1
            end
        end
    end
    if Config.ClickDelete and UIS:IsKeyDown(Enum.KeyCode.LeftAlt) then
        if ClickTPMouse.Target then ClickTPMouse.Target:Destroy() end
    end
end)

--====================================
-- SERVER FUNCTIONS
--====================================

local function ServerHop()
    local ok, servers = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(
            "https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"
        ))
    end)
    if not ok then Notify("Erro ao obter servidores!", 3, "Error") return end
    local TS = game:GetService("TeleportService")
    for _, sv in pairs(servers.data or {}) do
        if sv.id ~= game.JobId then
            TS:TeleportToPlaceInstance(game.PlaceId, sv.id, LocalPlayer)
            return
        end
    end
    Notify("Nenhum servidor encontrado!", 3, "Warning")
end

local function RejoinServer()
    game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
end

local antiKickHooked = false
local function ToggleAntiKick(on)
    if on and not antiKickHooked then
        antiKickHooked = true
        local old; old = hookmetamethod(game, "__namecall", function(self, ...)
            if getnamecallmethod() == "Kick" and Config.AntiKick then return task.wait(9e9) end
            return old(self, ...)
        end)
    end
end

local function ToggleChatSpam(on)
    if on then task.spawn(function()
        while Config.ChatSpam do
            pcall(function()
                game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(
                    Config.ChatSpamMessage, "All"
                )
            end)
            task.wait(1)
        end
    end) end
end

local function ToggleBTools(on)
    if on then
        for _, bin in pairs({"Move","Clone","Delete"}) do
            local t = Instance.new("HopperBin")
            t.Name = bin
            t.BinType = bin == "Move" and Enum.BinType.GameTool or
                        bin == "Clone" and Enum.BinType.Clone or
                        Enum.BinType.Hammer
            t.Parent = LocalPlayer.Backpack
        end
    else
        for _, t in pairs(LocalPlayer.Backpack:GetChildren()) do
            if t:IsA("HopperBin") then t:Destroy() end
        end
    end
end

--====================================
-- AUTOMATION
--====================================

local function AntiAFK()
    local VU = game:GetService("VirtualUser")
    LocalPlayer.Idled:Connect(function()
        if Config.AntiAFK then
            VU:CaptureController()
            VU:ClickButton2(Vector2.new())
        end
    end)
end

--====================================
-- LOOP PRINCIPAL
--====================================

RunService.RenderStepped:Connect(function()
    -- ESP
    if Config.ESPEnabled then
        for player, box in pairs(ESPObjects) do
            if player and player.Parent then
                UpdateESP(player, box)
            else
                RemoveESP(player)
            end
        end
    else
        for _, box in pairs(ESPObjects) do HideBox(box) end
    end

    -- Item ESP
    UpdateItemESP()

    -- Combat
    if Config.Aimbot    then Aimbot()     end
    if Config.TriggerBot then TriggerBot() end
    if Config.HitboxExpander then ApplyHitbox() end

    -- Visuals
    UpdateCrosshair()
    UpdateFOVCircle()
    UpdateChams()
    UpdateHighlights()

    -- Player
    if Config.AntiSlowdown then SetWalkSpeed(Config.WalkSpeed) end
    SetWalkSpeed(Config.WalkSpeed)
    SetJumpPower(Config.JumpPower)

    -- Rainbow border on main frame (handled in GUI section via spawn loop)
end)

-- Infinite Jump: conexão única, fora do RenderStepped
local infiniteJumpConn
UIS.JumpRequest:Connect(function()
    if Config.InfiniteJump and LocalPlayer.Character then
        local h = LocalPlayer.Character:FindFirstChild("Humanoid")
        if h then h:ChangeState(Enum.HumanoidStateType.Jumping) end
    end
end)


--====================================
-- GUI - BLACK SHARK V3
-- Menu reescrito com tratamento de erros
--====================================

-- ─── Sistema de Erro Visual ───────────────────────────────────────────────────
local function ShowError(err)
    local ok = pcall(function()
        local eg = Instance.new("ScreenGui")
        eg.Name           = "BSv3_Error"
        eg.ResetOnSpawn   = false
        eg.IgnoreGuiInset = true
        eg.Parent         = game.CoreGui

        local ef = Instance.new("Frame")
        ef.Size              = UDim2.new(0, 480, 0, 80)
        ef.Position          = UDim2.new(0.5, -240, 0, 10)
        ef.BackgroundColor3  = Color3.fromRGB(20, 5, 5)
        ef.BorderSizePixel   = 0
        ef.Parent            = eg

        local ec = Instance.new("UICorner")
        ec.CornerRadius = UDim.new(0, 10)
        ec.Parent       = ef

        local es = Instance.new("UIStroke")
        es.Color     = Color3.fromRGB(255, 60, 60)
        es.Thickness = 2
        es.Parent    = ef

        local el = Instance.new("TextLabel")
        el.Size               = UDim2.new(1, -16, 1, -10)
        el.Position           = UDim2.new(0, 8, 0, 5)
        el.BackgroundTransparency = 1
        el.TextColor3         = Color3.fromRGB(255, 100, 100)
        el.Font               = Enum.Font.Code
        el.TextSize           = 12
        el.TextWrapped        = true
        el.TextXAlignment     = Enum.TextXAlignment.Left
        el.TextYAlignment     = Enum.TextYAlignment.Top
        el.Text               = "🦈 BSv3 ERRO:\n" .. tostring(err)
        el.Parent             = ef

        task.delay(8, function()
            if eg and eg.Parent then eg:Destroy() end
        end)
    end)
    if not ok then
        warn("[BSv3] Erro crítico (não foi possível mostrar): " .. tostring(err))
    end
    warn("[BSv3 ERRO] " .. tostring(err))
end

-- ─── Proteção global: captura qualquer erro no script ────────────────────────
local _ENV_OK = true

local function SafeCall(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then
        ShowError(err)
        _ENV_OK = false
    end
end

-- ─── ScreenGui principal ─────────────────────────────────────────────────────
local Gui = Instance.new("ScreenGui")
Gui.Name             = "BlackSharkV3"
Gui.ResetOnSpawn     = false
Gui.IgnoreGuiInset   = true
Gui.ZIndexBehavior   = Enum.ZIndexBehavior.Sibling
Gui.Parent           = game.CoreGui

-- ─── Frame principal ─────────────────────────────────────────────────────────
local Main = Instance.new("Frame")
Main.Name            = "Main"
Main.Size            = UDim2.new(0, 530, 0, 630)
Main.Position        = UDim2.new(0.5, -265, 0.5, -315)
Main.BackgroundColor3= T().BG
Main.BorderSizePixel = 0
Main.Visible         = false
Main.ClipsDescendants= true
Main.Parent          = Gui

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 14)
MainCorner.Parent       = Main

local MainStroke = Instance.new("UIStroke")
MainStroke.Color       = T().Border
MainStroke.Thickness   = 2
MainStroke.Transparency= 0.2
MainStroke.Parent      = Main

-- Rainbow border
task.spawn(function()
    local hue = 0
    while Main and Main.Parent do
        RunService.RenderStepped:Wait()
        if Config.RainbowMode then
            hue = (hue + 0.003) % 1
            MainStroke.Color = Color3.fromHSV(hue, 1, 1)
        else
            MainStroke.Color = T().Border
        end
    end
end)

-- Sombra
local Shadow = Instance.new("ImageLabel")
Shadow.Size               = UDim2.new(1, 60, 1, 60)
Shadow.Position           = UDim2.new(0, -30, 0, -30)
Shadow.BackgroundTransparency = 1
Shadow.Image              = "rbxassetid://1316045217"
Shadow.ImageColor3        = Color3.new(0,0,0)
Shadow.ImageTransparency  = 0.55
Shadow.ScaleType          = Enum.ScaleType.Slice
Shadow.SliceCenter        = Rect.new(10,10,118,118)
Shadow.ZIndex             = 0
Shadow.Parent             = Main

-- ─── Barra de título ─────────────────────────────────────────────────────────
local TitleBar = Instance.new("Frame")
TitleBar.Name            = "TitleBar"
TitleBar.Size            = UDim2.new(1, 0, 0, 48)
TitleBar.BackgroundColor3= T().TitleBG
TitleBar.BorderSizePixel = 0
TitleBar.ZIndex          = 2
TitleBar.Parent          = Main

local TBCorner = Instance.new("UICorner")
TBCorner.CornerRadius = UDim.new(0, 14)
TBCorner.Parent       = TitleBar

local TitleGrad = Instance.new("UIGradient")
TitleGrad.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0,   Color3.fromRGB(0,  120, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(0,  220, 255)),
    ColorSequenceKeypoint.new(1,   Color3.fromRGB(180,  0, 255)),
}
TitleGrad.Parent = TitleBar

task.spawn(function()
    while TitleBar and TitleBar.Parent do
        RunService.RenderStepped:Wait()
        TitleGrad.Rotation = (TitleGrad.Rotation + 0.8) % 360
    end
end)

-- Ícone + Nome
local TitleIcon = Instance.new("TextLabel")
TitleIcon.Size               = UDim2.new(0, 36, 1, 0)
TitleIcon.Position           = UDim2.new(0, 10, 0, 0)
TitleIcon.BackgroundTransparency = 1
TitleIcon.Text               = "🦈"
TitleIcon.TextSize           = 22
TitleIcon.Font               = Enum.Font.GothamBold
TitleIcon.ZIndex             = 3
TitleIcon.Parent             = TitleBar

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Size               = UDim2.new(1, -180, 0, 28)
TitleLabel.Position           = UDim2.new(0, 48, 0, 4)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Text               = "BLACK SHARK V3"
TitleLabel.TextColor3         = Color3.new(1,1,1)
TitleLabel.Font               = Enum.Font.GothamBold
TitleLabel.TextSize           = 17
TitleLabel.TextXAlignment     = Enum.TextXAlignment.Left
TitleLabel.ZIndex             = 3
TitleLabel.Parent             = TitleBar

local VersionLabel = Instance.new("TextLabel")
VersionLabel.Size               = UDim2.new(0, 100, 0, 14)
VersionLabel.Position           = UDim2.new(0, 48, 1, -18)
VersionLabel.BackgroundTransparency = 1
VersionLabel.Text               = "v3.0 ULTIMATE"
VersionLabel.TextColor3         = Color3.fromRGB(200,200,200)
VersionLabel.Font               = Enum.Font.Gotham
VersionLabel.TextSize           = 10
VersionLabel.TextXAlignment     = Enum.TextXAlignment.Left
VersionLabel.ZIndex             = 3
VersionLabel.Parent             = TitleBar

-- ─── Botões da janela ────────────────────────────────────────────────────────
local function MakeWinBtn(posX, bgColor, icon)
    local btn = Instance.new("TextButton")
    btn.Size             = UDim2.new(0, 30, 0, 30)
    btn.Position         = UDim2.new(1, posX, 0, 9)
    btn.BackgroundColor3 = bgColor
    btn.Text             = icon
    btn.TextColor3       = Color3.new(1,1,1)
    btn.Font             = Enum.Font.GothamBold
    btn.TextSize         = 14
    btn.ZIndex           = 4
    btn.Parent           = TitleBar
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = btn
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0.3}):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundTransparency = 0}):Play()
    end)
    return btn
end

local CloseBtn = MakeWinBtn(-38, Color3.fromRGB(220, 55, 55),  "✕")
local MinBtn   = MakeWinBtn(-72, Color3.fromRGB(230, 145, 20), "─")

-- Fechar
local minimized = false
CloseBtn.MouseButton1Click:Connect(function()
    SafeCall(function()
        PlayClick()
        TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
            Size     = UDim2.new(0, 0, 0, 0),
            Position = UDim2.new(0.5, 0, 0.5, 0),
        }):Play()
        task.delay(0.32, function()
            Main.Visible  = false
            Main.Size     = UDim2.new(0, 530, 0, 630)
            Main.Position = UDim2.new(0.5, -265, 0.5, -315)
        end)
    end)
end)

-- Minimizar
MinBtn.MouseButton1Click:Connect(function()
    SafeCall(function()
        PlayClick()
        minimized = not minimized
        if minimized then
            TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {
                Size = UDim2.new(0, 530, 0, 48)
            }):Play()
            MinBtn.Text = "☐"
        else
            TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back), {
                Size = UDim2.new(0, 530, 0, 630)
            }):Play()
            MinBtn.Text = "─"
        end
    end)
end)

-- ─── Barra de busca ──────────────────────────────────────────────────────────
local SearchBar = Instance.new("Frame")
SearchBar.Size            = UDim2.new(1, -170, 0, 28)
SearchBar.Position        = UDim2.new(0, 0, 1, -36)
SearchBar.BackgroundColor3= Color3.fromRGB(28, 28, 40)
SearchBar.ZIndex          = 3
SearchBar.Parent          = TitleBar

local SearchCorner = Instance.new("UICorner")
SearchCorner.CornerRadius = UDim.new(0, 8)
SearchCorner.Parent       = SearchBar

local SearchIcon = Instance.new("TextLabel")
SearchIcon.Size               = UDim2.new(0, 24, 1, 0)
SearchIcon.BackgroundTransparency = 1
SearchIcon.Text               = "🔍"
SearchIcon.TextSize           = 13
SearchIcon.Font               = Enum.Font.Gotham
SearchIcon.ZIndex             = 4
SearchIcon.Parent             = SearchBar

local SearchBox = Instance.new("TextBox")
SearchBox.Size              = UDim2.new(1, -30, 1, 0)
SearchBox.Position          = UDim2.new(0, 26, 0, 0)
SearchBox.BackgroundTransparency = 1
SearchBox.Text              = ""
SearchBox.PlaceholderText   = "Pesquisar..."
SearchBox.PlaceholderColor3 = Color3.fromRGB(100, 100, 120)
SearchBox.TextColor3        = Color3.fromRGB(220, 220, 220)
SearchBox.Font              = Enum.Font.Gotham
SearchBox.TextSize          = 12
SearchBox.TextXAlignment    = Enum.TextXAlignment.Left
SearchBox.ClearTextOnFocus  = false
SearchBox.ZIndex            = 4
SearchBox.Parent            = SearchBar

-- ─── Área de abas (sidebar) ──────────────────────────────────────────────────
local TabArea = Instance.new("Frame")
TabArea.Name            = "TabArea"
TabArea.Size            = UDim2.new(0, 135, 1, -58)
TabArea.Position        = UDim2.new(0, 5, 0, 53)
TabArea.BackgroundTransparency = 1
TabArea.Parent          = Main

local TabScroll = Instance.new("ScrollingFrame")
TabScroll.Size               = UDim2.new(1, 0, 1, 0)
TabScroll.BackgroundTransparency = 1
TabScroll.BorderSizePixel    = 0
TabScroll.ScrollBarThickness = 3
TabScroll.ScrollBarImageColor3 = T().Accent
TabScroll.Parent             = TabArea

local tabLayout = Instance.new("UIListLayout")
tabLayout.SortOrder = Enum.SortOrder.LayoutOrder
tabLayout.Padding   = UDim.new(0, 5)
tabLayout.Parent    = TabScroll

-- ─── Área de conteúdo ────────────────────────────────────────────────────────
local ContentArea = Instance.new("Frame")
ContentArea.Name            = "ContentArea"
ContentArea.Size            = UDim2.new(1, -148, 1, -58)
ContentArea.Position        = UDim2.new(0, 144, 0, 53)
ContentArea.BackgroundColor3= Color3.fromRGB(20, 20, 28)
ContentArea.BorderSizePixel = 0
ContentArea.Parent          = Main

local ContentAreaCorner = Instance.new("UICorner")
ContentAreaCorner.CornerRadius = UDim.new(0, 10)
ContentAreaCorner.Parent       = ContentArea

local ContentScroll = Instance.new("ScrollingFrame")
ContentScroll.Size               = UDim2.new(1, -8, 1, -8)
ContentScroll.Position           = UDim2.new(0, 4, 0, 4)
ContentScroll.BackgroundTransparency = 1
ContentScroll.BorderSizePixel    = 0
ContentScroll.ScrollBarThickness = 5
ContentScroll.ScrollBarImageColor3 = T().Accent
ContentScroll.Parent             = ContentArea

--====================================
-- SISTEMA DE ABAS
--====================================

local tabs       = {}
local currentTab = nil
local allWidgets = {} -- para busca

local function SelectTab(tab)
    SafeCall(function()
        for _, t in pairs(tabs) do
            t.Content.Visible = false
            TweenService:Create(t.Button, TweenInfo.new(0.2), {
                BackgroundColor3 = T().TabBG
            }):Play()
            if t.Glow then t.Glow.Transparency = 1 end
            if t.NameLbl then t.NameLbl.TextColor3 = T().SubText end
        end

        tab.Content.Visible = true

        -- Atualiza canvas size baseado no conteúdo real
        local layout = tab.Content:FindFirstChildOfClass("UIListLayout")
        if layout then
            ContentScroll.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
        end
        ContentScroll.CanvasPosition = Vector2.new(0, 0)

        TweenService:Create(tab.Button, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
            BackgroundColor3 = T().Accent
        }):Play()
        if tab.Glow    then tab.Glow.Transparency    = 0.35 end
        if tab.NameLbl then tab.NameLbl.TextColor3   = Color3.new(1,1,1) end

        -- Animação bounce no botão
        TweenService:Create(tab.Button, TweenInfo.new(0.1, Enum.EasingStyle.Back), {
            Size = UDim2.new(1, 4, 0, 44)
        }):Play()
        task.delay(0.1, function()
            TweenService:Create(tab.Button, TweenInfo.new(0.2, Enum.EasingStyle.Back), {
                Size = UDim2.new(1, 0, 0, 42)
            }):Play()
        end)

        currentTab = tab
    end)
end

local function CreateTab(name, icon)
    local tab = {
        Name    = name,
        Icon    = icon,
        Content = Instance.new("Frame"),
        Button  = Instance.new("TextButton"),
    }

    -- Painel de conteúdo
    tab.Content.Size = UDim2.new(1, 0, 1, 0)
    tab.Content.BackgroundTransparency = 1
    tab.Content.Visible = false
    tab.Content.Parent  = ContentScroll

    local lay = Instance.new("UIListLayout")
    lay.SortOrder = Enum.SortOrder.LayoutOrder
    lay.Padding   = UDim.new(0, 5)
    lay.Parent    = tab.Content

    -- Atualiza CanvasSize automaticamente quando o layout muda
    lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        if tab.Content.Visible then
            ContentScroll.CanvasSize = UDim2.new(0, 0, 0, lay.AbsoluteContentSize.Y + 20)
        end
    end)

    local pad = Instance.new("UIPadding")
    pad.PaddingBottom = UDim.new(0, 8)
    pad.Parent = tab.Content

    -- Botão da aba
    tab.Button.Size            = UDim2.new(1, 0, 0, 42)
    tab.Button.BackgroundColor3= T().TabBG
    tab.Button.Text            = ""
    tab.Button.Parent          = TabScroll

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 10)
    bCorner.Parent       = tab.Button

    local bGlow = Instance.new("UIStroke")
    bGlow.Color       = T().Accent
    bGlow.Thickness   = 1.5
    bGlow.Transparency= 1
    bGlow.Parent      = tab.Button
    tab.Glow = bGlow

    local iconLbl = Instance.new("TextLabel")
    iconLbl.Size               = UDim2.new(0, 30, 1, 0)
    iconLbl.Position           = UDim2.new(0, 6, 0, 0)
    iconLbl.BackgroundTransparency = 1
    iconLbl.Text               = icon
    iconLbl.TextSize           = 17
    iconLbl.Font               = Enum.Font.GothamBold
    iconLbl.Parent             = tab.Button

    local nameLbl = Instance.new("TextLabel")
    nameLbl.Size               = UDim2.new(1, -40, 1, 0)
    nameLbl.Position           = UDim2.new(0, 38, 0, 0)
    nameLbl.BackgroundTransparency = 1
    nameLbl.Text               = name
    nameLbl.TextColor3         = T().SubText
    nameLbl.Font               = Enum.Font.GothamBold
    nameLbl.TextSize           = 13
    nameLbl.TextXAlignment     = Enum.TextXAlignment.Left
    nameLbl.Parent             = tab.Button
    tab.NameLbl = nameLbl

    tab.Button.MouseButton1Click:Connect(function()
        SafeCall(SelectTab, tab)
    end)
    tab.Button.MouseEnter:Connect(function()
        if tab ~= currentTab then
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = T().Hover}):Play()
        end
    end)
    tab.Button.MouseLeave:Connect(function()
        if tab ~= currentTab then
            TweenService:Create(tab.Button, TweenInfo.new(0.2), {BackgroundColor3 = T().TabBG}):Play()
        end
    end)

    table.insert(tabs, tab)
    TabScroll.CanvasSize = UDim2.new(0, 0, 0, tabLayout.AbsoluteContentSize.Y + 5)
    return tab
end

--====================================
-- WIDGETS (CreateCategory, Toggle, Slider, Button...)
--====================================

local function CreateCategory(parent, text)
    SafeCall(function()
        local cat = Instance.new("Frame")
        cat.Size            = UDim2.new(1, -8, 0, 28)
        cat.BackgroundColor3= Color3.fromRGB(30, 30, 42)
        cat.Parent          = parent

        local cCorner = Instance.new("UICorner")
        cCorner.CornerRadius = UDim.new(0, 7)
        cCorner.Parent       = cat

        local cStroke = Instance.new("UIStroke")
        cStroke.Color       = T().Accent
        cStroke.Thickness   = 1
        cStroke.Transparency= 0.6
        cStroke.Parent      = cat

        local bar = Instance.new("Frame")
        bar.Size            = UDim2.new(0, 3, 0.7, 0)
        bar.Position        = UDim2.new(0, 8, 0.15, 0)
        bar.BackgroundColor3= T().Accent
        bar.BorderSizePixel = 0
        bar.Parent          = cat
        local barC = Instance.new("UICorner")
        barC.CornerRadius = UDim.new(1, 0)
        barC.Parent = bar

        local lbl = Instance.new("TextLabel")
        lbl.Size               = UDim2.new(1, -20, 1, 0)
        lbl.Position           = UDim2.new(0, 18, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text               = text
        lbl.TextColor3         = T().Accent
        lbl.Font               = Enum.Font.GothamBold
        lbl.TextSize           = 13
        lbl.TextXAlignment     = Enum.TextXAlignment.Left
        lbl.Parent             = cat
    end)
end

local function CreateToggle(parent, text, configKey, callback, tooltip)
    local container
    SafeCall(function()
        container = Instance.new("Frame")
        container.Size            = UDim2.new(1, -8, 0, 36)
        container.BackgroundColor3= T().ItemBG
        container.Parent          = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent       = container

        local btn = Instance.new("TextButton")
        btn.Size              = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text              = ""
        btn.Parent            = container

        local lbl = Instance.new("TextLabel")
        lbl.Size              = UDim2.new(1, -60, 1, 0)
        lbl.Position          = UDim2.new(0, 12, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text              = text
        lbl.TextColor3        = T().Text
        lbl.Font              = Enum.Font.Gotham
        lbl.TextSize          = 13
        lbl.TextXAlignment    = Enum.TextXAlignment.Left
        lbl.Parent            = container

        local track = Instance.new("Frame")
        track.Size            = UDim2.new(0, 46, 0, 22)
        track.Position        = UDim2.new(1, -52, 0.5, -11)
        track.BackgroundColor3= (Config[configKey] and T().ToggleOn or T().ToggleOff)
        track.Parent          = container
        local trackCorner = Instance.new("UICorner")
        trackCorner.CornerRadius = UDim.new(1, 0)
        trackCorner.Parent       = track

        local knob = Instance.new("Frame")
        knob.Size             = UDim2.new(0, 18, 0, 18)
        knob.Position         = Config[configKey]
                                and UDim2.new(1, -20, 0.5, -9)
                                or  UDim2.new(0,   2, 0.5, -9)
        knob.BackgroundColor3 = Color3.new(1, 1, 1)
        knob.Parent           = track
        local knobCorner = Instance.new("UICorner")
        knobCorner.CornerRadius = UDim.new(1, 0)
        knobCorner.Parent       = knob

        -- Tooltip
        if tooltip then
            local tip = Instance.new("TextLabel")
            tip.Size              = UDim2.new(0, 200, 0, 30)
            tip.BackgroundColor3  = Color3.fromRGB(20, 20, 30)
            tip.TextColor3        = Color3.fromRGB(220, 220, 220)
            tip.Font              = Enum.Font.Gotham
            tip.TextSize          = 11
            tip.Text              = tooltip
            tip.Visible           = false
            tip.ZIndex            = 20
            tip.Parent            = Gui
            local tc = Instance.new("UICorner") tc.CornerRadius = UDim.new(0,6) tc.Parent = tip
            container.MouseEnter:Connect(function()
                local mp = UIS:GetMouseLocation()
                tip.Position = UDim2.new(0, mp.X + 12, 0, mp.Y - 8)
                tip.Visible  = true
            end)
            container.MouseLeave:Connect(function() tip.Visible = false end)
        end

        btn.MouseButton1Click:Connect(function()
            SafeCall(function()
                PlayClick()
                Config[configKey] = not Config[configKey]
                local on = Config[configKey]
                TweenService:Create(track, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                    BackgroundColor3 = on and T().ToggleOn or T().ToggleOff
                }):Play()
                TweenService:Create(knob, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
                    Position = on and UDim2.new(1,-20,0.5,-9) or UDim2.new(0,2,0.5,-9)
                }):Play()
                TweenService:Create(container, TweenInfo.new(0.1), {
                    BackgroundColor3 = on and Color3.fromRGB(30, 50, 40) or T().ItemBG
                }):Play()
                task.delay(0.15, function()
                    TweenService:Create(container, TweenInfo.new(0.2), {
                        BackgroundColor3 = T().ItemBG
                    }):Play()
                end)
                if callback then SafeCall(callback, on) end
            end)
        end)

        container.MouseEnter:Connect(function()
            TweenService:Create(container, TweenInfo.new(0.18), {BackgroundColor3 = T().Hover}):Play()
        end)
        container.MouseLeave:Connect(function()
            TweenService:Create(container, TweenInfo.new(0.18), {BackgroundColor3 = T().ItemBG}):Play()
        end)

        table.insert(allWidgets, {frame=container, text=text, parent=parent})
    end)
    return container
end

local function CreateSlider(parent, text, configKey, min, max, callback, isFloat)
    local container
    SafeCall(function()
        -- Garante que o valor existe no Config
        if Config[configKey] == nil then
            Config[configKey] = min
            warn("[BSv3] CreateSlider: Config." .. configKey .. " não encontrado, usando " .. min)
        end

        container = Instance.new("Frame")
        container.Size            = UDim2.new(1, -8, 0, 56)
        container.BackgroundColor3= T().ItemBG
        container.Parent          = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent       = container

        local lbl = Instance.new("TextLabel")
        lbl.Size              = UDim2.new(0.65, 0, 0, 22)
        lbl.Position          = UDim2.new(0, 12, 0, 5)
        lbl.BackgroundTransparency = 1
        lbl.Text              = text
        lbl.TextColor3        = T().Text
        lbl.Font              = Enum.Font.Gotham
        lbl.TextSize          = 13
        lbl.TextXAlignment    = Enum.TextXAlignment.Left
        lbl.Parent            = container

        local valLbl = Instance.new("TextLabel")
        valLbl.Size           = UDim2.new(0.35, -12, 0, 22)
        valLbl.Position       = UDim2.new(0.65, 0, 0, 5)
        valLbl.BackgroundTransparency = 1
        valLbl.Text           = tostring(Config[configKey])
        valLbl.TextColor3     = T().Accent
        valLbl.Font           = Enum.Font.GothamBold
        valLbl.TextSize       = 14
        valLbl.TextXAlignment = Enum.TextXAlignment.Right
        valLbl.Parent         = container

        local bg = Instance.new("Frame")
        bg.Size            = UDim2.new(1, -24, 0, 7)
        bg.Position        = UDim2.new(0, 12, 0, 36)
        bg.BackgroundColor3= Color3.fromRGB(40, 40, 55)
        bg.Parent          = container
        local bgC = Instance.new("UICorner") bgC.CornerRadius = UDim.new(1,0) bgC.Parent = bg

        local pct0 = math.clamp((Config[configKey] - min) / (max - min), 0, 1)

        local fill = Instance.new("Frame")
        fill.Size            = UDim2.new(pct0, 0, 1, 0)
        fill.BackgroundColor3= T().SliderFill
        fill.Parent          = bg
        local fillC = Instance.new("UICorner") fillC.CornerRadius = UDim.new(1,0) fillC.Parent = fill
        local fillGrad = Instance.new("UIGradient")
        fillGrad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, T().Accent),
            ColorSequenceKeypoint.new(1, T().Accent2),
        }
        fillGrad.Parent = fill

        local dot = Instance.new("Frame")
        dot.Size            = UDim2.new(0, 14, 0, 14)
        dot.Position        = UDim2.new(pct0, -7, 0.5, -7)
        dot.BackgroundColor3= Color3.new(1,1,1)
        dot.ZIndex          = 2
        dot.Parent          = bg
        local dotC = Instance.new("UICorner") dotC.CornerRadius = UDim.new(1,0) dotC.Parent = dot

        local dragging = false

        bg.InputBegan:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = true
            end
        end)
        UIS.InputEnded:Connect(function(i)
            if i.UserInputType == Enum.UserInputType.MouseButton1 then
                dragging = false
            end
        end)
        UIS.InputChanged:Connect(function(i)
            if dragging and i.UserInputType == Enum.UserInputType.MouseMovement then
                SafeCall(function()
                    local pct = math.clamp(
                        (i.Position.X - bg.AbsolutePosition.X) / bg.AbsoluteSize.X,
                        0, 1
                    )
                    local raw = min + (max - min) * pct
                    local val = isFloat and (math.floor(raw * 100) / 100) or math.floor(raw)
                    Config[configKey] = val
                    valLbl.Text = tostring(val)
                    TweenService:Create(fill, TweenInfo.new(0.07), {Size = UDim2.new(pct,0,1,0)}):Play()
                    TweenService:Create(dot,  TweenInfo.new(0.07), {Position = UDim2.new(pct,-7,0.5,-7)}):Play()
                    if callback then SafeCall(callback, val) end
                end)
            end
        end)

        table.insert(allWidgets, {frame=container, text=text, parent=parent})
    end)
    return container
end

local function CreateButton(parent, text, callback, color)
    local btn
    SafeCall(function()
        btn = Instance.new("TextButton")
        btn.Size            = UDim2.new(1, -8, 0, 38)
        btn.BackgroundColor3= color or T().Accent
        btn.Text            = text
        btn.TextColor3      = Color3.new(1,1,1)
        btn.Font            = Enum.Font.GothamBold
        btn.TextSize        = 13
        btn.Parent          = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 9)
        corner.Parent       = btn

        local grad = Instance.new("UIGradient")
        grad.Color = ColorSequence.new{
            ColorSequenceKeypoint.new(0, color or T().Accent),
            ColorSequenceKeypoint.new(1, T().Accent2),
        }
        grad.Rotation = 45
        grad.Parent   = btn

        btn.MouseButton1Click:Connect(function()
            SafeCall(function()
                PlayClick()
                TweenService:Create(btn, TweenInfo.new(0.08), {Size = UDim2.new(1,-12,0,35)}):Play()
                task.delay(0.08, function()
                    TweenService:Create(btn, TweenInfo.new(0.15, Enum.EasingStyle.Back), {Size = UDim2.new(1,-8,0,38)}):Play()
                end)
                if callback then SafeCall(callback) end
            end)
        end)
        btn.MouseEnter:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = T().Accent2}):Play()
        end)
        btn.MouseLeave:Connect(function()
            TweenService:Create(btn, TweenInfo.new(0.2), {BackgroundColor3 = color or T().Accent}):Play()
        end)

        table.insert(allWidgets, {frame=btn, text=text, parent=parent})
    end)
    return btn
end

local function CreateLabel(parent, text, color)
    SafeCall(function()
        local lbl = Instance.new("TextLabel")
        lbl.Size            = UDim2.new(1, -8, 0, 28)
        lbl.BackgroundColor3= Color3.fromRGB(18, 18, 28)
        lbl.TextColor3      = color or T().SubText
        lbl.Font            = Enum.Font.Gotham
        lbl.TextSize        = 12
        lbl.Text            = text
        lbl.TextXAlignment  = Enum.TextXAlignment.Left
        lbl.Parent          = parent
        local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,7) c.Parent = lbl
        local p = Instance.new("UIPadding") p.PaddingLeft = UDim.new(0,10) p.Parent = lbl
    end)
end

local function CreateDropdown(parent, label, options, configKey, callback)
    SafeCall(function()
        local container = Instance.new("Frame")
        container.Size            = UDim2.new(1, -8, 0, 38)
        container.BackgroundColor3= T().ItemBG
        container.ClipsDescendants= false
        container.Parent          = parent

        local corner = Instance.new("UICorner")
        corner.CornerRadius = UDim.new(0, 8)
        corner.Parent       = container

        local btn = Instance.new("TextButton")
        btn.Size              = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text              = label .. ":  " .. tostring(Config[configKey] or options[1]) .. "  ▾"
        btn.TextColor3        = T().Text
        btn.Font              = Enum.Font.Gotham
        btn.TextSize          = 13
        btn.TextXAlignment    = Enum.TextXAlignment.Center
        btn.Parent            = container

        local dropdown = Instance.new("Frame")
        dropdown.Size            = UDim2.new(1, 0, 0, 0)
        dropdown.Position        = UDim2.new(0, 0, 1, 4)
        dropdown.BackgroundColor3= Color3.fromRGB(18, 18, 28)
        dropdown.Visible         = false
        dropdown.ClipsDescendants= true
        dropdown.ZIndex          = 12
        dropdown.Parent          = container

        local dCorner = Instance.new("UICorner") dCorner.CornerRadius = UDim.new(0,8) dCorner.Parent = dropdown

        local dLayout = Instance.new("UIListLayout")
        dLayout.Padding = UDim.new(0, 2)
        dLayout.Parent  = dropdown

        for _, opt in ipairs(options) do
            local ob = Instance.new("TextButton")
            ob.Size            = UDim2.new(1, 0, 0, 32)
            ob.BackgroundColor3= Color3.fromRGB(22, 22, 34)
            ob.Text            = "  " .. opt
            ob.TextColor3      = T().Text
            ob.Font            = Enum.Font.Gotham
            ob.TextSize        = 12
            ob.TextXAlignment  = Enum.TextXAlignment.Left
            ob.ZIndex          = 13
            ob.Parent          = dropdown
            local oc = Instance.new("UICorner") oc.CornerRadius = UDim.new(0,6) oc.Parent = ob
            ob.MouseButton1Click:Connect(function()
                SafeCall(function()
                    PlayClick()
                    Config[configKey] = opt
                    btn.Text = label .. ":  " .. opt .. "  ▾"
                    dropdown.Visible = false
                    TweenService:Create(dropdown, TweenInfo.new(0.2), {Size = UDim2.new(1,0,0,0)}):Play()
                    if callback then SafeCall(callback, opt) end
                end)
            end)
            ob.MouseEnter:Connect(function() TweenService:Create(ob, TweenInfo.new(0.15), {BackgroundColor3 = T().Accent}):Play() end)
            ob.MouseLeave:Connect(function() TweenService:Create(ob, TweenInfo.new(0.15), {BackgroundColor3 = Color3.fromRGB(22,22,34)}):Play() end)
        end

        btn.MouseButton1Click:Connect(function()
            SafeCall(function()
                PlayClick()
                dropdown.Visible = not dropdown.Visible
                if dropdown.Visible then
                    TweenService:Create(dropdown, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
                        Size = UDim2.new(1, 0, 0, #options * 34 + 4)
                    }):Play()
                else
                    TweenService:Create(dropdown, TweenInfo.new(0.2), {Size = UDim2.new(1,0,0,0)}):Play()
                end
            end)
        end)
        container.MouseEnter:Connect(function() TweenService:Create(container, TweenInfo.new(0.18), {BackgroundColor3 = T().Hover}):Play() end)
        container.MouseLeave:Connect(function() TweenService:Create(container, TweenInfo.new(0.18), {BackgroundColor3 = T().ItemBG}):Play() end)
    end)
end

local function CreatePlayerDropdown(parent, text, callback)
    SafeCall(function()
        local container = Instance.new("Frame")
        container.Size            = UDim2.new(1, -8, 0, 38)
        container.BackgroundColor3= T().ItemBG
        container.ClipsDescendants= false
        container.Parent          = parent

        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0,8) corner.Parent = container

        local btn = Instance.new("TextButton")
        btn.Size              = UDim2.new(1, 0, 1, 0)
        btn.BackgroundTransparency = 1
        btn.Text              = "👤 " .. text .. "  ▾"
        btn.TextColor3        = T().Text
        btn.Font              = Enum.Font.Gotham
        btn.TextSize          = 13
        btn.Parent            = container

        local dropdown = Instance.new("Frame")
        dropdown.Size            = UDim2.new(1, 0, 0, 0)
        dropdown.Position        = UDim2.new(0, 0, 1, 4)
        dropdown.BackgroundColor3= Color3.fromRGB(18, 18, 28)
        dropdown.Visible         = false
        dropdown.ClipsDescendants= true
        dropdown.ZIndex          = 15
        dropdown.Parent          = container

        local dCorner = Instance.new("UICorner") dCorner.CornerRadius = UDim.new(0,8) dCorner.Parent = dropdown

        local dScroll = Instance.new("ScrollingFrame")
        dScroll.Size               = UDim2.new(1, 0, 1, 0)
        dScroll.BackgroundTransparency = 1
        dScroll.BorderSizePixel    = 0
        dScroll.ScrollBarThickness = 3
        dScroll.ScrollBarImageColor3 = T().Accent
        dScroll.ZIndex             = 15
        dScroll.Parent             = dropdown

        local dLayout = Instance.new("UIListLayout")
        dLayout.Padding = UDim.new(0, 2)
        dLayout.Parent  = dScroll

        btn.MouseButton1Click:Connect(function()
            SafeCall(function()
                PlayClick()
                dropdown.Visible = not dropdown.Visible
                if dropdown.Visible then
                    for _, c in pairs(dScroll:GetChildren()) do
                        if c:IsA("TextButton") then c:Destroy() end
                    end
                    local count = 0
                    for _, p in ipairs(Players:GetPlayers()) do
                        if p ~= LocalPlayer then
                            count = count + 1
                            local pb = Instance.new("TextButton")
                            pb.Size            = UDim2.new(1, 0, 0, 32)
                            pb.BackgroundColor3= Color3.fromRGB(22, 22, 34)
                            pb.Text            = "  👤 " .. p.Name
                            pb.TextColor3      = T().Text
                            pb.Font            = Enum.Font.Gotham
                            pb.TextSize        = 12
                            pb.TextXAlignment  = Enum.TextXAlignment.Left
                            pb.ZIndex          = 16
                            pb.Parent          = dScroll
                            local pc = Instance.new("UICorner") pc.CornerRadius = UDim.new(0,6) pc.Parent = pb
                            pb.MouseButton1Click:Connect(function()
                                dropdown.Visible = false
                                TweenService:Create(dropdown, TweenInfo.new(0.2), {Size = UDim2.new(1,0,0,0)}):Play()
                                if callback then SafeCall(callback, p) end
                            end)
                            pb.MouseEnter:Connect(function() TweenService:Create(pb, TweenInfo.new(0.15), {BackgroundColor3=T().Accent}):Play() end)
                            pb.MouseLeave:Connect(function() TweenService:Create(pb, TweenInfo.new(0.15), {BackgroundColor3=Color3.fromRGB(22,22,34)}):Play() end)
                        end
                    end
                    dScroll.CanvasSize = UDim2.new(0, 0, 0, count * 34)
                    TweenService:Create(dropdown, TweenInfo.new(0.25, Enum.EasingStyle.Back), {
                        Size = UDim2.new(1, 0, 0, math.min(count*34+4, 160))
                    }):Play()
                else
                    TweenService:Create(dropdown, TweenInfo.new(0.2), {Size = UDim2.new(1,0,0,0)}):Play()
                end
            end)
        end)
        container.MouseEnter:Connect(function() TweenService:Create(container, TweenInfo.new(0.18), {BackgroundColor3=T().Hover}):Play() end)
        container.MouseLeave:Connect(function() TweenService:Create(container, TweenInfo.new(0.18), {BackgroundColor3=T().ItemBG}):Play() end)
    end)
end

local function CreateTextInput(parent, label, configKey, callback)
    SafeCall(function()
        local container = Instance.new("Frame")
        container.Size            = UDim2.new(1, -8, 0, 38)
        container.BackgroundColor3= T().ItemBG
        container.Parent          = parent

        local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0,8) corner.Parent = container

        local lbl = Instance.new("TextLabel")
        lbl.Size              = UDim2.new(0, 100, 1, 0)
        lbl.Position          = UDim2.new(0, 12, 0, 0)
        lbl.BackgroundTransparency = 1
        lbl.Text              = label .. ":"
        lbl.TextColor3        = T().SubText
        lbl.Font              = Enum.Font.Gotham
        lbl.TextSize          = 12
        lbl.TextXAlignment    = Enum.TextXAlignment.Left
        lbl.Parent            = container

        local box = Instance.new("TextBox")
        box.Size              = UDim2.new(1, -120, 0, 26)
        box.Position          = UDim2.new(0, 108, 0.5, -13)
        box.BackgroundColor3  = Color3.fromRGB(35, 35, 50)
        box.Text              = tostring(Config[configKey] or "")
        box.TextColor3        = Color3.new(1,1,1)
        box.Font              = Enum.Font.Gotham
        box.TextSize          = 12
        box.PlaceholderText   = "..."
        box.PlaceholderColor3 = Color3.fromRGB(120,120,140)
        box.ClearTextOnFocus  = false
        box.Parent            = container
        local bCorner = Instance.new("UICorner") bCorner.CornerRadius = UDim.new(0,6) bCorner.Parent = box

        box.FocusLost:Connect(function()
            SafeCall(function()
                Config[configKey] = box.Text
                if callback then SafeCall(callback, box.Text) end
            end)
        end)
    end)
end

-- Filtro de busca
SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    local q = SearchBox.Text:lower()
    for _, w in pairs(allWidgets) do
        if w.frame and w.frame.Parent then
            w.frame.Visible = (q == "") or (w.text:lower():find(q, 1, true) ~= nil)
        end
    end
end)

--====================================
-- CRIAR ABAS
--====================================

local espTab      = CreateTab("ESP",        "👁")
local combatTab   = CreateTab("Combat",     "⚔️")
local playerTab   = CreateTab("Player",     "🏃")
local visualTab   = CreateTab("Visual",     "🎨")
local teleportTab = CreateTab("Teleport",   "📍")
local serverTab   = CreateTab("Server",     "🌐")
local miscTab     = CreateTab("Misc",       "⚙️")
local settingsTab = CreateTab("Settings",   "🔧")
local statsTab    = CreateTab("Stats",      "📊")

--====================================
-- ABA: ESP
--====================================

CreateCategory(espTab.Content, "📌 ESP BÁSICO")
CreateToggle(espTab.Content, "ESP Ativado",        "ESPEnabled",  nil, "Ativa/desativa o sistema de ESP")
CreateToggle(espTab.Content, "Boxes (Caixas)",     "Boxes",       nil, "Mostra caixas ao redor dos jogadores")
CreateDropdown(espTab.Content, "Estilo da Box", {"Full","Corner"}, "BoxStyle")
CreateToggle(espTab.Content, "Box Preenchida",     "FilledBox",   nil, "Caixa com fundo semi-transparente")
CreateSlider(espTab.Content, "Alpha Preench.",     "FilledBoxAlpha", 0, 1, nil, true)
CreateToggle(espTab.Content, "Nomes",              "Names")
CreateToggle(espTab.Content, "Distância",          "Distance")
CreateToggle(espTab.Content, "Tracers (Linhas)",   "Tracers")
CreateDropdown(espTab.Content, "Origem Tracer", {"Bottom","Center","Top"}, "TracerOrigin")
CreateToggle(espTab.Content, "Barras de Vida",     "HealthBars")
CreateToggle(espTab.Content, "Texto de HP",        "ShowHPText",  nil, "Mostra o HP numérico ao lado da barra")
CreateToggle(espTab.Content, "Esqueleto",          "Skeleton",    nil, "Desenha os ossos do personagem")
CreateToggle(espTab.Content, "Team Check",         "TeamCheck")
CreateToggle(espTab.Content, "Apenas Visíveis",    "VisibleOnly")
CreateToggle(espTab.Content, "Cor do Time",        "TeamColor")
CreateToggle(espTab.Content, "Nome do Time",       "ShowTeamName",nil, "Mostra o nome do time abaixo do nome")

CreateCategory(espTab.Content, "🔭 ALCANCE E VISUAL")
CreateSlider(espTab.Content, "Dist. Máxima ESP",   "MaxESPDist",  50, 5000)
CreateSlider(espTab.Content, "Tamanho Fonte",      "ESPFontSize",  8, 24)
CreateToggle(espTab.Content, "Setas Offscreen",    "OffscreenArrows", nil, "Indica jogadores fora da tela")
CreateToggle(espTab.Content, "Modo Rainbow",       "RainbowMode")
CreateSlider(espTab.Content, "Transparência ESP",  "ESPTransparency", 0, 1, nil, true)

CreateCategory(espTab.Content, "🎨 ESP AVANÇADO")
CreateToggle(espTab.Content, "Chams (3D)",         "ChamsEnabled", function(on)
    if on then for _,p in pairs(Players:GetPlayers()) do if p~=LocalPlayer then CreateChams(p) end end
    else ChamsFolder:ClearAllChildren() end
end)
CreateToggle(espTab.Content, "Highlight",          "HighlightEnabled", function(on)
    if on then for _,p in pairs(Players:GetPlayers()) do if p~=LocalPlayer then CreateHighlight(p) end end
    else for _,h in pairs(HighlightCache) do if h then h:Destroy() end end HighlightCache = {} end
end)
CreateToggle(espTab.Content, "Mostrar Ferramenta", "ShowTools")
CreateToggle(espTab.Content, "Mostrar Cabeça",     "ShowHead")
CreateToggle(espTab.Content, "Direção do Olhar",   "ShowLookDirection")

CreateCategory(espTab.Content, "📦 ITEM ESP")
CreateToggle(espTab.Content, "Item/Coin ESP",      "ItemESP",     nil, "Mostra itens e moedas no mapa")
CreateSlider(espTab.Content, "Alcance Item ESP",   "ItemESPRange", 50, 1000)

--====================================
-- ABA: COMBAT
--====================================

CreateCategory(combatTab.Content, "🎯 AIMBOT")
CreateToggle(combatTab.Content, "Aimbot",          "Aimbot")
CreateSlider(combatTab.Content, "FOV do Aimbot",   "AimbotFOV",      50,  600)
CreateSlider(combatTab.Content, "Suavização",      "AimbotSmoothing", 0, 100)
CreateToggle(combatTab.Content, "Prever Movimento","PredictMovement")
CreateToggle(combatTab.Content, "Ignorar Paredes", "IgnoreWalls")
CreateToggle(combatTab.Content, "Auto Shoot",      "AutoShoot")
CreateToggle(combatTab.Content, "Círculo FOV",     "FOVCircle")
CreateDropdown(combatTab.Content, "Alvo",      {"Head","Torso","Random"},     "AimbotTarget")
CreateDropdown(combatTab.Content, "Prioridade",{"Distance","Health"},         "AimbotPriority")

CreateCategory(combatTab.Content, "⚡ COMBAT AVANÇADO")
CreateToggle(combatTab.Content, "Silent Aim",      "SilentAim")
CreateToggle(combatTab.Content, "Trigger Bot",     "TriggerBot")
CreateToggle(combatTab.Content, "Rapid Fire",      "RapidFire")
CreateToggle(combatTab.Content, "No Recoil",       "NoRecoil")
CreateToggle(combatTab.Content, "Hitbox Expander", "HitboxExpander", nil, "Aumenta hitbox dos inimigos")
CreateSlider(combatTab.Content, "Tamanho Hitbox",  "HitboxSize", 1, 20)

--====================================
-- ABA: PLAYER
--====================================

CreateCategory(playerTab.Content, "🏃 MOVIMENTO")
CreateSlider(playerTab.Content,  "Walk Speed",        "WalkSpeed",  16,  500, SetWalkSpeed)
CreateSlider(playerTab.Content,  "Jump Power",        "JumpPower",  50,  500, SetJumpPower)
CreateToggle(playerTab.Content,  "Pulo Infinito",     "InfiniteJump")
CreateToggle(playerTab.Content,  "NoClip",            "NoClip",        ToggleNoClip)
CreateToggle(playerTab.Content,  "Voar",              "Fly",           ToggleFly)
CreateSlider(playerTab.Content,  "Velocidade de Voo", "FlySpeed",   10,  300)
CreateButton(playerTab.Content,  "⬆️ Super Jump",      SuperJump)

CreateCategory(playerTab.Content, "🛡️ PROTEÇÃO")
CreateToggle(playerTab.Content,  "God Mode",          "God",           ToggleGod)
CreateToggle(playerTab.Content,  "Anti Ragdoll",      "AntiRagdoll",   ToggleAntiRagdoll)
CreateToggle(playerTab.Content,  "Anti Slowdown",     "AntiSlowdown")
CreateToggle(playerTab.Content,  "Platform",          "PlatformEnabled",TogglePlatform)

CreateCategory(playerTab.Content, "🎭 OUTROS")
CreateToggle(playerTab.Content,  "Invisível",         "Invisible",     ToggleInvisible)
CreateToggle(playerTab.Content,  "Auto Respawn",      "AutoRespawn")
CreateButton(playerTab.Content,  "🗑️ Remover Acessórios", function()
    local c = LocalPlayer.Character
    if c then for _,a in pairs(c:GetChildren()) do if a:IsA("Accessory") then a:Destroy() end end end
    Notify("Acessórios removidos!", 2, "Success")
end)
CreateButton(playerTab.Content,  "💀 Reset Character", function()
    if LocalPlayer.Character then LocalPlayer.Character:BreakJoints() end
end, Color3.fromRGB(200, 50, 50))

--====================================
-- ABA: VISUAL
--====================================

CreateCategory(visualTab.Content, "💡 ILUMINAÇÃO")
CreateToggle(visualTab.Content, "Fullbright",       "Fullbright",  ToggleFullbright)
CreateToggle(visualTab.Content, "Remover Neblina",  "RemoveFog", function(on)
    Lighting.FogEnd = on and 1e9 or origLighting.FogEnd
end)
CreateToggle(visualTab.Content, "Modo Noturno",     "NightMode",   ToggleNightMode)

CreateCategory(visualTab.Content, "🖥️ INTERFACE")
CreateToggle(visualTab.Content, "Crosshair",        "Crosshair")
CreateToggle(visualTab.Content, "Círculo FOV",      "FOVCircle")
CreateToggle(visualTab.Content, "HUD Personalizado","CustomHUD",   nil, "Mostra stats na tela")
CreateToggle(visualTab.Content, "Modo Rainbow",     "RainbowMode")

CreateCategory(visualTab.Content, "🎭 EFEITOS")
CreateToggle(visualTab.Content, "FPS Boost",        "FPSBoost",    ApplyFPSBoost)
CreateToggle(visualTab.Content, "Wireframe Mode",   "WireframeMode",ToggleWireframe)
CreateButton(visualTab.Content, "🗑️ Remover Texturas", function()
    for _,o in pairs(workspace:GetDescendants()) do
        if o:IsA("Decal") or o:IsA("Texture") then o:Destroy() end
    end
    Notify("Texturas removidas!", 2, "Success")
end)
CreateButton(visualTab.Content, "✨ Remover Partículas", function()
    for _,v in pairs(workspace:GetDescendants()) do
        if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") or v:IsA("Sparkles") then
            v:Destroy()
        end
    end
    Notify("Partículas removidas!", 2, "Success")
end)

--====================================
-- ABA: TELEPORT
--====================================

CreateCategory(teleportTab.Content, "🚀 TELEPORTE RÁPIDO")
CreatePlayerDropdown(teleportTab.Content, "Teleportar para Jogador", function(p)
    TeleportToPlayer(p)
    Notify("Teleportado para " .. p.Name, 2, "Success")
end)
CreateDropdown(teleportTab.Content, "Método", {"Instant","Tween"}, "TeleportType")
CreateToggle(teleportTab.Content, "Click TP (CTRL+Click)",   "ClickTP",     nil, "Clique com CTRL para teleportar")
CreateToggle(teleportTab.Content, "Click Delete (ALT+Click)","ClickDelete")

CreateCategory(teleportTab.Content, "💾 POSIÇÕES SALVAS (5 SLOTS)")
for i = 1, 5 do
    SafeCall(function()
        local row = Instance.new("Frame")
        row.Size               = UDim2.new(1, -8, 0, 38)
        row.BackgroundTransparency = 1
        row.Parent             = teleportTab.Content

        local rL = Instance.new("UIListLayout")
        rL.FillDirection = Enum.FillDirection.Horizontal
        rL.Padding       = UDim.new(0, 4)
        rL.Parent        = row

        local function MakeSlotBtn(label, bgColor)
            local b = Instance.new("TextButton")
            b.Size            = UDim2.new(0.5, -2, 1, 0)
            b.BackgroundColor3= bgColor
            b.Text            = label
            b.TextColor3      = Color3.new(1,1,1)
            b.Font            = Enum.Font.GothamBold
            b.TextSize        = 12
            b.Parent          = row
            local c = Instance.new("UICorner") c.CornerRadius = UDim.new(0,8) c.Parent = b
            return b
        end

        local slot    = "pos" .. i
        local saveBtn = MakeSlotBtn("💾 Salvar #"..i, T().Accent)
        local loadBtn = MakeSlotBtn("📍 Ir #"..i,     Color3.fromRGB(80,60,200))

        saveBtn.MouseButton1Click:Connect(function()
            PlayClick()
            if SavePosition(slot) then Notify("✅ Slot "..i.." salvo!",      2, "Success")
            else                       Notify("❌ Falha ao salvar!",          2, "Error")   end
        end)
        loadBtn.MouseButton1Click:Connect(function()
            PlayClick()
            if LoadPosition(slot) then Notify("✅ Teleportado ao Slot "..i,  2, "Success")
            else                       Notify("❌ Slot "..i.." vazio!",       2, "Warning") end
        end)
    end)
end

--====================================
-- ABA: SERVER
--====================================

CreateCategory(serverTab.Content, "🌐 SERVIDOR")
CreateToggle(serverTab.Content, "Anti Kick",        "AntiKick",  ToggleAntiKick)
CreateToggle(serverTab.Content, "Anti Void",        "AntiVoid",  function(on) ToggleAntiVoid(on) end)
CreateButton(serverTab.Content, "🔄 Server Hop",    ServerHop)
CreateButton(serverTab.Content, "🔃 Rejoin Server", RejoinServer)

CreateCategory(serverTab.Content, "💬 CHAT")
CreateToggle(serverTab.Content, "Chat Spam",        "ChatSpam",  ToggleChatSpam)
CreateTextInput(serverTab.Content, "Mensagem",      "ChatSpamMessage")

CreateCategory(serverTab.Content, "🔧 FERRAMENTAS")
CreateToggle(serverTab.Content, "BTools",           "BTools",    ToggleBTools)

--====================================
-- ABA: MISC
--====================================

CreateCategory(miscTab.Content, "🖱️ AUTO CLICKER")
CreateToggle(miscTab.Content, "Auto Clicker",       "AutoClicker", function(on)
    if on then StartAutoClicker() end
end)
CreateSlider(miscTab.Content, "CPS (Clicks/Seg)",   "AutoClickerCPS", 1, 30)

CreateCategory(miscTab.Content, "🎮 GAMEPLAY")
CreateToggle(miscTab.Content, "SpinBot",            "SpinBot",   ToggleSpinBot)
CreateToggle(miscTab.Content, "Anti AFK",           "AntiAFK")
CreateToggle(miscTab.Content, "Som no Clique",      "SoundOnClick")

CreateCategory(miscTab.Content, "🛠️ DEBUG / EXPLORAR")
CreateToggle(miscTab.Content, "Remote Spy",         "RemotesSpy", function(on)
    if on then
        local old; old = hookmetamethod(game,"__namecall",function(self,...)
            local m = getnamecallmethod()
            if m=="FireServer" or m=="InvokeServer" then
                print("[REMOTE SPY]", self:GetFullName(), m, ...)
            end
            return old(self,...)
        end)
    end
end)

CreateCategory(miscTab.Content, "⚠️ PERIGOSO")
CreateButton(miscTab.Content, "🔴 Matar Todos", function()
    for _,p in ipairs(Players:GetPlayers()) do
        if p~=LocalPlayer and p.Character then
            local h = p.Character:FindFirstChild("Humanoid")
            if h then h.Health = 0 end
        end
    end
    Notify("Kill All executado!", 2, "Warning")
end, Color3.fromRGB(180, 30, 30))

CreateButton(miscTab.Content, "🔄 Reset Configurações", function()
    for k,v in pairs(Config) do
        if type(v) == "boolean" then Config[k] = false end
    end
    Config.WalkSpeed        = 16
    Config.JumpPower        = 50
    Config.AimbotFOV        = 200
    Config.AimbotSmoothing  = 100
    Config.FlySpeed         = 50
    Config.ESPTransparency  = 0.3
    Config.AntiAFK          = true
    SetWalkSpeed(16); SetJumpPower(50)
    Notify("Configurações resetadas!", 2, "Success")
end)

CreateButton(miscTab.Content, "💥 Fechar Interface", function()
    Notify("Interface fechando...", 1.5, "Info")
    task.delay(1.5, function() if Gui then Gui:Destroy() end end)
end, Color3.fromRGB(80, 30, 30))

--====================================
-- ABA: SETTINGS
--====================================

CreateCategory(settingsTab.Content, "🎨 TEMA")
CreateDropdown(settingsTab.Content, "Tema", {"Dark","Neon","Light"}, "CurrentTheme", function(theme)
    Config.CurrentTheme         = theme
    Main.BackgroundColor3       = T().BG
    TitleBar.BackgroundColor3   = T().TitleBG
    Notify("Tema: " .. theme, 2, "Success")
end)

CreateCategory(settingsTab.Content, "🔊 ÁUDIO")
CreateToggle(settingsTab.Content, "Som nos Cliques", "SoundOnClick")
CreateSlider(settingsTab.Content, "Volume Clique",   "dummy_cv", 0, 100, function(v)
    ClickSound.Volume = v / 100
end)

CreateCategory(settingsTab.Content, "💾 CONFIGS")
CreateButton(settingsTab.Content, "💾 Salvar Config Padrão", function()
    Notify("Config salva em memória!", 2, "Success")
    LogSystem:Add("Config salva pelo usuário", "Config")
end)
CreateButton(settingsTab.Content, "📋 Copiar Info do Jogo", function()
    local info = string.format("PlaceId: %d | JobId: %s | Players: %d",
        game.PlaceId, game.JobId, #Players:GetPlayers())
    pcall(setclipboard, info)
    Notify("Info copiada!", 2, "Success")
end)

CreateCategory(settingsTab.Content, "ℹ️ SOBRE")
CreateLabel(settingsTab.Content, "  🦈 Black Shark V3 - Ultimate Edition")
CreateLabel(settingsTab.Content, "  INSERT → Abrir / Fechar menu")
CreateLabel(settingsTab.Content, "  F1 = ESP   |  F2 = Aimbot")
CreateLabel(settingsTab.Content, "  F3 = Fly   |  F4 = NoClip")
CreateLabel(settingsTab.Content, "  F5 = Fullbright  |  F6 = HUD")

--====================================
-- ABA: STATS
--====================================

CreateCategory(statsTab.Content, "📊 ESTATÍSTICAS EM TEMPO REAL")

local statsFrame = Instance.new("Frame")
statsFrame.Size            = UDim2.new(1, -8, 0, 140)
statsFrame.BackgroundColor3= Color3.fromRGB(12, 12, 20)
statsFrame.Parent          = statsTab.Content

local sCorner = Instance.new("UICorner") sCorner.CornerRadius = UDim.new(0,8) sCorner.Parent = statsFrame

local statsLabel = Instance.new("TextLabel")
statsLabel.Size               = UDim2.new(1,-16,1,-12)
statsLabel.Position           = UDim2.new(0,8,0,6)
statsLabel.BackgroundTransparency = 1
statsLabel.TextColor3         = Color3.fromRGB(200,200,200)
statsLabel.Font               = Enum.Font.Code
statsLabel.TextSize           = 12
statsLabel.TextYAlignment     = Enum.TextYAlignment.Top
statsLabel.TextXAlignment     = Enum.TextXAlignment.Left
statsLabel.TextWrapped        = true
statsLabel.Parent             = statsFrame

task.spawn(function()
    while statsFrame and statsFrame.Parent do
        task.wait(0.5)
        local ok, fps = pcall(function() return math.floor(1 / RunService.RenderStepped:Wait()) end)
        local ok2, ping= pcall(function() return math.floor(LocalPlayer:GetNetworkPing() * 1000) end)
        statsLabel.Text = string.format(
            "⏱  Tempo Ativo: %s\n⚡  FPS: %d\n📡  Ping: %d ms\n👥  Jogadores: %d\n💀  Kills: %d\n📍  Teleportes: %d\n🎁  Coletados: %d\n📝  Logs: %d",
            Stats:Uptime(),
            ok  and fps  or 0,
            ok2 and ping or 0,
            #Players:GetPlayers(),
            Stats.Kills, Stats.Teleports, Stats.Collected, #LogSystem.Logs
        )
    end
end)

CreateButton(statsTab.Content, "🔄 Resetar Stats", function()
    Stats.Kills=0; Stats.Deaths=0; Stats.Teleports=0; Stats.Collected=0
    Stats.StartTime = tick()
    Notify("Estatísticas resetadas!", 2, "Success")
end)

CreateCategory(statsTab.Content, "📝 CONSOLE DE LOGS")

local logsScroll = Instance.new("ScrollingFrame")
logsScroll.Size               = UDim2.new(1,-8,0,200)
logsScroll.BackgroundColor3   = Color3.fromRGB(8,8,14)
logsScroll.BorderSizePixel    = 0
logsScroll.ScrollBarThickness = 4
logsScroll.ScrollBarImageColor3 = T().Accent
logsScroll.Parent             = statsTab.Content

local logsCorner = Instance.new("UICorner") logsCorner.CornerRadius = UDim.new(0,8) logsCorner.Parent = logsScroll

local logsLayout = Instance.new("UIListLayout")
logsLayout.SortOrder = Enum.SortOrder.LayoutOrder
logsLayout.Padding   = UDim.new(0, 1)
logsLayout.Parent    = logsScroll

task.spawn(function()
    local last = 0
    while logsScroll and logsScroll.Parent do
        task.wait(0.5)
        if #LogSystem.Logs > last then
            for i = last+1, #LogSystem.Logs do
                local log = LogSystem.Logs[i]
                local col = log.Type == "Error"   and Color3.fromRGB(255,100,100) or
                            log.Type == "Warning" and Color3.fromRGB(255,200,80)  or
                            log.Type == "Success" and Color3.fromRGB(100,255,100) or
                            Color3.fromRGB(180,180,180)
                local ll = Instance.new("TextLabel")
                ll.Size            = UDim2.new(1,-8,0,18)
                ll.BackgroundColor3= Color3.fromRGB(14,14,22)
                ll.TextColor3      = col
                ll.Font            = Enum.Font.Code
                ll.TextSize        = 10
                ll.Text            = "  ["..log.Time.."] "..log.Text
                ll.TextXAlignment  = Enum.TextXAlignment.Left
                ll.Parent          = logsScroll
                local lc = Instance.new("UICorner") lc.CornerRadius = UDim.new(0,3) lc.Parent = ll
            end
            last = #LogSystem.Logs
            logsScroll.CanvasSize     = UDim2.new(0,0,0, logsLayout.AbsoluteContentSize.Y + 4)
            logsScroll.CanvasPosition = Vector2.new(0, math.huge)
        end
    end
end)

CreateButton(statsTab.Content, "🗑️ Limpar Logs", function()
    LogSystem.Logs = {}
    for _,c in pairs(logsScroll:GetChildren()) do
        if c:IsA("TextLabel") then c:Destroy() end
    end
    Notify("Logs limpos!", 2, "Success")
end)

--====================================
-- ARRASTAR JANELA
--====================================

do
    local dragging, dragStart, startPos, dragInput = false, nil, nil, nil

    TitleBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging  = true
            dragStart = input.Position
            startPos  = Main.Position
        end
    end)
    TitleBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            dragInput = input
        end
    end)
    UIS.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            local d = input.Position - dragStart
            Main.Position = UDim2.new(
                startPos.X.Scale, startPos.X.Offset + d.X,
                startPos.Y.Scale, startPos.Y.Offset + d.Y
            )
        end
    end)
    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

--====================================
-- FUNÇÃO PARA ABRIR/FECHAR O MENU
--====================================

local menuOpen = false

local function OpenMenu()
    if menuOpen then return end
    menuOpen = true
    minimized = false
    MinBtn.Text = "─"
    Main.Visible  = true
    Main.Size     = UDim2.new(0, 0, 0, 0)
    Main.Position = UDim2.new(0.5, 0, 0.5, 0)
    TweenService:Create(Main, TweenInfo.new(0.4, Enum.EasingStyle.Back), {
        Size     = UDim2.new(0, 530, 0, 630),
        Position = UDim2.new(0.5, -265, 0.5, -315),
    }):Play()
end

local function CloseMenu()
    if not menuOpen then return end
    Main.Size     = UDim2.new(0, 530, 0, 630)
    Main.Position = UDim2.new(0.5, -265, 0.5, -315)
    TweenService:Create(Main, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.In), {
        Size     = UDim2.new(0, 0, 0, 0),
        Position = UDim2.new(0.5, 0, 0.5, 0),
    }):Play()
    task.delay(0.32, function()
        Main.Visible = false
        menuOpen = false
    end)
end

local function ToggleMenu()
    if menuOpen then CloseMenu() else OpenMenu() end
end

--====================================
-- HOTKEYS
--====================================

UIS.InputBegan:Connect(function(input, gp)
    -- INSERT sempre funciona, independente de gp
    if input.KeyCode == Enum.KeyCode.Insert then
        SafeCall(ToggleMenu)
        return
    end

    -- Outros hotkeys só funcionam quando o jogo não está processando
    if gp then return end

    if input.KeyCode == Enum.KeyCode.F1 then
        Config.ESPEnabled = not Config.ESPEnabled
        Notify(Config.ESPEnabled and "ESP Ativado" or "ESP Desativado", 1.5)
    elseif input.KeyCode == Enum.KeyCode.F2 then
        Config.Aimbot = not Config.Aimbot
        Notify(Config.Aimbot and "Aimbot Ativado" or "Aimbot Desativado", 1.5)
    elseif input.KeyCode == Enum.KeyCode.F3 then
        Config.Fly = not Config.Fly
        SafeCall(ToggleFly, Config.Fly)
        Notify(Config.Fly and "Fly Ativado" or "Fly Desativado", 1.5)
    elseif input.KeyCode == Enum.KeyCode.F4 then
        Config.NoClip = not Config.NoClip
        SafeCall(ToggleNoClip, Config.NoClip)
        Notify(Config.NoClip and "NoClip Ativado" or "NoClip Desativado", 1.5)
    elseif input.KeyCode == Enum.KeyCode.F5 then
        Config.Fullbright = not Config.Fullbright
        SafeCall(ToggleFullbright, Config.Fullbright)
        Notify(Config.Fullbright and "Fullbright Ativado" or "Fullbright Desativado", 1.5)
    elseif input.KeyCode == Enum.KeyCode.F6 then
        Config.CustomHUD = not Config.CustomHUD
        Notify(Config.CustomHUD and "HUD Ativado" or "HUD Desativado", 1.5)
    end
end)

--====================================
-- PLAYER EVENTS
--====================================

Players.PlayerAdded:Connect(function(p)
    SafeCall(AddESP, p)
    LogSystem:Add(p.Name .. " entrou no servidor", "Info")
end)
Players.PlayerRemoving:Connect(function(p)
    SafeCall(RemoveESP, p)
    LogSystem:Add(p.Name .. " saiu do servidor", "Info")
end)
for _, p in ipairs(Players:GetPlayers()) do SafeCall(AddESP, p) end

LocalPlayer.CharacterAdded:Connect(function()
    LogSystem:Add("Character respawnado", "Info")
    task.wait(1)
    SafeCall(function()
        if Config.God         then ToggleGod(true)    end
        if Config.Fly         then ToggleFly(true)    end
        if Config.NoClip      then ToggleNoClip(true) end
        if Config.AntiRagdoll then ToggleAntiRagdoll() end
        SetWalkSpeed(Config.WalkSpeed)
        SetJumpPower(Config.JumpPower)
    end)
end)

SafeCall(CreateCrosshair)
SafeCall(AntiAFK)

--====================================
-- SELECIONAR ABA INICIAL E ABRIR MENU
--====================================

-- Seleciona a primeira aba diretamente (sem :Fire())
if #tabs > 0 then
    SafeCall(SelectTab, tabs[1])
end

-- Abre o menu com delay para garantir que tudo foi inicializado
task.delay(0.5, function()
    SafeCall(OpenMenu)
    task.delay(0.6, function()
        Notify("🦈 Black Shark V3 carregado!", 3, "Success")
        Notify("Pressione INSERT para abrir/fechar", 4, "Info")
    end)
end)

--====================================
-- LOGS E PRINT FINAL
--====================================

LogSystem:Add("Black Shark V3 iniciado com sucesso!", "Success")
LogSystem:Add(#Players:GetPlayers() .. " jogadores no servidor", "Info")
LogSystem:Add(#tabs .. " abas carregadas", "Info")

print("================================================")
print("  🦈 BLACK SHARK V3 - ULTIMATE EDITION")
print("================================================")
print("  INSERT   → Abrir / Fechar Menu")
print("  F1-F6    → Atalhos rápidos")
print("  Abas: " .. #tabs .. " carregadas")
print("================================================")

--====================================
-- FIM DO SCRIPT - BLACK SHARK V3
--====================================

-- ================================================
-- BLACK SHARK V3 - ULTIMATE EDITION
-- Copyright © 2026 DhaaankMK - Todos os direitos reservados.
-- 
-- Este script é PROIBIDA a redistribuição sem créditos,
-- venda, modificação ou republicação sem autorização expressa.
-- Qualquer violação será rastreada e denunciada.
-- ================================================
