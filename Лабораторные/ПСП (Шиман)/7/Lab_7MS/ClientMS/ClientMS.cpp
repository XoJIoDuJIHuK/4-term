#include <iostream>
#include "windows.h"
#include <string>
#include "ClientMS.h"

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

void SendViaMailslot(LPCWSTR mailslotName)
{
	HANDLE clientMailSlot;
	double t1, t2;

	if ((clientMailSlot = CreateFile(mailslotName, // символическое имя канала
		GENERIC_WRITE, //чтение или запись в канал
		FILE_SHARE_WRITE, // режим совместного использования
		NULL, //атрибуты безопасности
		OPEN_EXISTING, //флаг открытия ящика
		NULL, //флаги и атрибуты
		NULL)) == INVALID_HANDLE_VALUE) //доп атрибуты
		throw SetErrorMail("CreateFile: ", GetLastError());

	cout << "Hello i am Client" << endl;

	char writeBuf[500] = "Hello from Client-Mailslot";
	/*для отправки на несколько серверов длина сообщения - максимум 50 байт
	*/
	char emptyMessage[] = " ";
	DWORD writeMsg;

	t1 = clock();

	cout << "Enter number of messages: ";
	int number = 0;
	cin >> number;

	for (int i = 1; i <= number; i++) {

		if (!WriteFile(clientMailSlot, writeBuf, sizeof(writeBuf), &writeMsg, NULL))
			throw SetErrorMail("WriteFile: ", GetLastError());

		cout << "Message " << i << " was sent " << writeBuf << endl;
	}

	if (!WriteFile(clientMailSlot, emptyMessage, sizeof(emptyMessage), &writeMsg, NULL))
		throw SetErrorMail("WriteFile: ", GetLastError());

	t2 = clock();

	if (!CloseHandle(clientMailSlot))
		throw "Error: CloseHandle";

	cout << endl << "Время передачи: " << (t2 - t1) / 1000 << " сек." << endl << endl;
}

int main()
{
	setlocale(LC_ALL, "rus");

	try {
		SendViaMailslot(L"\\\\*\\mailslot\\BOX");
		//system("pause");
	}
	catch (string e) {
		cout << e << endl;
	}
	
	return 0;
}


