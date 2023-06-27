using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
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
    /// Логика взаимодействия для SearchForm.xaml
    /// </summary>
    public partial class SearchForm : Window
    {
        MainWindow _mv;

        public SearchForm(MainWindow mv)
        {
            _mv = mv;

            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(dateBT.Text == "")
            {
                dynamic res;

                using (FC db = new FC())
                {
                    res = db.Clients.Where(x => x.Name == NameT.Text);
                }

                // Создаем объект DataAdapter
                SqlDataAdapter adapter = new SqlDataAdapter($"select * from Clients where Name = '{NameT.Text}'", new SqlConnection
                ((string)Application.Current.FindResource("TestEF")));
                // Создаем объект DataSet
                SQLItems.ds = new DataSet();
                // Заполняем Dataset
                adapter.Fill(SQLItems.ds);

                _mv.phonesGrid.ItemsSource = SQLItems.ds.Tables[0].DefaultView;
            }

            else
            {
                dynamic res;

                using (FC db = new FC())
                {
                    res = db.Clients.Where(x => x.Name == NameT.Text && x.date_of_birth == dateBT.Text);
                }

                // Создаем объект DataAdapter
                SqlDataAdapter adapter = new SqlDataAdapter($"select * from Clients where Clients.Name = '{NameT.Text}' and Clients.date_of_birth = '{dateBT.Text}' ", new SqlConnection
                ((string)Application.Current.FindResource("TestEF")));
                // Создаем объект DataSet
                SQLItems.ds = new DataSet();
                // Заполняем Dataset
                adapter.Fill(SQLItems.ds);

                _mv.phonesGrid.ItemsSource = SQLItems.ds.Tables[0].DefaultView;
            }

            
        }
    }
}
