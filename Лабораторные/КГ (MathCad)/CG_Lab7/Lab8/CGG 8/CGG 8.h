
// CGG 8.h : ������� ���� ��������� ��� ���������� CGG 8
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"       // �������� �������


// CCGG8App:
// � ���������� ������� ������ ��. CGG 8.cpp
//

class CCGG8App : public CWinApp
{
public:
	CCGG8App();


// ���������������
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// ����������

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG8App theApp;
