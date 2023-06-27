using Newtonsoft.Json;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace oop_03
{
    internal static class Parser
    {
        public static List<Good> GetGoods()
        {
            const string path = "json.json";
            return JsonConvert.DeserializeObject<List<Good>>(File.ReadAllText(path));
        }
    }
}
