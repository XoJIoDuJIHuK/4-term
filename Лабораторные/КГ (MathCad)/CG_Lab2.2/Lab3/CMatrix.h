#pragma once
#include<WinUser.h>
class CMatrix
{
	double** array;
	int n_rows;							// ����� �����
	int n_cols;							// ����� ��������
public:
	CMatrix();							// ����������� �� ��������� (1 �� 1)	
	CMatrix(int, int);		    		// �����������	
	CMatrix(int);						// ����������� -������� (���� �������)
	CMatrix(const CMatrix&);			// ����������� �����������	
	~CMatrix();
	double& operator()(int, int);        // ����� �������� ������� �� ������� 
	double& operator()(int);            // ����� �������� ������� �� ������� 
	CMatrix operator-();			    // �������� "-"
	CMatrix operator=(const CMatrix&);	// �������� "���������":    M1=M2
	CMatrix operator*(CMatrix&);        // �������� "������������": �1*�2
	CMatrix operator+(CMatrix&);	    // �������� "+": M1+M2
	CMatrix operator-(CMatrix&);	    // �������� "-": M1-M2
	CMatrix operator+(double);		    // �������� "+": M+a
	CMatrix operator-(double);		    // �������� "-": M-a
	int rows()const { return n_rows; };   // ���������� ����� �����
	int cols()const { return n_cols; };    // ���������� ����� �����
	CMatrix Transp();				    // ���������� �������,����������������� � �������
	CMatrix GetRow(int);			    // ���������� ������ �� ������
	CMatrix GetRow(int, int, int);
	CMatrix GetCol(int);			    // ���������� ������� �� ������
	CMatrix GetCol(int, int, int);
	CMatrix RedimMatrix(int, int);	    // �������� ������ ������� � ������������ ������
	CMatrix RedimData(int, int);         // �������� ������ ������� � ����������� ������, 
										//������� ����� ���������
	CMatrix RedimMatrix(int);	        // �������� ������ ������� � ������������ ������
	CMatrix RedimData(int);             // �������� ������ ������� � ����������� ������,
										//������� ����� ���������
	double MaxElement();			  	// ������������ ������� �������
	double MinElement();				// ����������� ������� �������
	
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
