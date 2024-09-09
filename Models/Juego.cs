using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Dapper;

public class Juego
{
   const int SUMA_PUNTAJE = 300;
    public static string username { get; private set; }
    public static int puntajeActual { get; private set; }
    public static int cantPreguntasCorrectas { get; private set; }
    private static List<Pregunta> preguntas { get; set; }
    private static List<Respuesta> respuestas { get; set; }
    private static bool esCategoria { get; set; }
    private static bool perdido { get; set; }




    public static void InicializarJuego()
    {
        username = string.Empty;
        puntajeActual = 0;
        cantPreguntasCorrectas = 0;
        preguntas = new List<Pregunta>();
        respuestas = new List<Respuesta>();
    }

    public static List<Categoria> ObtenerCategorias()
    {
        return BD.ObtenerCategorias();
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        return BD.ObtenerDificultades();
    }

    public static void CargarPartida(string nuevoUsername, int dificultad, int categoria)
    {
        esCategoria = categoria == -1;
        username = nuevoUsername;
        preguntas = BD.ObtenerPreguntas(dificultad, categoria);
        respuestas = BD.ObtenerRespuestas(preguntas);
        perdido = false;
    }

    public static bool ComprobarPartida()
    {
        return username != null;
    }
    public static bool ComprobarPreguntas()
    {
        return preguntas != null && preguntas.Count() > 0;
    }
    public static bool ComprobarEsCategoria()
    {
        return esCategoria;
    }
    public static bool ComprobarPerdido()
    {
        return perdido;
    }

    public static string ObtenerUsername(){

        return username;
    }

    public static Pregunta? ObtenerProximaPregunta()
    {
        int valor;
        Random rnd;
        Pregunta? proximaPregunta = null;

        if (ComprobarPreguntas())
        {
            rnd = new Random();
            valor = rnd.Next(0, preguntas.Count);
            proximaPregunta = preguntas[valor];
        }
        return proximaPregunta;
    }
    public static List<Respuesta> ObtenerProximasRespuestas(int idPregunta)
    {
        List<Respuesta> proximasRespuestas = new List<Respuesta>();
        foreach (Respuesta respuesta in respuestas)
            if (respuesta.IdPregunta == idPregunta)
                proximasRespuestas.Add(respuesta);
        return proximasRespuestas;
        
    }

    public static Pregunta ObtenerPreguntaLista(int idPregunta)
    {
        return preguntas[BuscarPregunta(idPregunta)];
    }
    public static bool VerificarRespuesta(int idPregunta, int idRespuesta)
    {
        bool correcta = BuscarRespuestaCorrecta(idRespuesta);

        if (correcta)
        {
            puntajeActual += SUMA_PUNTAJE;
            cantPreguntasCorrectas++;
            preguntas.RemoveAt(BuscarPregunta(idPregunta));
        }

        return correcta;
    }
    public static string? ObtenerRespuestaCorrecta(int idPregunta)
    {
        string? respuestaCorrecta = null;
        respuestaCorrecta = BD.RespuestaCorrecta(idPregunta);
        return respuestaCorrecta;
    }
    public static int ObtenerPuntajeActual()
    {
        return puntajeActual;
    }


    public static int BuscarCategoriaLista(int idCategoria, List<Categoria> lista)
    {
        int posCategoria = lista.Count - 1;
        while (posCategoria >= 0 && idCategoria != lista[posCategoria].IdCategoria)
            posCategoria--;
        return posCategoria;
    }
    private static int BuscarPregunta(int idPregunta)
    {
        int posPregunta = preguntas.Count - 1;
        while (posPregunta >= 0 && idPregunta != preguntas[posPregunta].IdPregunta)
            posPregunta--;
        return posPregunta;
    }
    private static bool BuscarRespuestaCorrecta(int idRespuesta)
    {

        bool correcto = BD.EsCorrecta(idRespuesta);
        return correcto;
    }
}