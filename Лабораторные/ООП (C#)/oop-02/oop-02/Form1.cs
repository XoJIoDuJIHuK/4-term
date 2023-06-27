using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using Newtonsoft.Json;
using System.IO;

namespace oop_02
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void UnerrorRadioButtons()
        {
            if (sizeLabel.ForeColor == Color.Red)
            {
                sizeLabel.ForeColor = Color.Black;
                sizeLabel.Text = "Размер";
            }
        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            UnerrorRadioButtons();
        }
        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            UnerrorRadioButtons();
        }

        private void radioButton3_CheckedChanged(object sender, EventArgs e)
        {
            UnerrorRadioButtons();
        }

        private void maskedTextBox1_MaskInputRejected(object sender, MaskInputRejectedEventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void UnerrorCheckboxes()
        {
            if (typeLabel.ForeColor == Color.Red)
            {
                typeLabel.ForeColor = Color.Black;
                typeLabel.Text = "Тип";
            }
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            UnerrorCheckboxes();
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            UnerrorCheckboxes();
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
            UnerrorCheckboxes();
        }

        private void tabControl1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void UnerrorQuantity()
        {
            if (quantityInput.BackColor == Color.Red)
            {
                quantityInput.BackColor = Color.White;
                quantityLabel.ForeColor = Color.Black;
            }
        }

        private bool ValidateGood()
        {
            bool ret = true;
            int tryNum;

            if (titleInput.Text.Length == 0)
            {
                titleLabel.ForeColor = Color.Red;
                titleLabel.Text = "Пустая строка";
            }

            if (!int.TryParse(invNumInput.Text, out tryNum))
            {
                ret = false;
                invNumInput.BackColor = Color.Red;
                invNumLabel.Text = "Инвентарный номер должен быть целым числом";
                invNumLabel.ForeColor = Color.Red;
            }

            int.TryParse(weightInput.Text, out tryNum);
            if (tryNum.ToString() != weightInput.Text)
            {
                ret = false;
                weightInput.BackColor = Color.Red;
                weightLabel.Text = "Вес должен быть целым числом";
                weightLabel.ForeColor = Color.Red;
            }
            else if (tryNum < 0)
            {
                ret = false;
                weightInput.BackColor = Color.Red;
                weightLabel.Text = "Вес должен быть неотрицательным";
                weightLabel.ForeColor = Color.Red;
            }
            tryNum = 0;

            if (!typeInput1.Checked && !typeInput2.Checked && !typeInput3.Checked)
            {
                ret = false;
                typeLabel.Text = "Должен быть выбран хотя бы один тип";
                typeLabel.ForeColor = Color.Red;
            }

            if (!sizeInput1.Checked && !sizeInput2.Checked && !sizeInput3.Checked)
            {
                ret = false;
                sizeLabel.Text = "Выберите размер";
                sizeLabel.ForeColor = Color.Red;
            }

            if (quantityInput.Value == 0)
            {
                ret = false;
                quantityInput.BackColor = Color.Red;
                quantityLabel.Text = "Должна быть хотя бы одна единицы товара";
                quantityLabel.ForeColor = Color.Red;
            }

            double tryDouble;
            double.TryParse(priceInput.Text, out tryDouble);
            if (tryDouble.ToString() != priceInput.Text)
            {
                ret = false;
                priceInput.BackColor = Color.Red;
                priceLabel.Text = "Цена должна быть числом";
                priceLabel.ForeColor = Color.Red;
            }
            else if (tryDouble < 0)
            {
                ret = false;
                priceInput.BackColor = Color.Red;
                priceLabel.Text = "Цена должна быть неотрицательной";
                priceLabel.ForeColor = Color.Red;
            }

            if (producerInput.CheckedItems.Count == 0)
            {
                ret = false;
                producerLabel.Text = "Выберите хотя бы одного производителя";
                producerLabel.ForeColor = Color.Red;
            }

            return ret;
        }

        private void SerializeGood(Good good)
        {
            File.WriteAllText("json.txt", JsonConvert.SerializeObject(good));
        }

        private Good DeserializeGood()
        {
            return JsonConvert.DeserializeObject<Good>(
                File.ReadAllText("json.txt"));
        }

        private void button1_Click(object sender, EventArgs e) {}

        private void saveButton_Click(object sender, EventArgs e)
        {
            Console.WriteLine(dateInput.SelectionStart);
            if (ValidateGood())
            {
                Good good = new Good();
                good.name = titleInput.Text;
                good.invNumber = int.Parse(invNumInput.Text);
                if (sizeInput1.Checked)
                {
                    good.size = 1;
                }
                else if (sizeInput2.Checked)
                {
                    good.size = 0.5;
                }
                else if (sizeInput3.Checked)
                {
                    good.size = 0.1;
                }
                
                good.weight = int.Parse(weightInput.Text);
                if (typeInput1.Checked)
                {
                    good.type.Add(Good.type1);
                }
                if (typeInput2.Checked)
                {
                    good.type.Add(Good.type2);
                }
                if (typeInput3.Checked)
                {
                    good.type.Add(Good.type3);
                }
                good.arrivalDate = new Date(dateInput.SelectionStart.Year,
                    dateInput.SelectionStart.Month,
                    dateInput.SelectionStart.Day);
                good.quantity = int.Parse(quantityInput.Text);
                good.price = int.Parse(priceInput.Text);
                for (int i = 0; i < producerInput.SelectedItems.Count; i++)
                {
                    var p = Program.GetProducerByOrganisation(
                        (string)producerInput.SelectedItems[i]);
                    good.producers.Add(p);
                }

                SerializeGood(good);
            }
        }

        private void weightInput_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void invNumInput_KeyPress(object sender, KeyPressEventArgs e)
        {
            
        }

        private void quantityInput_KeyPress(object sender, KeyPressEventArgs e)
        {
            UnerrorQuantity();
        }

        private void quantityInput_ValueChanged(object sender, EventArgs e)
        {
            UnerrorQuantity();
        }

        private void priceInput_TextChanged(object sender, EventArgs e)
        {
            if (priceInput.BackColor == Color.Red)
            {
                priceInput.BackColor = Color.White;
                priceLabel.ForeColor = Color.Black;
                priceLabel.Text = "Цена";
            }
        }

        private void invNumInput_TextChanged(object sender, EventArgs e)
        {
            if (invNumInput.BackColor == Color.Red)
            {
                invNumInput.BackColor = Color.White;
                invNumLabel.Text = "Вес";
                invNumLabel.ForeColor = Color.Black;
            }
        }

        private void weightInput_TextChanged(object sender, EventArgs e)
        {
            if (weightInput.BackColor == Color.Red)
            {
                weightInput.BackColor = Color.White;
                weightLabel.Text = "Вес";
                weightLabel.ForeColor = Color.Black;
            }
        }

        private void producerInput_Leave(object sender, EventArgs e)
        {

        }

        private void producerInput_Enter(object sender, EventArgs e)
        {
            
        }

        private void producerInput_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            if (ValidateProducer())
            {
                Country country = Country.Oceania;
                if (countryInputEa.Checked) country = Country.Eastasia;
                else if (countryInputEu.Checked) country = Country.Eurasia;
                else if (countryInputOc.Checked) country = Country.Oceania;
                addProducerButton.Text = "Успешно";
                Program.Producers.Add(new Producer(organisationInput.Text,
                    country, addressInput.Text, int.Parse(telNumInput.Text)));
                producerInput.Items.Add((object)organisationInput.Text);
            }
        }

        private bool ValidateProducer()
        {
            bool ret = true;

            if (organisationInput.Text.Length == 0)
            {
                ret = false;
                organisationLabel.ForeColor = Color.Red;
                organisationLabel.Text = "Пустая строка";
            }
            if (Program.Contains(organisationInput.Text))
            {
                ret = false;
                organisationLabel.ForeColor = Color.Red;
                organisationLabel.Text = "Такой производитель уже есть";
            }

            if (!countryInputEa.Checked && !countryInputEu.Checked &&
                !countryInputOc.Checked)
            {
                ret = false;
                countryLabel.ForeColor = Color.Red;
                countryLabel.Text = "Страна не выбрана";
            }

            if (addressInput.Text.Length == 0)
            {
                ret = false;
                addressLabel.ForeColor = Color.Red;
                addressLabel.Text = "Пустая строка";
            }

            if (telNumInput.Text.Length == 0)
            {
                ret = false;
                telNumLabel.ForeColor = Color.Red;
                telNumLabel.Text = "Пустая строка";
            }

            return ret;
        }

        private void addProducerButton_Leave(object sender, EventArgs e)
        {
            if (addProducerButton.Text == "Успешно")
            {
                addProducerButton.Text = "Добавить";
            }
        }

        private void producerInput_SelectedIndexChanged(object sender, EventArgs e){}

        private void producerInput_Layout(object sender, LayoutEventArgs e){}

        private void titleInput_TextChanged(object sender, EventArgs e)
        {
            if (titleLabel.ForeColor == Color.Red)
            {
                titleLabel.ForeColor = Color.Black;
                titleLabel.Text = "Название";
            }
        }

        private void tabPage2_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click_2(object sender, EventArgs e)
        {
            richTextBox1.Text = DeserializeGood().ToString();
        }
    }
}
