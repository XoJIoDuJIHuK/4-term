// ChildView.cpp : implementation of the CChildView class
//

#include "stdafx.h"
#include "Pyramid.h"
#include "ChildView.h"
#include "MainFrm.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CChildView
  

CChildView::CChildView()
{
	Index=0;//начальный индекс
	PView.RedimMatrix(3);//матрица для точки камеры для наблюдени
	PLight.RedimMatrix(3);//матрица для точки освещения для наблюдени
}

CChildView::~CChildView()
{
}


BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_COMMAND(ID_PYRAMID_PYRAMID1, &CChildView::OnPyramidPyramid1)
	ON_WM_KEYDOWN()
	ON_WM_SIZE()
	ON_COMMAND(ID_PYRAMID_PYRAMID2, &CChildView::OnPyramidPyramid2)
	ON_COMMAND(ID_PYRAMID_PYRAMID3, &CChildView::OnPyramidPyramid3)
	ON_COMMAND(ID_PYRAMID_PYRAMID4, &CChildView::OnPyramidPyramid4)
END_MESSAGE_MAP()

// CChildView message handlers

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

void CChildView::OnPaint() //при отрисовке
{
	CPaintDC dc(this); // Подключаем контекст рисования
	if(Index==4)//только для варианта с падением света
		PIR.ColorDraw(//параметры для падения цвета
			dc,//контекст рисования
			PView, //точка камеры для наблюдения
			PLight,//точка освещения
			WinRect, //параметры окна рисования
			RGB(237, 76, 255));// основной цвет пирамиды без учета теней
}


void CChildView::OnPyramidPyramid1()	// Без удаления невидимых граней
{
	CFrameWnd* pWnd=GetParentFrame(); //получаем родительское рамочное окно

	//точка камеры для наблюдения
	PView(0)= 10;	PView(1)=20;	PView(2)=60;

	Invalidate();
}

void CChildView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)//при нажатии стрелок вращается
{
	if(Index==4)//только для варианта с падением света
  {
	switch(nChar)
	{
	  case VK_UP:
		{
		  double d=PLight(2)-5;
		  if(d>=0)PLight(2)=d;
		  break;
		}
	  case VK_DOWN:
		{
		  double d=PLight(2)+5;
		  if(d<=180)PLight(2)=d;
		  break;
		}
	  case VK_LEFT:
		{
		  double d=PLight(1)-10;
		  if(d>=-180)PLight(1)=d;
		  else PLight(1)=d+360;
		  break;
		}
	  case VK_RIGHT:
		{
		  double d=PLight(1)+10;
		  if(d<=180)PLight(1)=d;
		  else PLight(1)=d-360;
		  break;
		}

	  case 87:
	  {
		  double d = PView(2) - 5;
		  if (d >= 0)PView(2) = d;
		  break;
	  }
	  case 83:
	  {
		  double d = PView(2) + 5;
		  if (d <= 180)PView(2) = d;
		  break;
	  }
	  case 65:
	  {
		  double d = PView(1) - 10;
		  if (d >= -180)PView(1) = d;
		  else PView(1) = d + 360;
		  break;
	  }
	  case 68:
	  {
		  double d = PView(1) + 10;
		  if (d <= 180)PView(1) = d;
		  else PView(1) = d - 360;
		  break;
	  }
	}
	Invalidate();
  }
	CWnd::OnKeyDown(nChar, nRepCnt, nFlags);//для зажатия
}

void CChildView::OnSize(UINT nType, int cx, int cy)
{
	CWnd::OnSize(nType, cx, cy);//для динамического изменения окна
	WinRect.SetRect(50,50,cx-50,cy-50);//параметры окна рисования
}

void CChildView::OnPyramidPyramid2()    // С удалением невидимых граней
{
	CFrameWnd* pWnd=GetParentFrame(); //получаем родительское рамочное окно

	//точка камеры для наблюдения
	PView(0)= 10;	PView(1)=20;	PView(2)=60;

	Invalidate();
}

void CChildView::OnPyramidPyramid3()	// Draw2()- для режима MM_ANISOTROPIC
{
	CFrameWnd* pWnd=GetParentFrame(); //получаем родительское рамочное окно

	//точка камеры для наблюдения
	PView(0)= 10;	PView(1)=20;	PView(2)=60;

	Invalidate();
}

void CChildView::OnPyramidPyramid4() // С учетом освещения
{
	CFrameWnd* pWnd=GetParentFrame(); //получаем родительское рамочное окно
	
	//точка камеры для наблюдения
	PView(0) = 10;	PView(1)=20;	PView(2)=60;

	PLight(0) = 10; PLight(1) = 20; PLight(2) = 200;

	Index=4; //позволяет вращать пирамиду и задает ей цвет
	Invalidate();
}
