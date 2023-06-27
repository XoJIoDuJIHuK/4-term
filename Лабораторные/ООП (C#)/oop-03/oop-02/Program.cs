using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using System.ComponentModel.DataAnnotations;

namespace oop_03
{
    enum Country
    {
        Oceania = 1,
        Eurasia,
        Eastasia
    }
    class Producer
    {
        [StringLength(50, MinimumLength = 3, ErrorMessage = "[3, 50]")]
        public string organisation;
        public Country country;
        public string adress;
        public int telNumber;
        public Producer(string organisation, Country country, string adress, int telNumber)
        {
            this.organisation = organisation;
            this.country = country;
            this.adress = adress;
            this.telNumber = telNumber;
        }

        public override string ToString()
        {
            string ret = $"Organisation: {organisation}, Country: ";

            switch (country)
            {
                case Country.Oceania:
                {
                    ret += "Oceania, ";
                    break;
                }
                case Country.Eurasia:
                {
                    ret += "Eurasia, ";
                    break;
                }
                case Country.Eastasia:
                {
                    ret += "Eastasia, ";
                    break;
                }
            }

            ret += $"Address: {adress}, Phone number: {telNumber}";

            return ret;
        }
    }
    class Date : IComparable<Date>
    {
        public int year;
        public int month;
        public int day;
        public Date(int year, int month, int day)
        {
            this.year = year;
            this.month = month;
            this.day = day;
        }

        public int CompareTo(Date other)
        {
            return year > other.year ? 1 :
                year < other.year ? -1 :
                    month > other.month ? 1 :
                        month < other.month ? -1 :
                            day > other.day ? 1 :
                                day < other.day ? -1 : 0;
        }

        public bool Equals(Date other)
        {
            if (other == null) return false;
            if (year != other.year) return false;
            if (month != other.month) return false;
            if (day != other.day) return false;
            return true;
        }

        public override string ToString()
        {
            return $"{day}.{month}.{year}";
        }
    }
    class CustomAttribute : ValidationAttribute
    {
        public override bool IsValid(object value)
        {
            if (value is int invNum)
            {
                if (invNum == 0)
                    return true;
                else
                {
                    ErrorMessage = "Must be divided by 7 without a remain";
                    return false;
                }
            }
            return false;
        }
    }
    class Good
    {
        public static string type1 = "Little good";
        public static string type2 = "More little good";
        public static string type3 = "God damn little good";
        [RegularExpression(@"([A-Z][a-zA-Z]* ?)+", ErrorMessage = "Every word must start with a capital, have no other capitals or non-letters. Words must be separated with 0 or 1 space")]
        public string name;
        [Required]
        //[Custom]
        [Range(0, 100, ErrorMessage = "[0, 100]")]
        public int invNumber;
        public double size;
        public double weight;
        public List<string> type = new List<string>();
        public Date arrivalDate;
        public int quantity;
        public int price;
        public List<Producer> producers = new List<Producer>();
        public bool ContainsType(string str, bool isRegex)
        {
            foreach(var t in type)
            {
                if (isRegex && Regex.IsMatch(str, t)) return true;
                if (!isRegex && t.Contains(str)) return true;
            }
            return false;
        }
        public override string ToString()
        {
            string ret = $"Title: {name}\nInventory number: {invNumber}\n" +
                $"Size: {size}m^3\nWeight: {weight}kg\nType: [\n";

            foreach (var t in type)
            {
                ret += $"{t}\n";
            }

            ret += $"]\nDate: {arrivalDate}\nQuantity: {quantity}\n" +
                $"Price: {price}\nProducers: [\n";

            foreach (var t in producers)
            {
                ret += $"{t}\n";
            }

            ret += "]";

            return ret;
        }
    }

    internal static class Program
    {
        public static List<Producer> Producers = new List<Producer>()
        {
            new Producer("Nokia", Country.Eurasia,
                "Qwerty str., 23", 783654),
            new Producer("Samsung", Country.Oceania,
                "ZXC str., 32a", 290321235),
            new Producer("Apple", Country.Eastasia,
                "Orwell str., 56878", 34982)
        };
        public static bool Contains(string s)
        {
            foreach (var p in Producers)
            {
                if (p.organisation.Equals(s)) return true;
            }
            return false;
        }
        public static Producer GetProducerByOrganisation(string organisation)
        {
            foreach (var p in Producers)
            {
                if (organisation.Equals(p.organisation)) return p;
            }
            return null;
        }
        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }
    }
}
