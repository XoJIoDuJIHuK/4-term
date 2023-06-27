// ChildView.cpp : ���������� ������ CChildView
//

#include "stdafx.h"
#include "CGG 9.h"
#include "ChildView.h"
#include "CMATRIX.H"
#include "LibChart2D.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

int i = -1;
int buf = 0;

// CChildView

CChildView::CChildView()
{
}

CChildView::~CChildView()
{
}

BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_COMMAND(ID_PLOT_LAGRANGE, &CChildView::OnPlotLagrange)
	ON_COMMAND(ID_PLOT_BEZIER, &CChildView::OnPlotBezier)
	ON_COMMAND(ID_PLOT_BEZIER2, &CChildView::OnPlotBezier2)
	ON_COMMAND(ID_PLOT_BEZIER3, &CChildView::OnPlotBezier3)
	ON_COMMAND(ID_PLOT_BEZIER4, &CChildView::OnPlotBezier4)

END_MESSAGE_MAP()

// ����������� ��������� CChildView

BOOL CChildView::PreCreateWindow(CREATESTRUCT& cs) 
{
	if (!CWnd::PreCreateWindow(cs))
		return FALSE;

	cs.dwExStyle |= WS_EX_CLIENTEDGE;
	cs.style &= ~WS_BORDER;
	cs.lpszClass = AfxRegisterWndClass(CS_HREDRAW|CS_VREDRAW|CS_DBLCLKS, 
		::LoadCursor(NULL, IDC_ARROW), reinterpret_cast<HBRUSH>(COLOR_WINDOW+1), NULL);

	return TRUE;
}

void CChildView::OnPaint() 
{
	CPaintDC dc(this); // �������� ���������� ��� ���������

	if (Index == 1)
	{
		Graph.Draw(dc, 1, 1);
	}

	if (Index == 2)
	{
		Graph.DrawBezier(dc, 20);//����� ������ ��������
	}
}

void CChildView::OnPlotLagrange() // �������� ���������� ��� �������������� � ������� ������
{
	RW.SetRect(100, 20, 700, 400);
	Lagrange();
	Index = 1;
	this->Invalidate();
}

void CChildView::OnPlotBezier()// �������� ���������� ��� �������������� � ������� ������
{
	RW.SetRect(100, 20, 700, 400);
	Bezier();
	Index = 2;
	this->Invalidate();
}

void CChildView::OnPlotBezier2()// �������� ���������� ��� �������������� � ������� ������
{
	RW.SetRect(100, 20, 700, 400);
	Bezier2();
	Index = 2;
	this->Invalidate();
}
void CChildView::OnPlotBezier3()// �������� ���������� ��� �������������� � ������� ������
{
	RW.SetRect(100, 20, 700, 400);
	Bezier3();
	Index = 2;
	this->Invalidate();
}
void CChildView::OnPlotBezier4()// �������� ���������� ��� �������������� � ������� ������
{
	RW.SetRect(100, 20, 700, 400);
	Bezier4();
	Index = 2;
	this->Invalidate();
}
double CChildView::Lagr(CMatrix& X, CMatrix& Y, double x, int size) //������ ��������
{
	double lagrange_pol = 0;
	double basics_pol;

	for (int i = 0; i < size; i++)
	{
		basics_pol = 1;
		for (int j = 0; j < size; j++)
		{
			if (j == i) continue;
			basics_pol *= (x - X(j)) / (X(i) - X(j));
		}
		lagrange_pol += basics_pol*Y(i);
	}
	return lagrange_pol;
}

void CChildView::Lagrange() // �������� ���������� ��� ���������
{
	double dx = pi / 4;//��� ��������� �����
	
	//���������� ����
	double xL = 0;
	double xH = pi;
	
	int N = (xH - xL) / dx;//����������� �����
	//��������� �����
	X.RedimMatrix(N + 1);
	Y.RedimMatrix(N + 1);
	//������ �����
	for (int i = 0; i <= N; i++)
	{
		X(i) = xL + i*dx;
		Y(i) = pow(2 + cos(X(i)), sin(2 * X(i)));
	}

	dx = 0.2;//��� ���������
	int NL = (xH - xL) / dx;//���������� ����� �� �������
	CMatrix XL(NL + 1);
	CMatrix YL(NL + 1);

	for (int i = 0; i <= NL; i++)
	{
		XL(i) = xL + i*dx;
		YL(i) = Lagr(X, Y, XL(i), N + 1);
	}
	PenLine.Set(PS_SOLID, 1, RGB(255, 0, 0));
	PenAxis.Set(PS_SOLID, 2, RGB(255, 0, 0));

	Graph.SetParams(XL, YL, RW);
	Graph.SetPenLine(PenLine);
	Graph.SetPenAxis(PenAxis);
}

void CChildView::Bezier() //���������� ��� �����
{

		CMatrix X(3);//� ����� �
		CMatrix Y(3);
		X(0) = 0;
		Y(0) = 0;
		X(1) = -15; //	X(1) = 5; //��� ����������� ������
		Y(1) = 5;
		X(2) = 10; //	X(2) = 0; //��� ������ �����
		Y(2) = 0;

	
	PenLine.Set(PS_SOLID, 1, RGB(255, 0, 0));//���� �������

	//������ ���������
	Graph.SetParams(X, Y, RW);
	Graph.SetPenLine(PenLine);
	Graph.SetPenAxis(PenAxis);
}

void CChildView::Bezier2() //���������� ��� �����
{

	//������������ � �1=�2
		CMatrix X(3);//� ����� �
		CMatrix Y(3);
		X(0) = 0;
		Y(0) = 0;
		X(1) = 5; //��� ����������� ������
		Y(1) = 5;
		X(2) = 10; //	X(2) = 0; //��� ������ �����
		Y(2) = 0;

	PenLine.Set(PS_SOLID, 1, RGB(255, 0, 0));//���� �������

											 //������ ���������
	Graph.SetParams(X, Y, RW);
	Graph.SetPenLine(PenLine);
	Graph.SetPenAxis(PenAxis);
}

void CChildView::Bezier3() //���������� ��� �����
{
	//�� ������� ���������

		CMatrix X(4);//� ����� �
		CMatrix Y(4);
		X(0) = 0;
		Y(0) = 0;
		X(1) = 5;
		Y(1) = 10;
		X(2) = 10;
		Y(2) = -10;
		X(3) = 15;
		Y(3) = 0;

	PenLine.Set(PS_SOLID, 1, RGB(255, 0, 0));//���� �������

											 //������ ���������
	Graph.SetParams(X, Y, RW);
	Graph.SetPenLine(PenLine);
	Graph.SetPenAxis(PenAxis);
}

void CChildView::Bezier4() //���������� ��� �����
{
	//���������

		CMatrix X(4);//� ����� �
		CMatrix Y(4);
		X(0) = 0;
		Y(0) = 0;
		X(1) = 20;
		Y(1) = 10;
		X(2) = -5;
		Y(2) = 10;
		X(3) = 15;
		Y(3) = 0;


	PenLine.Set(PS_SOLID, 1, RGB(255, 0, 0));//���� �������

											 //������ ���������
	Graph.SetParams(X, Y, RW);
	Graph.SetPenLine(PenLine);
	Graph.SetPenAxis(PenAxis);
}

