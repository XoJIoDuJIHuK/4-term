   M S B A M L   `   `   `  ����C  ?Lab8_SQL, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null#clr-namespace:Lab8_SQLLab8_SQL  5   	       Lab8_SQL.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   (localclr-namespace:Lab8_SQL     5   	     � Title$  
MainWindow��5   	   $	��600��6   $	��900��6)   .��5	      � 
����� � � RowDefinitions 5   
   �� 5      $
��0.3* �6   �� 5      �� 5      .+�5   
   �� $��30(�6   $��Fitness Center Data��6"   $��Center=�6=   $��Center=�6X   � 5   
   $��1��6    5      �� 5      �� 5      .+�5      �� -   5         ��Name$ SW��5      $
��Auto=�6'   .��5      &   System.Windows.Controls.DataGrid  -   5          Name$ 
phonesGrid��5   ;      AutoGenerateColumns .     Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5       ,  &System.Windows.Controls.DataGridColumn   Header$ id��6H      Width5  /System.Windows.Controls.DataGridLengthConverter$ 70 6T   1  +System.Windows.Controls.DataGridBoundColumn   Binding 61   �� *Id+6T     5!      $ Имя��6J   $ 60 6W    61   �� *Name+6W     5#      $ Дата рождения��6S   $	 130 6j    61   �� *date_of_birth+6j     5$      $, &код плана тренировки��6H   $	 130 6f    6-   �� *PlanId+6f   5*      5.      5/      �� 51   
   -   5        $��Добавление��51      $
��Left=�6&   $��	48,54,0,0q�6A   $��2��6T   $	��Top=�6a   $��45��6y   $��92��6�   6�   �� 52   
   -   5        $��Удаление��52      $
��Left=�6$   $��
172,53,0,0q�6?   $��2��6S   $	��Top=�6`   $��45��6x   $��92��6�   6�   �� 53   
   -   5        $"��Редактирование��53      $
��Left=�6*   $��
293,56,0,0q�6E   $��2��6Y   $	��Top=�6f   $��45��6~   $	��109��6�   6�   �� 54   
   -   5        $%��Просмотр записей��54      $
��Left=�6,   $��
424,53,0,0q�6G   $��2��6[   $	��Top=�6h   $��45��6�   $	��116��6�   6�   �� 55   
   -   5        $��Сортировка��55      $
��Left=�6&   $��
569,54,0,0q�6A   $��2��6U   $	��Top=�6b   $��45��6z   $	��116��6�   6�   �� 5;   
   -   5        $��Add Proc��5;      $
��Left=�6$   $��
781,19,0,0q�6?   $��2��6S   $	��Top=�6`   $��53��6x   $��77��6�   6�   �� 5>   
   -	   5        $��Undor��5>      $
��Left=�6!   $��
500,10,0,0q�6<   $��2��6P   $	��Top=�6]   6u   �� 5?   
   -
   5        $
��Redo��5?      $
��Left=�6    $��
587,11,0,0q�6;   $��2��6O   $	��Top=�6\   6t   �� 5@   
   -   5        $��
Поиск��5@      $
��Left=�6!   $��753,127,0,0q�6<   $��2��6Q   $	��Top=�6^   6v   5C      5D      