   M S B A M L   `   `   `  ����A  =oop-04, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:oop_04oop_04  5   	   =#clr-namespace:oop_04.MVVM.ViewModeloop_04.MVVM.ViewModel  5   	   3clr-namespace:oop_04.MVVM.Viewoop_04.MVVM.View  5   	       oop_04.MainWindow   5   	   W SPresentationCore, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=7.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=7.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   &localclr-namespace:oop_04     5   	   2vm#clr-namespace:oop_04.MVVM.ViewModel     5   	   ,vclr-namespace:oop_04.MVVM.View     5   	     � WindowState$  	Maximized=�5
   	    � 
ResizeMode$ CanResizeWithGrip=�5   	   
������  � AllowsTransparency$ False��5   	    � Title$ 
MainWindow��5   	   $	��800��5   	   $
��1300��5   	    � ForceCursor$
 True��5   	    J� CommandBindings 5      )  #System.Windows.Input.CommandBinding  5   
   -   5        )  #oop_04.MVVM.ViewModel.MainViewModel   MyCustomCommand   Command# Z 5      5      .��5      � .+�5   
   �� -   5         ��Name$ ParentBorder��5      ���#8819FF._�5      � 	 � ColumnDefinitions	 5      �� 5      $	��250 �6'   �� 5      
 � RowDefinitions
 5       �� 5!      .+�5$      �� $��0��6   .+�5%      �� -   5         ��Name$ ShopName��5&       $��Center=�5%       $
��Bold"�5'       $
��Left=�5(       
�������$��24(�5*       $��Flower Shop��5+       $��
15,20,0,20q�5,       	� 5.      -   5         	�Name$ RadioButtonHome��5/   "    
  m_home#���   5.   "   $��50��51   "   
�������  MenuButtonTheme#��[ 53   "   ��50   "   �� *homeViewClick+53   "   	� 54      -   5        $ RadioButtonView��55   "    
 m_view#���  54   "   $��50��57   "   
�������#��[ 59   "   ��56   "   �� *viewViewClick+59   "   	� 5:      -   5        $ RadioButtonAdd��5<   "    	 m_add#���  5:   "   $��50��5=   "   
�������#��[ 5?   "   ��5;   "   �� *
addNewCard+5?   "   � 5@      	 5A      �� 5B      $��4* �6/   
 5D      �� 5E      $��80 �6,   .+�5G      �� -   5        $��0q�5G   !   $	��100��5J   !   $��25,20,25,20q�5K   !   ��5H   !   �� *switchLanguage+.��5L      �� ���#FF51A8$	��100��5M   %   ._�5N   "   �� -   5        $ CurrentLanguage��5N   ,     m_langButton#���  5O   (   $��Center=�5P   (   $��Center=�5Q   (   ���#ffffff$��30(�5S   (   5T      5U      5V      �� 5W      -	   5         ��Name$ 
SaveButton��5W      $	��200��5X      $��60��5Y      $��20q�5Z      $��0q�5[      
������ ��5\      �� *saveCardsToFile+.��5^      �� ���#77FFF3$��60��5_   !   $	��200��5`   !   ._�5a      �� -
   5        $ SaveButtonTextBlock��5b   (   $��Center=�5a   (   $��Center=�5c   (    
 m_save#���  5d   (   $��26(�5e   (   5f      5g      � 5i      $��70��6   $y�	Collapsed=�5j      $��0 20 0 0q�5k      	 5l      �� 5m      �� 5n      .+�5p      �� $
��Undo��6!   $��0��5q   !   ��5r   !   �� *undo+�� 5s      $
��Redo��6!   $��1��5t   !   ��5u   !   �� *redo+5v      �� 5x      -   5        $ Parent��5x      $	��100��6-   ��6:   �� *biggestCommand+.��5y      �� -   5        $	 Son��5y   !   $��80��6.   $	��200��6:   
���  ����6W   �� *
bigCommand+.��5z      �� -   5        $ NotSon��5z   %   $��60��65   $	��180��6A   
����  ���6_   �� *smallCommand+6�   5{      5|      �� 5}      -   5        $ EventRouteLog��5}       �� 5~      -   5        $ EventRouteLogTunnel��5~       
���  ��6=   5         oop_04.MVVM.View.HomeView  5�      -   5          Name$ HomeView��5�      $��1��5�         oop_04.MVVM.View.ViewView  5�      -   5          Name$ ViewView��5�      $��1��5�      $y�	Collapsed=�5�      5�      5�      5�      5�      