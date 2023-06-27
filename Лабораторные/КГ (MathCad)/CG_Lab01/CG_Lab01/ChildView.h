
// ChildView.h: интерфейс класса CChildView
//


#pragma once
#include "CMatrix.h"


// Окно CChildView

class CChildView : public CWnd
{
// Создание
public:
	CChildView();

// Атрибуты
public:
	CMatrix A = CMatrix(3, 3);
	CMatrix B = CMatrix(3, 3);
	CMatrix V1 = CMatrix(3);
	CMatrix V2 = CMatrix(3);
// Операции
public:

// Переопределение
	protected:
	virtual BOOL PreCreateWindow(CREATESTRUCT& cs);

// Реализация
public:
	virtual ~CChildView();

	// Созданные функции схемы сообщений
protected:
	afx_msg void OnPaint();
	DECLARE_MESSAGE_MAP()
public:
	afx_msg void OnMatrix();
	afx_msg void OnFunctions();
};

