   M S B A M L   `   `   `  ����Q  MDentalClinicManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullK*clr-namespace:DentalClinicManagement.AdminDentalClinicManagement.Admin  5      S.clr-namespace:DentalClinicManagement.Converter DentalClinicManagement.Converter  5      ,    &DentalClinicManagement.Admin.DashBoard   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      <local*clr-namespace:DentalClinicManagement.Admin     5      E
converters.clr-namespace:DentalClinicManagement.Converter     5      -   5          N� Title$  Admin��5
       � 	Resources 5      8   2DentalClinicManagement.Converter.AbsoluteConverter   absoluteConverter��%   &	          5   
   6'   5      .��5      �� 
�������.+�5   
   ��  �� Orientation$ 
Horizontal=�6   .+�5      �� -   5         ��Name$ 
LeftCanvas��5      $	��734��6)   $	��400��66   ���	#FF00C1E6.+�5      �� $��/images/teeth.jpg��6   $	��100��63   $��96��6?    �� Left$ 6��6K   
 �� Top$ 7��6[   �� 5      $��/images/ava_10.png��6   $	��152��64   $	��150��6@   $	 124��6M   $ 66��6_   �� 5      $��Dentistry Plus��6   $��24(�62   $��Bookman Old Style)�6@   $
��Bold"�6_   $��Center=�6q   $��76��6�   $	 211��6�   
�������$ 17��6�   $	��Top=�6�   �� 5      $
��Left=�62   $	��Top=�6M   $	 236��6e   $��22(�6v   $
��Bold"�6�   $	 180��6�   ��6   �� *Name+6�   �� 5      $��Quản Trị Viên��6   $��DemiBold"�61   $	 147��6G   $	 265��6Y   $��18(�6j   $��Center=�6x   $��Center=�6�   �� 5      $��Date of birth:��6   $��18(�62   $ 40��6@   $	 343��6Q   6d   �� 5      $��18(�69   $	 180��6G   $	 343��6Y   $
��Left=�6j   $��Center=�6�   $	��202��6�   ��6   �� *DateOfBirth+6�   �� 5      $��Phone number:��6   $��18(�61   $ 40��6?   $	 391��6P   $��Center=�6a   $	��Top=�6~   6�   �� 5      $��18(�65   $	 180��6C   $	 391��6U   $
��Left=�6f   $��Center=�6�   $	��202��6�   ��6   �� *	PhoneNo+6�   �� 5      $��Address:��6   $��18(�6,   $ 40��6:   $	 439��6K   $��Center=�6\   $	��Top=�6y   6�   �� 5      $��18(�65   $	 180��6C   $	 439��6U   $
��Left=�6f   $��Center=�6�   $	��202��6�   ��6   �� *	Address+6�   �� 5      -   5        $��Đăng Xuất��5      $	��364��6-   $��49��69    �� 	IsDefault$
 True��6E   $��24(�6V   ���	#FFB6D7F4$ 18��6�   $	 588��6�   $��Center=�6�   $	��Top=�6�    5       �� 
TargetType �� Property	 �� Value��%_   '��       �� 5      " ��6    .�5       ��  �@��CornerRadius$	 20��6=   5!      5"      5#      5$      �� 5%      $	��734��6   $	��800��6"   
�������.+�5&      �� $��..\\images\\homePage.jpg��6   $	��258��6:   $	��248��6F   $	 491��6S   $	 144��6e   �� 5'      $��Trang Chủ��6   $	��800��6-   $��41��69   $��24(�6E   ���	#FFB6D7F4$
��Left=�6j   
 �� TextAlignment$
 Center=�6�   $��Center=�6�   �� 5(      $V��PDentistry Plus cung cấp các dịch vụ nha khoa đảm bảo chất lượng��6   $ 33��6c   $	 170��6t   $��36(�6�   $
��Bold"�6�   $	��197��6�   $	��367��6�   $
��Wrap=�6�   $��Center=�6�   $��Center=�6�   6  �� 5)      $��Các chức năng��6   $ 33��61   $	 439��6B   $��24(�6S   $
��Bold"�6a   $��62��6s   $	��279��6   $
��Wrap=�6�   $��Center=�6�   $	��Top=�6�   6�   �� 5*      -   5        $#��Xem, sửa thông tin thuốc��5*      $	��364��6<   $��49��6H   $
 True��6T   $��24(�6e   ���	#FFB6D7F4$ 33��6�   $	 589��6�   $
��Left=�6�   $	��Top=�6�    5+      ��%_   '��       �� 5,      " ��6    .�5-      ��  �@��CornerRadius$	 20��6=   5.      5/      50      �� 51      -   5        $��Xem, sửa tài khoản��51      $	��364��66   $��49��6B   $
 True��6N   $��24(�6_   ���	#FFB6D7F4$ 33��6�   $	 506��6�   $
��Left=�6�   $	��Top=�6�    52      ��%_   '��       �� 53      " ��6    .�54      ��  �@��CornerRadius$	 20��6=   55      56      57      58      59      5:      5;      