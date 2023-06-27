
// CG_Lab01.h: основной файл заголовка для приложения CG_Lab01
//
#pragma once

#ifndef __AFXWIN_H__
	#error "включить pch.h до включения этого файла в PCH"
#endif

#include "resource.h"       // основные символы


// CCGLab01App:
// Сведения о реализации этого класса: CG_Lab01.cpp
//

class CCGLab01App : public CWinApp
{
public:
	CCGLab01App() noexcept;


// Переопределение
public:
	virtual BOOL InitInstance();
	virtual int ExitInstance();

// Реализация

public:
	afx_msg void OnAppAbout();
	DECLARE_MESSAGE_MAP()
};

extern CCGLab01App theApp;
