using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace oop_04.MVVM.ViewModel
{
    internal class FilterWindowViewModel
    {
        public ICommand FilterCommand { get; set; }
        private HomeViewModel homeViewModel { get; set; }
        private FilterWindow filterWindow { get; set; }
        public FilterWindowViewModel(HomeViewModel hvm, FilterWindow fw)
        {
            filterWindow = fw;
            homeViewModel = hvm;
            FilterCommand = new RelayCommand(SubmitFilter);
        }
        private void SubmitFilter()
        {
            List<string> tags = new();
            foreach(CheckBox c in filterWindow.TagCheckboxes.Children)
            {
                if ((bool)c.IsChecked)
                {
                    tags.Add(c.Content.ToString());
                }
            }
            int.TryParse(filterWindow.priceRangeLowerTextBox.Text, out int lower);
            int.TryParse(filterWindow.priceRangeHigherTextBox.Text, out int higher);
            Query.Mode mode = (bool)filterWindow.CategoriesButton.IsChecked ? Query.Mode.Categories :
                ((bool)filterWindow.TagsButton.IsChecked ? Query.Mode.Tags : Query.Mode.PriceRange);
            homeViewModel.SubmitFilter(new Query(
                filterWindow.enginePowerTextBox.Text,
                filterWindow.amountTextBox.Text,
                lower,
                higher,
                mode,
                tags));
            filterWindow.Close();
        }
    }
}
