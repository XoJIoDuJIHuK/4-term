#include <algorithm>
#include <iostream>
#include <ctime>
#include <iomanip>
#include <random>
#include <tchar.h>
#include "Levenstein.h"
using namespace std;

char alphabet[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
int alphabetLength = 26;

int max(int a, int b)
{
    return a < b ? b : a;
}
int currIndex(int x, int width, int y)
{
    return x * width + y;
}

void LCSdynamic(int lx, const char* x, int ly, const char* y)
{
    int* mat = new int[(lx + 1) * (ly + 1)];
    for (int i = 0; i < ly + 1; i++)
    {
        for (int j = 0; j < lx + 1; j++)
        {
            mat[currIndex(i, lx + 1, j)] = 0;
        }
    }

    for (int i = 0; i < ly; i++)
    {
        for (int j = 0; j < lx; j++)
        {
            if (y[i] == x[j]) mat[currIndex(i + 1, lx + 1, j + 1)] = 
                mat[currIndex(i, lx + 1, j)] + 1;
            else mat[currIndex(i + 1, lx + 1, j + 1)] = 
                max(mat[currIndex(i, lx + 1, j + 1)], mat[currIndex(i + 1, lx + 1, j)]);
        }
    }

    for (int i = 0; i < ly + 2; i++)//matrix output
    {
        for (int j = 0; j < lx + 2; j++)
        {
            if (i == 0)
            {
                if (j > 1) cout << setw(3) << x[j - 2];
                else cout << setw(3) << "";
            }
            else if (j == 0)
            {
                if (i > 1) cout << setw(3) << y[i - 2];
                else cout << setw(3) << "";
            }
            if (i > 0 && j > 0)
            {
                cout << setw(3) << mat[currIndex(i - 1, lx + 1, j - 1)];
            }
        }
        cout << endl;
    }
}
int LCSrecursive(int lenx, const char x[], int leny, const char y[])
{
    int rc = 0;
    if (lenx > 0 && leny > 0)
    {
        if (x[lenx - 1] == y[leny - 1]) rc = 1 + LCSrecursive(lenx - 1, x, leny - 1, y);
        else rc = std::max(LCSrecursive(lenx, x, leny - 1, y), LCSrecursive(lenx - 1, x, leny, y));
    }
    return rc;        //длина LCS
}

char* getRandStr(int length)
{
    char* ret = new char[length + 1];
    ret[length] = 0;
    for (int i = 0; i < length; i++)
    {
        int j = rand() % alphabetLength;
        ret[i] = alphabet[j];
    }
    return ret;
}

int _tmain(int argc, _TCHAR* argv[])
{
    clock_t t1 = 0, t2 = 0, t3, t4;

    t1 = clock(); LCSdynamic(7, "MIOPLKJ", 6, "GUIOLW"); t2 = clock();
    t3 = clock();  cout << LCSrecursive(7, "MIOPLKJ", 6, "GUIOLW") << endl; t4 = clock();
    cout << "dynamic: " << t2 - t1 << "; recursive: " << t4 - t3 << endl;
    return 0;


    srand(time(NULL));
    setlocale(LC_ALL, "rus");
    t1 = 0, t2 = 0, t3 = 0, t4 = 0;
    //char x[] = "abcdefghklmnoxm", y[] = "xyabcdefghomnkm";
    //int  lx = sizeof(x) - 1, ly = sizeof(y) - 1;
    char* x = getRandStr(300); char* y = getRandStr(200); int lx = 300, ly = 200;
    std::cout << std::endl;
    std::cout << std::endl << "-- расстояние Левенштейна -----" << std::endl;
    std::cout << std::endl << "--длина --- рекурсия -- дин.програм. ---"
        << std::endl;

    double k[] = { 1.0/30, 1.0/25, 1.0/24, 1.0/23, 1.0/22, 1.0/21, 1.0/20 };

    for (int i = 0; i < 7; i++)
    {

        t1 = clock(); 
        levenshtein_r(k[i] * lx, x, k[i] * ly, y);
        t2 = clock();
        
        
        t3 = clock(); levenshtein(k[i] * lx, x, k[i] * ly, y); t4 = clock();
        std::cout << std::right << std::setw(3) << k[i] << "/" << std::setw(2) << i
            << "        " << std::left << std::setw(10) << (t2 - t1)
            << "   " << std::setw(10) << (t4 - t3) << std::endl;
    }
    system("pause");
    return 0;
}
