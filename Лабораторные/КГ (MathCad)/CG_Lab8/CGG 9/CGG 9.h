
// CGG 9.h : ������� ���� ��������� ��� ���������� CGG 9
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"       // �������� �������


// CCGG9App:
// � ���������� ������� ������ ��. CGG 9.cpp
//

class CCGG9App : public CWinApp
{
public:
	CCGG9App();


// ���������������
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// ����������

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG9App theApp;
