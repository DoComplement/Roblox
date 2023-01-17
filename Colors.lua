-- table of Color3 values for each unique BrickColor defined by Roblox (ignoring Medium stone grey)

--[[
writefile("Colors.lua", "return {");
local found = {};
local Color

for i = 1,1100 do 
	Color = BrickColor.new(i)
	if tostring(Color) ~= "Medium stone grey" and table.find(found, Color) == nil then
		table.insert(found, Color);
		appendfile("Colors.lua", "\n\t["..table.getn(found).."] = {"..tostring(Color.Color).."},\t-- "..tostring(Color))
	end
end


for i = 1,127 do
	Color = BrickColor.palette(i);
	if tostring(Color) ~= "Medium stone grey" and table.find(found, Color) == nil then
		table.insert(found, Color);
		appendfile("Colors.lua", "\n\t["..table.getn(found).."] = {"..tostring(Color.Color).."},\t-- "..tostring(Color))
	end
end

appendfile("Colors.lua", "\n}");
]]

return {
	[1] = {0.94902, 0.952941, 0.952941},	-- White
	[2] = {0.631373, 0.647059, 0.635294},	-- Grey
	[3] = {0.976471, 0.913726, 0.6},	-- Light yellow
	[4] = {0.843137, 0.772549, 0.603922},	-- Brick yellow
	[5] = {0.760784, 0.854902, 0.721569},	-- Light green (Mint)
	[6] = {0.909804, 0.729412, 0.784314},	-- Light reddish violet
	[7] = {0.501961, 0.733333, 0.858824},	-- Pastel Blue
	[8] = {0.796079, 0.517647, 0.258824},	-- Light orange brown
	[9] = {0.8, 0.556863, 0.411765},	-- Nougat
	[10] = {0.768628, 0.156863, 0.109804},	-- Bright red
	[11] = {0.768628, 0.439216, 0.627451},	-- Med. reddish violet
	[12] = {0.0509804, 0.411765, 0.67451},	-- Bright blue
	[13] = {0.960784, 0.803922, 0.188235},	-- Bright yellow
	[14] = {0.384314, 0.278431, 0.196078},	-- Earth orange
	[15] = {0.105882, 0.164706, 0.207843},	-- Black
	[16] = {0.427451, 0.431373, 0.423529},	-- Dark grey
	[17] = {0.156863, 0.498039, 0.278431},	-- Dark green
	[18] = {0.631373, 0.768628, 0.54902},	-- Medium green
	[19] = {0.952941, 0.811765, 0.607843},	-- Lig. Yellowich orange
	[20] = {0.294118, 0.592157, 0.294118},	-- Bright green
	[21] = {0.627451, 0.372549, 0.207843},	-- Dark orange
	[22] = {0.756863, 0.792157, 0.870588},	-- Light bluish violet
	[23] = {0.92549, 0.92549, 0.92549},	-- Transparent
	[24] = {0.803922, 0.329412, 0.294118},	-- Tr. Red
	[25] = {0.756863, 0.87451, 0.941177},	-- Tr. Lg blue
	[26] = {0.482353, 0.713726, 0.909804},	-- Tr. Blue
	[27] = {0.968628, 0.945098, 0.552941},	-- Tr. Yellow
	[28] = {0.705882, 0.823529, 0.894118},	-- Light blue
	[29] = {0.85098, 0.521569, 0.423529},	-- Tr. Flu. Reddish orange
	[30] = {0.517647, 0.713726, 0.552941},	-- Tr. Green
	[31] = {0.972549, 0.945098, 0.517647},	-- Tr. Flu. Green
	[32] = {0.92549, 0.909804, 0.870588},	-- Phosph. White
	[33] = {0.933333, 0.768628, 0.713726},	-- Light red
	[34] = {0.854902, 0.52549, 0.478431},	-- Medium red
	[35] = {0.431373, 0.6, 0.792157},	-- Medium blue
	[36] = {0.780392, 0.756863, 0.717647},	-- Light grey
	[37] = {0.419608, 0.196078, 0.486275},	-- Bright violet
	[38] = {0.886275, 0.607843, 0.25098},	-- Br. yellowish orange
	[39] = {0.854902, 0.521569, 0.254902},	-- Bright orange
	[40] = {0, 0.560784, 0.611765},	-- Bright bluish green
	[41] = {0.407843, 0.360784, 0.262745},	-- Earth yellow
	[42] = {0.262745, 0.329412, 0.576471},	-- Bright bluish violet
	[43] = {0.74902, 0.717647, 0.694118},	-- Tr. Brown
	[44] = {0.407843, 0.454902, 0.67451},	-- Medium bluish violet
	[45] = {0.898039, 0.678431, 0.784314},	-- Tr. Medi. reddish violet
	[46] = {0.780392, 0.823529, 0.235294},	-- Med. yellowish green
	[47] = {0.333333, 0.647059, 0.686275},	-- Med. bluish green
	[48] = {0.717647, 0.843137, 0.835294},	-- Light bluish green
	[49] = {0.643137, 0.741176, 0.278431},	-- Br. yellowish green
	[50] = {0.85098, 0.894118, 0.654902},	-- Lig. yellowish green
	[51] = {0.905882, 0.67451, 0.345098},	-- Med. yellowish orange
	[52] = {0.827451, 0.435294, 0.298039},	-- Br. reddish orange
	[53] = {0.572549, 0.223529, 0.470588},	-- Bright reddish violet
	[54] = {0.917647, 0.721569, 0.572549},	-- Light orange
	[55] = {0.647059, 0.647059, 0.796079},	-- Tr. Bright bluish violet
	[56] = {0.862745, 0.737255, 0.505882},	-- Gold
	[57] = {0.682353, 0.478431, 0.34902},	-- Dark nougat
	[58] = {0.611765, 0.639216, 0.658824},	-- Silver
	[59] = {0.835294, 0.45098, 0.239216},	-- Neon orange
	[60] = {0.847059, 0.866667, 0.337255},	-- Neon green
	[61] = {0.454902, 0.52549, 0.615686},	-- Sand blue
	[62] = {0.529412, 0.486275, 0.564706},	-- Sand violet
	[63] = {0.878431, 0.596078, 0.392157},	-- Medium orange
	[64] = {0.584314, 0.541176, 0.45098},	-- Sand yellow
	[65] = {0.12549, 0.227451, 0.337255},	-- Earth blue
	[66] = {0.152941, 0.27451, 0.176471},	-- Earth green
	[67] = {0.811765, 0.886275, 0.968628},	-- Tr. Flu. Blue
	[68] = {0.47451, 0.533333, 0.631373},	-- Sand blue metallic
	[69] = {0.584314, 0.556863, 0.639216},	-- Sand violet metallic
	[70] = {0.576471, 0.529412, 0.403922},	-- Sand yellow metallic
	[71] = {0.341176, 0.345098, 0.341176},	-- Dark grey metallic
	[72] = {0.0862745, 0.113725, 0.196078},	-- Black metallic
	[73] = {0.670588, 0.678431, 0.67451},	-- Light grey metallic
	[74] = {0.470588, 0.564706, 0.509804},	-- Sand green
	[75] = {0.584314, 0.47451, 0.466667},	-- Sand red
	[76] = {0.482353, 0.180392, 0.184314},	-- Dark red
	[77] = {1, 0.964706, 0.482353},	-- Tr. Flu. Yellow
	[78] = {0.882353, 0.643137, 0.760784},	-- Tr. Flu. Red
	[79] = {0.458824, 0.423529, 0.384314},	-- Gun metallic
	[80] = {0.592157, 0.411765, 0.356863},	-- Red flip/flop
	[81] = {0.705882, 0.517647, 0.333333},	-- Yellow flip/flop
	[82] = {0.537255, 0.529412, 0.533333},	-- Silver flip/flop
	[83] = {0.843137, 0.662745, 0.294118},	-- Curry
	[84] = {0.976471, 0.839216, 0.180392},	-- Fire Yellow
	[85] = {0.909804, 0.670588, 0.176471},	-- Flame yellowish orange
	[86] = {0.411765, 0.25098, 0.156863},	-- Reddish brown
	[87] = {0.811765, 0.376471, 0.141176},	-- Flame reddish orange
	[88] = {0.27451, 0.403922, 0.643137},	-- Royal blue
	[89] = {0.137255, 0.278431, 0.545098},	-- Dark Royal blue
	[90] = {0.556863, 0.258824, 0.521569},	-- Bright reddish lilac
	[91] = {0.388235, 0.372549, 0.384314},	-- Dark stone grey
	[92] = {0.509804, 0.541176, 0.364706},	-- Lemon metalic
	[93] = {0.898039, 0.894118, 0.87451},	-- Light stone grey
	[94] = {0.690196, 0.556863, 0.266667},	-- Dark Curry
	[95] = {0.439216, 0.584314, 0.470588},	-- Faded green
	[96] = {0.47451, 0.709804, 0.709804},	-- Turquoise
	[97] = {0.623529, 0.764706, 0.913726},	-- Light Royal blue
	[98] = {0.423529, 0.505882, 0.717647},	-- Medium Royal blue
	[99] = {0.564706, 0.298039, 0.164706},	-- Rust
	[100] = {0.486275, 0.360784, 0.27451},	-- Brown
	[101] = {0.588235, 0.439216, 0.623529},	-- Reddish lilac
	[102] = {0.419608, 0.384314, 0.607843},	-- Lilac
	[103] = {0.654902, 0.662745, 0.807843},	-- Light lilac
	[104] = {0.803922, 0.384314, 0.596078},	-- Bright purple
	[105] = {0.894118, 0.678431, 0.784314},	-- Light purple
	[106] = {0.862745, 0.564706, 0.584314},	-- Light pink
	[107] = {0.941177, 0.835294, 0.627451},	-- Light brick yellow
	[108] = {0.921569, 0.721569, 0.498039},	-- Warm yellowish orange
	[109] = {0.992157, 0.917647, 0.552941},	-- Cool yellow
	[110] = {0.490196, 0.733333, 0.866667},	-- Dove blue
	[111] = {0.203922, 0.168627, 0.458824},	-- Medium lilac
	[112] = {0.313726, 0.427451, 0.329412},	-- Slime green
	[113] = {0.356863, 0.364706, 0.411765},	-- Smoky grey
	[114] = {0, 0.0627451, 0.690196},	-- Dark blue
	[115] = {0.172549, 0.396078, 0.113725},	-- Parsley green
	[116] = {0.321569, 0.486275, 0.682353},	-- Steel blue
	[117] = {0.2, 0.345098, 0.509804},	-- Storm blue
	[118] = {0.0627451, 0.164706, 0.862745},	-- Lapis
	[119] = {0.239216, 0.0823529, 0.521569},	-- Dark indigo
	[120] = {0.203922, 0.556863, 0.25098},	-- Sea green
	[121] = {0.356863, 0.603922, 0.298039},	-- Shamrock
	[122] = {0.623529, 0.631373, 0.67451},	-- Fossil
	[123] = {0.34902, 0.133333, 0.34902},	-- Mulberry
	[124] = {0.121569, 0.501961, 0.113725},	-- Forest green
	[125] = {0.623529, 0.678431, 0.752941},	-- Cadet blue
	[126] = {0.0352941, 0.537255, 0.811765},	-- Electric blue
	[127] = {0.482353, 0, 0.482353},	-- Eggplant
	[128] = {0.486275, 0.611765, 0.419608},	-- Moss
	[129] = {0.541176, 0.670588, 0.521569},	-- Artichoke
	[130] = {0.72549, 0.768628, 0.694118},	-- Sage green
	[131] = {0.792157, 0.796079, 0.819608},	-- Ghost grey
	[132] = {0.654902, 0.368627, 0.607843},	-- Lilac
	[133] = {0.482353, 0.184314, 0.482353},	-- Plum
	[134] = {0.580392, 0.745098, 0.505882},	-- Olivine
	[135] = {0.658824, 0.741176, 0.6},	-- Laurel green
	[136] = {0.87451, 0.87451, 0.870588},	-- Quill grey
	[137] = {0.592157, 0, 0},	-- Crimson
	[138] = {0.694118, 0.898039, 0.65098},	-- Mint
	[139] = {0.596078, 0.760784, 0.858824},	-- Baby blue
	[140] = {1, 0.596078, 0.862745},	-- Carnation pink
	[141] = {1, 0.34902, 0.34902},	-- Persimmon
	[142] = {0.458824, 0, 0},	-- Maroon
	[143] = {0.937255, 0.721569, 0.219608},	-- Gold
	[144] = {0.972549, 0.85098, 0.427451},	-- Daisy orange
	[145] = {0.905882, 0.905882, 0.92549},	-- Pearl
	[146] = {0.780392, 0.831373, 0.894118},	-- Fog
	[147] = {1, 0.580392, 0.580392},	-- Salmon
	[148] = {0.745098, 0.407843, 0.384314},	-- Terra Cotta
	[149] = {0.337255, 0.141176, 0.141176},	-- Cocoa
	[150] = {0.945098, 0.905882, 0.780392},	-- Wheat
	[151] = {0.996078, 0.952941, 0.733333},	-- Buttermilk
	[152] = {0.878431, 0.698039, 0.815686},	-- Mauve
	[153] = {0.831373, 0.564706, 0.741176},	-- Sunrise
	[154] = {0.588235, 0.333333, 0.333333},	-- Tawny
	[155] = {0.560784, 0.298039, 0.164706},	-- Rust
	[156] = {0.827451, 0.745098, 0.588235},	-- Cashmere
	[157] = {0.886275, 0.862745, 0.737255},	-- Khaki
	[158] = {0.929412, 0.917647, 0.917647},	-- Lily white
	[159] = {0.913726, 0.854902, 0.854902},	-- Seashell
	[160] = {0.533333, 0.243137, 0.243137},	-- Burgundy
	[161] = {0.737255, 0.607843, 0.364706},	-- Cork
	[162] = {0.780392, 0.67451, 0.470588},	-- Burlap
	[163] = {0.792157, 0.74902, 0.639216},	-- Beige
	[164] = {0.733333, 0.701961, 0.698039},	-- Oyster
	[165] = {0.423529, 0.345098, 0.294118},	-- Pine Cone
	[166] = {0.627451, 0.517647, 0.309804},	-- Fawn brown
	[167] = {0.584314, 0.537255, 0.533333},	-- Hurricane grey
	[168] = {0.670588, 0.658824, 0.619608},	-- Cloudy grey
	[169] = {0.686275, 0.580392, 0.513726},	-- Linen
	[170] = {0.588235, 0.403922, 0.4},	-- Copper
	[171] = {0.337255, 0.258824, 0.211765},	-- Medium brown
	[172] = {0.494118, 0.407843, 0.247059},	-- Bronze
	[173] = {0.411765, 0.4, 0.360784},	-- Flint
	[174] = {0.352941, 0.298039, 0.258824},	-- Dark taupe
	[175] = {0.415686, 0.223529, 0.0352941},	-- Burnt Sienna
	[176] = {0.972549, 0.972549, 0.972549},	-- Institutional white
	[177] = {0.803922, 0.803922, 0.803922},	-- Mid gray
	[178] = {0.0666667, 0.0666667, 0.0666667},	-- Really black
	[179] = {1, 0, 0},	-- Really red
	[180] = {1, 0.690196, 0},	-- Deep orange
	[181] = {0.705882, 0.501961, 1},	-- Alder
	[182] = {0.639216, 0.294118, 0.294118},	-- Dusty Rose
	[183] = {0.756863, 0.745098, 0.258824},	-- Olive
	[184] = {1, 1, 0},	-- New Yeller
	[185] = {0, 0, 1},	-- Really blue
	[186] = {0, 0.12549, 0.376471},	-- Navy blue
	[187] = {0.129412, 0.329412, 0.72549},	-- Deep blue
	[188] = {0.0156863, 0.686275, 0.92549},	-- Cyan
	[189] = {0.666667, 0.333333, 0},	-- CGA brown
	[190] = {0.666667, 0, 0.666667},	-- Magenta
	[191] = {1, 0.4, 0.8},	-- Pink
	[192] = {1, 0.686275, 0},	-- Deep orange
	[193] = {0.0705882, 0.933333, 0.831373},	-- Teal
	[194] = {0, 1, 1},	-- Toothpaste
	[195] = {0, 1, 0},	-- Lime green
	[196] = {0.227451, 0.490196, 0.0823529},	-- Camo
	[197] = {0.498039, 0.556863, 0.392157},	-- Grime
	[198] = {0.54902, 0.356863, 0.623529},	-- Lavender
	[199] = {0.686275, 0.866667, 1},	-- Pastel light blue
	[200] = {1, 0.788235, 0.788235},	-- Pastel orange
	[201] = {0.694118, 0.654902, 1},	-- Pastel violet
	[202] = {0.623529, 0.952941, 0.913726},	-- Pastel blue-green
	[203] = {0.8, 1, 0.8},	-- Pastel green
	[204] = {1, 1, 0.8},	-- Pastel yellow
	[205] = {1, 0.8, 0.6},	-- Pastel brown
	[206] = {0.384314, 0.145098, 0.819608},	-- Royal purple
	[207] = {1, 0, 0.74902},	-- Hot pink
}, 207;
