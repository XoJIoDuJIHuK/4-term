// ChildView.cpp : ���������� ������ CChildView
//

#include "stdafx.h"
#include "CGG 8.h"
#include "ChildView.h"
#include "CMatrix.h"
#include "LibChart2D.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

#define DIFFUSE_LIGHT 1
#define GLOSSY_LIGHT 2

#ifdef _DEBUG
#define new DEBUG_NEW
#endif

int DRAW_MODE = 0;

//���� ������� �����
int Light_Global_Theta = 45;
int Light_Global_Phi = 45;

CMatrix transform(4, 4);
CMatrix transform2(4, 4);
CMatrix buffer1(4, 1);
CMatrix buffer2(4, 1);

// CChildView

CChildView::CChildView()
{
	int radius = 50;
	sphere = new Sphere(radius);
	sphere->CalculateMatrix(CRect(0, 0, 400, 400), CRectD(-radius, -radius, radius, radius));
}

CChildView::~CChildView()
{
}

BEGIN_MESSAGE_MAP(CChildView, CWnd)
	ON_WM_PAINT()
	ON_WM_KEYDOWN()
	ON_COMMAND(ID_DRAW_DIFFUSE, &CChildView::OnDrawDiffuse)
	ON_COMMAND(ID_DRAW_GLOSSY, &CChildView::OnDrawGlossy)
END_MESSAGE_MAP()

// ����������� ��������� CChildView

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

void CChildView::OnPaint() 
{
	CPaintDC dc(this); // �������� ���������� ��� ���������

	if (DRAW_MODE == DIFFUSE_LIGHT)//��� ������������ ���������
	{
		sphere->Draw(dc, true);
	}
	if (DRAW_MODE == GLOSSY_LIGHT)//��� �����������
	{
		sphere->Draw(dc, false);
	}
}

void CChildView::OnKeyDown(UINT nChar, UINT nRepCnt, UINT nFlags)
{
	// TODO: �������� ���� ��� ����������� ��������� ��� ����� ������������

	if (nChar == 65 || nChar == 68 || nChar == 87 || nChar == 83)
	{
		if (nChar == 65) Light_Global_Phi -= 30;//���� ������
		if (nChar == 68) Light_Global_Phi += 30;//���� �������
		if (nChar == 87) Light_Global_Theta -= 30;//���� ����
		if (nChar == 83) Light_Global_Theta += 30;//���� ����
		if (Light_Global_Phi < 0) Light_Global_Phi += 360;
		if (Light_Global_Phi > 360) Light_Global_Phi -= 360;
		if (Light_Global_Theta < 0) Light_Global_Theta += 360;
		if (Light_Global_Theta > 360) Light_Global_Theta -= 360;
		Invalidate();
	}
	CWnd::OnKeyDown(nChar, nRepCnt, nFlags);
}

void CChildView::OnDrawDiffuse()
{
	DRAW_MODE = DIFFUSE_LIGHT;
	Invalidate();
}

void CChildView::OnDrawGlossy()
{
	DRAW_MODE = GLOSSY_LIGHT;
	Invalidate();
}

void Sphere::Draw(CDC& dc, bool light_mode)
{
	ExtPoint CurrentPoint;//�������� �����
	ExtPoint CoordCenter;//����������� ����������
	ExtPoint CameraVector;//������� ������
	ExtPoint LightVector;//������� �����
	CoordCenter.Set(0, 0, 0);//�����
	CameraVector = PointsOnVector(CoordCenter, SphereToCart(700, 0, 0));//������ ��������� ������
	//������ ������� �����
	LightVector = PointsOnVector(CoordCenter, SphereToCart(700, Light_Global_Phi*pi / 180, Light_Global_Theta*pi / 180));
	CoordCenter.Set(0, 0, 0);
	ExtPoint RadiusVector;//������� ����
	double light_result;//���������� ����� ��� ���������
	//���� �����
	int red = 255;
	int green = 255;
	int blue = 255;
	
	bool pointVisible;//���� ���������
	bool pointIlluminated;//���� �������
	for (double Fi = 0; Fi < 360; Fi += 0.25)
	{
		for (double Teta = 0; Teta < 180; Teta += 0.25)
		{
			CurrentPoint = SphereToCart(radius, Fi*pi / 180, Teta*pi / 180);
			RadiusVector = PointsOnVector(CoordCenter, CurrentPoint);//������ � ��������������� �����
			pointVisible = ScalarMultiply(CameraVector, RadiusVector) > 0;
			if (pointVisible)
			{
				pointIlluminated = ScalarMultiply(LightVector, RadiusVector) > 0;
				cord(0) = CurrentPoint.X;
				cord(1) = CurrentPoint.Y;
				rescord = transform * cord;
				if (pointIlluminated)
				{
					double temp = ModuleVector(LightVector) * Cos(LightVector, RadiusVector) / ModuleVector(RadiusVector) * 2;
					ExtPoint VectorOtrazenia;
					//��������������� ��������� �����
					VectorOtrazenia.X = RadiusVector.X * temp - LightVector.X;
					VectorOtrazenia.Y = RadiusVector.Y * temp - LightVector.Y;
					VectorOtrazenia.Z = RadiusVector.Z * temp - LightVector.Z;
					double first = 0;

					double second = 0;

					double result = 0;
					if (light_mode)//������������ ���������
					{
						result = Cos(CameraVector, RadiusVector) * Cos(LightVector, RadiusVector);
					}
					else//���������� ���������
					{
						result = Cos(CameraVector, VectorOtrazenia);
					}

					if (result < 0) result = 0;

					light_result = result;

					dc.SetPixel(rescord(0), rescord(1), RGB(red*light_result, green*light_result, blue*light_result));//������������ �����
				}
				else
				{
					dc.SetPixel(rescord(0), rescord(1), RGB(0, 0, 0));
				}
			}
		}
	}
}