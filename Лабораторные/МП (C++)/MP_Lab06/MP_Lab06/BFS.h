#pragma once
#include "Graph.h"
#include <queue>
struct BFS   // breadth-first search ����� � ������ (������� ����) 
{
	const static int INF = 0x7fffffff;
	const static int NIL = -1;
	enum Color { WHITE, GRAY, BLACK };       // 
	const graph::AList* al;                // �������� ����
	Color* c;                              // ���� �������  
	int* d;                              // ���������� �� �������
	int* p;                              // �������������� ������� 
	std::queue<int> q;                     // ������� 
	std::queue<int> qResult;                     // ������� (��������)
	void PrintQueue();
	void PrintQueueResult();
	BFS(const graph::AList& al, int s);
	BFS(const graph::AMatrix& am, int s);
	void init(const graph::AList& al, int s);
	int get();                             // �������� ��������� �������  
};
