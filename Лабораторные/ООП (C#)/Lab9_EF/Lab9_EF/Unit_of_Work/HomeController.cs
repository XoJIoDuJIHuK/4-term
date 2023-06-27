//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using System.Web.Mvc;

//namespace Lab9_EF.Unit_of_Work
//{
//    public class HomeController : Controller
//    {
//        UnitOfWork unitOfWork;
//        public HomeController()
//        {
//            unitOfWork = new UnitOfWork();
//        }
//        public ActionResult Index()
//        {
//            var books = unitOfWork.Clients.GetAll();
//            return View();
//        }

//        public ActionResult Create()
//        {
//            return View();
//        }

//        [HttpPost]
//        public ActionResult Create(Client b)
//        {
//            if (ModelState.IsValid)
//            {
//                unitOfWork.Clients.Create(b);
//                unitOfWork.Save();
//                return RedirectToAction("Index");
//            }
//            return View(b);
//        }

//        public ActionResult Edit(int id)
//        {
//            Client b = unitOfWork.Clients.Get(id);
//            if (b == null)
//                return HttpNotFound();
//            return View(b);
//        }

//        [HttpPost]
//        public ActionResult Edit(Client b)
//        {
//            if (ModelState.IsValid)
//            {
//                unitOfWork.Clients.Update(b);
//                unitOfWork.Save();
//                return RedirectToAction("Index");
//            }
//            return View(b);
//        }

//        public ActionResult Delete(int id)
//        {
//            unitOfWork.Clients.Delete(id);
//            unitOfWork.Save();
//            return RedirectToAction("Index");
//        }

//        protected override void Dispose(bool disposing)
//        {
//            unitOfWork.Dispose();
//            base.Dispose(disposing);
//        }
//    }
//}
