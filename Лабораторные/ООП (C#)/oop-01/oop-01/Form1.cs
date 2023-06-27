using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace oop_01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            this.Text = "ewsrhydxtjfcykgvuhlbijn;koml;kjhgvmfcndxfcngvbhjnkm";
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {

                if (textBox1.Text != "male" && textBox1.Text != "female")
                {
                    throw new Exception("There are only 2 genders: \"male\" and \"female\"");
                }
                int ValidateNumber(string str)
                {
                    int ret;
                    if (string.IsNullOrEmpty(str))
                    {
                        throw new Exception("String is null or empty");
                    }
                    if (!int.TryParse(str, out ret))
                    {
                        throw new Exception("Invalid string");
                    }
                    else
                    {
                        if (ret <= 0)
                        {
                            throw new Exception("Number must be positive");
                        }
                    }
                    return ret;
                }
                var calculator = new Calculator(
                    textBox1.Text,
                    ValidateNumber(textBox2.Text),
                    ValidateNumber(textBox7.Text),
                    ValidateNumber(textBox3.Text),
                    ValidateNumber(textBox6.Text),
                    ValidateNumber(textBox4.Text),
                    ValidateNumber(textBox5.Text)
                    );
                calculator.Calc();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }

    interface ICalculator
    {
        void Calc();
    }
    class Calculator : ICalculator 
    {
        private string curGender;
        private int curHeight;
        private int estHeight;
        private int curWeight;
        private int estWeight;
        private int curAge;
        private int term;
        public Calculator(string gender, int ch, int eh, int cw, int ew,
            int ca, int t)
        {
            curGender = gender;
            curHeight = ch;
            estHeight = eh;
            estWeight = ew;
            curWeight = cw;
            curAge = ca;
            if (t == 0)
            {
                throw new Exception("Term can't be equal 0");
            }
            term = t;
        }
        public void Calc()
        {
            double kcaloriesPerDay = curGender == "male" ? 2500 : 2000;
            double deltaWeight = ((double)(estWeight - curWeight)) / term;
            double deltaHeight = ((double)(estHeight - curHeight)) * 10 / term;
            if (deltaHeight < 0 && Math.Abs(deltaHeight) > kcaloriesPerDay)
            {
                throw new Exception("Impossible height loss. Try larger term");
            }
            if (deltaWeight < 0 && Math.Abs(deltaWeight) > kcaloriesPerDay)
            {
                throw new Exception("Impossible weight loss. Try larger term");
            }
            if ((deltaWeight + deltaHeight) < 0 && Math.Abs(deltaHeight + deltaWeight)
                > kcaloriesPerDay)
            {
                throw new Exception("Impossible weight and height loss. Try larger term");
            }
            kcaloriesPerDay += (deltaWeight + deltaHeight);
            string output = "";
            string action;
            if (estWeight == curWeight) action = "don't need to do anything with weight";
            else if (estWeight < curWeight) action = "need to lose weight";
            else action = "need to gain weight";
            if (estHeight == curHeight) action += " and don't need to do anything with height";
            else if (estHeight < curHeight) action += " and lose height";
            else action += " and grow up";
            output += $"You are {curAge} years old {curHeight}-cm {curWeight}-kg {curGender} human\n";
            output += $"You need to consume {kcaloriesPerDay} kilocalories/day because you {action}";
            MessageBox.Show(output);
        }
    }
}
