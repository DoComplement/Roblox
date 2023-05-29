
local f = io.open("games__filenames.txt");
if(not f)then
	os.execute("dir hub_files\\Games /b > games__filenames.txt");
else
	f:close();
end;

f = io.open("unknown_filenames.txt");
if(not f)then
	os.execute("dir hub_files\\Unknown /b > unknown_filenames.txt");
else
	f:close();
end;
