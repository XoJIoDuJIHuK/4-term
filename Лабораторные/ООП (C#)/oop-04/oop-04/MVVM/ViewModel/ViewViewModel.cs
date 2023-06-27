using oop_04.MVVM.View;
using System.Windows;
using System.Windows.Input;

namespace oop_04.MVVM.ViewModel
{
    class ViewViewModel : DependencyObject
    {
        #region Commands

        #region Для лаб 6

        public static bool ValidateFullname(object obj)
        {
            if ((string)obj == "Invalid name") return false;//работает
            else return true;
        }
        public static object CorrectFullname(DependencyObject d, object baseValue)
        {
            if ((string)baseValue == string.Empty) return "Empty name";
            else return baseValue;
        }

        public DependencyProperty Lab6TextProperty = DependencyProperty.Register(
            "Lab6Text",
            typeof(string),
            typeof(ViewViewModel),
            new FrameworkPropertyMetadata() { CoerceValueCallback = new(CorrectFullname) },
            ValidateFullname);

        public string Lab6Text
        {
            get { return (string)GetValue(Lab6TextProperty); }
            set { SetValue(Lab6TextProperty, value); }
        }

        #endregion

        public ICommand saveCommand { get; set; }
        public ICommand cancelCommand { get; set; }
        public ICommand editCommand { get; set; }
        public ICommand deleteCommand { get; set; }
        #endregion

        public ViewView viewView { get; set; }
        public MainViewModel mainViewModel { get; set; }

        public ViewViewModel(ViewView vv, MainViewModel mvm)
        {
            viewView = vv;
            mainViewModel = mvm;
            saveCommand = new RelayCommand(Save);
            cancelCommand = new RelayCommand(Cancel);
            editCommand = new RelayCommand(Edit);
            deleteCommand = new RelayCommand(Delete);

            Lab6Text = "xrdfcgvhbjkl";
        }

        #region Methods
        private void Delete()
        {
            mainViewModel.DeleteCard();
        }
        private void Save()
        {
            mainViewModel.SaveCard();
        }
        private void Edit()
        {
            mainViewModel.EditCard();
        }
        private void Cancel()
        {
            mainViewModel.CancelEditing();
        }
        #endregion
    }
}
