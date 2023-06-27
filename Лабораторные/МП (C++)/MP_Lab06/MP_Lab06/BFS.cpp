//#include "stdafx.h"
#include "BFS.h"
#include <iostream>
using namespace std;

void BFS::init(const graph::AList& al, int s)
{
	this->al = &al;
	this->c = new Color[this->al->n_vertex];
	this->d = new int[this->al->n_vertex];
	this->p = new int[this->al->n_vertex];
	for (int i = 0; i < this->al->n_vertex; i++)
	{
		this->c[i] = WHITE;
		this->d[i] = INF;
		this->p[i] = NIL;
	};
	this->c[s] = GRAY;
	this->q.push(s);
	this->qResult.push(s);
};
BFS::BFS(const graph::AList& al, int s) { this->init(al, s); };
BFS::BFS(const graph::AMatrix& am, int s)
{
	this->init(*(new graph::AList(am)), s);
};

int BFS::get()
{
	int rc = NIL, v = NIL;
	if (!this->q.empty())
	{
		rc = this->q.front();
		this->q.pop();
		cout << "Выбранная вершина: " << rc << endl;
		for (int j = 0; j < this->al->size(rc); j++)
		{
			int v = this->al->get(rc, j);
			cout << "Взята смежная вершина " << v << endl;
			if (this->c[v] == WHITE)
			{
				cout << "Помещаем вершину " << v << " в очередь\n";
				this->c[v] = GRAY;
				this->d[v] = this->d[rc] + 1;
				this->p[v] = rc;
				this->q.push(v);
				this->qResult.push(v);
				cout << "Очередь: "; this->PrintQueue();
			}
			else
			{
				cout << "Вершина " << v << " не подходит\n";
			}
		}
		this->c[rc] = BLACK;
	}
	else cout << "Вершины кончились\n";
	return rc;
}

void BFS::PrintQueueResult()
{
	while (this->qResult.size() > 0)
	{
		cout << this->qResult.front() << " ";
		this->qResult.pop();
	}
	cout << endl;
}
void BFS::PrintQueue()
{
	for (int i = 0; i < q.size(); i++)
	{
		cout << q._Get_container()[i] << " ";
	}
	cout << endl;
}
