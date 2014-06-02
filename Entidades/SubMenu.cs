using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class SubMenu
    {
        public int idSubMenu { get; set; }
        public string nombre { get; set; }
        public int idMenu { get; set; }
        public int activa { get; set; }
        public string imagen { get; set; }
    }
}
