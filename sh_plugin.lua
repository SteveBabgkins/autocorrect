-- Dear fuck niggers, this is a plugin for fucking clockwork. 
-- AUTO TEXT CORRECTION PLUGIN FOR CLOCKWORK HL2RP!!!!
-- I don't know why the fuck you need this, you can open it yourself and you can change anything in coding, I just got bored and decided to do it
-- Made by Steve Babgkins

local PLUGIN = PLUGIN;

PLUGIN.name = "Auto Text Correction";
PLUGIN.author = "Steve Babgkins";
PLUGIN.description = "Automatically corrects common typos and mistakes in player chat messages.";


PLUGIN.corrections = {
    ["misspelled_word"] = "correct_word",
    ["teh"] = "the",
    ["arent"] = "aren't",
    ["cant"] = "can't",
    ["didnt"] = "didn't",
    ["dont"] = "don't",
    ["doesnt"] = "doesn't",
    ["isnt"] = "isn't",
    ["wasnt"] = "wasn't",
    ["wouldnt"] = "wouldn't",
    ["shouldnt"] = "shouldn't",
    ["couldnt"] = "couldn't",
    ["wont"] = "won't",
    ["havent"] = "haven't",
    ["hasnt"] = "hasn't",
    ["hadnt"] = "hadn't",
    ["youre"] = "you're",
    ["theyre"] = "they're",
    ["thier"] = "their",
    ["alot"] = "a lot",
    ["recieve"] = "receive",
    ["wierd"] = "weird",
    ["definately"] = "definitely",
    ["goverment"] = "government",
    ["seperate"] = "separate",
    ["occured"] = "occurred",
    ["truely"] = "truly",
    ["acheive"] = "achieve",
    ["beleive"] = "believe",
    ["freind"] = "friend",
    ["tommorow"] = "tomorrow",
    ["untill"] = "until",
    ["accross"] = "across",
    ["reccomend"] = "recommend",
    ["accomodate"] = "accommodate",
    ["begining"] = "beginning",
    ["concious"] = "conscious",
    ["enviroment"] = "environment",
    ["existance"] = "existence",
    ["foriegn"] = "foreign",
    ["independant"] = "independent",
    ["liason"] = "liaison",
    ["occassion"] = "occasion",
    ["occurence"] = "occurrence",
    ["posession"] = "possession",
    ["priviledge"] = "privilege",
    ["restaraunt"] = "restaurant",
    ["rythm"] = "rhythm",
    ["sieze"] = "seize",
    ["sucess"] = "success",
    ["suprise"] = "surprise",
    ["threshhold"] = "threshold",
    ["vaccum"] = "vacuum",
    ["wether"] = "whether",
    ["buisness"] = "business"
   
};


function PLUGIN:CorrectText(text)
    local words = string.Explode(" ", text);
    local corrected = false;
    
    for i, word in ipairs(words) do
        local lowerWord = string.lower(word);
        if self.corrections[lowerWord] then
            words[i] = self.corrections[lowerWord];
            corrected = true;
        end
    end
    
    return table.concat(words, " "), corrected;
end


function PLUGIN:ClockworkChatBoxSendText(player, text)
    local correctedText, wasCorrection = self:CorrectText(text);
    
    if wasCorrection then
        return correctedText;
    end
end


Clockwork.plugin:Add(PLUGIN);
