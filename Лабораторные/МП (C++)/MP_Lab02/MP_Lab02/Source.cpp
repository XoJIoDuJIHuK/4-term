#include <stdio.h>
#include <stdlib.h>
//--��� ���������� � �������
#include <math.h>

int main()
{
    int M[4] = { 2, 5, 6, 9 }; //--���������
    int w = 4; //--���-�� ��������� ���������

    int i, j, n;

    n = pow(2, w);
    for (i = 0; i < n; i++) //--������� ������� ����
    {
        printf("{");
        for (j = 0; j < w; j++) //--������� ����� � �����
            if (i & (1 << j)) //--���� j-� ��� ����������
                printf(" %d", M[j]); //--�� ������� j-� ������� ���������
        printf(" }\n");
    }
    return 0;
}