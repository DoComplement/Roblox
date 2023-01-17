-- Add the chances of each element

--[[
writefile("Elements.lua", '');
local Elements = require(Game:GetService("ReplicatedStorage").Saturn.Modules.GameDependent.Elements);
local Order = {
    [1] = "Water",
    [2] = "Earth",
    [3] = "Light",
    [4] = "Shadow",
    [5] = "Wind",
    [6] = "Lightning",
    [7] = "Fire",
    [8] = "Galaxy",
    [9] = "Chaos",
    [10] = "Spooky"
};

for _,Element in ipairs(Order) do
    appendfile("Elements.lua", getgenv().t2s(Elements[Element], Element, true)..'\n'); 
end;
]]

local Water = { 	-- table: 0x00000000880dfc6c
	["Color"] = Water,
	["Image"] = 10316015475,
	["Multi"] = { 	-- table: 0x00000000619b2a14
		["Max"] = 1.1,
		["Min"] = 1.05
	},
	["Title"] = "Water"
}

local Earth = { 	-- table: 0x00000000485e36b4
	["Color"] = Earth,
	["Image"] = 10310389655,
	["Multi"] = { 	-- table: 0x00000000d05f3d54
		["Max"] = 1.2,
		["Min"] = 1.1
	},
	["Title"] = "Earth"
}

local Light = { 	-- table: 0x000000001b983874
	["Color"] = Light,
	["Image"] = 10310390184,
	["Multi"] = { 	-- table: 0x0000000081193494
		["Max"] = 1.3,
		["Min"] = 1.2
	},
	["Title"] = "Light"
}

local Shadow = { 	-- table: 0x000000007f564334
	["Color"] = Shadow,
	["Image"] = 10310396267,
	["Multi"] = { 	-- table: 0x00000000b1aaaed4
		["Max"] = 1.5,
		["Min"] = 1.3
	},
	["Title"] = "Shadow"
}

local Wind = { 	-- table: 0x00000000da0c95f4
	["Color"] = Wind,
	["Image"] = 10310388625,
	["Multi"] = { 	-- table: 0x00000000e5af8114
		["Max"] = 1.8,
		["Min"] = 1.5
	},
	["Title"] = "Wind"
}

local Lightning = { 	-- table: 0x00000000b74d9fb4
	["Color"] = Lightning,
	["Image"] = 10310387921,
	["Multi"] = { 	-- table: 0x000000007532d854
		["Max"] = 2,
		["Min"] = 1.8
	},
	["Title"] = "Lightning"
}

local Fire = { 	-- table: 0x00000000abb74574
	["Color"] = Fire,
	["Image"] = 10310389158,
	["Multi"] = { 	-- table: 0x00000000dc31d194
		["Max"] = 2.5,
		["Min"] = 2
	},
	["Title"] = "Fire"
}

local Galaxy = { 	-- table: 0x00000000efb36a34
	["Color"] = Galaxy,
	["Image"] = 10310390856,
	["Multi"] = { 	-- table: 0x00000000bdbe07d4
		["Max"] = 3,
		["Min"] = 2.5
	},
	["Title"] = "Galaxy"
}

local Chaos = { 	-- table: 0x00000000033d70f4
	["Color"] = Chaos,
	["Image"] = 10310391666,
	["Multi"] = { 	-- table: 0x00000000a5b3fc14
		["Max"] = 5,
		["Min"] = 3
	},
	["Title"] = "Chaos"
}

local Spooky = { 	-- table: 0x00000000d63578b4
	["Color"] = Spooky,
	["Image"] = 11264749508,
	["Multi"] = { 	-- table: 0x00000000f636f354
		["Max"] = 5,
		["Min"] = 3.1
	},
	["Title"] = "Spooky"
}

