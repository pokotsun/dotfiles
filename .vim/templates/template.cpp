#include "bits/stdc++.h"

using namespace std;

#define COUNTOF(array) (sizeof(array) / sizeof(array[0]))
#define OUT(P) cout << (P) << endl
#define OUT2(P1, P2) cout << (P1) << " " << (P2) << endl
#define PRINT_ARRAY(P) for(int i=0; i<P.size(); i++) cout << P[i] << endl;
#define PRINT_ARRAY_INLINE(P) do { for(int i=0; i<P.size(); i++) cout << P[i] << " "; cout << endl; } while(0)
#define PRINT_ARRAY_WITH_LABEL(L, P) do { cout << L << ": "; PRINT_ARRAY_INLINE(P); cout << endl; } while(0)
typedef long long ll;

int sum_digits(int num);
template <class T>
vector<T> copy_vector(vector<T> vec);
int gcd(int a, int b);

int main() {

    return 0;
}

/******************************/
/***** DECRARED FUNCTIONS *****/
/******************************/

int sum_digits(int num) {
    int rtn = 0;
    while(num != 0) {
        int tmp = num % 10; 
        rtn += tmp;
        num /= 10; 
    }   
    return rtn;
}

// vectorのコピー
template <class T>
vector<T> copy_vector(vector<T> vec) {
    vector<T> rtn;
    rtn.reserve(vec.size());
    copy(vec.begin(), vec.end(), back_inserter(rtn));
    return rtn;
}

// ユークリウッドの互除法
int gcd(int a, int b) {
    if(b==0) return a;
    else return gcd(b, a % b);
}
