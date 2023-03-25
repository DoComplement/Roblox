local match,format,gsub = string.match,string.format,string.gsub;
local floor = math.floor;
local consts = {
	[1] = {1,''};
	[2] = {1e-3,'K'};
	[3] = {1e-6,'M'};
	[4] = {1e-9,'B'};
	[5] = {1e-12,'T'};
	[6] = {1e-15,"Qd"};
	[7] = {1e-18,"Qt"};
	[8] = {1e-21,"Sx"};
	[9] = {1e-24,"Oc"};
	[10] = {1e-27,"No"};
	[11] = {1e-30,"De"};
	[12] = {1e-33,"Ud"};
	[13] = {1e-36,"Du"};
	[14] = {1e-39,"Td"};
	[15] = {1e-42,"Qu"};
}; -- and so on

-- gives the option to remove trailing zeros
local function Abbreviate1(num,rem)
	local idx = c[1 + floor(math.log10(num)/3)];

	num = format("%.3f",num*idx[1]); -- truncate, will round
	if(rem)then -- remove trailing zeros
		if((num - floor(num))==0)then
			return(floor(num)..idx[2]);
		end;
		return(gsub(num,"0+$",'')..idx[2]);
	end;
	return(num..idx[2]);
end;

-- does not remove trailing zeros
local function Abbreviate2(num)
	local idx = c[1 + floor(math.log10(num)/3)];
	return(format("%.3f",num*idx[1])..idx[2]); -- truncate
end;

-- contains a resolution option (can be added to the other two as desired)
-- the input format of "res" is arbitrary, but must stay consistent in the function (or add error checking)
local function Abbreviate3(num,res)
    if(not res or type(res)~="number"or res<0)then 
        res = "%.3f";
    else
        res = "%."..floor(res)..'f';
    end;
    
	local idx = c[1 + floor(math.log10(num)/3)];
	return(format(res,num*idx[1])..idx[2]); -- truncate
end;

-- method without rounding from string.format
local function Abbreviate4(num,idx)
	idx = c[1 + floor(math.log10(num)/3)];
	num = tostring(num*idx[1]);
	return(num:sub(1,1 + (num:find('%.')))..idx[2]);
end;

-- same as about, including a resolution
local function Abbreviate5(num,res,len)
	if(not res or type(res)~="number"or res<0)then res = 3 end;
	
	local idx = c[1 + floor(math.log10(num)/3)];
	num = tostring(num*idx[1]);
	return(num:sub(1,res + (num:find('%.')))..idx[2]);
end;

-- same as above but removes trailing zeros (WITHOUT OPTION!!!)
local function Abbreviate6(num,res,len)
	if(not res or type(res)~="number"or res<0)then res = 3 end;
	local idx = c[1 + floor(math.log10(num)/3)];
	
	num = tostring(num*idx[1]);
	num = num:sub(1,res + (num:find('%.')))..idx[2]);
	if((num - floor(num))==0)then
		return(floor(num)..idx[2]);
	end;
	return(gsub(num,"0+$",'')..idx[2]);
end;
