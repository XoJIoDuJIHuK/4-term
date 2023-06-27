#include <iostream>
#include "windows.h"
#include <string>

using namespace std;

string GetErrorMail(int code)
{
	string msgText = "";
	switch (code)
	{
	case WSAEINTR: msgText = "WSAEINTR"; break;
	case WSAEACCES:	msgText = "WSAEACCES"; break;
	case WSAEFAULT:	msgText = "WSAEFAULT"; break;
	default: msgText = "Error";
	};
	return msgText;
}

string SetErrorMail(string msgText, int code)
{
	return msgText + GetErrorMail(code);
}

int main()
{
	setlocale(LC_ALL, "rus");

	try {

		SECURITY_DESCRIPTOR  pSD;
		SECURITY_ATTRIBUTES  SA;

		InitializeSecurityDescriptor(&pSD, SECURITY_DESCRIPTOR_REVISION);

	    //указатель на SECURITY_DESCRIPTOR, наличие DACL, указатель на структуру ACL (разреш. доступ ко всем объекту), флаг источника dacl (false - указан явно) 
		SetSecurityDescriptorDacl(&pSD, true, NULL, false);
		SA.nLength = sizeof(SA);
		SA.lpSecurityDescriptor = &pSD;
		SA.bInheritHandle = true;

		

		HANDLE serverMailSlot;
		int i = 0;
		double t1 = 0, t2 = 0;

		if ((serverMailSlot = CreateMailslot(L"\\\\.\\mailslot\\BOX", 
			500,
			//5000,//три минуты ждать долго, так что будет 5 секунд
			MAILSLOT_WAIT_FOREVER,//это убрать
			&SA)) == INVALID_HANDLE_VALUE)
			throw SetErrorMail("CreateMailslot", GetLastError());

		cout << "Hello i am server" << endl;

		char readBuf[50];
		DWORD readMsg;
		do {
			i++; 
			if (!ReadFile(serverMailSlot, readBuf, sizeof(readBuf), &readMsg, NULL)) 
				throw SetErrorMail("ReadFile", GetLastError());
			SetMailslotInfo(serverMailSlot, 5000);
			if (i == 1)
				t1 = clock();
			cout << readBuf << " " << i << endl;
			Sleep(10);
		} while (strcmp(readBuf, " ") != 0);

		t2 = clock();

		cout << "Время передачи: " << (t2 - t1) / 1000 << " сек." << endl;
		cout << "Количество сообщений: " << i - 1 << endl << endl;

		if (!CloseHandle(serverMailSlot))
			throw "Error: CloseHandle";

		system("pause");
	}
	catch (string e) {
		if (e == "ReadFileError") {
			cout << e << " Timeout";
			return 0;
		}
		cout << e << endl;
	}
	return 0;
}

