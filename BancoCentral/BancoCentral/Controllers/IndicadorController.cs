﻿using BancoCentral.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BancoCentral.Controllers
{
    public class IndicadorController : Controller
    {
        private BancoCentralEntities db = new BancoCentralEntities();

        public void CreateIndicador(DataSet tablaIndicadores)
        {
            string monetaria = "", pasiva = "", compra = "", venta = "";
            DateTime fecha;
            
            for (int i = 0; i < tablaIndicadores.Tables[2].Rows.Count; i++)
            {
                fecha = Convert.ToDateTime(tablaIndicadores.Tables[2].Rows[i].ItemArray[1]);
                        if (tablaIndicadores.Tables[0].Rows.Count == 0) {
                             monetaria = "No disponible";
                        }
                        else
                        {
                             monetaria = Convert.ToString(tablaIndicadores.Tables[0].Rows[i].ItemArray[2]);
                        }
                pasiva = Convert.ToString(tablaIndicadores.Tables[1].Rows[i].ItemArray[2]);
                compra = Convert.ToString(tablaIndicadores.Tables[2].Rows[i].ItemArray[2]);
                venta = Convert.ToString(tablaIndicadores.Tables[3].Rows[i].ItemArray[2]);

                try
                {
                    db.Database.ExecuteSqlCommand("INSERT INTO Indicador (tasaBasicaPasiva,tasaPoliticaMonetaria,tipoCambioCompra,tipoCambioVenta,fecha) " +
                                                  "VALUES ('" + pasiva + "', '" + monetaria + "', '" + compra + "', '" + venta + "', '" + Convert.ToString(fecha.ToString("yyyy/MM/dd")) + "')");
                }
                catch (Exception e)
                {

                }
               
            }

            
        }

        public List<Indicador> ObtenerIndicadoresBaseDatos(string lastDate, string nowDate)
        {
            List<Indicador> listaIndicadores = new List<Indicador>();
            try
            {
                listaIndicadores = db.Database.SqlQuery<Indicador>("SELECT * FROM Indicador WHERE fecha BETWEEN ('" + lastDate + "') AND ('" + nowDate + "')").ToList();
            }
            catch (Exception e)
            {

            }
            return listaIndicadores;
        }
    }
}