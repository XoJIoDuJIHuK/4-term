using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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
    /// Логика взаимодействия для SortForm.xaml
    /// </summary>
    public partial class SortForm : Window
    {
        MainWindow mv;

        public SortForm(MainWindow mv)
        {
            this.mv = mv;
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(SortItem.Text.Length != 0)
            {

                //ShowForm showForm = new ShowForm(mv,sqlExpression);
                //showForm.Show();

                // Создаем объект DataAdapter
                SqlDataAdapter adapter = new SqlDataAdapter($"select * from Clients order by  '{SortItem.Text}'", new SqlConnection
                ((string)Application.Current.FindResource("TestEF")));
                // Создаем объект DataSet
                SQLItems.ds = new DataSet();
                // Заполняем Dataset
                adapter.Fill(SQLItems.ds);

                mv.phonesGrid.ItemsSource = SQLItems.ds.Tables[0].DefaultView;
            }
        }
    }
}
