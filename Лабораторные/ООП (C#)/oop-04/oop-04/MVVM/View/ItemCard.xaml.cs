using oop_04.MVVM.ViewModel;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace oop_04.MVVM.View
{
    /// <summary>
    /// Логика взаимодействия для ItemCard.xaml
    /// </summary>
    public partial class ItemCard : UserControl
    {
        public ItemCard(HomeViewModel homeViewModel)
        {
            InitializeComponent();
            DataContext = new ItemCardViewModel(homeViewModel);
        }

        private void Card_Click(object sender, RoutedEventArgs e)
        {
            var mainWindow = (MainWindow)Application.Current.MainWindow;
            ((MainViewModel)mainWindow.DataContext).SetViewCard(sender);
        }
    }
}
