
// ChildView.cpp: реализация класса CChildView
//

#include "pch.h"
#include "framework.h"
#include "CG_Lab01.h"
#include "ChildView.h"
//#include "CMatrix.h"
#include "LibGraph.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CChildView

CChildView::CChildView()
{

}

CChildView::~CChildView()
{
}


BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_COMMAND(ID_MATRIX, &CChildView::OnMatrix)
	ON_COMMAND(ID_FUNCTIONS, &CChildView::OnFunctions)
END_MESSAGE_MAP()



// Обработчики сообщений CChildView

BOOL CChildView::PreCreateWindow(CREATESTRUCT& cs) 
{
	if (!CWnd::PreCreateWindow(cs))
		return FALSE;

	cs.dwExStyle |= WS_EX_CLIENTEDGE;
	cs.style &= ~WS_BORDER;
	cs.lpszClass = AfxRegisterWndClass(CS_HREDRAW|CS_VREDRAW|CS_DBLCLKS, 
		::LoadCursor(nullptr, IDC_ARROW), reinterpret_cast<HBRUSH>(COLOR_WINDOW+1), nullptr);

	return TRUE;
}

void CChildView::OnPaint() 
{
	CPaintDC dc(this); // контекст устройства для рисования
	
	// TODO: Добавьте код обработки сообщений
	
	// Не вызывайте CWnd::OnPaint() для сообщений рисования
}



void CChildView::OnMatrix()
{
	// TODO: добавьте свой код обработчика команд
	InvalidateRect(0);
	UpdateWindow();
	CDC* dc = GetDC();
	int y_out = 20;
	int x_out = 700;
	dc->TextOut(x_out, y_out + 32, L"A = ");
	PrintMatrix(*dc, x_out + 40, y_out, A);
	dc->TextOut(x_out, (y_out += 120) + 32, L"B = ");
	PrintMatrix(*dc, x_out + 40, y_out, B);
	dc->TextOut(x_out, (y_out += 120) + 32, L"V1 = ");
	PrintMatrix(*dc, x_out + 40, y_out, V1);
	dc->TextOut(x_out, (y_out += 120) + 32, L"V2 = ");
	PrintMatrix(*dc, x_out + 40, y_out, V2);
	/* C1=A+B */
	y_out = 20;
	x_out = 10;
	dc->TextOut(x_out, y_out - 15, L"C1=A+B");
	PrintMatrix(*dc, x_out, y_out, A);
	dc->TextOut(x_out += 185, y_out + 32, L"+");
	PrintMatrix(*dc, x_out += 35, y_out, B);
	dc->TextOut(x_out += 185, y_out + 32, L"=");
	CMatrix C1 = A + B;
	PrintMatrix(*dc, x_out += 35, y_out, C1);
	/* C2=A*B */
	x_out = 10;
	y_out += 120;
	dc->TextOut(x_out, y_out - 15, L"C2=A*B");
	PrintMatrix(*dc, x_out, y_out, A);
	dc->TextOut(x_out += 185, y_out + 32, L"x");
	PrintMatrix(*dc, x_out += 35, y_out, B);
	dc->TextOut(x_out += 185, y_out + 32, L"=");
	CMatrix C2 = A * B;
	PrintMatrix(*dc, x_out += 35, y_out, C2);
	/* D=A*V1 */
	x_out = 10;
	y_out += 120;
	dc->TextOut(x_out, y_out - 15, L"D=A*V1");
	PrintMatrix(*dc, x_out, y_out, A);
	dc->TextOut(x_out += 185, y_out + 32, L"x");
	PrintMatrix(*dc, x_out += 35, y_out, V1);
	dc->TextOut(x_out += 70, y_out + 32, L"=");
	CMatrix D = (A) * (V1);
	PrintMatrix(*dc, x_out += 35, y_out, D);
	CMatrix q, p;
	/* q=v1t*v2 */
	x_out = 10;
	y_out += 120;
	dc->TextOut(x_out, y_out - 15, L"q=V1(T) *V2");
	PrintMatrix(*dc, x_out, y_out + 32, (V1).Transp());
	dc->TextOut(x_out += 185, y_out + 32, L"x");
	PrintMatrix(*dc, x_out += 35, y_out, V2);
	dc->TextOut(x_out += 70, y_out + 32, L"=");
	q = (V1).Transp() * (V2);
	PrintMatrix(*dc, x_out += 35, y_out + 32, q);
	/* p=v1t*A*v2 */
	x_out = 10;
	y_out += 120;
	dc->TextOut(x_out, y_out - 15, L"p=V1(T) *A*V2");
	PrintMatrix(*dc, x_out, y_out + 32, (V1).Transp());
	dc->TextOut(x_out += 185, y_out + 32, L"x");
	PrintMatrix(*dc, x_out += 35, y_out, A);
	dc->TextOut(x_out += 185, y_out + 32, L"x");
	PrintMatrix(*dc, x_out += 35, y_out, V2);
	dc->TextOut(x_out += 70, y_out + 32, L"=");
	p = (V1).Transp() * (A) * (V2);
	PrintMatrix(*dc, x_out += 35, y_out + 32, p);
}


void CChildView::OnFunctions()
{
	// TODO: добавьте свой код обработчика команд
	char t[10];
	memset(t, 0, 10);
	InvalidateRect(0);
	UpdateWindow();
	CClientDC dc(this);
	CChildView M;
	int y_out = 20;
	int x_out = 700;
	dc.TextOut(x_out, (y_out += 120) + 32, L"V1 = ");
	PrintMatrix(dc, x_out + 40, y_out, V1);
	dc.TextOut(x_out, (y_out += 120) + 32, L"V2 = ");
	PrintMatrix(dc, x_out + 40, y_out, V2);
	y_out = 20;
	x_out = 10;
	dc.TextOut(x_out, y_out - 15, L"VectorMult");
	CMatrix Mult = VectorMult(V1, V2);
	PrintMatrix(dc, x_out, y_out, Mult);
	dc.TextOut(x_out, (y_out += 120) - 15, L"ScalarMult");

	CMatrix number = CMatrix(1, 1);
	number(0) = ScalarMult(V1, V2);
	PrintMatrix(dc, x_out, y_out, number);
	//sprintf_s(t, "%3.2f", ScalarMult(V1, V2));
	////dc.TextOut(x_out, y_out, (wchar_t*)t);
	dc.TextOut(x_out, (y_out += 65) - 15, L"ModVec V1");
	dc.TextOut(x_out + 100, (y_out)-15, L"ModVec V2");
	number(0) = ModVec(V1);
	PrintMatrix(dc, x_out, y_out, number);
	number(0) = ModVec(V2);
	PrintMatrix(dc, x_out + 100, y_out, number);

	//sprintf_s(t, "%f", ModVec(V1));
	////dc.TextOut(x_out, y_out, (wchar_t*)t);
	//sprintf_s(t, "%f", ModVec(V2));
	////dc.TextOut(x_out + 100, y_out, (wchar_t*)t);
	dc.TextOut(x_out, (y_out += 65) - 15, L"CosV1V2");
	number(0) = CosV1V2(V1, V2);
	PrintMatrix(dc, x_out, y_out, number);
	//sprintf_s(t, "%f", CosV1V2(V1, V2));
	////dc.TextOut(x_out, y_out, (wchar_t*)t);
	dc.TextOut(x_out, (y_out += 65) - 15, L"Sphere");
	dc.TextOut(x_out + 185, y_out - 15, L"Cart");
	dc.TextOut(x_out + 100, y_out - 15, L"->");
	CMatrix s(3, true);
	PrintMatrix(dc, x_out, y_out, s);
	PrintMatrix(dc, x_out + 185, y_out, SphereToCart(s));
	dc.TextOut(x_out + 100, y_out + 32, L"->");
}
