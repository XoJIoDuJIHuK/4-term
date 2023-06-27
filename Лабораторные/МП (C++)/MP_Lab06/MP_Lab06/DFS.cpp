//#include "stdafx.h"
#include "DFS.h"
#include <iostream>
#include <stack>
using namespace std;

#define NINF 0x80000000
#define INF  0x7fffffff
void DFS::init(const graph::AList& al)
{
	this->al = &al;
	this->c = new Color[this->al->n_vertex];
	this->d = new int[this->al->n_vertex];
	this->f = new int[this->al->n_vertex];
	this->p = new int[this->al->n_vertex];
	this->t = 0;
	for (int i = 0; i < this->al->n_vertex; i++)
	{
		this->c[i] = WHITE;
		this->d[i] = this->f[i] = 0;
		this->p[i] = NIL;
	};
	for (int i = 0; i < this->al->n_vertex; i++)
		if (this->c[i] == WHITE)
		{
			this->visit(i);
			this->topological_sort.push_back(i);
		}
};
DFS::DFS(const graph::AList& al) { this->init(al); };
DFS::DFS(const graph::AMatrix& am)
{
	this->init(*(new graph::AList(am)));
};
void DFS::visit(int u)
{
	int v = NIL;
	this->c[u] = GRAY;
	this->d[u] = ++(this->t);
	for (int j = 0; j < this->al->size(u); j++)
		if (this->c[v = this->al->get(u, j)] == WHITE)
		{
			this->p[v] = u;
			this->visit(v);
			this->topological_sort.push_back(v);
		}
	this->c[u] = BLACK;
	this->f[u] = ++(this->t);
};
int DFS::get(int i)
{
	int j = 0, min1 = INF, min2 = NINF, ntx = NIL;
	for (int j = 0; j <= i; j++)    // iая статистика 
	{
		for (int k = 0; k < this->al->n_vertex; k++)
			if (this->f[k] < min1 && this->f[k] > min2)
			{
				min1 = this->f[k]; ntx = k;
			};
		min2 = min1;  min1 = INF;
	};
	return ntx;
};

void DFS::get()
{
	this->Stack.push(0);
	this->StackResult.push(0);

	for (int i = 0; i < this->al->n_vertex; i++)
	{
		this->c[i] = WHITE;
	}

	while (!this->Stack.empty())
	{
		int currentVertex = this->Stack.top();
		this->c[currentVertex] = BLACK;
		this->Stack.pop();

		cout << "Выбрана вершина " << currentVertex << endl;

		for (int i = this->al->size(currentVertex) - 1; i >= 0; i--)
		{
			int selectedVertex = this->al->get(currentVertex, i);
			cout << "Выбрана смежная вершина " << selectedVertex << endl;

			if (this->c[selectedVertex] == WHITE)
			{
				this->Stack.push(selectedVertex);
				this->StackResult.push(selectedVertex);
				this->c[selectedVertex] = GRAY;
				cout << "Вершина " << selectedVertex << " помещена на вершину стека" << endl;
			}
			else cout << "Вершина " << selectedVertex << " не подошла" << endl;
		}


	}
	this->PrintStackResult();
}

void DFS::PrintStack()
{
	for (int i = 0; i < this->Stack.size(); i++)
	{
		cout << this->Stack._Get_container()[i] << " ";
	}
	cout << endl;
}
void DFS::PrintStackResult()
{
	for (int i = 0; i < this->StackResult.size(); i++)
	{
		cout << this->StackResult._Get_container()[i] << " ";
	}
	cout << endl;
}
