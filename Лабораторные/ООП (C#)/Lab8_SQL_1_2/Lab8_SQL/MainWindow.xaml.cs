using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
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

namespace Lab8_SQL
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    /// 

    static class SQLItems 
    {
        public static SqlConnection connection = new SqlConnection
            ((string)Application.Current.FindResource("OtherEntersMyConnectionString"));

        public static SqlDataReader reader;

        public static DataSet ds;
    }

    public partial class MainWindow : Window
    {
        

        public MainWindow()
        {
            InitializeComponent();

            DataContext = SQLItems.ds;

            Lab9.CreateModels();

            try
            {
                SQLItems.connection.Open();
            }
            catch (Exception)
            {
                // Создание базы данных
                string connectionString = (string)Application.Current.FindResource("FirstEnterMyConnectionString");
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand("CREATE DATABASE fitness_center", connection);
                    command.ExecuteNonQuery();
                }

                // Выполнение скриптов создания таблиц и других объектов базы данных
                string createTablesScript = File.ReadAllText("D:\\BSTU\\2course\\2term\\ООП\\Lab8_SQL_1_2\\Lab8_SQL");
                using (var connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand command = new SqlCommand(createTablesScript, connection);
                    command.ExecuteNonQuery();
                }

                Thread.Sleep(5000);
                SQLItems.connection.Open();
            }

            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            AddForm addForm = new AddForm();
            addForm.Show();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            RemoveForm removeForm = new RemoveForm();
            removeForm.Show();
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            EditForm editForm = new EditForm();
            editForm.Show();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            ShowForm showForm = new ShowForm(this, "SELECT * FROM Clients");
            //showForm.Show();
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            SortForm sortForm = new SortForm(this);
            sortForm.Show();
        }

       

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            string proc1 = @"CREATE PROCEDURE [dbo].[addClients]
                                @first_name varchar(255),
                                @last_name varchar(255),
                                @date_of_birth date,
                                @email varchar(255),
                                @phone varchar(20),
                                @address varchar(255),
                                @photo varbinary(MAX)
                            AS
                                INSERT INTO clients (first_name, last_name, date_of_birth, email, phone, address, photo)
                                VALUES (@first_name, @last_name, @date_of_birth, @email, @phone, @address, @photo)
   
                                SELECT SCOPE_IDENTITY()
                            GO";

            string proc2 = @"CREATE PROCEDURE [dbo].[getClients]
                                AS
                                    SELECT * FROM clients 
                                GO";

            SqlTransaction transaction = SQLItems.connection.BeginTransaction();

            SqlCommand command = SQLItems.connection.CreateCommand();
            command.Transaction = transaction;

            try
            {
                command.CommandText = proc1;
                command.ExecuteNonQuery();
                command.CommandText = proc2;
                command.ExecuteNonQuery();

                transaction.Commit();

                MessageBox.Show("Хранимые процедуры добавлены в базу данных.");
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                transaction.Rollback();
            }

            
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            SW.ScrollToEnd();
        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
            SW.ScrollToHome();
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {
            SearchForm searchForm = new SearchForm(this);
            searchForm.Show();
        }
    }
}
