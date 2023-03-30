local api = game:GetService("HttpService"):JSONDecode(readfile("rbx_api.dat"));
local find = table.find;
local functions,events = {},{};
local f,e = 1,1;

for _,mems in ipairs(api.Classes)do
    for _,dat in ipairs(mems.Members)do
        if(dat.MemberType=="Function"and not find(functions,dat.Name))then
            functions[f] = dat.Name;
            f += 1;
        elseif(dat.MemberType=="Event"and not find(events,dat.Name))then
            events[e] = dat.Name;
            e += 1;
        end;
    end;
end;

table.sort(functions);
table.sort(events);

writefile("functions.txt",table.concat(functions,' '));
writefile("events.txt",table.concat(events,' '));

local enums = {};
for idx,dat in ipairs(api.Enums)do
    enums[idx] = dat.Name;
end;

table.sort(enums);
writefile("enums.txt",table.concat(enums,' '));
