--[[
writefile("Eggies.lua", '')

local function GetTotal(EggTable)
    local Total = 0;
    for _,Item in next, EggTable do
        Total = Total + Item.Weight;
    end;
    return Total;
end;

local function AddChances(EggTable)
    local Total = GetTotal(EggTable);
    for _,Item in next, EggTable do
        local Weight = Item.Weight/Total
        Item["Chances"] = tostring(Weight*100).."%\t~\t1/"..tostring(math.round(1/Weight)); 
    end
end

for _,Egg in ipairs(Game:GetService("ReplicatedStorage").Eggs:GetChildren()) do
    local Table = require(Egg);
    AddChances(Table.EggTable);
    
    appendfile("Eggies.lua", getgenv().t2s(Table, Egg.Name:gsub(' ', '_'), true)..'\n'); 
end;
]]

local Grassland_Egg_1 = { 	-- table: 0x00000000a37a499c
	["Cost"] = 50,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000004d7dd4fc
		["Deer"] = { 	-- table: 0x000000009577217c
			["Chances"] = "8%	~	1/13",
			["Weight"] = 8
		},
		["Dog"] = { 	-- table: 0x000000003c7c1fdc
			["Chances"] = "34%	~	1/3",
			["Weight"] = 34
		},
		["Horse"] = { 	-- table: 0x000000007770335c
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Pig"] = { 	-- table: 0x000000000472161c
			["Chances"] = "18%	~	1/6",
			["Weight"] = 18
		},
		["Squirrel"] = { 	-- table: 0x00000000ec731abc
			["Chances"] = "37%	~	1/3",
			["Weight"] = 37
		}
	},
	["Zone"] = 1
}

local Grassland_Egg_2 = { 	-- table: 0x00000000de02ca74
	["Cost"] = 10000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000008ea74e94
		["Bear"] = { 	-- table: 0x0000000032c1e134
			["Chances"] = "51%	~	1/2",
			["Weight"] = 51
		},
		["Bird"] = { 	-- table: 0x00000000448efff4
			["Chances"] = "8%	~	1/13",
			["Weight"] = 8
		},
		["Cow"] = { 	-- table: 0x00000000f4c3f1b4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 1
		},
		["Raccoon"] = { 	-- table: 0x00000000d42e6314
			["Chances"] = "5%	~	1/20",
			["Weight"] = 5
		},
		["Skunk"] = { 	-- table: 0x000000006b2374d4
			["Chances"] = "35%	~	1/3",
			["Weight"] = 35
		}
	},
	["Zone"] = 1
}

local Savannah_Egg_1 = { 	-- table: 0x0000000058d7aeb4
	["Cost"] = 200000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000c0d4b554
		["Cheetah"] = { 	-- table: 0x0000000062f0c6d4
			["Chances"] = "5%	~	1/20",
			["Weight"] = 5
		},
		["Elephant"] = { 	-- table: 0x00000000f80c8074
			["Chances"] = "54%	~	1/2",
			["Weight"] = 54
		},
		["Girraffe"] = { 	-- table: 0x0000000098f1bb34
			["Chances"] = "11%	~	1/9",
			["Weight"] = 11
		},
		["Zebra"] = { 	-- table: 0x0000000030efbc94
			["Chances"] = "30%	~	1/3",
			["Weight"] = 30
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2
	["Zone"] = 2
}

local Savannah_Egg_2 = { 	-- table: 0x00000000ccf65234
	["Cost"] = 3000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000024f6efd4
		["Boar"] = { 	-- table: 0x000000007509f414
			["Chances"] = "45%	~	1/2",
			["Weight"] = 450000
		},
		["Hyena"] = { 	-- table: 0x00000000a2ef60b4
			["Chances"] = "30%	~	1/3",
			["Weight"] = 300000
		},
		["Lion"] = { 	-- table: 0x00000000cacafb54
			["Chances"] = "1%	~	1/100",
			["Weight"] = 10000
		},
		["Parrot"] = { 	-- table: 0x0000000094e888f4
			["Chances"] = "18%	~	1/6",
			["Weight"] = 180000
		},
		["Rhinoceros"] = { 	-- table: 0x00000000dee57674
			["Chances"] = "6%	~	1/17",
			["Weight"] = 60000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2
	["Zone"] = 2
}

local Desert_Egg_1 = { 	-- table: 0x0000000078c6aa54
	["Cost"] = 50000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000008f25af74
		["Camel"] = { 	-- table: 0x00000000de838394
			["Chances"] = "5%	~	1/20",
			["Weight"] = 50000
		},
		["Cat"] = { 	-- table: 0x0000000076abc2f4
			["Chances"] = "50%	~	1/2",
			["Weight"] = 500000
		},
		["Scorpion"] = { 	-- table: 0x00000000bacebdd4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 150000
		},
		["Snake"] = { 	-- table: 0x00000000c22cb834
			["Chances"] = "30%	~	1/3",
			["Weight"] = 300000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 3
}

local Desert_Egg_2 = { 	-- table: 0x0000000012b552d4
	["Cost"] = 1000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000f6b7e9f4
		["Fox"] = { 	-- table: 0x0000000091306454
			["Chances"] = "30%	~	1/3",
			["Weight"] = 300000
		},
		["Golem"] = { 	-- table: 0x00000000e0927d94
			["Chances"] = "4%	~	1/25",
			["Weight"] = 40000
		},
		["Lizard"] = { 	-- table: 0x00000000c6318d14
			["Chances"] = "15%	~	1/7",
			["Weight"] = 150000
		},
		["Mummy"] = { 	-- table: 0x000000000f51f974
			["Chances"] = "1%	~	1/100",
			["Weight"] = 10000
		},
		["Rat"] = { 	-- table: 0x000000006ab0f3b4
			["Chances"] = "50%	~	1/2",
			["Weight"] = 500000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 3
}

local Cavern_Egg_1 = { 	-- table: 0x000000005e59a274
	["Cost"] = 5000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000006d669694
		["Bat"] = { 	-- table: 0x000000003b0a8934
			["Chances"] = "64%	~	1/2",
			["Weight"] = 640000
		},
		["Fish"] = { 	-- table: 0x00000000f56dacd4
			["Chances"] = "30%	~	1/3",
			["Weight"] = 300000
		},
		["Ice Angler"] = { 	-- table: 0x00000000244fb7f4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 10000
		},
		["Mushroom"] = { 	-- table: 0x00000000446d3b14
			["Chances"] = "5%	~	1/20",
			["Weight"] = 50000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 4
}

local Cavern_Egg_2 = { 	-- table: 0x0000000027445ef4
	["Cost"] = 50000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000089649a14
		["Amethyst Valkryie"] = { 	-- table: 0x000000002968c494
			["Chances"] = "0.5%	~	1/200",
			["Weight"] = 5000
		},
		["Gem Beast"] = { 	-- table: 0x0000000040496874
			["Chances"] = "1%	~	1/100",
			["Weight"] = 10000
		},
		["Salamander"] = { 	-- table: 0x00000000138686b4
			["Chances"] = "58.5%	~	1/2",
			["Weight"] = 585000
		},
		["Vampire Bat"] = { 	-- table: 0x00000000a86bed54
			["Chances"] = "40%	~	1/3",
			["Weight"] = 400000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 4
}

local Castle_Egg_1 = { 	-- table: 0x000000000f515574
	["Cost"] = 1000000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000bc50e194
		["Abyssal Hydra"] = { 	-- table: 0x00000000f54ccc14
			["Chances"] = "1%	~	1/100",
			["Weight"] = 10000
		},
		["Hydra"] = { 	-- table: 0x00000000a752a0f4
			["Chances"] = "3%	~	1/33",
			["Weight"] = 30000
		},
		["Ice Beast"] = { 	-- table: 0x000000006c179a34
			["Chances"] = "78%	~	1/1",
			["Weight"] = 780000
		},
		["Ice King"] = { 	-- table: 0x00000000459197d4
			["Chances"] = "18%	~	1/6",
			["Weight"] = 180000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 5
}

local Castle_Egg_2 = { 	-- table: 0x00000000183ecbf4
	["Cost"] = 10000000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000503aa714
		["Abbysal Tricrystals"] = { 	-- table: 0x000000008fa29774
			["Chances"] = "0.5%	~	1/200",
			["Weight"] = 5000
		},
		["Glowing Mushroom"] = { 	-- table: 0x00000000cba59db4
			["Chances"] = "80%	~	1/1",
			["Weight"] = 800000
		},
		["Ice Valkryie"] = { 	-- table: 0x0000000011c26b94
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 1000
		},
		["Tricrystals"] = { 	-- table: 0x00000000e1078254
			["Chances"] = "19.400000000000002%	~	1/5",
			["Weight"] = 194000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 5
}

local Volcano_Egg_2 = { 	-- table: 0x000000003f9ccc74
	["Cost"] = 10000000000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000cdde5094
		["Death Angler"] = { 	-- table: 0x00000000a3dbe734
			["Chances"] = "93.8%	~	1/1",
			["Weight"] = 938000
		},
		["Death Hydra"] = { 	-- table: 0x0000000077e891f4
			["Chances"] = "0.0199%	~	1/5025",
			["Weight"] = 199
		},
		["Death King"] = { 	-- table: 0x0000000039cba514
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 1000
		},
		["Death Mushroom"] = { 	-- table: 0x0000000005989ad4
			["Chances"] = "6.08%	~	1/16",
			["Weight"] = 60800
		},
		["Three-Headed Darkheart Valkryie"] = { 	-- table: 0x00000000c3edcbb4
			["Chances"] = "0.00009999999999999999%	~	1/1000000",
			["Weight"] = 1
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 6
}

local Volcano_Egg_1 = { 	-- table: 0x0000000029ffc814
	["Cost"] = 1000000000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000083f1acb4
		["Calamity Golem"] = { 	-- table: 0x0000000023cb5134
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 1000
		},
		["Death Bat"] = { 	-- table: 0x00000000cdf59e94
			["Chances"] = "1%	~	1/100",
			["Weight"] = 10000
		},
		["Death Beast"] = { 	-- table: 0x00000000dff49a74
			["Chances"] = "4.9%	~	1/20",
			["Weight"] = 49000
		},
		["Death Pig"] = { 	-- table: 0x000000002df29754
			["Chances"] = "94%	~	1/1",
			["Weight"] = 940000
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 6
}

local Wasteland_Egg_1 = { 	-- table: 0x000000001dddc794
	["Cost"] = 1000000000000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000abdf6c34
		["Mushroom Bat"] = { 	-- table: 0x0000000061a79214
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Mutant Anglerfish"] = { 	-- table: 0x000000001bc05eb4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Mutant Mushroom"] = { 	-- table: 0x00000000b022c554
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Mutant Pig"] = { 	-- table: 0x00000000f1a2e9d4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Mutant Valkryie"] = { 	-- table: 0x00000000370186f4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 7
}

local Wasteland_Egg_2 = { 	-- table: 0x00000000cb38b7b4
	["Cost"] = 25000000000000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000005d38a054
		["Mutant Beast"] = { 	-- table: 0x000000006fbb8d74
			["Chances"] = "64%	~	1/2",
			["Weight"] = 640000
		},
		["Mutant Cat"] = { 	-- table: 0x00000000bc358994
			["Chances"] = "35.8%	~	1/3",
			["Weight"] = 358000
		},
		["Mutant Hydra"] = { 	-- table: 0x00000000470dd8f4
			["Chances"] = "0.00009999999999999999%	~	1/1000000",
			["Weight"] = 1
		},
		["Radioactive Golem"] = { 	-- table: 0x00000000d5b45fd4
			["Chances"] = "0.0019000000000000002%	~	1/52632",
			["Weight"] = 19
		},
		["Squid Bat"] = { 	-- table: 0x00000000f3b4a234
			["Chances"] = "0.198%	~	1/505",
			["Weight"] = 1980
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 7
}

local Robux_Grassland_Egg_1 = { 	-- table: 0x00000000a85c78d4
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000001df3f4
		["Conifer Cat"] = { 	-- table: 0x00000000999a8f14
			["Chances"] = "65%	~	1/2",
			["Weight"] = 65
		},
		["Great Ivy Valkyrie"] = { 	-- table: 0x0000000079495a54
			["Chances"] = "5%	~	1/20",
			["Weight"] = 5
		},
		["Willow Beast"] = { 	-- table: 0x00000000335695b4
			["Chances"] = "30%	~	1/3",
			["Weight"] = 30
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 1
}

local Robux_Volcano_Egg_1 = { 	-- table: 0x000000008c41b154
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x000000003f7fa474
		["Fire Bat"] = { 	-- table: 0x000000005b628f34
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Fire Reaper"] = { 	-- table: 0x00000000328cdd14
			["Chances"] = "3%	~	1/33",
			["Weapon"] = true,
			["Weight"] = 3
		},
		["Igneous Beast"] = { 	-- table: 0x000000002647a2d4
			["Chances"] = "30%	~	1/3",
			["Weight"] = 30
		},
		["Volcanic Titan"] = { 	-- table: 0x000000004d008894
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Winged Beast - Magmapinion"] = { 	-- table: 0x00000000866559f4
			["Chances"] = "2%	~	1/50",
			["Weight"] = 2
		}
	},
	["Multiplier"] = 10000,
	["ProductID"] = 1280750467,
	["TotalWeight"] = 2,
	["Zone"] = 6
}

local Robux_Wasteland_Egg_1 = { 	-- table: 0x00000000fa1384b4
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x000000000e55ef54
		["Dark Toxic Beast"] = { 	-- table: 0x000000009f565274
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Mutated Longsword"] = { 	-- table: 0x00000000e42f1cd4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Radioactive Bone Sword"] = { 	-- table: 0x0000000094b52b14
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Radioactive Mech"] = { 	-- table: 0x00000000c4905934
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Toxic Reaper"] = { 	-- table: 0x000000006d10c694
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Winged Beast - Irradiator"] = { 	-- table: 0x00000000143207f4
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		}
	},
	["Multiplier"] = 10000,
	["ProductID"] = 1280750467,
	["TotalWeight"] = 2,
	["Zone"] = 7
}

local Robux_Ocean_Egg_1 = { 	-- table: 0x0000000008e202b4
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x0000000091011954
		["Cursed Sunken Bone Sword"] = { 	-- table: 0x00000000ee8fead4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Cursed Sunken Sword"] = { 	-- table: 0x0000000042c0c094
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Cursed Trident"] = { 	-- table: 0x000000002cc4f514
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Cyan Coral Fish"] = { 	-- table: 0x0000000026e05c74
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Gold Comet Angler"] = { 	-- table: 0x00000000bae25734
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Winged Beast - Waveadder"] = { 	-- table: 0x000000009eed81f4
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 8
}

local Coral_Egg_2 = { 	-- table: 0x000000004ef564f4
	["Cost"] = 1.e+22,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000daf4d814
		["Bactopus"] = { 	-- table: 0x00000000370da754
			["Chances"] = "35.8%	~	1/3",
			["Weight"] = 358000
		},
		["Dark Fish"] = { 	-- table: 0x0000000060ee8a74
			["Chances"] = "0.198%	~	1/505",
			["Weight"] = 1980
		},
		["Dual Squid Golem"] = { 	-- table: 0x00000000d0d1a134
			["Chances"] = "0.00009999999999999999%	~	1/1000000",
			["Weight"] = 1
		},
		["Ocean Bird"] = { 	-- table: 0x0000000092f35cb4
			["Chances"] = "64%	~	1/2",
			["Weight"] = 640000
		},
		["Tidal Coral Hydra"] = { 	-- table: 0x0000000048d08e94
			["Chances"] = "0.0019000000000000002%	~	1/52632",
			["Weight"] = 19
		}
	},
	["Multiplier"] = 10000,
	["TotalWeight"] = 2,
	["Zone"] = 8
}

local Coral_Egg_1 = { 	-- table: 0x000000003ad75794
	["Cost"] = 1.e+21,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000008cc9dc34
		["Coral Beast"] = { 	-- table: 0x00000000cc0e96f4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Coral Hydra"] = { 	-- table: 0x00000000fcae8214
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Hydropowered Hydra"] = { 	-- table: 0x0000000034cbeeb4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Ocean Golem"] = { 	-- table: 0x0000000087247554
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Sea Anglers"] = { 	-- table: 0x000000005cab59d4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 8
}

local Robux_Village_Egg = { 	-- table: 0x00000000c0245054
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000288c9d74
		["Dragonic Branchsword"] = { 	-- table: 0x00000000a55a20b4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Dragonic Champion Blade"] = { 	-- table: 0x0000000009499234
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Dragonic Greatsword"] = { 	-- table: 0x00000000ce08c8f4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Golden Warrior"] = { 	-- table: 0x00000000d2993414
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Sakura Cat"] = { 	-- table: 0x00000000932f9994
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Ultra Instinct Beast"] = { 	-- table: 0x00000000bea8afd4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 9
}

local Village_Egg_1 = { 	-- table: 0x000000008a919f14
	["Cost"] = 1.e+24,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000e26f85b4
		["Baby Dragon"] = { 	-- table: 0x00000000b1756f74
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Guardian Lions"] = { 	-- table: 0x000000007b77c394
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Nine-tailed Fox"] = { 	-- table: 0x00000000187afdd4
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Phoenix"] = { 	-- table: 0x0000000081757834
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["White Snake"] = { 	-- table: 0x00000000c672ea54
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 9
}

local Village_Egg_2 = { 	-- table: 0x000000006f4e92d4
	["Cost"] = 1.e+25,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000009d63a9f4
		["Dragonic Edge"] = { 	-- table: 0x000000000d9c2634
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Hidden Reaper"] = { 	-- table: 0x00000000631f3d94
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Lightning Beast"] = { 	-- table: 0x00000000e46033b4
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Red Dragon"] = { 	-- table: 0x000000000b81cd14
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Vicious Beast"] = { 	-- table: 0x0000000034432454
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Winged Beast - Spirited"] = { 	-- table: 0x0000000055623974
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 9
}

local Forest_Egg_1 = { 	-- table: 0x00000000200a5694
	["Cost"] = 1.e+27,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000059b4c934
		["Forest Dweller"] = { 	-- table: 0x000000003933f7f4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Magic Bat"] = { 	-- table: 0x0000000083be7b14
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Mighty Dragon"] = { 	-- table: 0x000000001a3ef9b4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Mystical Reaper"] = { 	-- table: 0x0000000057b07654
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Wizard"] = { 	-- table: 0x000000004f346cd4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 10
}

local Robux_Forest_Egg = { 	-- table: 0x0000000097d72d54
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x0000000005d82874
		["Ancient Bone Sword"] = { 	-- table: 0x00000000e1c445f4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Forest Guardian"] = { 	-- table: 0x000000004fdd3ed4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Magical Energysword"] = { 	-- table: 0x00000000719e3334
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Mystical Champions Sword"] = { 	-- table: 0x00000000b006afb4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Mystical Dual Hydra"] = { 	-- table: 0x000000000be4b114
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Mystical Forest Beast"] = { 	-- table: 0x00000000aa1b0494
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 10
}

local Forest_Egg_2 = { 	-- table: 0x00000000d5fd08b4
	["Cost"] = 1.e+28,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000e7ffe354
		["Butterfly Hydra"] = { 	-- table: 0x0000000013f8fa94
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Calamity Blade"] = { 	-- table: 0x00000000b3ece714
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Dark Dominus"] = { 	-- table: 0x00000000fdca8bf4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Forest Knight"] = { 	-- table: 0x000000005df76534
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Magic Mushroom"] = { 	-- table: 0x0000000085f97e74
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Mystical Monster"] = { 	-- table: 0x00000000cfe9f0d4
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 10
}

local City_Egg_1 = { 	-- table: 0x0000000069de3af4
	["Cost"] = 1.e+30,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000033d33e14
		["Alien"] = { 	-- table: 0x00000000a797a954
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Antenna"] = { 	-- table: 0x000000001a2a8c74
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Light Mech"] = { 	-- table: 0x000000003dafa734
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Robot"] = { 	-- table: 0x00000000c915b2b4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Tech Beast"] = { 	-- table: 0x0000000073ca9094
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 11
}

local City_Egg_2 = { 	-- table: 0x000000002da3fe34
	["Cost"] = 1.e+31,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000007e0063d4
		["Energy Core"] = { 	-- table: 0x00000000db438814
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Future Bringer"] = { 	-- table: 0x0000000008455e94
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Future Dominus"] = { 	-- table: 0x00000000702cda74
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Old-fashioned Object"] = { 	-- table: 0x0000000031a0f4f4
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["TechBat"] = { 	-- table: 0x00000000278f5754
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Techtopus"] = { 	-- table: 0x00000000c12decb4
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 11
}

local Robux_City_Egg = { 	-- table: 0x000000003b558794
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x000000006c53ac34
		["Blissful Sword"] = { 	-- table: 0x000000008c7146f4
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Dark Rusted Triborg"] = { 	-- table: 0x00000000e373d214
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Future Champions Blade"] = { 	-- table: 0x00000000c5711eb4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Golem Zord"] = { 	-- table: 0x0000000056760554
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Hope's Blade"] = { 	-- table: 0x000000001a731074
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Venom Spider"] = { 	-- table: 0x000000001c0ea9d4
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 11
}

local Robux_Pixel_Forest_Egg = { 	-- table: 0x00000000a90e4d74
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000436dc994
		["Gold Enlightened Trident"] = { 	-- table: 0x0000000074a0cb54
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Light Energyblade"] = { 	-- table: 0x00000000be671fd4
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Space Odyssey Mech"] = { 	-- table: 0x000000000a8618f4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Space Odyssey Robot"] = { 	-- table: 0x000000006e446234
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Space Triangle Dude"] = { 	-- table: 0x00000000554050b4
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Spirit Sword"] = { 	-- table: 0x00000000a3632414
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 12
}

local Pixel_Forest_Egg_1 = { 	-- table: 0x000000001648d5b4
	["Cost"] = 1.1e+33,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000096a81a54
		["8-Bit Dirt"] = { 	-- table: 0x0000000021371f74
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["8-Bit Grass"] = { 	-- table: 0x0000000078ba1394
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["8-Bit Ninja"] = { 	-- table: 0x00000000503ae834
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Pixel Demon"] = { 	-- table: 0x00000000183c4dd4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Pixel Shrub"] = { 	-- table: 0x0000000080bdf2f4
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 12
}

local Pixel_Forest_Egg_2 = { 	-- table: 0x000000005c9419f4
	["Cost"] = 1.01e+34,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000d4171d14
		["Glitched Blade"] = { 	-- table: 0x00000000fec7bbd4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Pixel Atenna"] = { 	-- table: 0x0000000004d95454
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Pixel Gems"] = { 	-- table: 0x00000000f4da23b4
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Pixel Robot"] = { 	-- table: 0x000000005298ad94
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Pixel TV"] = { 	-- table: 0x00000000651fc974
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Tech Reaper"] = { 	-- table: 0x00000000cedab634
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 12
}

local Robux_Space_Egg = { 	-- table: 0x000000006ec3dcd4
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000bafd47f4
		["Insane Lunar Trident"] = { 	-- table: 0x0000000074e67374
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Lunar Monster"] = { 	-- table: 0x00000000f2fceb14
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Lunar Slasher"] = { 	-- table: 0x00000000cce84434
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Lunar Triborg"] = { 	-- table: 0x00000000bc88ff94
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Solar Hydra"] = { 	-- table: 0x0000000086c58654
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Very Cool Sword"] = { 	-- table: 0x0000000026fb69b4
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 13
}

local Space_Egg_2 = { 	-- table: 0x000000007f11a334
	["Cost"] = 1.01e+37,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000a8d38ed4
		["Photon's Slasher"] = { 	-- table: 0x00000000daaa3194
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Space Dragon"] = { 	-- table: 0x00000000a093bfb4
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Space Triborg"] = { 	-- table: 0x00000000792c3854
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Ultra Dominus"] = { 	-- table: 0x0000000092cf2574
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Void Beast"] = { 	-- table: 0x00000000c816a114
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Void Monster"] = { 	-- table: 0x00000000d0d6b5f4
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 13
}

local Space_Egg_1 = { 	-- table: 0x00000000b4448e74
	["Cost"] = 1.1e+36,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000006ca76a94
		["Lunar Hydra"] = { 	-- table: 0x00000000c2217714
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Lunar Tricrystals"] = { 	-- table: 0x0000000066820db4
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Moon Dear"] = { 	-- table: 0x000000002ea340d4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Moon Spider"] = { 	-- table: 0x00000000fa40fbf4
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Moon dog"] = { 	-- table: 0x000000009f01f534
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 13
}

local Mars_Egg_1 = { 	-- table: 0x0000000001598e14
	["Cost"] = 1.1e+39,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000f697a2b4
		["Mars Mushroom"] = { 	-- table: 0x000000005a4d3c74
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Mars Rusted Triborg"] = { 	-- table: 0x000000008d720ad4
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Martian Beast"] = { 	-- table: 0x000000006d6c2094
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Martian Crystal"] = { 	-- table: 0x00000000d66ab954
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Martian Dragon"] = { 	-- table: 0x000000003f0d3734
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 14
}

local Mars_Egg_2 = { 	-- table: 0x000000007e76f3d4
	["Cost"] = 1.01e+40,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000236a44f4
		["Flaming Dominus"] = { 	-- table: 0x000000002947ee94
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Mars Alien"] = { 	-- table: 0x0000000010687cb4
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Mars Angler"] = { 	-- table: 0x000000009949f814
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Mars Dual Hydra"] = { 	-- table: 0x00000000406a6a74
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Super Cool Magic Bat"] = { 	-- table: 0x00000000a80b0754
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Zued's Upbringing"] = { 	-- table: 0x000000009f644134
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 14
}

local Robux_Mars_Egg = { 	-- table: 0x000000006c2d3c34
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x000000005d8c39d4
		["Mars Bone Sword"] = { 	-- table: 0x0000000066385554
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Mars Ray"] = { 	-- table: 0x00000000b7a6ceb4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Mars Spider"] = { 	-- table: 0x000000005bb9a074
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Martian Alien"] = { 	-- table: 0x00000000ab2b36f4
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Martian Champion Blade"] = { 	-- table: 0x00000000f5462214
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Sci-Fi Martian Blade"] = { 	-- table: 0x00000000b13f9c94
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 14
}

local Sakura_Egg_1 = { 	-- table: 0x000000008b91fd74
	["Cost"] = 1.1e+42,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000011d37994
		["Death Bee"] = { 	-- table: 0x000000003d954fd4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Kitsune"] = { 	-- table: 0x00000000eb13e8f4
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Mythic Reaper"] = { 	-- table: 0x0000000007de80b4
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Shiba Inu"] = { 	-- table: 0x000000006fd6f234
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Thunder Bird"] = { 	-- table: 0x0000000095dc9414
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 15
}

local Sakura_Egg_2 = { 	-- table: 0x00000000c7c525b4
	["Cost"] = 1.01e+43,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000d9e7ca54
		["Chaotic Lord"] = { 	-- table: 0x00000000d9e19dd4
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Dominus Ultimus"] = { 	-- table: 0x00000000d30262f4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Dragonblade Katana"] = { 	-- table: 0x0000000039e4d614
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Elder Bunny Beast"] = { 	-- table: 0x0000000079e0a394
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Ghost Beast"] = { 	-- table: 0x0000000033814f74
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Pumpkin Beast"] = { 	-- table: 0x000000002fc09834
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 15
}

local Robux_Sakura_Egg = { 	-- table: 0x00000000a59aed14
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000c7dd93b4
		["Shining Calamity Blade"] = { 	-- table: 0x000000006b929974
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Shining Champion Sword"] = { 	-- table: 0x00000000afd74634
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Shining Katana"] = { 	-- table: 0x00000000cb132cf4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Shining Overlord"] = { 	-- table: 0x000000001e12dd94
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Shining Shiba"] = { 	-- table: 0x0000000035df8454
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Shining Winged Beast"] = { 	-- table: 0x00000000f1d02bd4
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 15
}

local Robux_Ice_Egg = { 	-- table: 0x00000000ba3897f4
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000e5bb5b14
		["Dry Ice Halberd"] = { 	-- table: 0x00000000bc0d0f94
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Dry Subzero Destroyer"] = { 	-- table: 0x00000000dd4161d4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Fire Icicle"] = { 	-- table: 0x00000000efaff434
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Fire Skeleton"] = { 	-- table: 0x000000006ba4e374
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Fire Spiker"] = { 	-- table: 0x00000000d725d9b4
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Subzero Champion Blade"] = { 	-- table: 0x0000000055475654
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 16
}

local Ice_Egg_1 = { 	-- table: 0x000000007f9bd334
	["Cost"] = 1.1e+45,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000a8465ed4
		["Evil Ice Dragon"] = { 	-- table: 0x00000000a26b3574
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Ice Skeleton"] = { 	-- table: 0x00000000794e2854
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Ice Spiker"] = { 	-- table: 0x00000000e9881114
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Ice Trimushroom"] = { 	-- table: 0x00000000006925f4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Icey Beast"] = { 	-- table: 0x0000000037690fb4
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 16
}

local Ice_Egg_2 = { 	-- table: 0x000000003b765e74
	["Cost"] = 1.01e+46,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000004d751a94
		["Frozen Burger"] = { 	-- table: 0x00000000fa4e6bf4
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Gigantic Icicle"] = { 	-- table: 0x0000000057087db4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Ice Breaker"] = { 	-- table: 0x00000000226d10d4
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Ice Spider"] = { 	-- table: 0x00000000316bc714
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Snow Cat"] = { 	-- table: 0x000000005e8c0534
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Subzero Destroyer"] = { 	-- table: 0x000000004158e254
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 16
}

local Robux_Hell_Egg = { 	-- table: 0x0000000002a00954
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x000000009b4f2c74
		["Fire Cleaver"] = { 	-- table: 0x00000000673eabb4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Fire Cyborg Spider"] = { 	-- table: 0x000000006d223094
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Super Cool Wolf"] = { 	-- table: 0x0000000094bb8514
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Three-Headed Fire Valkryie"] = { 	-- table: 0x00000000ec24bad4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Truly Fire Cutlass"] = { 	-- table: 0x000000003c834734
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Truly Fire Energysword"] = { 	-- table: 0x000000001445b1f4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 17
}

local Hell_Egg_2 = { 	-- table: 0x00000000e012ccb4
	["Cost"] = 1.01e+49,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000088917754
		["Fire Beast"] = { 	-- table: 0x0000000070d7fa74
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Fire DireWolf"] = { 	-- table: 0x00000000b2ddcff4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Fire Ruins"] = { 	-- table: 0x0000000006d45314
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Fire Triborg"] = { 	-- table: 0x00000000de92f134
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Incendiary Tree"] = { 	-- table: 0x00000000aed17e94
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Magma Beast"] = { 	-- table: 0x00000000ea1e64d4
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 17
}

local Hell_Egg_1 = { 	-- table: 0x000000002ae5a6f4
	["Cost"] = 1.1e+48,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000c6c4b214
		["Fire Angler"] = { 	-- table: 0x000000009affb074
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Fire Core"] = { 	-- table: 0x0000000020c0cc94
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Fire Mage"] = { 	-- table: 0x00000000f8e02b34
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Fire Mushroom"] = { 	-- table: 0x00000000a6e4beb4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Fire Pig"] = { 	-- table: 0x0000000012fda554
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 17
}

local Egypt_Egg_1 = { 	-- table: 0x000000005ec6e994
	["Cost"] = 1.1e+51,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000008ed88234
		["Egpytian Dragon"] = { 	-- table: 0x00000000c4dec414
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Egpytian Hydra"] = { 	-- table: 0x00000000331bffd4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Egpytian Knight"] = { 	-- table: 0x0000000054db70b4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Egpytian Mighty Dragon"] = { 	-- table: 0x00000000e49978f4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Egpytian Prince"] = { 	-- table: 0x000000007495eb54
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 18
}

local Robux_Egypt_Egg = { 	-- table: 0x00000000d8b5ba54
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000403cbf74
		["Egpytian Triple Dominus"] = { 	-- table: 0x0000000078beb394
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Egpytian Winged Beast"] = { 	-- table: 0x000000009b3b2dd4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Egpytian Wolf"] = { 	-- table: 0x00000000b6290614
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Egyptian Alien Blade"] = { 	-- table: 0x00000000764a1ab4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Egyptian Branchsword"] = { 	-- table: 0x0000000030b9c834
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Egyptian Scythe"] = { 	-- table: 0x00000000e2b812f4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 18
}

local Egypt_Egg_2 = { 	-- table: 0x00000000f55fc3b4
	["Cost"] = 1.01e+52,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000a2627454
		["Egpytian Kitsune"] = { 	-- table: 0x000000004a04e974
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Egpytian Octopus"] = { 	-- table: 0x00000000a9451634
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Egpytian Spider"] = { 	-- table: 0x000000005e640d94
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Pyramid God"] = { 	-- table: 0x00000000a88edcf4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Sphinx"] = { 	-- table: 0x00000000036a5bd4
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Sun God Staff"] = { 	-- table: 0x0000000050685014
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 18
}

local Pirate_Egg_2 = { 	-- table: 0x00000000f7710b14
	["Cost"] = 1.01e+55,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000857009b4
		["Crabbeard"] = { 	-- table: 0x000000009b5491d4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Flying Dutchman Blade"] = { 	-- table: 0x0000000015968ef4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Pirate Beast"] = { 	-- table: 0x0000000024712654
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Pirate Queen"] = { 	-- table: 0x00000000bf8fdf94
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Pirates Best Friend"] = { 	-- table: 0x00000000ed6c6434
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Three-Headed Pirate Valkryie"] = { 	-- table: 0x000000004c725374
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 19
}

local Pirate_Egg_1 = { 	-- table: 0x000000004844eed4
	["Cost"] = 1.1e+54,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000d1a355f4
		["Pirate Angler"] = { 	-- table: 0x000000007a409854
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Pirate Core"] = { 	-- table: 0x0000000052218574
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Pirate Mage"] = { 	-- table: 0x00000000df879194
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Pirate Mushroom"] = { 	-- table: 0x00000000e70dc114
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Pirate Pig"] = { 	-- table: 0x0000000001af5fb4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 19
}

local Robux_Pirate_Egg = { 	-- table: 0x000000008f8b4a94
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x000000001e2ed534
		["Evil Pirate Octopus"] = { 	-- table: 0x00000000beffb034
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Pirate DireWolf"] = { 	-- table: 0x0000000027159714
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Pirate Scythe"] = { 	-- table: 0x00000000f9ab9bf4
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Pirate Striker"] = { 	-- table: 0x000000006afac5d4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Pirate Trident"] = { 	-- table: 0x000000008996edb4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Pirate Winged Beast"] = { 	-- table: 0x00000000d3cea0d4
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 19
}

local Robux_Jungle_Egg = { 	-- table: 0x00000000fae6ead4
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x0000000082c681f4
		["Jungle Dominus"] = { 	-- table: 0x00000000c49efc54
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Jungle Icecream Beast"] = { 	-- table: 0x000000008c25e594
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Jungle Scythe"] = { 	-- table: 0x00000000fcc27174
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Jungle Spider"] = { 	-- table: 0x0000000016e3f514
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Jungle Trident"] = { 	-- table: 0x0000000055007bb4
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Vucub's Reaper Scythe"] = { 	-- table: 0x000000001c840e34
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 20
}

local Jungle_Egg_2 = { 	-- table: 0x00000000c8bca134
	["Cost"] = 1.01e+58,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000a03cb4d4
		["Dino-God"] = { 	-- table: 0x00000000da332b74
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Jungle Kitsune"] = { 	-- table: 0x0000000070b22314
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Jungle Warrior"] = { 	-- table: 0x0000000008bd3ff4
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Jungle Wolf"] = { 	-- table: 0x00000000393131b4
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Plantera's Essence"] = { 	-- table: 0x000000002e4e5794
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Prehistoric Monster"] = { 	-- table: 0x00000000c2b00e54
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 20
}

local Jungle_Egg_1 = { 	-- table: 0x000000002d5fc074
	["Cost"] = 1.1e+57,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000df597c94
		["Jungle Crawler"] = { 	-- table: 0x0000000017436914
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Jungle Dragon"] = { 	-- table: 0x000000007265edf4
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Jungle Hydra"] = { 	-- table: 0x00000000ce9afb34
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Jungle Knight"] = { 	-- table: 0x00000000a16ec7b4
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Jungle Mighty Dragon"] = { 	-- table: 0x000000003a0706d4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 20
}

local Robux_Candyland_Egg = { 	-- table: 0x00000000667b20b4
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x000000001b7a3b54
		["Candy Chocolate Scythe"] = { 	-- table: 0x00000000ff482294
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Candycane Alien Blade"] = { 	-- table: 0x000000005c0fc8d4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Candycorn Monster"] = { 	-- table: 0x00000000146da3f4
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Chocolate DireWolf"] = { 	-- table: 0x00000000cc694d34
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Cottoncandy Battleaxe"] = { 	-- table: 0x0000000087549f14
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Tasty Candycane Beast"] = { 	-- table: 0x000000008d673674
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 21
}

local Candyland_Egg_1 = { 	-- table: 0x00000000d99602f4
	["Cost"] = 1.1e+60,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000004056f614
		["Candycorn Angler"] = { 	-- table: 0x00000000b3adc154
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Candycorn Mage"] = { 	-- table: 0x000000004e499f34
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Cotton Candy Mushroom"] = { 	-- table: 0x00000000090e5474
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		},
		["Lollipop Dog"] = { 	-- table: 0x0000000068546ab4
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Marshmellow Core"] = { 	-- table: 0x000000009faa9894
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 21
}

local Candyland_Egg_2 = { 	-- table: 0x000000001dc12634
	["Cost"] = 1.01e+61,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x000000008b204bd4
		["Candy Chocolate Beast"] = { 	-- table: 0x000000002580ccf4
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Chocolate Waffle God"] = { 	-- table: 0x000000008104e274
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Evolved Ice Cream"] = { 	-- table: 0x000000001ba59f54
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Marshmellow Queen"] = { 	-- table: 0x0000000051c394b4
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Santa's Candy Blade"] = { 	-- table: 0x000000003f9b5694
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Three-Headed Cotton Candy Valkryie"] = { 	-- table: 0x00000000462ea014
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 21
}

local Robux_Autumn_Egg = { 	-- table: 0x000000002fef6f94
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000fdcd9434
		["Autumn Blade"] = { 	-- table: 0x0000000065f09ef4
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Autumn Deathadder"] = { 	-- table: 0x0000000035f3c6b4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Autumn Kitsune"] = { 	-- table: 0x00000000e3fe2d54
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Autumn Mushroom"] = { 	-- table: 0x0000000057f05a14
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Autumn Rhino"] = { 	-- table: 0x000000000bf281d4
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Zood's Axe"] = { 	-- table: 0x000000000dfd2874
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 22
}

local Autumn_Egg_1 = { 	-- table: 0x0000000063ca8854
	["Cost"] = 1.1e+63,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000b9ea9574
		["Autumn Chill Dog"] = { 	-- table: 0x00000000cf87a194
			["Chances"] = "60%	~	1/2",
			["Weight"] = 6000
		},
		["Autumn Princess"] = { 	-- table: 0x0000000019e45a34
			["Chances"] = "34%	~	1/3",
			["Weight"] = 3400
		},
		["Autumn Reindeer"] = { 	-- table: 0x00000000b6010c14
			["Chances"] = "0.1%	~	1/1000",
			["Weight"] = 10
		},
		["Autumn Tree"] = { 	-- table: 0x00000000799e60f4
			["Chances"] = "1%	~	1/100",
			["Weight"] = 100
		},
		["Autumn Witch"] = { 	-- table: 0x0000000083c2d7d4
			["Chances"] = "4.900000000000001%	~	1/20",
			["Weight"] = 490.00000000000006
		}
	},
	["Multiplier"] = 100,
	["TotalWeight"] = 2,
	["Zone"] = 22
}

local Autumn_Egg_2 = { 	-- table: 0x00000000b709e714
	["Cost"] = 1.01e+64,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x0000000005a75db4
		["Autumn Bird"] = { 	-- table: 0x00000000de395774
			["Chances"] = "35.79999999999999%	~	1/3",
			["Weight"] = 3579999.9999999995
		},
		["Autumn Cow"] = { 	-- table: 0x00000000a13d0034
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Autumn Dog"] = { 	-- table: 0x00000000cfbe2b94
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Autumn Dominus"] = { 	-- table: 0x000000000bb435d4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Autumn Valkryie"] = { 	-- table: 0x00000000aa38c254
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Autumn's Revenge"] = { 	-- table: 0x0000000091b73af4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		}
	},
	["Multiplier"] = 100000,
	["TotalWeight"] = 2,
	["Zone"] = 22
}

local Robux_Egg_Christmas_2022 = { 	-- table: 0x00000000671d6514
	["Cost"] = 1000000000000000000,
	["CostType"] = "Coins",
	["EggTable"] = { 	-- table: 0x00000000859e0bb4
		["Arctic Crabbeard"] = { 	-- table: 0x000000005d0afe34
			["Chances"] = "35%	~	1/3",
			["Pet"] = true,
			["Weight"] = 35000
		},
		["Arctic Triple Dominus"] = { 	-- table: 0x00000000fc59e174
			["Chances"] = "1.5%	~	1/67",
			["Pet"] = true,
			["Weight"] = 1500
		},
		["Huge Mystical Ice Trident"] = { 	-- table: 0x000000002c5b0c54
			["Chances"] = "0.5%	~	1/200",
			["Weapon"] = true,
			["Weight"] = 500
		},
		["Pirated Octopus Blade"] = { 	-- table: 0x00000000936d63d4
			["Chances"] = "48%	~	1/2",
			["Weapon"] = true,
			["Weight"] = 48000
		},
		["Ultmate Toy Axe"] = { 	-- table: 0x00000000cf677594
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15000
		}
	},
	["Gift"] = true,
	["Multiplier"] = 1000,
	["TotalWeight"] = 2,
	["Unobtainable"] = true,
	["Zone"] = 1
}

local Christmas_Zone_1_Egg_1 = { 	-- table: 0x00000000e87f1134
	["Cost"] = 150,
	["CostType"] = "Presents2022",
	["EggTable"] = { 	-- table: 0x00000000d07e04d4
		["Arctic Witch"] = { 	-- table: 0x000000003a84c1b4
			["Chances"] = "21%	~	1/5",
			["Weight"] = 21
		},
		["Frozen Chill Dominus"] = { 	-- table: 0x00000000926bbe54
			["Chances"] = "8%	~	1/13",
			["Weight"] = 8
		},
		["Frozen Ice Wizard"] = { 	-- table: 0x0000000049432ff4
			["Chances"] = "34%	~	1/3",
			["Weight"] = 34
		},
		["Ice Frozen  Valkryie"] = { 	-- table: 0x0000000067643314
			["Chances"] = "37%	~	1/3",
			["Weight"] = 37
		}
	},
	["Zone"] = 1
}

local Christmas_Zone_1_Egg_2 = { 	-- table: 0x000000007b1f0554
	["Cost"] = 30000,
	["CostType"] = "Presents2022",
	["EggTable"] = { 	-- table: 0x000000002d521074
		["Arctic Icecream Beast"] = { 	-- table: 0x000000009e52ec94
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Arctic Squid"] = { 	-- table: 0x0000000012104b34
			["Chances"] = "30%	~	1/3",
			["Weight"] = 3000000
		},
		["Christmas Tree Sword"] = { 	-- table: 0x00000000080be054
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		},
		["Drippy Snowmobile"] = { 	-- table: 0x0000000090ad77b4
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Frozen Demon"] = { 	-- table: 0x0000000041527df4
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Frozen Dragon"] = { 	-- table: 0x00000000ba91f6d4
			["Chances"] = "5.800000000000001%	~	1/17",
			["Weight"] = 580000
		},
		["Toy Mega Dino"] = { 	-- table: 0x00000000274ef914
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		}
	},
	["Zone"] = 1
}

local Robux_Christmas_Zone_1_Egg = { 	-- table: 0x000000005b07cb54
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x00000000aca4a674
		["Drippy Sword"] = { 	-- table: 0x000000008c2fbd34
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Ice Battleaxe"] = { 	-- table: 0x000000004520b3f4
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Lolipop Candy Sword"] = { 	-- table: 0x00000000faa5d5b4
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Toy Dragon"] = { 	-- table: 0x00000000b6c74f14
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		},
		["Toy Robot"] = { 	-- table: 0x000000006481b8d4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Toy Spider"] = { 	-- table: 0x00000000fcc2b294
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 1
}

local Christmas_Zone_2_Egg_1 = { 	-- table: 0x0000000010cb6614
	["Cost"] = 1500,
	["CostType"] = "Presents2022",
	["EggTable"] = { 	-- table: 0x0000000068e9fab4
		["Christmas Princess"] = { 	-- table: 0x000000000af7cf34
			["Chances"] = "8%	~	1/13",
			["Weight"] = 8
		},
		["Christmas Santa Man"] = { 	-- table: 0x00000000eeece474
			["Chances"] = "37%	~	1/3",
			["Weight"] = 37
		},
		["Red Nosed Deer"] = { 	-- table: 0x000000009ef44894
			["Chances"] = "21%	~	1/5",
			["Weight"] = 21
		},
		["Scriptide's Jolly Dog"] = { 	-- table: 0x00000000430e7154
			["Chances"] = "34%	~	1/3",
			["Weight"] = 34
		}
	},
	["Zone"] = 1
}

local Christmas_Zone_2_Egg_2 = { 	-- table: 0x00000000c2cbb634
	["Cost"] = 300000,
	["CostType"] = "Presents2022",
	["EggTable"] = { 	-- table: 0x00000000eaeebbd4
		["Christmas Golem"] = { 	-- table: 0x00000000d8e72f54
			["Chances"] = "0.19980000000000003%	~	1/501",
			["Weight"] = 19980
		},
		["Christmas Toy Plane"] = { 	-- table: 0x0000000038dd0694
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weight"] = 1
		},
		["Frosty Pet"] = { 	-- table: 0x0000000022c844b4
			["Chances"] = "5.800000000000001%	~	1/17",
			["Weight"] = 580000
		},
		["Frozen Icy Droplet Pet"] = { 	-- table: 0x00000000f09a1274
			["Chances"] = "0.00017999999999999998%	~	1/555556",
			["Weight"] = 18
		},
		["Ice Cube"] = { 	-- table: 0x0000000076ebb014
			["Chances"] = "30%	~	1/3",
			["Weight"] = 3000000
		},
		["Ice Spirit"] = { 	-- table: 0x00000000360ebcf4
			["Chances"] = "64%	~	1/2",
			["Weight"] = 6400000
		},
		["Santa's Revenge"] = { 	-- table: 0x0000000080dc1934
			["Chances"] = "0.000009999999999999999%	~	1/10000000",
			["Weapon"] = true,
			["Weight"] = 1
		}
	},
	["Zone"] = 1
}

local Robux_Christmas_Zone_2_Egg = { 	-- table: 0x00000000fcc34434
	["Cost"] = 199,
	["CostType"] = "Robux",
	["EggTable"] = { 	-- table: 0x0000000034a4f1d4
		["Brick Toy Sword"] = { 	-- table: 0x0000000004ba0a14
			["Chances"] = "33%	~	1/3",
			["Weapon"] = true,
			["Weight"] = 33
		},
		["Christmas King"] = { 	-- table: 0x0000000094056ef4
			["Chances"] = "32%	~	1/3",
			["Weight"] = 32
		},
		["Giftbox :)"] = { 	-- table: 0x00000000ab3916b4
			["Chances"] = "15%	~	1/7",
			["Weight"] = 15
		},
		["Gingerbread Axe"] = { 	-- table: 0x000000009e39d494
			["Chances"] = "2%	~	1/50",
			["Weapon"] = true,
			["Weight"] = 2
		},
		["Inflatable Toy Hammer"] = { 	-- table: 0x00000000fd38dd54
			["Chances"] = "15%	~	1/7",
			["Weapon"] = true,
			["Weight"] = 15
		},
		["Santa's Ride"] = { 	-- table: 0x00000000cebb5874
			["Chances"] = "3%	~	1/33",
			["Weight"] = 3
		}
	},
	["ProductID"] = 1280750467,
	["Zone"] = 1
}

