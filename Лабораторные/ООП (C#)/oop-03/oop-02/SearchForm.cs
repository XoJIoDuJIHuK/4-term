using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace oop_03
{
    public partial class SearchForm : Form
    {

        private SearchOptions searchOption;
        private bool isRange;
        public SearchForm(SearchOptions so)
        {
            searchOption = so;
            isRange = so == SearchOptions.Range;
            InitializeComponent();
        }

        private void SearchForm_Load(object sender, EventArgs e)
        {
            if (!isRange) searchTextBox2.Hide();
            if (isRange) regexCheckBox.Hide();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            string result = "";
            switch (searchOption)
            {
                case SearchOptions.Name:
                    {
                        var goods = from g in Parser.GetGoods()
                                    where regexCheckBox.Checked ? 
                                    Regex.IsMatch(g.name, searchTextBox.Text) :
                                    g.name.Contains(searchTextBox.Text)
                                    select g;
                        foreach (var g in goods)
                        {
                            result += g.ToString();
                            result += '\n';
                        }
                        break;
                    }
                case SearchOptions.Type:
                    {
                        var goods = from g in Parser.GetGoods()
                                    where regexCheckBox.Checked ?
                                    g.ContainsType(searchTextBox.Text, regexCheckBox.Checked)
                                    : g.ContainsType(searchTextBox.Text, regexCheckBox.Checked)
                                    select g;
                        foreach (var g in goods)
                        {
                            result += g.ToString();
                            result += '\n';
                        }
                        break;
                    }
                case SearchOptions.Range:
                    {
                        var list = Parser.GetGoods();
                        int minBound = int.Parse(searchTextBox.Text);
                        int maxBound = int.Parse(searchTextBox2.Text);
                        var goods = from g in list
                                    where g.price >= minBound &&
                                    g.price < maxBound
                                    select g;
                        foreach (var g in goods)
                        {
                            result += g.ToString();
                            result += '\n';
                        }
                        break;
                    }
            }
            MessageBox.Show(result == "" ? "null" : result);
        }

        private void searchTextBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (searchOption == SearchOptions.Range && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
    }
}
