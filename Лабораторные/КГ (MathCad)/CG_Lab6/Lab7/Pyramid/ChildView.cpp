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
	Index=0;//��������� ������
	PView.RedimMatrix(3);//������� ��� ����� ������ ��� ���������
	PLight.RedimMatrix(3);//������� ��� ����� ��������� ��� ���������
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

void CChildView::OnPaint() //��� ���������
{
	CPaintDC dc(this); // ���������� �������� ���������
	if(Index==4)//������ ��� �������� � �������� �����
		PIR.ColorDraw(//��������� ��� ������� �����
			dc,//�������� ���������
			PView, //����� ������ ��� ����������
			PLight,//����� ���������
			WinRect, //��������� ���� ���������
			RGB(237, 76, 255));// �������� ���� �������� ��� ����� �����
}


void CChildView::OnPyramidPyramid1()	// ��� �������� ��������� ������
{
	CFrameWnd* pWnd=GetParentFrame(); //�������� ������������ �������� ����

	//����� ������ ��� ����������
	PView(0)= 10;	PView(1)=20;	PView(2)=60;

	Invalidate();
}

void CChildView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)//��� ������� ������� ���������
{
	if(Index==4)//������ ��� �������� � �������� �����
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
	CWnd::OnKeyDown(nChar, nRepCnt, nFlags);//��� �������
}

void CChildView::OnSize(UINT nType, int cx, int cy)
{
	CWnd::OnSize(nType, cx, cy);//��� ������������� ��������� ����
	WinRect.SetRect(50,50,cx-50,cy-50);//��������� ���� ���������
}

void CChildView::OnPyramidPyramid2()    // � ��������� ��������� ������
{
	CFrameWnd* pWnd=GetParentFrame(); //�������� ������������ �������� ����

	//����� ������ ��� ����������
	PView(0)= 10;	PView(1)=20;	PView(2)=60;

	Invalidate();
}

void CChildView::OnPyramidPyramid3()	// Draw2()- ��� ������ MM_ANISOTROPIC
{
	CFrameWnd* pWnd=GetParentFrame(); //�������� ������������ �������� ����

	//����� ������ ��� ����������
	PView(0)= 10;	PView(1)=20;	PView(2)=60;

	Invalidate();
}

void CChildView::OnPyramidPyramid4() // � ������ ���������
{
	CFrameWnd* pWnd=GetParentFrame(); //�������� ������������ �������� ����
	
	//����� ������ ��� ����������
	PView(0) = 10;	PView(1)=20;	PView(2)=60;

	PLight(0) = 10; PLight(1) = 20; PLight(2) = 200;

	Index=4; //��������� ������� �������� � ������ �� ����
	Invalidate();
}
