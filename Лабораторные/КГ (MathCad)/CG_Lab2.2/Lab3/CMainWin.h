#pragma once
#include "stdafx.h"
#include "resource.h"
enum Test
{
	F1 = 0,
	F2 = 1,
	F12 = 2
};
class CMainWin : public CFrameWnd
{
private:
	Test task = (Test)-1;
public:
	CMainWin();
	afx_msg void OnPaint();
	afx_msg void F1();
	afx_msg void F2();
	afx_msg void F12();
	afx_msg void Clear();
	afx_msg void MyClose();
	void PaintF1(CDC& dc);
	void PaintF2(CDC& dc);
	void PaintF12(CDC& dc);
	DECLARE_MESSAGE_MAP()
};
