#include "stdafx.h"
#include "CMatrix.h"
#include "LibGraph.h"
#include "LibSurface.h"
#include <cmath>
//�������
double function1(double x, double y)
{
	return x * x + y * y;
}

double function2(double x, double y)
{
	return  x * x - y * y;
}

double function3(double x, double y)
{
	if(y!=0 && x!=0)
		if((1 - x * x - y * y)>=0)
	return sqrt(1 - x * x - y * y);
}

CPlot3D::CPlot3D()//����������� �� ���������
{
	_pFunc = NULL;
	_viewport.RedimMatrix(3);
	_rectWindow.SetRect(0, 0, 200, 200);//�������������
	_viewport(0) = 10;
	_viewport(1) = 315;
	_viewport(2) = 50;
}

void CPlot3D::SetFunction(pfunc2 pF, CRectD RS, double dx, double dy)//������� � ���������� �������
{
	_pFunc = pF;//�������� ������� ������ � ������������
	_rectSpace.SetRectD(RS.left, RS.top, RS.right, RS.bottom);//������ ������ � �������
	_matrixFunction.clear();//������� ���������� ������
	_matrixView.clear();//������� ���������� � ���
	_matrixWindow.clear();//�������

	CreateMatrixFunction(dx, dy);
	CreateMatrixView();
	CreateMatrixWindow();
}

void CPlot3D::SetViewPoint(double r, double fi, double q)//����������� �����
{
	_viewport(0) = r;
	_viewport(1) = fi;
	_viewport(2) = q;
	_matrixView.clear();
	CreateMatrixView();
	_matrixWindow.clear();
	CreateMatrixWindow();
}

CMatrix CPlot3D::GetViewPoint()//������� �����
{
	CMatrix P = _viewport;
	return P;
}

void CPlot3D::SetWinRect(CRect Rect)//������������� ��� ��������� �������
{
	_rectWindow = Rect;
	_matrixWindow.clear();
	CreateMatrixWindow();
}

void CPlot3D::CreateMatrixFunction(double dx, double dy)//������� ������� ������ �� �������
{
	double xL = _rectSpace.left;//������������ ��� ��������������
	double xH = _rectSpace.right;
	double yL = _rectSpace.bottom;
	double yH = _rectSpace.top;
	CVecMatrix VecMatrix;
	CMatrix V(4);
	V(3) = 1;
	for (double x = xL; x <= xH; x += dx)
	{
		VecMatrix.clear();
		for (double y = yL; y <= yH; y += dy)
		{
			V(0) = x;
			V(1) = y;
			V(2) = _pFunc(x, y);
			VecMatrix.push_back(V);// ���������� �������� � ����� �������
		}
		_matrixFunction.push_back(VecMatrix); // ���������� ������� ����� � ����� ������� �������
	}
}

void CPlot3D::CreateMatrixView()//�������� ��� ��������� ����������
{
	CMatrix MV = CreateViewCoord(_viewport(0), _viewport(1), _viewport(2));
	CVecMatrix VecMatrix;//������ �������
	CMatrix VX(4), V(3);
	V(2) = 1;
	//������ ������� �����
	double xmin = DBL_MAX;
	double xmax = DBL_MIN;
	double ymin = DBL_MAX;
	double ymax = DBL_MIN;

	for (int i = 0; i < _matrixFunction.size(); i++)//�������� �������
	{
		VecMatrix.clear();
		for (int j = 0; j < _matrixFunction[i].size(); j++)
		{
			VX = _matrixFunction[i][j];
			VX = MV * VX;
			V(0) = VX(0);
			V(1) = VX(1);
			VecMatrix.push_back(V);// ���������� �������� � ����� �������

			double x = V(0);
			double y = V(1);
			//�������������� ������� ����� ������� �����
			if (x < xmin)
				xmin = x;
			if (x > xmax)
				xmax = x;
			if (y < ymin)
				ymin = y;
			if (y > ymax)
				ymax = y;
		}
		_matrixView.push_back(VecMatrix);// ���������� ������� ����� � ����� ������� �������
	}
	_rectView.SetRectD(xmin, ymax, xmax, ymin);
}

void CPlot3D::CreateMatrixWindow()//������� �������
{
	CMatrix MW = SpaceToWindow(_rectView, _rectWindow);//�� ���������������� � ������� �����
	CVecPoint VecPoint;
	CMatrix  V(3);
	for (int i = 0; i < _matrixView.size(); i++)
	{
		VecPoint.clear();//������� ������ �����
		for (int j = 0; j < _matrixView[i].size(); j++)
		{
			V = _matrixView[i][j];
			V = MW * V;
			CPoint P((int)V(0), (int)V(1));
			VecPoint.push_back(P);// ���������� �������� � ����� �������
		}
		_matrixWindow.push_back(VecPoint);// ���������� ������� ����� � ����� ������� �������
	}
}


int  CPlot3D::GetNamberRegion()
//���������� ����� �������  ���  ���������.
{
	CMatrix CartPoint = SphereToCart(_viewport);	// ��������� ���������� ����� ���������� (3x1)
	double xView = CartPoint(0);					// x- ���������� ����� ����������
	double yView = CartPoint(1);					// y- ���������� ����� ����������
	double zView = CartPoint(2);					// z- ���������� ����� ����������

	double xL = _rectSpace.left;
	double xH = _rectSpace.right;
	double yL = _rectSpace.bottom;
	double yH = _rectSpace.top;

	//-- ���������� ��� ��������� ����� ���������� ������������ ���������� ������� RectF:
	//-- �������� ��������� ��������� y1=y1(x) [����� (xL,yL)-(xH,yH)]� ������� �������� y1=y1(xView)  	
	double y1 = yL + (yH - yL) * (xView - xL) / (xH - xL);
	//-- �������� ��������� ��������� y2=y2(x) [����� (xL,yH)-(xH,yL)]� ������� �������� y2=y2(xView)  	
	double y2 = yH - (yH - yL) * (xView - xL) / (xH - xL);
	if ((yView <= y1) && (yView <= y2))return 1;
	if ((yView > y2) && (yView < y1))return 2;
	if ((yView >= y1) && (yView >= y2))return 3;
	if ((yView > y1) && (yView < y2))return 4;
}

void CPlot3D::Draw(CDC& dc)
{
	if (_matrixWindow.empty())
	{
		TCHAR* error = _T("������ ������ ��� ��������� � ���� ����! ");
		MessageBox(NULL, error, _T("������"), MB_ICONSTOP);
		return;
	}
	CPoint pt[4];
	int k, d;
	int kRegion = GetNamberRegion();	// kRegion=1,2,3,4
	int nRows = _matrixWindow.size();
	int nCols = _matrixWindow[0].size();  // ��� ������ ���������� �����!!!
	switch (kRegion)
	{//
	case 1:
	{
		for (int j = nCols - 1; j > 0; j--)
			for (int i = 0; i < nRows - 1; i++)
			{
				pt[0] = _matrixWindow[i][j];
				pt[1] = _matrixWindow[i][j - 1];
				pt[2] = _matrixWindow[i + 1][j - 1];
				pt[3] = _matrixWindow[i + 1][j];
				dc.Polygon(pt, 4);
			}
		break;
	}
	case 2:
	{
		for (int i = 0; i < nRows - 1; i++)
			for (int j = 0; j < nCols - 1; j++)
			{
				pt[0] = _matrixWindow[i][j];
				pt[1] = _matrixWindow[i][j + 1];
				pt[2] = _matrixWindow[i + 1][j + 1];
				pt[3] = _matrixWindow[i + 1][j];
				dc.Polygon(pt, 4);
			}
		break;
	}
	case 3:
	{
		for (int j = 0; j < nCols - 1; j++)
			for (int i = 0; i < nRows - 1; i++)
			{
				pt[0] = _matrixWindow[i][j];
				pt[1] = _matrixWindow[i][j + 1];
				pt[2] = _matrixWindow[i + 1][j + 1];
				pt[3] = _matrixWindow[i + 1][j];
				dc.Polygon(pt, 4);
			}
		break;
	}
	case 4:
	{
		for (int i = nRows - 1; i > 0; i--)
			for (int j = 0; j < nCols - 1; j++)
			{
				pt[0] = _matrixWindow[i][j];
				pt[1] = _matrixWindow[i][j + 1];
				pt[2] = _matrixWindow[i - 1][j + 1];
				pt[3] = _matrixWindow[i - 1][j];
				dc.Polygon(pt, 4);
			}
		break;
	}
	}//
}