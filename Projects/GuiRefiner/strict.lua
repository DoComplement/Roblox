-- this format is somewhat strict because only a specific, untampered format is allowed

-- consider keeping the input file in the same directory of this file
-- change input & output filename below

local INPUT_FILENAME = "input.lua";
local OUTPUT_FILENAME = "output.lua";

local properties = {};
local classes = {};
local parents = {};
local OTHER = {};

local function find_idx(name,assignment)
	for idx,tbl in ipairs(classes)do
		if(tbl[1]==name)then 
			return idx,name,assignment;
		end;
	end;
end;

local function add_main(idx,name,assignment)
	if(assignment:sub(1,6)=="Parent")then
		parents[idx] = assignment:match("= (.+)");	-- parent
	elseif(not properties[idx])then 
		properties[idx] = {assignment};
	else 
		table.insert(properties[idx], assignment);
	end;
end;

for line in io.lines(INPUT_FILENAME)do
	if(#line==0 or"--"==line:sub(1,2))then goto NEXT end;	
	if(line:sub(1,5)=="local"and nil~=line:match("Instance%.new"))then
		classes[#classes + 1] = {line:match("^local (.+) = Instance.new%((\".+\")%)")};		-- {name,class}
		goto NEXT;
	end;
	
	local idx,name,assignment = find_idx(line:match("^(%g+)%.(.+)"));
	if(assignment~=nil and not line:match("function"))then
		add_main(idx,name,assignment);
	else
		OTHER[#OTHER + 1] = line;
	end;
	
	::NEXT::
end;

local fmt = {
	"\n-- executes \"new_inst\" format";
	"local function new_inst(class,parent,props)";
	"\tlocal inst = Instance.new(class);";
	"\tfor prop,val in next,props do";
	"\t\tinst[prop] = val;\n\tend;";
	"\tinst.Parent = parent;\t-- appease Instance.new listeners";
	"\treturn inst;\nend;\n";
	"-- instances, edit toward further efficiency";
}

local tmp = {
	"local ";
	"TEMP_NAME";			-- 2 -> name
	" = new_inst(";
	"TEMP_CLASS";			-- 4 -> class name
	',';
	"TEMP_PARENT";			-- 6 -> parent
	",{";
	"TEMP_PROPERTIES";		-- 8 -> properties
	"});";
}

for idx,tbl in next,classes do
	tmp[2],tmp[4] = tbl[1],tbl[2];
	tmp[6],tmp[8] = parents[idx],table.concat(properties[idx],',');
	fmt[#fmt + 1] = table.concat(tmp);
end;

fmt[#fmt + 1] = "\n-- everything else\n"..table.concat(OTHER,'\n');
io.open(OUTPUT_FILENAME,'w'):write(table.concat(fmt,'\n')):close();
