#include "bits/stdc++.h"

using namespace std;

#define COUNTOF(array) (sizeof(array) / sizeof(array[0]))
#define OUT(P) cout << (P) << endl
#define OUT2(P1, P2) cout << (P1) << " " << (P2) << endl

// integerの各桁を足す
int sum_digits(int num) {
    int rtn = 0;
    string num_str = to_string(num);
    for(int i=0; i<num_str.size(); i++) {
        rtn += num_str[i] - '0';
    } 
    return rtn;
}

int main() {

    return 0;
}
