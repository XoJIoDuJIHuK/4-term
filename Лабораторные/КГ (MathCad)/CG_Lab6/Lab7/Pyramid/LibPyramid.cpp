#include "stdafx.h"


////////////////////////// ����������� ///////////////////////////////////
CPyramid::CPyramid()
{
	Vertices.RedimMatrix(4,5);	// ABCDE: ABCD - ���������, E - �������
	// ���������� ������ - �������
	Vertices(0,0)=10;	// A: x=10,y=0,z=0
	Vertices(1,1)=-10;	// B: x=0,y=-10,z=0
	Vertices(0,2)=-10;	// C: x=-10,y=0,z=0
	Vertices(1,3)=10;	// D: x=0,y=10,z=0
	Vertices(2,4)=20;	// E: x=0,y=0,z=20
	for(int i=0;i<5;i++)Vertices(3,i)=1;
}

#pragma region .

////////////////////////// Draw1(...) ///////////////////////////////

void CPyramid::Draw1(CDC& dc,CMatrix& PView,CRect& RW)
// ������ �������� � ��������� ��������� �����
// ��������������� �������� ��������� �� ������� � ������� (MM_TEXT)
// dc - ������ �� ����� CDC MFC
// PView - ���������� ����� ���������� � ������� ����������� ������� ���������
// (r,fi(����.), q(����.))
// RW - ������� � ���� ��� �����������
{
	CMatrix ViewCart=SphereToCart(PView);		// ��������� ���������� ����� ����������
	//double zz=ViewCart(2);
	CMatrix MV=CreateViewCoord(PView(0),PView(1),PView(2));	//�������(4x4) 
														                     //��� ��������� � ������� �� 
	CMatrix ViewVert=MV*Vertices; // ���������� ������ �������� � ������� ��
	CRectD RectView;
	GetRect(ViewVert,RectView);		// �������� ������������ �������������
	CMatrix MW=SpaceToWindow(RectView,RW);	// ������� (3x3) ��� ��������� 
                                          // � ������� ������� ���������
// ������� ������ ������� ��������� ��� ���������
	CPoint MasVert[5];	// ������ ������� ��������� ������
	CMatrix V(3); //V0(3);
	V(2)=1;
	//V0(0)=RectView.left;	
	//V0(1)=RectView.bottom;	
// ���� �� ���������� ������ - ��������� ������� ���������� ������
	for(int i=0;i<5;i++)		
	{
		V(0)=ViewVert(0,i); // x
		V(1)=ViewVert(1,i); // y
		//V=V-V0;			// x-xL, y-yL, 1
		V=MW*V;			// ������� ���������� �����
		MasVert[i].x=(int)V(0);
		MasVert[i].y=(int)V(1);			
	}
// ������

	CPen Pen(PS_SOLID, 2, RGB(0, 0, 255));
  CPen* pOldPen =dc.SelectObject(&Pen);
	CBrush Brus(RGB(255, 0, 0));
  CBrush* pOldBrush =dc.SelectObject(&Brus);
	CMatrix VE=Vertices.GetCol(4,0,2);	// ������� E
	CMatrix R1(3),R2(3),VN(3);
	double sm;
	for(int i=0;i<4;i++)	
	{
		int k;
		if(i==3) k=0;
		else k=i+1;
		R1=Vertices.GetCol(i,0,2);
		R2=Vertices.GetCol(k,0,2);
		CMatrix V1=R2-R1;			      // ������ - ����� � ���������
		CMatrix V2=VE-R1;			      // ������ - ����� � ������� E 
		VN=VectorMult(V2,V1);		  	// ������ �������(!)������� � �����
		sm=ScalarMult(VN,ViewCart);  // ��������� ������������ ������� 
		                             //������� � ����� � ������� ����� ���������� 
		if(sm>=0) // ����� ������ - ������ ������� �����
			{	
				dc.MoveTo(MasVert[i]);	// ���� 
				dc.LineTo(MasVert[k]);
				dc.LineTo(MasVert[4]);	
				dc.LineTo(MasVert[i]);
			}
	}
	VN=VectorMult(R1,R2);	
	sm=ScalarMult(VN,ViewCart);
	if(sm>=0)dc.Polygon(MasVert, 4);	// ���������
	dc.SelectObject(pOldPen);
	dc.SelectObject(pOldBrush);
}


////////////////////////// Draw(...) ///////////////////////////////
void CPyramid::Draw(CDC& dc,CMatrix& PView,CRect& RW)
// ������ �������� ��� �������� ��������� �����
// ��������������� �������� ��������� �� ������� � ������� (MM_TEXT)
// dc - ������ �� ����� CDC MFC
// PView - ���������� ����� ���������� � ������� ����������� ������� ���������
// (r,fi(����.), q(����.))
// RW - ������� � ���� ��� �����������
{
	CMatrix ViewCart=SphereToCart(PView);		// ��������� ���������� ����� ����������
	//double zz=ViewCart(2);
	CMatrix MV=CreateViewCoord(PView(0),PView(1),PView(2));	//�������(4x4) 
														                     //��� ��������� � ������� �� 
	CMatrix ViewVert=MV*Vertices; // ���������� ������ �������� � ������� ��
	CRectD RectView;
	GetRect(ViewVert,RectView);		// �������� ������������ �������������
	CMatrix MW=SpaceToWindow(RectView,RW);	// ������� (3x3) ��� ��������� 
                                          // � ������� ������� ���������
// ������� ������ ������� ��������� ��� ���������
	CPoint MasVert[5];	// ������ ������� ��������� ������
	CMatrix V(3); //V0(3);
	V(2)=1;
	//V0(0)=RectView.left;	
	//V0(1)=RectView.bottom;	
// ���� �� ���������� ������ - ��������� ������� ���������� ������
	for(int i=0;i<5;i++)		
	{
		V(0)=ViewVert(0,i); // x
		V(1)=ViewVert(1,i); // y
		//V=V-V0;			// x-xL, y-yL, 1
		V=MW*V;			// ������� ���������� �����
		MasVert[i].x=(int)V(0);
		MasVert[i].y=(int)V(1);			
	}
// ������

	CPen Pen(PS_SOLID, 2, RGB(0, 0, 255));
  CPen* pOldPen =dc.SelectObject(&Pen);
	dc.Polygon(MasVert, 4);	// ���������
	for(int i=0;i<4;i++)	
	{
		dc.MoveTo(MasVert[4]);	// ���� �� ������� E
		dc.LineTo(MasVert[i]);
	}
// ���������� ������ O 	����������� ���������� ���������
	int x0=(MasVert[0].x+MasVert[2].x)/2;
	int y0=(MasVert[0].y+MasVert[2].y)/2;
// ������ ��������� � ����� �� E � O 
	CPen Pen1(PS_DASH, 1, RGB(255, 0, 0));
	dc.SelectObject(&Pen1);
	dc.MoveTo(MasVert[4]);	// ���� �� ������� E
	dc.LineTo(x0,y0);				// ����� EO
	dc.MoveTo(MasVert[0]);	// ���� �� ������� A
	dc.LineTo(MasVert[2]);	// ���������
	dc.MoveTo(MasVert[1]);	// ���� �� ������� B
	dc.LineTo(MasVert[3]);	// ���������
	dc.SelectObject(pOldPen);
}


void CPyramid::Draw2(CDC& dc,CMatrix& PView,CRect& RW)
// ������ �������� ��� �������� ��������� �����
// �������� ��������� ��������� Windows, ��� �����
// ������ ���� ���������� ����� ����������� MM_ANISOTROPIC 
// dc - ������ �� ����� CDC MFC
// PView - ���������� ����� ���������� � ������� ����������� ������� ���������
// (r,fi(����.), q(����.))
// RW - ������� � ���� ��� �����������
{
	CMatrix ViewCart=SphereToCart(PView);		// ��������� ���������� ����� ����������
	double zz=ViewCart(2);
	CMatrix MV=CreateViewCoord(PView(0),PView(1),PView(2));	//�������(4x4) 
														                     //��� ��������� � ������� �� 
	CMatrix ViewVert=MV*Vertices; // ���������� ������ �������� � ������� ��
	CRectD RectView;
	GetRect(ViewVert,RectView);		// �������� ������������ �������������


/*
	CMatrix MW=SpaceToWindow(RectView,RW);	// ������� (3x3) ��� ��������� 
                                          // � ������� ������� ���������
// ������� ������ ������� ��������� ��� ���������
	CPoint MasVert[5];	// ������ ������� ��������� ������
	CMatrix V(3),V0(3);
	V(2)=1;
	V0(0)=RectView.left;	
	V0(1)=RectView.bottom;	
// ���� �� ���������� ������ - ��������� ������� ���������� ������
	for(int i=0;i<5;i++)		
	{
		V(0)=ViewVert(0,i); // x
		V(1)=ViewVert(1,i); // y
		V=V-V0;			// x-xL, y-yL, 1
		V=MW*V;			// ������� ���������� �����
		MasVert[i].x=(int)V(0);
		MasVert[i].y=(int)V(1);			
	}

*/

CPoint MasVert[5];	// 
for(int i=0;i<5;i++)		
	{
		MasVert[i].x=(int)ViewVert(0,i);
		MasVert[i].y=(int)ViewVert(1,i);			
	}

	CRect IRV((int)RectView.left,(int)RectView.top,(int)RectView.right,(int)RectView.bottom);
	SetMyMode(dc,IRV,RW);

// ������
		CPen Pen(PS_SOLID, 0, RGB(255, 0, 0));
  CPen* pOldPen =dc.SelectObject(&Pen);
	dc.Polygon(MasVert, 4);	// ���������
	for(int i=0;i<4;i++)	
	{
		dc.MoveTo(MasVert[4]);	// ���� �� ������� E
		dc.LineTo(MasVert[i]);
	}
// ���������� ������ O 	����������� ���������� ���������
	int x0=(MasVert[0].x+MasVert[2].x)/2;
	int y0=(MasVert[0].y+MasVert[2].y)/2;
// ������ ��������� � ����� �� E � O 
	CPen Pen1(PS_DASH, 0, RGB(0, 255, 0));
	dc.SelectObject(&Pen1);
	dc.MoveTo(MasVert[4]);	// ���� �� ������� E
	dc.LineTo(x0,y0);				// ����� EO
	dc.MoveTo(MasVert[0]);	// ���� �� ������� A
	dc.LineTo(MasVert[2]);	// ���������
	dc.MoveTo(MasVert[1]);	// ���� �� ������� B
	dc.LineTo(MasVert[3]);	// ���������
	dc.SelectObject(pOldPen);

	
	dc.SetMapMode(MM_TEXT);

}


#pragma endregion

////////////////////////// ColorDraw(...) ///////////////////////////////

void CPyramid::ColorDraw(CDC& dc, CMatrix& PView, CMatrix& PLight, CRect& RW, COLORREF Color) 
{
	//�������� ����������� ����
	BYTE red=GetRValue(Color);
    BYTE green=GetGValue(Color);
    BYTE blue=GetBValue(Color);

	//������� �������
	CMatrix ViewCart=SphereToCart(PView);	
	CMatrix LightCart=SphereToCart(PLight);	
	//���������� ������� ���������� � �������
	CMatrix MV=CreateViewCoord(PView(0),PView(1),PView(2));	 
														                   
	CMatrix ViewVert=MV*Vertices; 
	CRectD RectView;
	GetRect(ViewVert,RectView);		
	CMatrix MW=SpaceToWindow(RectView,RW);	

	CPoint MasVert[5];	
	CMatrix V(3);
	V(2)=1;
	for(int i=0;i<5;i++)		
	{
		V(0)=ViewVert(0,i); // x
		V(1)=ViewVert(1,i); // y
		//V=V-V0;			// x-xL, y-yL, 1
		V=MW*V;
		MasVert[i].x=(int)V(0);
		MasVert[i].y=(int)V(1);
	}


	CMatrix VE=Vertices.GetCol(4,0,2);//�������� ����� �������
	CMatrix R1(3),R2(3),VN(3);
	double teta;//���� ����� ���������� �������� � ����� � �������� � ����� ����������
	for(int i=0;i<4;i++)	
	{
		int k;
		if(i==3) k=0;
		else k=i+1;
		//�������� ���������� ������
		R1=Vertices.GetCol(i,0,2);
		R2=Vertices.GetCol(k,0,2);
		
		//�������� � ������
		CMatrix V1=R2-R1;
		CMatrix V2=VE-R1;
		VN=VectorMult(V2,V1);		  	

		teta =CosV1V2(VN,ViewCart);
		                           
		if(teta>=0) 
		{
			double phi = CosV1V2(VN, LightCart);
			if (phi >= 0)
			{
				CPen Pen(PS_SOLID, 2,
					RGB(teta * phi * red, teta * phi * green, teta * phi * blue));
				CPen* pOldPen = dc.SelectObject(&Pen);//�������� ���� � �������� ���������

				CBrush Brus(RGB(teta * phi * red, teta * phi * green, teta * phi * blue));
				//�������� ���� � �������� ������
				CBrush* pOldBrush = dc.SelectObject(&Brus);

				CPoint MasVertR[3] = { MasVert[i],MasVert[k],MasVert[4] };//������� ������������
				dc.Polygon(MasVertR, 3);	// �����
				//����������� ��������� ������
				dc.SelectObject(pOldBrush);
				dc.SelectObject(pOldPen);
			}
			else
			{
				CPen Pen(PS_SOLID, 2, //������ ����
					//����� ����� ������ � ��������� �� ���������
					//��������� ��������� 
					RGB(0,0,0));
				CPen* pOldPen = dc.SelectObject(&Pen);//�������� ���� � �������� ���������

				//������ ��������� ����� ��� ����� ����
				CBrush Brus(RGB(0,0,0));
				//�������� ���� � �������� ������
				CBrush* pOldBrush = dc.SelectObject(&Brus);

				CPoint MasVertR[3] = { MasVert[i],MasVert[k],MasVert[4] };//������� ������������
				dc.Polygon(MasVertR, 3);	// �����
				//����������� ��������� ������
				dc.SelectObject(pOldBrush);
				dc.SelectObject(pOldPen);
			}
		}
	}
	//�� �� ��� � � �����, �� ������ ��������� ��������, ���� teta=0
	VN=VectorMult(R1,R2);	
	teta=CosV1V2(VN,ViewCart);
	if(teta>=0)
	{
		double phi = CosV1V2(VN, LightCart);
		if (phi >= 0)
		{
			CPen Pen(PS_SOLID, 2, RGB(phi * teta * red, phi * teta * green, phi * teta * blue));
			CPen* pOldPen = dc.SelectObject(&Pen);
			CBrush Brus(RGB(phi * teta * red, phi * teta * green, phi * teta * blue));
			CBrush* pOldBrush = dc.SelectObject(&Brus);
			dc.Polygon(MasVert, 4);	// ���������
			dc.SelectObject(pOldBrush);
			dc.SelectObject(pOldPen);
		}
		else
		{
			CPen Pen(PS_SOLID, 2, RGB(0,0,0));
			CPen* pOldPen = dc.SelectObject(&Pen);
			CBrush Brus(RGB(0,0,0));
			CBrush* pOldBrush = dc.SelectObject(&Brus);
			dc.Polygon(MasVert, 4);	// ���������
			dc.SelectObject(pOldBrush);
			dc.SelectObject(pOldPen);
		}
	}
	
}



////////////////////////// GetRect(...) ///////////////////////////

void CPyramid::GetRect(CMatrix& Vert,CRectD& RectView)
// ��������� ���������� ��������������,������������� �������� 
// �������� �� ��������� XY � ������� ������� ���������
// Ver - ���������� ������ (� ��������)
// RectView - �������� - ������������ �������������
{
	CMatrix V=Vert.GetRow(0);					// x - ����������
	double xMin=V.MinElement();
	double xMax=V.MaxElement();
	V=Vert.GetRow(1);									// y - ����������
	double yMin=V.MinElement();
	double yMax=V.MaxElement();
	RectView.SetRectD(xMin,yMax,xMax,yMin);
}

//---------------------------------------------------------------------