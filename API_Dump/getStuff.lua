local api = game:HttpGetAsync(string.format("http://setup.roblox.com/%s-API-Dump.json", game:HttpGetAsync("http://setup.roblox.com/versionQTStudio")));
local functions,events = {},{};

for _,mems in ipairs(api.Classes)do
    for _,dat in ipairs(mems.Members)do
        if(dat.MemberType=="Function"and not table.find(functions,dat.Name))then
            functions[#functions + 1] = dat.Name;
        elseif(dat.MemberType=="Event"and not table.find(events,dat.Name))then
            events[#events + 1] = dat.Name;
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
