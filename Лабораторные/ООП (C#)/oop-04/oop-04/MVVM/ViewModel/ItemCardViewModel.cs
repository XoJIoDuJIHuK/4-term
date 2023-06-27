using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace oop_04.MVVM.ViewModel
{
    internal class ItemCardViewModel
    {
        private HomeViewModel _homeViewModel;
        public ItemCardViewModel(HomeViewModel homeViewModel)
        {
            _homeViewModel = homeViewModel;
        }
    }
}
