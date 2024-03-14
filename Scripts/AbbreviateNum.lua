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

local floor,log10 = math.floor,math.log10;
local function unsigAbbFast(num,idx)
	idx = consts[1 + log10(num)//3];
	if(not idx)then return(num)end;
	return (num*idx[1]*10)//10 .. idx[2];
end;

local abs = math.abs;
local function sigAbbFast(num)
	idx = consts[1 + log10(abs(num))//3];
	if(not idx)then return(num)end;
	return (num*idx[1]*10)//10 .. idx[2];
end;

-- includes resolution option (factor of 10)
local function abbFastRes(num,res,idx)
	if(type(res)~="number" or res<=0)then res = 10 end;
	idx = consts[1 + log10(num)//3];
	if(not idx)then return(num)end;
	return floor(num*idx[1]*res)//res .. idx[2];
end;


local format,gsub = string.format,string.gsub
-- gives the option to remove trailing zeros
local function abbSlow(num,rem)
	local idx = consts[1 + log10(num)//3];

	num = format("%.3f",num*idx[1]); -- truncate, will round
	if(rem)then -- remove trailing zeros
		if((num - floor(num))==0)then
			return(floor(num)..idx[2]);
		end;
		return(gsub(num,"0+$",'')..idx[2]);
	end;
	return(num..idx[2]);
end;

local sub,find = string.sub,string.find;
-- without rouding
local function abbSlowish(num,rem)
	local idx = consts[1 + log10(num)//3];

	num = tostring(num*idx[1]);
	num = sub(num,1,1 + find(num,"%.")); -- resolution of 1
	if(rem)then -- remove trailing zeros
		if((num - floor(num))==0)then
			return(floor(num)..idx[2]);
		end;
		return(gsub(num,"0+$",'')..idx[2]);
	end;
	return(num..idx[2]);
end;

-- same as above with resolution option (no error checking)
local function abbSlowisher(num,rem,res)
	local idx = consts[1 + log10(num)//3];

	num = tostring(num*idx[1]);
	num = sub(num,1,res + find(num,"%.")); -- resolution of res
	if(rem)then -- remove trailing zeros
		if((num - floor(num))==0)then
			return(floor(num)..idx[2]);
		end;
		return(gsub(num,"0+$",'')..idx[2]);
	end;
	return(num..idx[2]);
end;


