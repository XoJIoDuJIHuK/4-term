using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
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
using System.Windows.Shapes;

namespace Lab8_SQL
{
    /// <summary>
    /// Логика взаимодействия для ShowForm.xaml
    /// </summary>
    public partial class ShowForm : Window
    {
        public ShowForm(MainWindow mv , string SQLScript)
        {
            InitializeComponent();

            string sqlExpression = SQLScript;

            //SqlCommand command = new SqlCommand(sqlExpression, SQLItems.connection);
            //SQLItems.reader = command.ExecuteReader();


            dynamic res ;

            using (FC db = new FC())
            {
                res = db.Clients;
            }

            //    if (SQLItems.reader.HasRows)
            //{
            //    // выводим названия столбцов
            //    string columnName0 = SQLItems.reader.GetName(0);
            //    string columnName1 = SQLItems.reader.GetName(1);
            //    string columnName2 = SQLItems.reader.GetName(2);
            //    string columnName3 = SQLItems.reader.GetName(3);
            //    string columnName4 = SQLItems.reader.GetName(4);
            //    string columnName5 = SQLItems.reader.GetName(5);
            //    string columnName6 = SQLItems.reader.GetName(6);

            //    Console.WriteLine($"{columnName0}\t{columnName1}\t{columnName2}\t{columnName3}\t{columnName4}\t{columnName5}\t{columnName6}");

            //    while (SQLItems.reader.Read()) // построчно считываем данные
            //    {
            //        object id = SQLItems.reader.GetValue(0);
            //        object first_name = SQLItems.reader.GetValue(1);
            //        object last_name = SQLItems.reader.GetValue(2);
            //        object date_of_birth = SQLItems.reader.GetValue(3);
            //        object email = SQLItems.reader.GetValue(4);
            //        object phone = SQLItems.reader.GetValue(5);
            //        object address = SQLItems.reader.GetValue(6);
            //        byte[] photo = (byte[])SQLItems.reader.GetValue(7);

            //        Items.Text +=
            //           ($"{id} \t{first_name} \t{last_name} \t{date_of_birth}" +
            //            $"\t{email} \t{phone} \t{address}\n");

            //        using (FileStream fs = new FileStream($@"D:\2k2s\OOP_MY\Lab8_SQL_1_2\Lab8_SQL\ImagesFromBD\SavedImgage_{id}.jpg", FileMode.OpenOrCreate))
            //        {
            //            fs.Write(photo, 0, photo.Length);
            //            Console.WriteLine($"Файл сохранен");
            //        }

                     
            //    }
            //}

            ///////////////////////////////////s////////////////////////////////////////////
            //

            //Close First
            //SQLItems.reader.Close();

            // Создаем объект DataAdapter
            SqlDataAdapter adapter = new SqlDataAdapter(SQLScript, new SqlConnection
            ((string)Application.Current.FindResource("TestEF")));
            // Создаем объект DataSet
            SQLItems.ds = new DataSet();
            // Заполняем Dataset
            adapter.Fill(SQLItems.ds);

            mv.phonesGrid.ItemsSource = SQLItems.ds.Tables[0].DefaultView;
        }
    }
}
