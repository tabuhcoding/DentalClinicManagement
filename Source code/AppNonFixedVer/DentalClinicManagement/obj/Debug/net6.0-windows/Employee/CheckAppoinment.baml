   M S B A M L   `   `   `  ����Q  MDentalClinicManagement, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullQ-clr-namespace:DentalClinicManagement.EmployeeDentalClinicManagement.Employee  5      S.clr-namespace:DentalClinicManagement.Converter DentalClinicManagement.Converter  5      5    /DentalClinicManagement.Employee.CheckAppoinment   5      W SPresentationCore, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=6.0.2.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=6.0.2.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      ?local-clr-namespace:DentalClinicManagement.Employee     5      E
converters.clr-namespace:DentalClinicManagement.Converter     5        N� Title$  CheckAppointment��5
       � 	Resources 5      8   2DentalClinicManagement.Converter.AbsoluteConverter   absoluteConverter��%   &	          5   
   6'   5      .��5      �� 
�������.+�5   
   ��  �� Orientation$ Vertical=�6   .+�5      �� $	��100��6   $
��1200��6"   ���#39A7FF.+�5      �� $&�� Xem lịch rảnh của bác sĩ��6   $��40(�6<   $
��Bold"�6J   $
��Left=�6\   $��53��6w    �� Left$ 69��6�   
�������
 �� Top$ 23��6�   $��Center=�6�   $	��463��6�   �� 5      $��../images/teeth.jpg��6   $	��127��65   $	��112��6A   $
 1063��6N   $ -6��6a   5      �� 5      $ 
Horizontal=�6   .+�5      �� $	��634��6   $	��800��6&   
�������.+�5      �� -   5        $
��Date��5       $��Ngày��6,   $��20(�68   $��31��6F   $ 23��6R   
���   �$ 36��6v   $��55��6�   $��Center=�6�   $	��Top=�6�   (  "System.Windows.Controls.DatePicker  5      -   5        $��
datePicker��5   V   $	��300��6h   $��30��6t   $ 23��6�   $ 67��6�   �� 5      -   5        $��Schedule��5       $��Lịch hẹn��60   $��20(�6@   $��31��6N   $ 23��6Z   
���   �$	 112��6~   $	��100��6�   $��Center=�6�   $	��Top=�6�   �� 5      -   5        $��listView��5   B   $	��317��6R   $	��750��6_   $ 23��6k   $	 153��6|   $��Center=�6�   $	��Top=�6�    �� View 5      �� 5      .P�5   "   �� $��Giờ hẹn��61    �� Width$	 200��6B    �� DisplayMemberBinding 6N   �� *shift+�� 5   "   $��Bác sĩ��61   $	 150��6A    6M   �� *dentistName+�� 5   "   $��Ca��61   $	 150��6=    6I   �� *date+5       5"      5#      5$      5%      5'      5(      