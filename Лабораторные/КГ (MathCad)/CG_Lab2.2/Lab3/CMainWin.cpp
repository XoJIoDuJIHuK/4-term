#include "stdafx.h"
#include "CMainWin.h"
#include <string.h>
#include <string>
#include "CMatrix.h"
#include "Functions.h"

#define PI acos(-1)

class CRectD
{
public:
	double left, top, right, bottom;
	CRectD() { left = top = right = bottom = 0; }
};

//возвращает функцию пересчета координат из мировых в оконные
CMatrix SpaceToWindow(CRectD& rs, CRect& rw)
{
	CMatrix T(3, 3);
	double kx = (rw.right - rw.left) / (rs.right - rs.left),
		ky = (rw.bottom - rw.top) / (rs.top - rs.bottom);
	T(0, 0) = kx;
	T(0, 2) = rw.left - kx * rs.left;
	T(1, 1) = -ky;
	T(1, 2) = rw.bottom + ky * rs.bottom;
	T(2, 2) = 1;
	return T;
}

//структура для создания пера
struct CMyPen
{
	int PenStyle;
	double PenWidth;
	COLORREF PenColor;
	CMyPen() 
	{
		PenStyle = PS_SOLID;
		PenWidth = 1;
		PenColor = RGB(0, 0, 0);
	}
	void Set(int PS, int PW, COLORREF PC)
	{
		PenStyle = PS;
		PenWidth = PW;
		PenColor = PC;
	}
};

//класс для отображения зависимости y=f(x)
class CPlot2D
{
private:
	CMatrix X, Y, K;
	CRectD Rs;
	CRect Rw;
	CMyPen PenLine;
	CMyPen PenAxis;
public:
	CPlot2D() 
	{ K.RedimMatrix(3, 3); }
	//установка парметров графика
	void SetParams(CMatrix& XX, CMatrix& YY)//оставляет первый столбец у X и Y
	{
		X.RedimMatrix(XX.rows(), 1);
		X = XX;
		Y.RedimMatrix(YY.rows(), 1);
		Y = YY;
		for (int i = 0; i < X.rows(); i++)
		{
			if (X(i) < Rs.left)
				Rs.left = X(i);
			if (X(i) > Rs.right)
				Rs.right = X(i);
			if (Y(i) < Rs.bottom)
				Rs.bottom = Y(i);
			if (Y(i) > Rs.top)
				Rs.top = Y(i);
		}
	}
	// установка области в окне для отображения графика
	void SetWindowRect(CRect& RWX) { Rw = RWX; }
	//пересчет точки из МСК в окнную СК
	void GetWindowCoords(double xs, double ys, int &xw, int &yw)
	{
		CMatrix V(3), W(3);
		V(0) = xs;
		V(1) = ys;
		V(2) = 1;
		W = K * V;
		xw = (int)W(0);
		yw = (int)W(1);
	}
	//перо для рисования графика
	void SetPenLine(CMyPen& PLine) { PenLine = PLine; }
	// перо для осей координат
	void SetPenAxis(CMyPen& PAxis) { PenAxis = PAxis; }
	//рисование с самостоятельным пересчетом координат
	void Draw(CDC& dc, int Int1, int Int2)
	{
		SetMapMode(dc, MM_TEXT);
		CPen pen;
		int xw, yw;
		K = SpaceToWindow(Rs, Rw);
		pen.CreatePen(PenAxis.PenStyle, PenAxis.PenWidth, PenAxis.PenColor);
		dc.SelectObject(pen);
		
		dc.MoveTo(Rw.left, Rw.top);	
		dc.LineTo(Rw.right, Rw.top);
		dc.MoveTo(Rw.left,Rw.top);
		dc.LineTo(Rw.left, Rw.bottom);

		pen.Detach();
		pen.CreatePen(PenLine.PenStyle, PenLine.PenWidth, PenLine.PenColor);
		dc.SelectObject(pen);
		if (Int1 < X.rows() && Int2 <= X.rows())
			for (int i = Int1 + 1; i < X.rows(); i+= Int2)
			{
				GetWindowCoords(X(i - 1), Y(i - 1), xw, yw);
				dc.MoveTo(xw, yw);
				GetWindowCoords(X(i), Y(i), xw, yw);
				dc.LineTo(xw, yw);
			}
	}
	//возвращает область графика в в мировой ск
	void GetRS(CRectD& RS) { RS = Rs; }
	void GetRW(CRect& RW) { RW = Rw; }
};


void CMainWin::PaintF1(CDC& dc)
{
	CPlot2D paint2D;
	CMyPen penLine, penAxis;
	penAxis.Set(PS_SOLID, 2, RGB(0, 0, 255));
	penLine.Set(PS_SOLID, 1, RGB(255, 0, 0));
	paint2D.SetPenAxis(penAxis);
	paint2D.SetPenLine(penLine);
	paint2D.SetWindowRect(CRect(500, 150, 900, 500));
	int count = (3 * PI - (-3 * PI)) / (PI / 36);
	CMatrix X(count), Y(count);
	int j = 0;
	for (double i = -3 * PI; (i < 3 * PI && j < count); i += PI / 36, j++)
	{
		X(j) = i;
		Y(j) = MyF1(i);
	}
	paint2D.SetParams(X, Y);
	paint2D.Draw(dc, 0, 1);
}


void CMainWin::PaintF2(CDC& dc)
{
	CPlot2D paint2D;
	CMyPen penLine, penAxis;
	penAxis.Set(PS_SOLID, 2, RGB(0, 0, 0));
	penLine.Set(PS_DASHDOT, 3, RGB(255, 0, 0));
	paint2D.SetPenAxis(penAxis);
	paint2D.SetPenLine(penLine);
	paint2D.SetWindowRect(CRect(500, 150, 900, 500));
	int count = 6 * 36;
	CMatrix X(count), Y(count);
	int j = 0;
	for (double i = 0; (i < 6 && j < count); i += (double)1 / 36, j++)
	{
		X(j) = i;
		Y(j) = MyF2(i);
	}
	paint2D.SetParams(X, Y);
	paint2D.Draw(dc, 0, 1);
}


void CMainWin::PaintF12(CDC& dc)
{
	SetMapMode(*GetDC(), MM_TEXT);
	CPlot2D paint2D1;
	CMyPen penLine1, penAxis1;
	penAxis1.Set(PS_SOLID, 2, RGB(0, 0, 255));
	penLine1.Set(PS_SOLID, 1, RGB(255, 0, 0));
	paint2D1.SetPenAxis(penAxis1);
	paint2D1.SetPenLine(penLine1);
	paint2D1.SetWindowRect(CRect(100, 50, 300, 200));
	int count1 = (3 * PI - (-3 * PI)) / (PI / 36);
	CMatrix X1(count1), Y1(count1);
	int j1 = 0;
	for (double i = -3 * PI; (i < 3 * PI && j1 < count1); i += PI / 36, j1++)
	{
		X1(j1) = i;
		Y1(j1) = MyF1(i);
	}
	paint2D1.SetParams(X1, Y1);
	paint2D1.Draw(dc, 0, 1);
	CPlot2D paint2D2;
	CMyPen penLine2, penAxis2;
	penAxis2.Set(PS_SOLID, 2, RGB(0, 0, 255));
	penLine2.Set(PS_SOLID, 1, RGB(0, 255, 0));
	paint2D2.SetPenAxis(penAxis2);
	paint2D2.SetPenLine(penLine2);
	paint2D2.SetWindowRect(CRect(600, 50, 800, 200));
	int count2 = 10 / 0.25;
	CMatrix X2(count2), Y2(count2);
	int j2 = 0;
	for (double i = -5; (i < 5 && j2 < count2); i += 0.25, j2++)
	{
		X2(j2) = i;
		Y2(j2) = MyF2(i);
	}
	paint2D2.SetParams(X2, Y2);
	paint2D2.Draw(dc, 0, 1);
}
CMainWin::CMainWin()
{
	this->Create(0, (LPCTSTR)L"Hello World", WS_OVERLAPPED, rectDefault, 0, (LPCTSTR)IDR_MAINFRAME);
}


void CMainWin::OnPaint()
{
	CPaintDC dc(this);
	switch (task)
	{
	case Test::F1:
		PaintF1(dc);
		break;
	case Test::F2:
		PaintF2(dc);
		break;
	case Test::F12:
		PaintF12(dc);
		break;
	}
	
}


void CMainWin::F1()
{
	task = Test::F1;
	InvalidateRect(0);
}

void CMainWin::F2()
{
	task = Test::F2;
	InvalidateRect(0);
}

void CMainWin::F12()
{
	task = Test::F12;
	InvalidateRect(0);
}

void CMainWin::Clear()
{
	task = (Test)-1;
	InvalidateRect(0);
}

void CMainWin::MyClose()
{
	this->OnClose();
}

BEGIN_MESSAGE_MAP(CMainWin, CFrameWnd)
	ON_COMMAND(ID_TESTSF_F1, &CMainWin::F1)
	ON_COMMAND(ID_TESTSF_F2, &CMainWin::F2)
	ON_COMMAND(ID_TESTSF_F12, &CMainWin::F12)
	ON_COMMAND(ID_CLEAR, &CMainWin::Clear)
	ON_COMMAND(ID_EXIT, &CMainWin::MyClose)
	//ON_COMMAND(ID_TESTS_IMAGE, &CMainWin::Open)
	ON_WM_LBUTTONDOWN()
	ON_WM_LBUTTONUP()
	ON_WM_PAINT()
END_MESSAGE_MAP()
