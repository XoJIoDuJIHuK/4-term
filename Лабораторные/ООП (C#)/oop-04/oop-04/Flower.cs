using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace oop_04
{
    public static class UtilitaryFunctions
    {
        public static void MemberviseClone(this Flower to, Flower from)
        {
            to.name = from.name;
            to.mass = from.mass;
            to.armor = from.armor;
            to.vaa = from.vaa;
            to.enginePower = from.enginePower;
            to.hppt = from.hppt;
            to.speed = from.speed;
            to.path = from.path;
            to.fullName = from.fullName;
            to.addPic1 = from.addPic1;
            to.addPic2 = from.addPic2;
            to.rating = from.rating;
            to.price = from.price;
            to.amount = from.amount;
            to.categories = from.categories;
            to.desc = from.desc;
        }
    }
    public class Flower
    {
        public string name;
        public double mass;
        public string armor;
        public string vaa;
        public int enginePower;
        public double hppt;
        public int speed;
        public string path;
        public string fullName;
        public string addPic1;
        public string addPic2;
        public double rating;
        public double price;
        public int amount;
        public string desc;
        public List<string> categories;
        public Flower(string name, double mass, string armor, string vaa, int enginePower, double hppt,
            int speed, string path, string fullName, string addPic1, string addPic2, double rating, double price,
            int amount, List<string> categories, string desc)
        {
            this.name = name;
            this.mass = mass;
            this.armor = armor;
            this.vaa = vaa;
            this.enginePower = enginePower;
            this.hppt = hppt;
            this.speed = speed;
            this.path = path;
            this.fullName = fullName;
            this.addPic1 = addPic1;
            this.addPic2 = addPic2;
            this.rating = rating;
            this.price = price;
            this.amount = amount;
            this.desc = desc;
            this.categories = categories;
        }
        public Flower()
        {
            name = string.Empty;
            mass = 0;
            armor = string.Empty;
            vaa = string.Empty;
            enginePower = 0;
            hppt = 0;
            speed = 0;
            path = string.Empty;
            fullName = string.Empty;
            addPic1 = string.Empty;
            addPic2 = string.Empty;
            rating = 0;
            price = 0;
            amount = 0;
            categories = new List<string>();
            desc = string.Empty;
        }
        public bool Equals(Flower flower)
        {
            if (this == flower) return true;
            if (this == null) return false;
            if (name.Equals(flower.name) &&
                mass.Equals(flower.mass) &&
                armor.Equals(flower.armor) &&
                vaa.Equals(flower.vaa) &&
                enginePower.Equals(flower.enginePower) &&
                hppt.Equals(flower.hppt) &&
                speed.Equals(flower.speed) &&
                path.Equals(flower.path) &&
                fullName.Equals(flower.fullName) &&
                addPic1.Equals(flower.addPic1) &&
                addPic2.Equals(flower.addPic2) &&
                rating.Equals(flower.rating) &&
                price.Equals(flower.price) &&
                amount.Equals(flower.amount) &&
                desc.Equals(flower.desc) &&
                categories.Equals(flower.categories)
                ) return true;
            return false;
        }
        /// <summary>
        /// Overriden toString method
        /// </summary>
        /// <returns>Element presentation brought to lowercase</returns>
        public override string ToString()
        {
            return ($"{name} {fullName} {mass} {armor} {vaa} {enginePower} {hppt} {speed} {rating} {price}" +
                $"{amount}").ToLower();
        }
        public Flower Clone()
        {
            return new Flower(name, mass, armor, vaa, enginePower, hppt, speed, path, fullName, addPic1, addPic2,
                rating, price, amount, categories, desc);
        }
    }
}
