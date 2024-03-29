﻿using DentalClinicManagement;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using DentalClinicManagement.Customer;

namespace DentalClinicManagement.Account
{
    /// <summary>
    /// Interaction logic for SignUp.xaml
    /// </summary>
    

    public partial class SignUp : Page
    {
        public SignUp()
        {
            InitializeComponent();
        }

        private void WindowLoaded(object sender, RoutedEventArgs e)
        {
            
        }

        private void CompleteSignUpButton_Click(object sender, RoutedEventArgs e)
        {
            string dateStr = BirthDateTextBox.Text;
            DateTime birthDate;

            if (!DateTime.TryParseExact(dateStr, "dd/MM/yyyy", null, DateTimeStyles.None, out birthDate))
            {
                MessageBox.Show("Invalid date string format. Valid format is: dd/MM/yyyy");
            }

            // Tạo đối tượng Customer
            CustomerClass newCustomer = new CustomerClass
            {
                // Lấy thông tin từ giao diện người dùng
                Name = FullNameTextBox.Text,
                DateOfBirth = birthDate,
                Address = AddressTextBox.Text,
                PhoneNo = PhoneNumberTextBox.Text,
                Email = EmailTextBox.Text
            };

            // Thực hiện đăng ký và lưu vào database
            RegistryHelpers regist = new RegistryHelpers();
            if (regist.RegisterCustomer(newCustomer))
            {
                MainWindow? mainWindow = Application.Current.MainWindow as MainWindow;

                if (mainWindow != null && mainWindow.MainFrame != null)
                {
                    // Chuyển qua cửa sổ PasswordSignUp và chuyển số điện thoại từ SignUp qua
                    mainWindow.MainFrame.Navigate(new DentalClinicManagement.Account.PasswordSignUp(PhoneNumberTextBox.Text));
                }
            }
            else
            {
                MessageBox.Show("Đăng ký thất bại. Vui lòng thử lại.");
            }
        }

        private void OnBackButtonClick(object sender, RoutedEventArgs e)
        {
            MainWindow? mainWindow = Application.Current.MainWindow as MainWindow;


            if (mainWindow != null && mainWindow.MainFrame != null)
            {
                mainWindow.MainFrame.Navigate(new DentalClinicManagement.Account.Home());
            }
        }
    }

    public class RegistryHelpers
    {
        public bool RegisterCustomer(CustomerClass customer)
        {
            try
            {
                //DB dB = new DB();
                using (SqlConnection connection = DB.Instance.Connection)
                {
                    // Thực hiện thêm dữ liệu vào database
                    string query = "INSERT INTO Customer (Name, DateOfBirth, Address, PhoneNo) " +
                                   "VALUES (@Name, @DateOfBirth, @Address, @PhoneNo)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Name", customer.Name);
                        command.Parameters.AddWithValue("@DateOfBirth", customer.DateOfBirth);
                        command.Parameters.AddWithValue("@Address", customer.Address);
                        command.Parameters.AddWithValue("@PhoneNo", customer.PhoneNo);

                        command.ExecuteNonQuery();
                    }
                    return true;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error: {ex.Message}");
                return false;
            }
        }
    }
}
