
// (sometime late april 2022) Updated to ignore comments or blank spaces in any logical place
// (5/9/22) Updated to work with updated input format (new gui-to-lua with table of instances)

#include <iostream>
#include <string>
#include <fstream>
#include <vector>
#include <windows.h>	// delete lines 9, 23, 24, 34, 92, and 93 if this interferes with compilation

using std::string;
using std::vector;
using std::ifstream;
using std::ofstream;

int find(vector<string> &, string);
void r(string &, ofstream &, string);
int checkInst(string, int);
int LINE = 0, l;  // second variable is the character "l"

int main(){
	
	LARGE_INTEGER frequency, t1, t2;
	QueryPerformanceFrequency(&frequency);
	
	ifstream In("Input.txt");	// input file
	ofstream Out("Output.txt");	// output file 
	
	Out << "\nlocal function createInstance(class, props)\n"
		<< "\tlocal inst = Instance.new(class)\n"
		<< "\tfor i, v in pairs(props) do"
		<< "\n\t\tinst[i] = v\n\tend\n\n\treturn inst\nend\n\n";
		
	QueryPerformanceCounter(&t1);
	
	vector<string> Names, ClassNames;
	vector<int> cCheck;
	string str, pastName = "nil", header;
	
	while(getline(In, str)) { LINE++; l = header.length();
		int x = 0;
		for (int i = -1; i++ < static_cast<int>(str.length() - 1);) {
			if (str[i] == ' ' || str[i] == '\t') {	x++;	}
			else { break; }
		}
		if (str[x] == '-' && str[x + 1] == '-') {	continue;	}
		else if (checkInst(str, x)){
			string tName, tClassName;
			int c1 = 1, c2 = 0;
			for (int i = (x - 1); i++ < static_cast<int>(str.length() - 2);){
				if (((i > (x + 5) && checkInst(str, x) == 1) || (checkInst(str, x) == 2)) && c1){ 
					tName += str[i];	
					if (str[i + 1] == ' ') {	c1 = 0;	}
				}
				else if (str[i] == '"' || str[i] == ')') {	c2++;	}
				if (c2 && c2 < 3) {	tClassName += str[i];	}
			}
			if (tClassName == "") {	header = tName;	}
			else {	 
				Names.push_back(tName); 
				ClassNames.push_back(tClassName);	
				cCheck.push_back(1);	
			}
		}
		else if (str.length() > 0){
			int check = 0, s1 = (l > 0) ? (l + 1) : (0);
			string tName, tPose;
			
			for (int i = (x - 1 + s1); i++ < static_cast<int>(str.length() - 1);){
				if (check) {	tPose += str[i];
					if ((str[i + 1] == '-' && str[i + 2] == '-') || i == static_cast<int>(str.length() - 1))
					{	r(tPose, Out, header); break;	}
				}
				if (str[i] != '.' and !check) {	tName += str[i];	}
				else if ((i - x - s1) == static_cast<int>(tName.length())) {
					if (pastName != "nil")
					{	Out << ((pastName == tName) ? (", ") : ("})\n"));	}
					check = 1;
					
					if (cCheck.at(find(Names, tName))) {
						Out << "local " << tName << " = createInstance("
							 << ClassNames.at(find(Names, tName)) << ", \{";
						cCheck.at(find(Names, tName)) = 0;
					}
				}
			}
			if (tName.length() > 0) {pastName = tName;}	
		}
	}	
	Out << "})";
	
	QueryPerformanceCounter(&t2);
	std::cout << "Program completed in " << (t2.QuadPart - t1.QuadPart) * 1000.00 / frequency.QuadPart << " ms.";
	
	In.close();
	Out.close();
	
	return 0;
}

int find(vector<string> &obj, string val){
	int temp = -1;
	
	for (int i = -1; i++ < static_cast<int>(obj.size() - 1);)
	{	if (obj.at(i) == val) {	temp = i;	}}
	if (temp == -1) {
		std::cout << "Some sort of error has occurred..."
				  << "Current Line: " << LINE;
		exit(EXIT_FAILURE);
	}
	return temp;
}

void r(string &obj, ofstream &Out, string str){
	int count = 0, len1 = str.length(), len2 = obj.length();
	
	for (int i = static_cast<int>(len2); i-- > 0;) {
		if (obj[i] == ' ' || obj[i] == '\t') {	count++;	} 
		else {	break;	}
	}
	if (obj.substr(0, 6) == "Parent" && len1 > 0){
		for (int i = -1; i++ < static_cast<int>(len2 - len1 - count);)
			if (obj.substr(i, i + len1).substr(0, len1) == str){
				Out << obj.substr(0, i) + obj.substr(i + len1 + 1, len2 - count);
				return;
			}
	}
	Out <<  obj.substr(0, len2 - count);
}

int checkInst(string str, int x){
	if (str.substr(x, x + 5).substr(0, 5) == "local")
	{	return 1;	}
	for (int i = x; i++ < static_cast<int>(str.length() - 12);){
		if (str.substr(i + x, i + x + 12).substr(0, 12) == "Instance.new") 
			return 2;	
	}
	return false;
}
