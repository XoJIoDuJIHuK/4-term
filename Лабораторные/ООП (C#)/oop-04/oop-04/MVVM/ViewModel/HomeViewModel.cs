using oop_04.MVVM.View;
using oop_04.MVVM.ViewModel;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;

namespace oop_04
{
    public class HomeViewModel
    {
        public ICommand SearchCommand { get; set; }
        public ICommand FilterCommand { get; set; }
        private MainWindow _MainWindow = (MainWindow)Application.Current.MainWindow;
        private MainViewModel _MainViewModel { get; set; }
        public HomeView _HomeView { get; set; }
        public FilterWindow filterWindow { get; set; }
        private void Search()
        {
            _MainViewModel.ShowSearchResults(_HomeView.SearchTextBox.Text);
        }

        internal HomeViewModel(MainViewModel mvm)
        {
            SearchCommand = new RelayCommand(Search);
            FilterCommand = new RelayCommand(CallFilterWindow);
            _MainViewModel = mvm;
        }

        private void CallFilterWindow()
        {
            filterWindow = new(this);

            List<string> tagSet = new List<string>();
            foreach (var f in _MainViewModel.AllFlowers)
            {
                foreach (string tag in f.categories)
                {
                    bool exists = false;
                    foreach (string s in tagSet)
                    {
                        if (s.Equals(tag))
                        {
                            exists = true; 
                            break;
                        }
                    }
                    if (!exists)
                    {
                        tagSet.Add(tag);
                        var checkbox = new CheckBox();
                        checkbox.Content = tag;
                        filterWindow.TagCheckboxes.Children.Add(checkbox);
                    }
                }
            }

            filterWindow.CategoriesButton.Content = _MainViewModel.currentDictionary.categories;
            filterWindow.RangeButton.Content = _MainViewModel.currentDictionary.priceRange;
            filterWindow.SubmitFilter.Content = _MainViewModel.currentDictionary.submit;
            filterWindow.enginePowerLabel.Text = _MainViewModel.currentDictionary.Engine;
            filterWindow.amountLabel.Text = _MainViewModel.currentDictionary.amount;
            filterWindow.priceRangeLabel.Text = _MainViewModel.currentDictionary.priceRange;

            filterWindow.Show();
        }
        public void SubmitFilter(Query query)
        {
            _MainViewModel.ShowFilterResults(query);
        }
    }
}
