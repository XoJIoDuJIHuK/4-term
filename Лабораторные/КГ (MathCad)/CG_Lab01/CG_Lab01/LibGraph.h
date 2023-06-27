#pragma once
#include "CMatrix.h"
#include <afxwin.h>

void PrintMatrix(CDC& dc, int x, int y, CMatrix& M);

CMatrix VectorMult(CMatrix& V1, CMatrix& V2);
double ScalarMult(CMatrix& V1, CMatrix& V2);
double ModVec(CMatrix& V);
double CosV1V2(CMatrix& V1, CMatrix& V2);
CMatrix SphereToCart(CMatrix& PView);