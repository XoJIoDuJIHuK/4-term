using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Lab8_SQL
{
    /// <summary>
    /// Логика взаимодействия для EditForm.xaml
    /// </summary>
    public partial class EditForm : Window
    {
        public EditForm()
        {
            InitializeComponent();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            first_name.Text = "Nikita";
            last_name.Text = "Ilyin";
            date_of_birth.Text = "2004-01-05";
            email.Text = "lox@gmail.com";
            phone.Text = "+375293579110";
            address.Text = "Zlobin";
        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            int testStr;
            if (!int.TryParse(id.Text, out testStr))
            {
                id.Background = Brushes.Red;
                return;
            }

            // Делаю валтдацию :D
            if (!Regex.IsMatch(first_name.Text, "^[A-Za-zА-Яа-я]+$"))
            {
                first_name.Background = Brushes.Red;
                return;
            }

            if (!Regex.IsMatch(last_name.Text, "^[A-Za-zА-Яа-я]+$"))
            {
                last_name.Background = Brushes.Red;
                return;
            }

            DateTime dateValue = new DateTime();
            if (Regex.IsMatch(date_of_birth.Text, "^[0-9]{4}-(0[1-9]|1[0-2])-([0-2][1-9]|3[0-1])$"))
            {

                if (!DateTime.TryParse(date_of_birth.Text, out dateValue))
                {
                    date_of_birth.Background = Brushes.Red;
                    return;
                }

                if (dateValue.Year < 1900 || dateValue.Year >= 2023)
                {
                    date_of_birth.Background = Brushes.Red;
                    return;
                }
            }
            else
            {
                date_of_birth.Background = Brushes.Red;
                return;
            }

            if (!Regex.IsMatch(email.Text, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                email.Background = Brushes.Red;
                return;
            }

            if (!Regex.IsMatch(phone.Text, @"^\+375(17|25|29|33|44)\d{7}$"))
            {
                phone.Background = Brushes.Red;
                return;
            }

            //string sqlExpression = 
            //    $"UPDATE clients SET " +
            //    $"first_name  = '{first_name.Text}', " +
            //    $"last_name  = '{last_name.Text}', " +
            //    $"date_of_birth  = '{date_of_birth.Text}', " +
            //    $"email  = '{email.Text}', " +
            //    $"phone  = '{phone.Text}', " +
            //    $"address  = '{address.Text}' " +
            //    $"WHERE id = '{id.Text}' ";

            //SqlCommand command = new SqlCommand(sqlExpression, SQLItems.connection);
            //int number = await command.ExecuteNonQueryAsync();
            //MessageBox.Show($"Изменено объектов: {number}");

            using (FC db = new FC())
            {
                //Clients cl = new Clients { Name = first_name.Text, date_of_birth = date_of_birth.Text };

                Clients cl = db.Clients.Find(int.Parse(id.Text));

                cl.Name = first_name.Text;
                cl.date_of_birth = date_of_birth.Text;

                //db.Clients.Add(cl);
                db.SaveChanges();
            }
        }

        // Делаю валтдацию :D
        private void first_name_TextChanged(object sender, TextChangedEventArgs e)
        {
            first_name.Background = Brushes.White;
        }

        private void last_name_TextChanged(object sender, TextChangedEventArgs e)
        {
            last_name.Background = Brushes.White;
        }

        private void date_of_birth_TextChanged(object sender, TextChangedEventArgs e)
        {
            date_of_birth.Background = Brushes.White;
        }

        private void email_TextChanged(object sender, TextChangedEventArgs e)
        {
            email.Background = Brushes.White;
        }

        private void phone_TextChanged(object sender, TextChangedEventArgs e)
        {
            phone.Background = Brushes.White;
        }

        private void id_TextChanged(object sender, TextChangedEventArgs e)
        {
            id.Background = Brushes.White;
        }
    }
}
