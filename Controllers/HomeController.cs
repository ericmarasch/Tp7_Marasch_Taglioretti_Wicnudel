using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TP_PREGUNTADOS_1.Models;

namespace TP_PREGUNTADOS_1.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Jugar()
    {
        var pregunta = Juego.ObtenerProximaPregunta();

    if (pregunta == null)
    {
        return View("Fin");
    }
    var respuestas = Juego.ObtenerProximasRespuestas(pregunta.IdPregunta);
    ViewBag.Pregunta = pregunta;
    ViewBag.Respuestas = respuestas;
    return View("Jugar");
    }

    public IActionResult VerificarRespuesta(int idPregunta, int idRespuesta)
    {
    bool esCorrecta = Juego.VerificarRespuesta(idPregunta, idRespuesta);
    var respuestaCorrecta = Juego.ObtenerProximasRespuestas(idPregunta).FirstOrDefault(r => r.esCorrecta)?.Contenido;
    ViewBag.EsCorrecta = esCorrecta;
    ViewBag.RespuestaCorrecta = respuestaCorrecta;
    return View("Respuesta");
    }

    public IActionResult ConfigurarJuego()
    {
         Juego.InicializarJuego();
        ViewBag.Categorias = BD.ObtenerCategorias();
        ViewBag.Dificultades = BD.ObtenerDificultades();
        return View();
    }

    public IActionResult Comenzar(string username, int dificultad, int categoria)
    {
        if (username != String.Empty && (dificultad > 0 || dificultad == -1) && (categoria > 0 || categoria == -1))
        {
            Juego.CargarPartida(username, dificultad, categoria);
            if (Juego.ComprobarPreguntas())
                return RedirectToAction("Jugar");
            else
                ViewBag.Error = "No existen preguntas para esta categoría";
        }
        ViewBag.Categorias = BD.ObtenerCategorias();
        ViewBag.Dificultades = BD.ObtenerDificultades();
        return View("ConfigurarJuego");
    }
    public IActionResult Privacy()
    {
        return View();
    }

    public IActionResult Creditos()
    {
        return View();
    }
    public IActionResult Respuesta()
    {
        return View();
    }

    public IActionResult Fin()
    {
        return View();
    }
}
