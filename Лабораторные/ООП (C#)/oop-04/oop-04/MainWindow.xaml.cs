using Newtonsoft.Json;
using oop_04.MVVM.View;
using System;
using System.IO;
using System.Collections;
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
using oop_04.MVVM.ViewModel;
using System.Globalization;

namespace oop_04
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        enum lang
        {
            eng,
            rus
        }

        ResourceDictionary englishDictionary = new ResourceDictionary();
        ResourceDictionary russianDictionary = new ResourceDictionary();

        private lang currentLanguage;

        public MainWindow()
        {
            InitializeComponent();

            DataContext = new MainViewModel();
            ViewView.DataContext = new ViewViewModel(ViewView, (MainViewModel)DataContext);

            englishDictionary.Source = new Uri("lang.xaml", UriKind.RelativeOrAbsolute);
            russianDictionary.Source = new Uri("lang.ru-RU.xaml", UriKind.RelativeOrAbsolute);

            Application.Current.Resources.MergedDictionaries.Add(englishDictionary);
            currentLanguage = lang.eng;
        }

        private void ChangeLanguageClick(Object sender, EventArgs e)
        {
            switch (currentLanguage)
            {
                case lang.eng:
                    {
                        currentLanguage = lang.rus;
                        Application.Current.Resources.MergedDictionaries.Remove(englishDictionary);
                        Application.Current.Resources.MergedDictionaries.Add(russianDictionary);
                        break;
                    }
                case lang.rus:
                    {
                        currentLanguage = lang.eng;
                        Application.Current.Resources.MergedDictionaries.Remove(russianDictionary);
                        Application.Current.Resources.MergedDictionaries.Add(englishDictionary);
                        break;
                    }
            }
        }

        #region Lab7

        private void Parent_Click(object sender, RoutedEventArgs e)//Bubble
        {
            EventRouteLog.Text += "sender: " + ((Button)sender).Name + "\nsource" + ((Button)e.Source).Name + "\n";
        }

        private void Parent_PreviewMouseDown(object sender, MouseButtonEventArgs e)//Tunnel
        {
            EventRouteLogTunnel.Text += "sender: " + ((Button)sender).Name + "\nsource" + ((Button)e.Source).Name + "\n";
        }

        private void CommandBinding_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            MessageBox.Show(sender.ToString());
        }

        #endregion
    }
}