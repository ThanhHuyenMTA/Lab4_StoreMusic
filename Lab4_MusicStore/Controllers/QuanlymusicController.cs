using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Lab4_MusicStore.Models;

namespace Lab4_MusicStore.Controllers
{
    public class QuanlymusicController : Controller
    {
        Thuctap_MusicEntities db = new Thuctap_MusicEntities();
        // GET: Quanlymusic
        public ActionResult Danhsachnhac()
        {
            ViewBag.coutAlbum = db.Albums.ToList().Count();
            return View(db.Albums.ToList());
        }
        [HttpGet]
        public ActionResult AddAlbum()
        {
            //hiên thị list tên Genre và tên Artist
            List<Genre> listG =db.Genres.ToList();
            List<Artist> listA = db.Artists.ToList();
            List<string> G = new List<string>();
            List<string> A = new List<string>();
            foreach(var i in listG)
                G.Add(i.GenreName);
            foreach (var i in listA)
                A.Add(i.ArtistName);
            ViewBag.listGenre =G;           
            ViewBag.listArtist =A;
            //end

            return View();
        }
        [HttpPost]
        public ActionResult AddAlbum(Album album, FormCollection Fields)
        {
            if (Fields["sumbmitSave"] == "sumbmitSave")
            {
                if (ModelState.IsValid)
                {
                    //lấy tên Genre va Artist từ form
                    string genreN = Fields["genreN"];
                    string artistN = Fields["artistN"];
                    Genre G = db.Genres.SingleOrDefault(n => n.GenreName == genreN);
                    Artist A = db.Artists.SingleOrDefault(n => n.ArtistName == artistN);
                    album.Artist_ID = A.ArtistID;
                    album.Genre_ID = G.GenreID;
                    db.Albums.Add(album);
                    db.SaveChanges();
                    return RedirectToAction("Danhsachnhac");
                }
                return View(album);
            }
            if (Fields["sumbmitCancal"] == "sumbmitCancel")
                 return RedirectToAction("Danhsachnhac");
            else return View(album);
        }
        [HttpGet]
        public ActionResult EditAlbum(int album_id)
        {
            Album al = db.Albums.Find(album_id);
            Genre ge = db.Genres.Find(al.Genre_ID);
            Artist ar = db.Artists.Find(al.Artist_ID);
            ViewBag.nameGenre = ge.GenreName;
            ViewBag.nameArtist = ar.ArtistName;
            //hiên thị list tên Genre và tên Artist
            List<Genre> listG = db.Genres.ToList();
            List<Artist> listA = db.Artists.ToList();
            List<string> G = new List<string>();
            List<string> A = new List<string>();
            foreach (var i in listG)
                G.Add(i.GenreName);
            foreach (var i in listA)
                A.Add(i.ArtistName);
            ViewBag.listGenre = G;
            ViewBag.listArtist = A;
            Session["album_id"] = album_id;
            return View(al);
        }
        [HttpPost]
        public ActionResult EditAlbum(Album album,FormCollection fm)
        {
            if (ModelState.IsValid)
            {
                //lấy tên Genre va Artist từ form
                string genreN = fm["genreN"];
                string artistN = fm["artistN"];
                Genre G = db.Genres.SingleOrDefault(n => n.GenreName == genreN);
                Artist A = db.Artists.SingleOrDefault(n => n.ArtistName == artistN);
                album.AlbumID = (int)Session["album_id"];
                album.Artist_ID = A.ArtistID;
                album.Genre_ID = G.GenreID;
                db.Entry(album).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Danhsachnhac");
            }
            return View(album);
        }
        [HttpGet]
        public JsonResult SelectAlbum(int id)
        {
            Album al = db.Albums.Find(id);
            return Json(al.Title, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult SearchAlbum(string title)
        {
            if (title != null)
            {
                List<Album> album = db.Albums.Where(n => n.Title.Contains(title)).ToList();
                ViewBag.coutAlbum = album.Count();
                return View(album);
            }
            else return RedirectToAction("Danhsachnhac");
            
        }

    }
}