using Lab9_EF.Unit_of_Work;
using Microsoft.Data.SqlClient;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.StartPanel;

namespace Lab8_SQL
{
    /// <summary>
    /// Логика взаимодействия для AddForm.xaml
    /// </summary>
    public partial class AddForm : Window
    {
        private UnitOfWork context;

        public AddForm()
        {
            InitializeComponent();

            context = new UnitOfWork();
        }

        private async void Button_Click(object sender, RoutedEventArgs e)
        {
            // Делаю валтдацию :D
            if (!Regex.IsMatch(first_name.Text, "^[A-Za-zА-Яа-я]+$"))
            {
                first_name.Background = Brushes.Red;
                return;
            }

            if (!Regex.IsMatch(last_name.Text, "^[A-Za-zА-Яа-я]+$"))
            {
                last_name.Background = Brushes.Red;
                return;
            }

            DateTime dateValue = new DateTime();
            if (Regex.IsMatch(date_of_birth.Text, "^[0-9]{4}-(0[1-9]|1[0-2])-([0-2][1-9]|3[0-1])$"))
            {
                
                if (!DateTime.TryParse(date_of_birth.Text, out dateValue))
                {
                    date_of_birth.Background = Brushes.Red;
                    return;
                }

                if (dateValue.Year < 1900 || dateValue.Year >= 2023)
                {
                    date_of_birth.Background = Brushes.Red;
                    return;
                }
            }
            else
            {
                date_of_birth.Background = Brushes.Red;
                    return;
            }

            if (!Regex.IsMatch(email.Text, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                email.Background = Brushes.Red;
                return;
            }

            if (!Regex.IsMatch(phone.Text, @"^\+375(17|25|29|33|44)\d{7}$"))
            {
                phone.Background = Brushes.Red;
                return;
            }





            Clients cl = new Clients { Name = first_name.Text, date_of_birth = date_of_birth.Text, PlanId = int.Parse(Plan.Text) };
            context.Clients.AddClient(cl);
            var temp = context.Clients.FindById(cl.Id);



            using (FC db = new FC())
            {
                cl = new Clients { Name = first_name.Text, date_of_birth = date_of_birth.Text, PlanId = int.Parse(Plan.Text) };
                db.Clients.Add(cl);

                temp = context.Clients.FindById(cl.Id);

                db.SaveChanges();
            }



            //await AddClientAsync(first_name.Text, last_name.Text, date_of_birth.Text, email.Text, phone.Text, address.Text, photoPath);


        }

        // добавление пользователя
        private static async Task AddClientAsync(string first_name, string last_name, string date_of_birth, string email, string phone, string address, string photo)
        {
            

            byte[] imageData = { };

            if (photo != null)
            {
                
                using (FileStream fs = new FileStream(photo, FileMode.Open))
                {
                    imageData = new byte[fs.Length];
                    fs.Read(imageData, 0, imageData.Length);
                }
            }

            // название процедуры
            string sqlExpression = "addClients";                  

            SqlCommand command = new SqlCommand(sqlExpression, SQLItems.connection);
            // указываем, что команда представляет хранимую процедуру
            command.CommandType = CommandType.StoredProcedure;
            // параметр для ввода имени
            SqlParameter first_nameParam = new SqlParameter
            {
                ParameterName = "@first_name",
                Value = first_name
            };
            // добавляем параметр
            command.Parameters.Add(first_nameParam);
            // параметр для ввода фамилии
            SqlParameter last_nameParam = new SqlParameter
            {
                ParameterName = "@last_name",
                Value = last_name
            };
            command.Parameters.Add(last_nameParam);

            SqlParameter date_of_birthParam = new SqlParameter
            {
                ParameterName = "@date_of_birth",
                Value = date_of_birth
            };
            command.Parameters.Add(date_of_birthParam);

            SqlParameter emailParam = new SqlParameter
            {
                ParameterName = "@email",
                Value = @email
            };
            command.Parameters.Add(emailParam);

            SqlParameter phoneParam = new SqlParameter
            {
                ParameterName = "@phone",
                Value = phone
            };
            command.Parameters.Add(phoneParam);

            SqlParameter addressParam = new SqlParameter
            {
                ParameterName = "@address",
                Value = address
            };
            command.Parameters.Add(addressParam);

            //Разобраться с фоткой...............................................................................
            SqlParameter photoParam = new SqlParameter
            {
                ParameterName = "@photo",
                Value = imageData
            };
            command.Parameters.Add(photoParam);

            // выполняем процедуру
            var id = await command.ExecuteScalarAsync();
            // если нам не надо возвращать id
            //var id = await command.ExecuteNonQueryAsync();

            MessageBox.Show($"Id добавленного объекта: {id}");
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            first_name.Text = "Artyom";
            last_name.Text = "Pshenko";
            date_of_birth.Text = "2003-10-11";
            email.Text = "apsenko@gmail.com";
            phone.Text = "+375339032717";
            address.Text = "Lepel";
            
        }

        private static string photoPath;

        private void addPhotoButton_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Image|*.jpg;*.jpeg;*.png;";
            if (openFileDialog.ShowDialog() == true)
            {
                try
                {
                    //
                    //preview.Source = new BitmapImage(new Uri(openFileDialog.FileName, UriKind.Absolute));
                    //photoPath = openFileDialog.FileName;
                    //


                    BitmapImage image = new BitmapImage();
                    image.BeginInit();
                    image.CacheOption = BitmapCacheOption.OnLoad;
                    image.UriSource = new Uri(openFileDialog.FileName, UriKind.RelativeOrAbsolute);
                    image.EndInit();

                    // Замораживаем изображение
                    image.Freeze();

                    // Устанавливаем изображение в качестве источника для элемента Image
                    preview.Source = image;

                    photoPath = openFileDialog.FileName;

                }
                catch
                {
                    MessageBox.Show("Выберите файл подходящего формата.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }

        }

        // Делаю валтдацию :D
        private void first_name_TextChanged(object sender, TextChangedEventArgs e)
        {
            first_name.Background = Brushes.White;
        }

        private void last_name_TextChanged(object sender, TextChangedEventArgs e)
        {
            last_name.Background = Brushes.White;
        }

        private void date_of_birth_TextChanged(object sender, TextChangedEventArgs e)
        {
            date_of_birth.Background = Brushes.White;
        }

        private void email_TextChanged(object sender, TextChangedEventArgs e)
        {
            email.Background = Brushes.White;
        }

        private void phone_TextChanged(object sender, TextChangedEventArgs e)
        {
            phone.Background = Brushes.White;
        }
    }
}
