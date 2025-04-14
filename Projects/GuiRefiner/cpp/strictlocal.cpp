// follows "strict" (untampered) input format

#include <stdio.h>
#include <fstream>
#include <vector>

using std::vector;
using std::string;

void append_class(const string &line, vector<vector<string>> &classes){
	classes.push_back(vector<string>{
		line.substr(0, line.find(' ')),
		string(begin(line) + line.find('\"'), end(line) - 1)
	});
}

size_t find_idx(const string &name, vector<vector<string>> &classes){
	for(size_t idx{}; idx < classes.size(); ++idx) 
		if(classes[idx][0] == name) 
			return idx;
	return classes.size();
}

string concat(vector<string> &props, char split){
	if(!props.size()) return string();
	string temp{};
	for(string &prop : props) temp.append(prop.append(1, split));
	temp.pop_back();
	return temp;
}

// edit these filenames (they are, somewhat, not case sensitive)
const string INPUT_FILENAME{"input.lua"};
const char *OUTPUT_FILENAME{"output.lua"};

int main(){
	
	std::ifstream IN(INPUT_FILENAME);
	
	vector<vector<string>> classes{},		// name,class
						   properties{};	// assignments
	vector<string> parents{},				// parents
				   OTHER{};					// everything else

	string line{};
	while(getline(IN, line)){
		if(!line.size() || line.substr(0,2) == "--") continue;
		if(line.substr(0, 5) == "local" && line.substr(6, 8) != "function"){
			append_class(line.substr(6), classes);
			parents.push_back(string{});
			properties.push_back(vector<string>{});
			continue;
		};
		
		string name{line.substr(0, line.find('.'))};
		if(name == line){
			OTHER.push_back(line);
			continue;
		}
		
		size_t idx{find_idx(name, classes)};
		if(idx == classes.size()){
			OTHER.push_back(line);
			continue;
		}
		
		string assn{string(begin(line) + name.size() + 1, end(line))};
		if(assn.substr(0, 6)=="Parent") 
			parents[idx] = assn.substr(assn.find("= ") + 2);
		else 
			properties[idx].push_back(assn);
	};
	
	IN.close();
	
	FILE *OUT = fopen(OUTPUT_FILENAME, "w");
	fputs("\n-- executes \"new_inst\" format\nlocal function new_inst(class, parent, props)\n\tlocal inst = Instance.new(class);\n\tfor prop,val in next,props do\n\t\tinst[prop] = val;\n\tend;\n\tinst.Parent = parent;\t-- appease Instance.new listeners\n\treturn inst;\nend;\n\n-- instances, edit toward further efficiency\n", OUT);
	
	const char *fmt1{"local %s = new_inst(%s, %s, {%s});\n"};
	for(size_t idx{}; idx < classes.size(); ++idx)
		fprintf(OUT, fmt1, classes[idx][0].c_str(), classes[idx][1].c_str(), parents[idx].c_str(), concat(properties[idx], ',').c_str());
	
	fprintf(OUT, "\n-- everything else\n%s", concat(OTHER, '\n').c_str());
	fclose(OUT);
};
