local follow = false

local function Train()
    if follow then
        DoEmote('train')
    else
        myTimer:Cancel()
    end
end

local function OnEvent(self, event, ...)
    if event == "AUTOFOLLOW_BEGIN" then
        follow = true
        DoEmote('train')
        local myTimer = C_Timer.NewTicker(3, Train)    
    elseif event == "AUTOFOLLOW_END" then
        follow = false
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
f:RegisterEvent("AUTOFOLLOW_BEGIN")
f:RegisterEvent("AUTOFOLLOW_END")
f:SetScript("OnEvent", OnEvent)