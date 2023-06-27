#include <iostream>
#include "Winsock2.h"

#pragma comment(lib, "WS2_32.lib")

using namespace std;

string GetErrorMsgText(int code);
string SetErrorMsgText(string msgText, int code);


int main()
{
	setlocale(LC_ALL, "rus");
	int i;
	int t;
	try {
		WSADATA wsaData;
		SOCKET serverSocket;

		if (WSAStartup(MAKEWORD(2, 0), &wsaData) != 0)
			throw  SetErrorMsgText("Startup:", WSAGetLastError());

		if ((serverSocket = socket(AF_INET, SOCK_STREAM, NULL)) == INVALID_SOCKET)
			throw  SetErrorMsgText("socket:", WSAGetLastError());

		SOCKADDR_IN serv;				   // параметры сокета sS
		serv.sin_family = AF_INET;		   // используется IP-адресация
		int port = 2000;
		serv.sin_port = htons(port);
		serv.sin_addr.s_addr = INADDR_ANY;

		if (bind(serverSocket, (LPSOCKADDR)&serv, sizeof(serv)) == SOCKET_ERROR) // установка параметров serv 
			//для сокета serverSocket
			throw  SetErrorMsgText("bind:", WSAGetLastError());


		int queueLength = 2;
		if (SOCKET_ERROR == listen(serverSocket, queueLength))
		{
			cout << "Listen: " << WSAGetLastError << endl;
		}
		cout << "Сервер начал прослушку!" << endl;

		SOCKET clientSocket;	                 // сокет для обмена данными с клиентом 
		SOCKADDR_IN clnt;						 // параметры  сокета клиента
		memset(&clnt, 0, sizeof(clnt));
		int lclnt = sizeof(clnt);			     // размер SOCKADDR_IN

		while (true) {
			i = 1;
		
			if ((clientSocket = accept(serverSocket, (sockaddr*)&clnt, &lclnt)) == INVALID_SOCKET)
				throw  SetErrorMsgText("accept:", WSAGetLastError());

			cout << "Соединение с клиентом успешно!" << endl;
			cout << "Адрес клиента: " << inet_ntoa(clnt.sin_addr) << ":" << htons(clnt.sin_port) << "\n";

			char ibuf[50],
				obuf[50] = "Server: принято ";
			int  libuf = 0,
				lobuf = 0;

			while (true) {
				
				t = clock();

				if ((libuf = recv(clientSocket, ibuf, sizeof(ibuf), NULL)) == SOCKET_ERROR)
				{
					cout << "Recv: " << WSAGetLastError() << endl;
					break;
				}


				_itoa(lobuf, obuf + sizeof("Server: принято ") - 1, 10);

				cout << "Принято сообщение " << i << ": " << ibuf << endl;
				i++;

				if ((lobuf = send(clientSocket, ibuf, strlen(ibuf) + 1, NULL)) == SOCKET_ERROR)
				{
					cout << "Send: " << WSAGetLastError() << endl;
					break;
				}

				cout << t << " ticks\n";

			}

			cout << "\n\nКлиент отключился" << endl;
			cout << "Затраченное время: " << t << " ticks\n";
		}
		if (closesocket(serverSocket) == SOCKET_ERROR)
			throw  SetErrorMsgText("closesocket:", WSAGetLastError());

		if (WSACleanup() == SOCKET_ERROR)
			throw  SetErrorMsgText("Cleanup:", WSAGetLastError());

		
	}
	catch (string errorMsgText) {
		{ cout << endl << "WSAGetLastError: " << errorMsgText; }
	}
	return 0;
}

string GetErrorMsgText(int code)
{
    string msgText;
    switch (code)
    {
	case WSAEINTR: msgText = "Работа функции прервана";
		break;
	case WSAEACCES: msgText = "Разрешение отвергнуто";
		break;
	case WSAEFAULT: msgText = "Ошибочный адрес";
		break;
	case WSASYSCALLFAILURE: msgText = "Аварийное завершение системного вызова";
		break;
	default: msgText = "***ERROR***";
		break;
	}
	return msgText;
}


string SetErrorMsgText(string msgText, int code)
{
	return msgText + GetErrorMsgText(code);
}