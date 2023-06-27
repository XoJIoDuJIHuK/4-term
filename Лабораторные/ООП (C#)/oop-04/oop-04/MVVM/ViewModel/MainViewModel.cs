using Newtonsoft.Json;
using oop_04.Core;
using oop_04.MVVM.View;
using Prism.Commands;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media.Imaging;

namespace oop_04.MVVM.ViewModel
{
    internal class MainViewModel : ObservableObject
    {
        #region Commands

        public CompositeCommand homeViewClick { get; set; }
        public CompositeCommand viewViewClick { get; set; }

        public ICommand showHomeView { get; set; }
        public ICommand hideHomeView { get; set; }
        public ICommand showViewView { get; set; }
        public ICommand hideViewView { get; set; }

        public ICommand addNewCard { get; set; }
        public ICommand saveCardsToFile { get; set; }
        public ICommand switchLanguage { get; set; }

        public ICommand undo { get; set; }
        public ICommand redo { get; set; }
        private Stack<MementoAction> previousSteps = new();
        private Stack<MementoAction> followingSteps = new();


        public ICommand biggestCommand { get; set; }
        public ICommand bigCommand { get; set; }
        public ICommand smallCommand { get; set; }
        public void Biggest() { MessageBox.Show("biggest"); }
        public void Big() { MessageBox.Show("big"); }
        public void Small() { MessageBox.Show("small"); }

        public static readonly RoutedUICommand MyCustomCommand =
        new RoutedUICommand(
            "My Custom Command",
            "MyCustomCommand",
            typeof(MainViewModel),
            new InputGestureCollection()
            {
                new KeyGesture(Key.C, ModifierKeys.Control)
            });

        #endregion

        private MainWindow mainWindow = (MainWindow)Application.Current.MainWindow;
        private HomeViewModel homeViewModel;

        public MainViewModel()
        {
            #region Command Setups
            addNewCard = new RelayCommand(AddNewCard);
            saveCardsToFile = new RelayCommand(WriteFlowersToFile);
            switchLanguage = new RelayCommand(SwitchLanguage);

            showHomeView = new RelayCommand(ShowHomeView);
            hideHomeView = new RelayCommand(HideHomeView);
            showViewView = new RelayCommand(ShowViewView);
            hideViewView = new RelayCommand(HideViewView);

            homeViewClick = new();
            homeViewClick.RegisterCommand(showHomeView);
            homeViewClick.RegisterCommand(hideViewView);

            viewViewClick = new();
            viewViewClick.RegisterCommand(showViewView);
            viewViewClick.RegisterCommand(hideHomeView);

            undo = new RelayCommand(Undo);
            redo = new RelayCommand(Redo);

            biggestCommand = new RelayCommand(Biggest);
            bigCommand = new RelayCommand(Big);
            smallCommand = new RelayCommand(Small);

            #endregion

            currentDictionary = rus;
            UpdateLocalization();
            ReadFlowersFromFile();
            if (Flowers.Count > 0)
            {
                currentViewCard = Flowers[0];
                currentViewCardIndex = 0;
            }
            else
            {
                currentViewCard = new Flower();
                currentViewCardIndex = -1;
            }
            UpdateViewView();
            UpdateHomeViewGoodStats();

            homeViewClick.Execute(null);

            homeViewModel = new HomeViewModel(this);
            homeViewModel._HomeView = mainWindow.HomeView;
            mainWindow.HomeView.DataContext = homeViewModel;
        }

        private static Flower currentViewCard = new Flower();
        private static int currentViewCardIndex = 0;
        private static string path = "goods.json";
        private List<Flower> Flowers = new List<Flower>();//shown flowers
        public List<Flower> AllFlowers = new List<Flower>();//all flowers

        #region IO
        private void WriteFlowersToFile()
        {
            File.WriteAllText(path, JsonConvert.SerializeObject(Flowers));
        }
        private void ReadFlowersFromFile()
        {
            List<Flower> deser = JsonConvert.DeserializeObject<List<Flower>>(File.ReadAllText(path));
            AllFlowers = deser == null ? new List<Flower>() : deser;
            Flowers = AllFlowers;
        }
        #endregion

        #region Dictionaries
        public class DictionaryForApp
        {
            public string flowerShop = "";
            public string home = "";
            public string view = "";
            public string add = "";
            public string Title = "";
            public string Armour = "";
            public string Mass = "";
            public string VAA = "";
            public string Engine = "";
            public string RelativePower = "";
            public string Speed = "";
            public string sort = "";
            public string langButton = "";
            public string fullName = "";
            public string rating = "";
            public string price = "";
            public string amount = "";
            public string desc = "";
            public string delete = "";
            public string save = "";
            public string edit = "";
            public string cancel = "";

            public string categories = "";
            public string priceRange = "";
            public string submit = "";
            public string filter = "";
            public string search = "";

            public List<string> pathsToImages = new List<string>();
        }
        private static DictionaryForApp rus = new()
        {
            flowerShop = "Цветочный магазин",
            home = "Главная",
            view = "Просмотр",
            add = "Добавление",
            Title = "Название",
            Armour = "Броня, мм",
            Mass = "Масса, т",
            VAA = "УВН, град",
            Engine = "Двигатель, л.с.",
            RelativePower = "УМ, л.с./т",
            Speed = "Макс. скорость, км/ч",
            filter = "Фильтр",
            sort = "Сортировка",
            langButton = "РУС",
            fullName = "Полное название",
            rating = "Рейтинг",
            price = "Цена, $",
            amount = "Количество",
            desc = "Описание",
            delete = "Удалить",
            save = "Сохранить",
            edit = "Изменить",
            cancel = "Отменить",
            pathsToImages =
            {
                "Путь к основному изображению",
                "Путь к первому дополнительному изображению",
                "Путь ко второму дополнительному изображению"
            },

            categories = "Категории",
            priceRange = "Диапазон цен",
            submit = "Подтвердить",
            search = "Поиск"
        };
        private static DictionaryForApp en = new()
        {
            flowerShop = "Flower Shop",
            home = "Main",
            view = "View",
            add = "Add",
            Title = "Title",
            Armour = "Armour, mm",
            Mass = "Mass, t",
            VAA = "VAA, deg",
            Engine = "Engine, h.p.",
            RelativePower = "RP, h.p./t",
            Speed = "Max. speed, km/h",
            filter = "Filter",
            sort = "Sort",
            langButton = "EN",
            fullName = "Full name",
            rating = "Rating",
            price = "Price, $",
            amount = "Amount",
            desc = "Description",
            delete = "Delete",
            save = "Save",
            edit = "Edit",
            cancel = "Cancel",
            pathsToImages =
            {
                "Path to main image",
                "Path to first additional image",
                "Path to second additional image"
            },

            categories = "Categories",
            priceRange = "Price range",
            submit = "Submit",
            search = "Search"
        };
        public DictionaryForApp currentDictionary = en;
        public void UpdateLocalization()
        {
            //mainWindow.ShopName.Text = currentDictionary.flowerShop;
            //mainWindow.RadioButtonHome.Content = currentDictionary.home;
            //mainWindow.RadioButtonView.Content = currentDictionary.view;
            //mainWindow.RadioButtonAdd.Content = currentDictionary.add;
            //mainWindow.CurrentLanguage.Text = currentDictionary.langButton;
            //mainWindow.SaveButtonTextBlock.Text = currentDictionary.save;

            //var vv = mainWindow.ViewView.ViewViewItemCard;
            //vv.Left0.Text = currentDictionary.fullName;
            //vv.Left1.Text = currentDictionary.Mass;
            //vv.Left2.Text = currentDictionary.Armour;
            //vv.Left3.Text = currentDictionary.VAA;
            //vv.Left4.Text = currentDictionary.Engine;
            //vv.Left5.Text = currentDictionary.RelativePower;
            //vv.Left6.Text = currentDictionary.Speed;
            //vv.Left7.Text = currentDictionary.rating;
            //vv.Left8.Text = currentDictionary.price;
            //vv.Left9.Text = currentDictionary.amount;
            //vv.Left10.Text = currentDictionary.desc;
            //vv.Left11.Text = currentDictionary.Title;
            //vv.Left12.Text = currentDictionary.pathsToImages[0];
            //vv.Left13.Text = currentDictionary.pathsToImages[1];
            //vv.Left14.Text = currentDictionary.pathsToImages[2];
            //mainWindow.ViewView.DeleteTextBlock.Text = currentDictionary.delete;
            //mainWindow.ViewView.EditTextBlock.Text = currentDictionary.edit;
            //mainWindow.ViewView.SaveTextBlock.Text = currentDictionary.save;
            //mainWindow.ViewView.CancelTextBlock.Text = currentDictionary.cancel;

            //var hv = mainWindow.HomeView;
            //hv.SearchButton.Content = currentDictionary.search;
            //hv.OpenFilterWindowButton.Content = currentDictionary.filter;

            //var cards = mainWindow.HomeView.ItemCards.Children;
            //foreach (ItemCard card in cards)
            //{
            //    setCurrentCardLeftFields(card);
            //}
        }
        private void SwitchLanguage()
        {
            currentDictionary = (currentDictionary == rus) ? en : rus;
            UpdateLocalization();
        }
        #endregion

        #region ViewView Interactions
        public void SetImageSource(Image i, string path)
        {
            try
            {
                if (!string.IsNullOrEmpty(path))
                {
                    BitmapImage bitmap = new BitmapImage(new Uri(path, UriKind.RelativeOrAbsolute));
                    i.Source = bitmap;
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                mainWindow.Close();
            }
        }
        public void DeleteCard()
        {
            if (currentViewCardIndex != -1)
            {
                previousSteps.Push(new MementoAction(Actions.Delete, Flowers[currentViewCardIndex], 
                    null));

                Flowers.RemoveAt(currentViewCardIndex);
                currentViewCardIndex = Flowers.Count > 0 ? 0 : -1;
                if (currentViewCardIndex == -1)
                {
                    Flowers.Add(new Flower());
                    currentViewCardIndex = 0;
                    currentViewCard = Flowers[0];
                }
                else
                {
                    currentViewCard = Flowers[currentViewCardIndex];
                    mainWindow.HomeView.ItemCards.Children.RemoveAt(currentViewCardIndex);
                }
                UpdateViewView();
                UpdateHomeViewGoodStats();
            }
        }
        private void SwitchVVICReadOnlybility(ViewItemCard c)
        {
            c.Right0.InnerTextBox.IsReadOnly = !c.Right0.InnerTextBox.IsReadOnly;
            c.Right1.InnerTextBox.IsReadOnly = !c.Right1.InnerTextBox.IsReadOnly;
            c.Right2.InnerTextBox.IsReadOnly = !c.Right2.InnerTextBox.IsReadOnly;
            c.Right3.InnerTextBox.IsReadOnly = !c.Right3.InnerTextBox.IsReadOnly;
            c.Right4.InnerTextBox.IsReadOnly = !c.Right4.InnerTextBox.IsReadOnly;
            c.Right5.InnerTextBox.IsReadOnly = !c.Right5.InnerTextBox.IsReadOnly;
            c.Right6.InnerTextBox.IsReadOnly = !c.Right6.InnerTextBox.IsReadOnly;
            c.Right7.InnerTextBox.IsReadOnly = !c.Right7.InnerTextBox.IsReadOnly;
            c.Right8.InnerTextBox.IsReadOnly = !c.Right8.InnerTextBox.IsReadOnly;
            c.Right9.InnerTextBox.IsReadOnly = !c.Right9.InnerTextBox.IsReadOnly;
            c.Right10.InnerTextBox.IsReadOnly = !c.Right10.InnerTextBox.IsReadOnly;
            c.Right11.InnerTextBox.IsReadOnly = !c.Right11.InnerTextBox.IsReadOnly;
            c.Right12.InnerTextBox.IsReadOnly = !c.Right12.InnerTextBox.IsReadOnly;
            c.Right13.InnerTextBox.IsReadOnly = !c.Right13.InnerTextBox.IsReadOnly;
            c.Right14.InnerTextBox.IsReadOnly = !c.Right14.InnerTextBox.IsReadOnly;

            c.Left11.Visibility = c.Left11.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
            c.Left12.Visibility = c.Left12.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
            c.Left13.Visibility = c.Left13.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
            c.Left14.Visibility = c.Left14.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
            c.Right11.Visibility = c.Right11.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
            c.Right12.Visibility = c.Right12.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
            c.Right13.Visibility = c.Right13.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
            c.Right14.Visibility = c.Right14.Visibility == Visibility.Collapsed ? Visibility.Visible : Visibility.Collapsed;
        }
        public void SaveCard()
        {
            Flower state = new();
            state.MemberviseClone(Flowers[currentViewCardIndex]);
            previousSteps.Push(new MementoAction(Actions.EditFlower, state,
                Flowers[currentViewCardIndex]));

            mainWindow.ViewView.EditItemCard.Visibility = Visibility.Visible;
            mainWindow.ViewView.DeleteItemCard.Visibility = Visibility.Visible;

            var f = Flowers[currentViewCardIndex];
            var c = mainWindow.ViewView.ViewViewItemCard;
            f.fullName = c.Right0.Text;
            f.mass = double.Parse(c.Right1.Text);
            f.armor = c.Right2.Text;
            f.vaa = c.Right3.Text;
            f.enginePower = int.Parse(c.Right4.Text);
            f.hppt = double.Parse(c.Right5.Text);
            f.speed = int.Parse(c.Right6.Text);
            f.rating = double.Parse(c.Right7.Text);
            f.price = double.Parse(c.Right8.Text);
            f.amount = int.Parse(c.Right9.Text);
            f.desc = c.Right10.Text;
            f.name = c.Right11.Text;
            f.path = c.Right12.Text;
            f.addPic1 = c.Right13.Text;
            f.addPic2 = c.Right14.Text;

            c.Right11.Text = "";
            c.Right12.Text = "";
            c.Right13.Text = "";
            c.Right14.Text = "";

            SwitchVVICReadOnlybility(c);
            mainWindow.ViewView.SaveItemCard.Visibility = Visibility.Collapsed;
            mainWindow.ViewView.CancelEditingCard.Visibility = Visibility.Collapsed;
            UpdateViewView();
            UpdateHomeViewGoodStats();
        }
        public void CancelEditing()
        {
            mainWindow.ViewView.EditItemCard.Visibility = Visibility.Visible;
            mainWindow.ViewView.DeleteItemCard.Visibility = Visibility.Visible;

            var f = Flowers[currentViewCardIndex];
            var c = mainWindow.ViewView.ViewViewItemCard;
            c.Right0.Text = f.fullName;
            c.Right1.Text = f.mass.ToString();
            c.Right2.Text = f.armor;
            c.Right3.Text = f.vaa;
            c.Right4.Text = f.enginePower.ToString();
            c.Right5.Text = f.hppt.ToString();
            c.Right6.Text = f.speed.ToString();
            c.Right7.Text = f.rating.ToString();
            c.Right8.Text = f.price.ToString();
            c.Right9.Text = f.amount.ToString();
            c.Right10.Text = f.desc;

            c.Right11.Text = "";
            c.Right12.Text = "";
            c.Right13.Text = "";
            c.Right14.Text = "";

            SwitchVVICReadOnlybility(c);
            mainWindow.ViewView.SaveItemCard.Visibility = Visibility.Collapsed;
            mainWindow.ViewView.CancelEditingCard.Visibility = Visibility.Collapsed;
            UpdateViewView();
            UpdateHomeViewGoodStats();
        }
        public void EditCard()
        {
            mainWindow.ViewView.EditItemCard.Visibility = Visibility.Collapsed;
            mainWindow.ViewView.DeleteItemCard.Visibility = Visibility.Collapsed;

            var c = mainWindow.ViewView.ViewViewItemCard;

            c.Right11.Text = currentViewCard.name;
            c.Right12.Text = currentViewCard.path;
            c.Right13.Text = currentViewCard.addPic1;
            c.Right14.Text = currentViewCard.addPic2;

            SwitchVVICReadOnlybility(c);
            mainWindow.ViewView.SaveItemCard.Visibility = Visibility.Visible;
            mainWindow.ViewView.CancelEditingCard.Visibility = Visibility.Visible;
        }
        #endregion

        #region Updates
        public void setCurrentCardLeftFields(ItemCard card)
        {
            card.Left0.Text = currentDictionary.Title;
            card.Left1.Text = currentDictionary.Mass;
            card.Left2.Text = currentDictionary.Armour;
            card.Left3.Text = currentDictionary.VAA;
            card.Left4.Text = currentDictionary.Engine;
            card.Left5.Text = currentDictionary.RelativePower;
            card.Left6.Text = currentDictionary.Speed;
        }
        public void UpdateHomeViewGoodStats()
        {
            while (mainWindow.HomeView.ItemCards.Children.Count > Flowers.Count)
            {
                mainWindow.HomeView.ItemCards.Children.
                    RemoveAt(mainWindow.HomeView.ItemCards.Children.Count - 1);
            }
            while (Flowers.Count > mainWindow.HomeView.ItemCards.Children.Count)
                mainWindow.HomeView.ItemCards.Children.Add(new ItemCard(homeViewModel));
            for (int i = 0; i < Flowers.Count; i++)
            {
                ItemCard c = (ItemCard)mainWindow.HomeView.ItemCards.Children[i];
                setCurrentCardLeftFields(c);
                SetImageSource(c.Image, Flowers[i].path);
                c.Right0.Text = Flowers[i].name;
                c.Right1.Text = Flowers[i].mass.ToString();
                c.Right2.Text = Flowers[i].armor;
                c.Right3.Text = Flowers[i].vaa;
                c.Right4.Text = Flowers[i].enginePower.ToString();
                c.Right5.Text = Flowers[i].hppt.ToString();
                c.Right6.Text = Flowers[i].speed.ToString();
            }
        }
        public void UpdateViewView()
        {
            var vv = mainWindow.ViewView.ViewViewItemCard;
            vv.Right0.Text = currentViewCard.fullName;
            vv.Right1.Text = currentViewCard.mass.ToString();
            vv.Right2.Text = currentViewCard.armor;
            vv.Right3.Text = currentViewCard.vaa;
            vv.Right4.Text = currentViewCard.enginePower.ToString();
            vv.Right5.Text = currentViewCard.hppt.ToString();
            vv.Right6.Text = currentViewCard.speed.ToString();
            vv.Right7.Text = currentViewCard.rating.ToString();
            vv.Right8.Text = currentViewCard.price.ToString();
            vv.Right9.Text = currentViewCard.amount.ToString();
            vv.Right10.Text = currentViewCard.desc;
            vv.Right11.Text = currentViewCard.name;
            vv.Right12.Text = currentViewCard.path;
            vv.Right13.Text = currentViewCard.addPic1;
            vv.Right14.Text = currentViewCard.addPic2;

            SetImageSource(vv.img1, currentViewCard.path);
            SetImageSource(vv.img2, currentViewCard.addPic1);
            SetImageSource(vv.img3, currentViewCard.addPic2);
        }
        #endregion

        #region Radio Button Interactions
        private void ShowHomeView()
        {
            mainWindow.HomeView.Visibility = Visibility.Visible;
            mainWindow.RadioButtonHome.IsChecked = true;
        }
        private void HideHomeView()
        {
            mainWindow.HomeView.Visibility = Visibility.Collapsed;
        }
        private void ShowViewView()
        {
            mainWindow.ViewView.Visibility = Visibility.Visible;
            mainWindow.RadioButtonView.IsChecked = true;
        }
        private void HideViewView()
        {
            mainWindow.ViewView.Visibility = Visibility.Collapsed;
        }

        private void AddNewCard()
        {
            mainWindow.HomeView.Visibility = Visibility.Collapsed;
            mainWindow.ViewView.Visibility = Visibility.Visible;

            Flowers.Add(new Flower());
            currentViewCard = Flowers[Flowers.Count - 1];
            currentViewCardIndex = Flowers.Count - 1;

            mainWindow.RadioButtonView.IsChecked = true;
            UpdateViewView();
            EditCard();

            previousSteps.Push(new MementoAction(Actions.Add, currentViewCard, null));
        }
        #endregion

        public void SetViewCard(object sender)
        {
            var c = sender as ItemCard;
            if (c == null) return;
            viewViewClick.Execute(this);
            for (int i = 0; i < Flowers.Count; i++)
            {
                if (Flowers[i].name.Equals(c.Right0.Text))
                {
                    currentViewCard = Flowers[i];
                    currentViewCardIndex = i;
                    UpdateViewView();
                    return;
                }
            }
            UpdateViewView();
        }

        #region VIT//VERY important tasks
        public void ShowSearchResults(string query)
        {
            if (string.IsNullOrEmpty(query))
            {
                Flowers = AllFlowers;
            }
            else
            {
                var result = from f in AllFlowers
                             where f.ToString().Contains(query.ToLower())
                             select f;
                Flowers = new List<Flower>();
                foreach (var f in result )
                {
                    Flowers.Add(f);
                }
            }
            UpdateHomeViewGoodStats();
        }
        public void ShowFilterResults(Query query)
        {
            Flowers = new();
            foreach (var f in AllFlowers)
            {
                bool isMatched = true;
                switch (query.mode.ToString())
                {
                    case "Categories":
                        {
                            if (!string.IsNullOrEmpty(query.amount) && !query.amount.Equals("Value"))
                            {
                                if (f.amount.ToString() != query.amount)
                                {
                                    isMatched = false;
                                    break;
                                }
                            }
                            if (!string.IsNullOrEmpty(query.enginePower) && !query.enginePower.Equals("Value"))
                            {
                                if (f.enginePower.ToString() != query.enginePower)
                                {
                                    isMatched = false;
                                    break;
                                }
                            }
                            break;
                        }
                    case "PriceRange":
                        {
                            if (f.price > query.upperLimit || f.price < query.lowerLimit) isMatched = false;
                            break;
                        }
                    case "Tags":
                        {
                            foreach (string tag in query.tags)
                            {
                                if (!f.categories.Contains(tag))
                                {
                                    isMatched = false;
                                    break;
                                }
                            }
                            break;
                        }
                }
                if (isMatched) Flowers.Add(f);
            }
            UpdateHomeViewGoodStats();
        }

        public void Undo()
        {
            if (previousSteps.Count > 0)
            {
                MementoAction action = previousSteps.Pop();

                switch (action.type)
                {
                    case Actions.Add:
                        {
                            followingSteps.Push(new MementoAction(Actions.Delete, action.state, null));
                            
                            AllFlowers.Remove(action.state);
                            
                            UpdateViewView();
                            UpdateHomeViewGoodStats();
                            break;
                        }
                    case Actions.Delete:
                        {
                            AllFlowers.Add(action.state);
                            
                            UpdateViewView();
                            UpdateHomeViewGoodStats();
                            followingSteps.Push(new MementoAction(Actions.Add, action.state, null));
                            break;
                        }
                    case Actions.EditFlower:
                        {
                            followingSteps.Push(new MementoAction(Actions.EditFlower, action.state,
                                action.changedObject));
                            action.changedObject?.MemberviseClone(action.state);
                            UpdateViewView();
                            UpdateHomeViewGoodStats();
                            break;
                        }
                }
            }
        }
        public void Redo()
        {
            if (followingSteps.Count > 0)
            {
                MementoAction action = followingSteps.Pop();

                switch (action.type)
                {
                    case Actions.Add:
                        {
                            previousSteps.Push(new MementoAction(Actions.Delete, action.state, null));
                            AllFlowers.Remove(action.state);
                            UpdateViewView();
                            UpdateHomeViewGoodStats();
                            break;
                        }
                    case Actions.Delete:
                        {
                            AllFlowers.Add(action.state);
                            UpdateViewView();
                            UpdateHomeViewGoodStats();
                            previousSteps.Push(new MementoAction(Actions.Add, action.state, null));
                            break;
                        }
                    case Actions.EditFlower:
                        {
                            previousSteps.Push(new MementoAction(Actions.EditFlower, action.state,
                                action.changedObject));
                            action.changedObject?.MemberviseClone(action.state);
                            UpdateViewView();
                            UpdateHomeViewGoodStats();
                            break;
                        }
                }
            }
        }

        #endregion
    }
}
