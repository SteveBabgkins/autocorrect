-- Here is the client part, you can also change everything here, I don't give a shit

local PLUGIN = PLUGIN;


function PLUGIN:ClockworkChatBoxSendText(text)
    local correctedText, wasCorrection = self:CorrectText(text);
    
    if wasCorrection then
        Clockwork.chatBox:Add(nil, "autocorrect", "Your message has been auto-corrected.");
        return correctedText;
    end
end
