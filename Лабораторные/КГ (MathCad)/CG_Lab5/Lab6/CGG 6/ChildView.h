#pragma once
#include "CMatrix.h"
#include "LibGraph.h"
#include "LibSurface.h"

// ���� CChildView

class CChildView : public CWnd
{
// ��������
public:
	CChildView();
	double R, Phi, Q;
	CRect WRect;
	int Index;
	CPlot3D Graph1, Graph2, Graph3;

// ��������
public:

// ��������
public:

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
	afx_msg void OnFunctionsF1();
	afx_msg void OnFunctionsF2();
	afx_msg void OnFunctionsF3();
	afx_msg void OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags);
};