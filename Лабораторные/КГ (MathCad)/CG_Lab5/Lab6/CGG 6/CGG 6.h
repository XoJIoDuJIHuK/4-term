
// CGG 6.h : ������� ���� ��������� ��� ���������� CGG 6
//
#pragma once

#ifndef __AFXWIN_H__
	#error "�������� stdafx.h �� ��������� ����� ����� � PCH"
#endif

#include "resource.h"       // �������� �������


// CCGG6App:
// � ���������� ������� ������ ��. CGG 6.cpp
//

class CCGG6App : public CWinApp
{
public:
	CCGG6App();


// ���������������
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// ����������

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGG6App theApp;
