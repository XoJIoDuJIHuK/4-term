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
using System.Windows.Shapes;

namespace oop_04
{
    /// <summary>
    /// Логика взаимодействия для FilterWindow.xaml
    /// </summary>
    public partial class FilterWindow : Window
    {
        private HomeViewModel homeViewModel { get; set; }
        private FilterWindowViewModel filterWindowViewModel { get; set; }
        public FilterWindow(HomeViewModel hvm)
        {
            InitializeComponent();
            filterWindowViewModel = new FilterWindowViewModel(hvm, this);
            DataContext = filterWindowViewModel;
        }
    }
}
