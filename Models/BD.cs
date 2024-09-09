using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using Dapper;

public static class BD
{
    private static string connectionString = @"Server=Localhost; Database = PreguntadORT; Trusted_Connection = True";
    public static List<Categoria> ObtenerCategorias()
    {
        using (SqlConnection db = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Categoria";
            return db.Query<Categoria>(query).ToList();
        }
    }

    public static List<Dificultad> ObtenerDificultades()
    {
        using (SqlConnection db = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Dificultad";
            return db.Query<Dificultad>(query).ToList();
        }
    }
    public static List<Pregunta> ObtenerPreguntas(int dificultad, int categoria)
    {
        using (SqlConnection db = new SqlConnection(connectionString))
        {
            string query = "SELECT * FROM Pregunta WHERE (@Dificultad = -1 OR DificultadId = @Dificultad) AND (@Categoria = -1 OR CategoriaId = @Categoria)";
            return db.Query<Pregunta>(query, new { Dificultad = dificultad, Categoria = categoria}).ToList();
        }
    }

     public static List<Respuesta> ObtenerRespuestas(List<Pregunta> preguntas)
    {
        string sql = "SELECT * FROM Respuestas WHERE IdPregunta IN @pIdPreguntas;";
        int[] idPreguntas = BuscarIdPreguntas(preguntas);
        List<Respuesta> listadoRespuestas;
        
        using(SqlConnection BD = new SqlConnection(connectionString))
        {
            listadoRespuestas = BD.Query<Respuesta>(sql, new { pIdPreguntas = idPreguntas }).ToList();
        }

        return listadoRespuestas;
    }


    public static int[] BuscarIdPreguntas(List<Pregunta> preguntas)
    {
        int cantPreguntas = preguntas.Count;
        int[] idPreguntas = new int[cantPreguntas];

        for (int i = 0; i < cantPreguntas; i++)
            idPreguntas[i] = preguntas[i].IdPregunta;

        return idPreguntas;
    }

    public static bool EsCorrecta(int idRespuesta){
        bool Correcta=false;
        using(SqlConnection db = new SqlConnection(connectionString)){
            string sql= "Select Correcta from Respuestas where IdRespuesta=@pIdRespuesta";
            Correcta = db.QueryFirstOrDefault<bool>(sql, new{pIdRespuesta=idRespuesta});
        }
        return Correcta;
    }

    public static string RespuestaCorrecta(int idPregunta){

        string respuestaCorrecta = null;
        using(SqlConnection db = new SqlConnection(connectionString)){
            string sql= "SELECT Contenido from Preguntas INNER JOIN Respuestas ON Preguntas.IdPregunta = Respuestas.IdPregunta where Preguntas.IdPregunta = @pIdPregunta AND Correcta = 1";
            respuestaCorrecta = db.QueryFirstOrDefault<string>(sql, new{pIdPregunta=idPregunta});
        }

        return respuestaCorrecta;

    }
}
