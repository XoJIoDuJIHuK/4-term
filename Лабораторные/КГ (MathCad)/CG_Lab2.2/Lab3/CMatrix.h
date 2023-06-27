#pragma once
#include<WinUser.h>
class CMatrix
{
	double** array;
	int n_rows;							// Число строк
	int n_cols;							// Число столбцов
public:
	CMatrix();							// Конструктор по умолчанию (1 на 1)	
	CMatrix(int, int);		    		// Конструктор	
	CMatrix(int);						// Конструктор -вектора (один столбец)
	CMatrix(const CMatrix&);			// Конструктор копирования	
	~CMatrix();
	double& operator()(int, int);        // Выбор элемента матрицы по индексу 
	double& operator()(int);            // Выбор элемента вектора по индексу 
	CMatrix operator-();			    // Оператор "-"
	CMatrix operator=(const CMatrix&);	// Оператор "Присвоить":    M1=M2
	CMatrix operator*(CMatrix&);        // Оператор "Произведение": М1*М2
	CMatrix operator+(CMatrix&);	    // Оператор "+": M1+M2
	CMatrix operator-(CMatrix&);	    // Оператор "-": M1-M2
	CMatrix operator+(double);		    // Оператор "+": M+a
	CMatrix operator-(double);		    // Оператор "-": M-a
	int rows()const { return n_rows; };   // Возвращает число строк
	int cols()const { return n_cols; };    // Возвращает число строк
	CMatrix Transp();				    // Возвращает матрицу,транспонированную к текущей
	CMatrix GetRow(int);			    // Возвращает строку по номеру
	CMatrix GetRow(int, int, int);
	CMatrix GetCol(int);			    // Возвращает столбец по номеру
	CMatrix GetCol(int, int, int);
	CMatrix RedimMatrix(int, int);	    // Изменяет размер матрицы с уничтожением данных
	CMatrix RedimData(int, int);         // Изменяет размер матрицы с сохранением данных, 
										//которые можно сохранить
	CMatrix RedimMatrix(int);	        // Изменяет размер матрицы с уничтожением данных
	CMatrix RedimData(int);             // Изменяет размер матрицы с сохранением данных,
										//которые можно сохранить
	double MaxElement();			  	// Максимальный элемент матрицы
	double MinElement();				// Минимальный элемент матрицы
	
};
void PrintMatrix(CDC& dc, int x, int y, CMatrix& M);
CMatrix VectorMult(CMatrix& V1, CMatrix& V2);
double ScalarMult(CMatrix& V1, CMatrix& V2);
double ModVec(CMatrix& V);
double CosV1V2(CMatrix& V1, CMatrix& V2);
CMatrix SphereToCart(CMatrix& PView);
//CMatrix A(3, 3), B(3, 3), V1(3), V2(3);
	//for (int i = 0; i < A.rows(); i++)
	//for (int j = 0; j < A.cols(); j++)
	//{
	//	A(i, j) = i + j;
	//	B(i, j) = i + j + 1;
	//}
	//dc.TextOutW(1, 1, CString("A"));
	//PrintMatrix(dc, 1, 20, A);
	//dc.TextOutW(50, 1, CString("B"));
	//PrintMatrix(dc, 50, 20, B);
	//dc.TextOutW(100, 1, CString("C1 = A+B"));
	//PrintMatrix(dc, 100, 20, A+B);
