﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using BancoCentral.Models;

namespace BancoCentral.Controllers
{
    public class ConsultaController : Controller
    {
        private BancoCentralEntities db = new BancoCentralEntities();

        // GET: Consulta
        public async Task<ActionResult> Index()
        {
            return View(await db.Consulta.ToListAsync());
        }

        // GET: Consulta/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consulta consulta = await db.Consulta.FindAsync(id);
            if (consulta == null)
            {
                return HttpNotFound();
            }
            return View(consulta);
        }

        // GET: Consulta/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Consulta/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "idConsulta,nombre,consulta1")] Consulta consulta)
        {
            if (ModelState.IsValid)
            {
                db.Consulta.Add(consulta);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(consulta);
        }

        // GET: Consulta/Edit/5
        public async Task<ActionResult> Responder(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Consulta consulta = await db.Consulta.FindAsync(id);
            if (consulta == null)
            {
                return HttpNotFound();
            }
            return View(consulta);
        }

        // POST: Consulta/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Responder([Bind(Include = "idConsulta,nombre,consulta1")] Consulta consulta)
        {
            if (ModelState.IsValid)
            {
                db.Entry(consulta).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(consulta);
        }

        //public ActionResult Create()
        //{
        //    ViewBag.consultaId = new SelectList(db.Consulta, "idConsulta", "nombre");
        //    return View();
        //}

        //// POST: Respuestas/Create
        //// Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        //// más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        //[HttpPost]
        //[ValidateAntiForgeryToken]
        //public async Task<ActionResult> Create([Bind(Include = "idRespuesta,nombre,respuesta1,consultaId")] Respuesta respuesta)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        db.Respuesta.Add(respuesta);
        //        await db.SaveChangesAsync();
        //        return RedirectToAction("Index");
        //    }

        //    ViewBag.consultaId = new SelectList(db.Consulta, "idConsulta", "nombre", respuesta.consultaId);
        //    return View(respuesta);
        //}


        //protected override void Dispose(bool disposing)
        //{
        //    if (disposing)
        //    {
        //        db.Dispose();
        //    }
        //    base.Dispose(disposing);
        //}
    }
}
