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
using System.ComponentModel.DataAnnotations;
using System.Reflection.Emit;
using System.Runtime.Remoting.Contexts;

namespace oop_03
{
    public partial class Form1 : Form
    {
        private const string path = "json.json";
        public Form1()
        {
            InitializeComponent();            
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

            if (titleInput.Text.Length == 0)
            {
                titleLabel.ForeColor = Color.Red;
                titleLabel.Text = "Пустая строка";
            }

            if (!int.TryParse(invNumInput.Text, out int tryNum))
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
            const string path = "json.json";

            List<Good> list = JsonConvert.DeserializeObject<List<Good>>(File.ReadAllText("json.json"));
            if (list == null)
            {
                list = new List<Good>();   
            }
            list.Add(good);
            File.WriteAllText(path, JsonConvert.SerializeObject(list));
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

                var context = new ValidationContext(good);
                var res = new List<ValidationResult>();

                if (!Validator.TryValidateObject(good, context, res, true))
                {
                    MessageBox.Show("validation insuccessfull");
                    foreach (var r in res)
                    {
                        MessageBox.Show(r.ErrorMessage);
                    }
                }
                else
                {
                    MessageBox.Show("validation successful");
                    SerializeGood(good);
                    UpdateObjectsCount();
                }
            }
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

        private void button1_Click_2(object sender, EventArgs e)
        {
            string str = string.Empty;
            foreach (var g in Parser.GetGoods())
            {
                str += g.ToString();
                str += '\n';
            }
            richTextBox1.Text = str == string.Empty ? "null" : str;
        }

        private void aboutButt_Click(object sender, EventArgs e)
        {
            MessageBox.Show("ver.1.22474487139... Tachyla Aleh");
        }

        private void nameToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SearchForm searchForm = new SearchForm(SearchOptions.Name);
            searchForm.Show();
            actionLabel.Text = "Search by name";
        }

        private void typeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SearchForm searchForm = new SearchForm(SearchOptions.Type);
            searchForm.Show();
            actionLabel.Text = "Search by type";
        }

        private void priceRangeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            SearchForm searchForm = new SearchForm(SearchOptions.Range);
            searchForm.Show();
            actionLabel.Text = "Search by range";
        }

        private string GetSortResult(int type)
        {
            string result = string.Empty;
            
            switch (type)
            {
                case 1:
                    {
                        var list = from g in Parser.GetGoods()
                                   orderby g.arrivalDate ascending
                                   select g;
                        foreach (var g in list)
                        {
                            result += g.ToString();
                            result += "\n";
                        }
                        break;
                    }
                case 2:
                    {
                        var list = from g in Parser.GetGoods()
                                   orderby g.producers[0].telNumber ascending, g.name
                                   select g;
                        foreach (var g in list)
                        {
                            result += g.ToString();
                            result += "\n";
                        }
                        break;
                    }
            }

            return result == string.Empty ? "null" : result;
        }

        private void dateToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show(GetSortResult(1));
            actionLabel.Text = "Sort by date";
        }

        private void countryThenToolStripMenuItem_Click(object sender, EventArgs e)
        {
            actionLabel.Text = "Sort by phone number, then name";
            MessageBox.Show(GetSortResult(2));
        }

        private void phoneNumberThenDateToolStripMenuItem_Click(object sender, EventArgs e)
        {
            File.WriteAllText("Serialize.json", GetSortResult(2));
        }

        private void dateToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            File.WriteAllText("Serialize.json", GetSortResult(1));
        }

        private void aboutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            MessageBox.Show("ver.1.1269723784538... Tachyla Aleh");
            actionLabel.Text = "About clicked";
        }

        private void invNumInput_Validating(object sender, CancelEventArgs e)
        {
            if (invNumInput.Text == string.Empty) invNumInput.Text = "0";
            var good = new Good();
            if (int.TryParse(invNumInput.Text, out good.invNumber))
            {
                var context = new ValidationContext(good);
                var res = new List<ValidationResult>();
                if (!Validator.TryValidateObject(good, context, res, false))
                {
                    MessageBox.Show("inv number validation insuccessfull");
                    foreach (var r in res)
                    {
                        MessageBox.Show(r.ErrorMessage);
                    }
                }
                else
                {
                    MessageBox.Show("inv number validation successful");
                }
            }
            else MessageBox.Show("Ты как в маскед инпут не число ввёл, шизоид?");
        }

        private void Clone(Form1 from, Form1 to)
        {
            if (from != null)
            {
                to.titleInput.Text = from.titleInput.Text;
                to.invNumInput.Text = from.invNumInput.Text;
                to.sizeInput1.Checked = from.sizeInput1.Checked;
                to.sizeInput2.Checked = from.sizeInput2.Checked;
                to.sizeInput3.Checked = from.sizeInput3.Checked;
                to.weightInput.Text = from.weightInput.Text;
                to.typeInput1.Checked = from.typeInput1.Checked;
                to.typeInput2.Checked = from.typeInput2.Checked;
                to.typeInput3.Checked = from.typeInput3.Checked;
                to.dateInput.MinDate = from.dateInput.MinDate;
                to.priceInput.Text = from.priceInput.Text;
                to.quantityInput.Text = from.quantityInput.Text;
                to.producerInput = from.producerInput;
            }
        }

        private void Undo()
        {
            if (Memento.previous != null)
            {
                if (Memento.next == null) Memento.next = new Form1();
                Clone(this, Memento.next);
                Clone(Memento.previous, this);
                Memento.previous = null;
                actionLabel.Text = "Undoed";
            }
        }

        private void Redo()
        {
            if (Memento.next != null)
            {
                if (Memento.previous == null) Memento.previous = new Form1();
                Clone(this, Memento.previous);
                Clone(Memento.next, this);
                Memento.next = null;
                actionLabel.Text = "Redoed";
            }
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            nameToolStripMenuItem_Click(sender, e);
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            dateToolStripMenuItem_Click(sender, e);
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            Clone(new Form1(), this);
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            if (titleInput.Text != string.Empty)
            {
                var list = from g in Parser.GetGoods()
                           where g.name != titleInput.Text
                           select g;
                File.WriteAllText(path, JsonConvert.SerializeObject(list));
                UpdateObjectsCount();
            }
        }

        private void toolStripButton5_Click(object sender, EventArgs e)
        {
            Redo();
        }

        private void toolStripButton6_Click(object sender, EventArgs e)
        {
            Undo();
        }

        private void UpdateObjectsCount()
        {
            objectCount.Text = Parser.GetGoods().Count.ToString();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            UpdateObjectsCount();
            toolStripStatusLabel3.Text = DateTime.Now.ToString();
        }

        private void SaveState()
        {
            if (Memento.previous == null) Memento.previous = new Form1();
            Clone(this, Memento.previous);
        }
        private void titleInput_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void invNumInput_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void sizeInput1_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void sizeInput2_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void sizeInput3_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void weightInput_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void typeInput1_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void typeInput2_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void typeInput3_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void dateInput_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void quantityInput_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void priceInput_Leave(object sender, EventArgs e)
        {
            SaveState();
        }

        private void producerInput_Leave(object sender, EventArgs e)
        {
            SaveState();
        }
    }
}
