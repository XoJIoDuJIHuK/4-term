use To_MyBase;
select ����������.[ID ����������], ����������.[��� ����������], ����������.���������
	from ���������� inner join ����������
	on ����������.[ID ����������] = ����������.[ID ����������] and ����������.[��� ����������] like '%�%'

select ����������.[ID ����������], ����������.[��� ����������],
	case
	when (����������.[���� ��������] between '1971-01-01' and '1973-01-01') then '1971-1972 �.�.'
	when (����������.[���� ��������] between '1900-01-01' and '1971-01-02') then '������'
	else '�������'
	end �������
	from ���������� inner join ����������
	on ����������.[ID ����������] = ����������.[ID ����������]
		order by ����������.[������� ����������]

select isnull(���������.[�������� ���������], '***')���������,
	����������.[���� ���������]
	from ��������� left outer join ����������
		on ���������.[ID ���������] = ����������.���������

select ����������.[���� ��������]
	from ���������� full outer join ����������
	on ����������.[ID ����������] = ����������.[ID ����������]

select ����������.���������
	from ���������� full outer join ����������
	on ����������.[ID ����������] = ����������.[ID ����������]

select ����������.���������, ����������.[���� ��������]
	from ���������� full outer join ����������
	on ����������.[ID ����������] = ����������.[ID ����������]

select count(*) from ���������� full outer join ����������
	on ����������.[ID ����������] = ����������.[ID ����������]
	where [��� ����������] is null


select ����������.���������, ����������.[��� ����������], ����������.���
	from ���������� cross join ����������