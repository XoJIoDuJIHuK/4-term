#include "stdafx.h"
#include "CApp.h"

CApp App;

BOOL CApp::InitInstance()
{
	m_pMainWnd = new CMainWin;
	m_pMainWnd->ShowWindow(SW_RESTORE);
	m_pMainWnd->UpdateWindow();
	return TRUE;
}
BEGIN_MESSAGE_MAP(CApp, CWinApp)
//	ON_COMMAND(ID_TESTSF_F12, &CApp::OnTestsfF12)
END_MESSAGE_MAP()
