using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
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
using static System.Net.Mime.MediaTypeNames;

namespace Lab8_SQL
{
    /// <summary>
    /// Логика взаимодействия для RemoveForm.xaml
    /// </summary>
    public partial class RemoveForm : Window
    {
        public RemoveForm()
        {
            InitializeComponent();
        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            int testStr;
            if(!int.TryParse(RemoveId.Text, out testStr))
            {
                RemoveId.Background = Brushes.Red;
                return;
            }

            //string sqlExpression = $"DELETE FROM clients WHERE id='{RemoveId.Text}'";

            //SqlCommand command = new SqlCommand(sqlExpression, SQLItems.connection);
            //int number = await command.ExecuteNonQueryAsync();
            //MessageBox.Show($"Удалено объектов: {number}");

            using (FC db = new FC())
            {
                var res = db.Clients.Where(c => c.Id == testStr);


                db.Clients.Remove(res.FirstOrDefault());
                db.SaveChanges();
            }
        }

        private void RemoveId_TextChanged(object sender, TextChangedEventArgs e)
        {
            RemoveId.Background = Brushes.White;
        }
    }
}
