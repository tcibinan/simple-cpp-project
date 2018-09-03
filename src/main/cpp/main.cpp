#include <iostream>
#include <map>
#include <functional>
#include <cstring>
#include "plus.h"
#include "minus.h"


using namespace std;

int main(int argc, char **argv) {
    if (argc != 2) {
        cout << "You should specify a name of function to run: \"<executable_name>.exe <function name>\"\n";
        return -1;
    }
    char *functionName = argv[1];
    cout << "Running function \"" << functionName << "\"\n";

    std::map<std::string, std::function<int()>> funcMap =
            {
                    {"plus", plus_task},
                    {"sub",  minus_task}
            };

    funcMap[functionName]();

    return 0;
}