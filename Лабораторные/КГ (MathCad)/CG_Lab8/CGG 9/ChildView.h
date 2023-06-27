// ChildView.h : ��������� ������ CChildView
//

#pragma once

#include "CMATRIX.H"
#include "LibChart2D.h"

struct point
{
	double x;
	double y;
};

// ���� CChildView

class CChildView : public CWnd
{
// ��������
public:
	CChildView();

// ��������
public:
	int Index;
	int N_Bezier;
	CMatrix X, Y;
	CRect RW;
	CRectD RS;
	CPlot2D Graph;
	CMyPen PenLine, PenAxis;
	const double PI = 3.1415926535897932384626433832795;

// ��������
public:
	void Lagrange();
	void Bezier();
	void Bezier2();
	void Bezier3();
	void Bezier4();



	double Lagr(CMatrix& X, CMatrix& Y, double x, int size);

// ���������������
	protected:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);

// ����������
public:
	virtual ~CChildView();

	// ��������� ������� ����� ���������
protected:
	afx_msg void OnPaint();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnPlotLagrange();
	afx_msg void OnPlotBezier();
	afx_msg void OnPlotBezier2();
	afx_msg void OnPlotBezier3();
	afx_msg void OnPlotBezier4();

};