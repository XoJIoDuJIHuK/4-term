#include "Auxil.h"

#include <ctime>
#include <iostream>
#include <random>
#include <cstdlib>

std::random_device rd;//initializing mersenne GenPseRanNum
std::mt19937 mersenne(rd());
const unsigned int UINTMAX = 0xffffffff;
#define CYCLE 1000000

using namespace std;

int factorial(int i)
{
	if (i < 0) return -1;
	if (i == 0) return 1;
	return factorial(i - 1) * i;
}

int fibonacci(int i)
{
	if (i == 0) return 0;
	if (i == 1) return 1;
	return fibonacci(i - 1) + fibonacci(i - 2);
}

namespace Auxil
{
	void start()
	{
		srand(time(0));
	}

	double dget(double rmin, double rmax)
	{
		return rmin + ((double)mersenne() / UINTMAX * (rmax - rmin + 1));
	}

	int iget(int rmin, int rmax)
	{
		return rmin + (int)((double)mersenne() / UINTMAX * (rmax - rmin + 1));
	}
}

void main()
{
	double  av1 = 0, av2 = 0;
	clock_t  t1 = 0, t2 = 0;
	
	Auxil::start();                          // старт генерации 
	t1 = clock();                            // фиксация времени 
	for (int i = 0; i < CYCLE; i++)
	{
		int randint = Auxil::iget(-100, 100);
		//cout << randint;
		av1 += (double)randint; // сумма случайных чисел 
		av2 += Auxil::dget(-100, 100);         // сумма случайных чисел 
	}
	t2 = clock();
	
	std::cout << "cycles amount:   " << CYCLE << std::endl;
	std::cout << "average int:     " << av1 / CYCLE << std::endl;
	std::cout << "average double:  " << av2 / CYCLE << std::endl;
	std::cout << "duration (msec): " << (t2 - t1) << std::endl;
	std::cout << "(sec):		 " << ((double)(t2 - t1)) / 
		((double)CLOCKS_PER_SEC) << std::endl;
	std::cout << std::endl;

	Auxil::start();
	t1 = clock();
	cout << fibonacci(40);
	t2 = clock();
	std::cout << "duration (msec): " << (t2 - t1) << std::endl;
}