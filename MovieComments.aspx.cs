using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MovieComments : System.Web.UI.Page
{
    connection con = new connection();
    string filmid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        filmid = Request.QueryString["FILMID"];
        SqlCommand command = new SqlCommand("SELECT TITLE,(SELECT GENRE + ',' FROM MOVIE_GENRE MG INNER JOIN GENRE G ON G.GENREID = MG.GENREID WHERE MG.FILMID = M.FILMID FOR XML PATH('')) GENRES, RELEASE_DATE, OVERVIEW, TAGLINE, POSTER_PATH, CONVERT (VARCHAR,RUNTIME/60)+'h '+CONVERT(VARCHAR,RUNTIME%60)+'m ' as RUNTIME, VOTE_AVERAGE, (SELECT P.NAME_ + ',' FROM CREW_CREDIT CC INNER JOIN DEPARTMENT D ON D.ID = CC.DEPARTMENTID INNER JOIN JOB J ON J.ID = CC.JOBID INNER JOIN PERSON P ON P.PERSONID = CC.PERSONID WHERE FILMID = M.FILMID AND J.JOB IN('Director') FOR XML PATH('')) Director FROM MOVIE M WHERE FILMID=@p1", con.baglanti());
        command.Parameters.AddWithValue("@p1", filmid);
        SqlDataReader read = command.ExecuteReader();
        DataList1.DataSource = read;
        DataList1.DataBind();


        //bindComments();

        //if (gridComment.Rows.Count == 0)
        //{
        //    labelCommentError.Text = "There are no comments yet.";
        //}
    }

    protected void bindComments()
    {
        SqlCommand bindComments = new SqlCommand("SELECT comment_id, username, comment_text FROM Comments WHERE movie_id=@movie_id", con.baglanti());
        bindComments.Parameters.AddWithValue("@movie_id", filmid);
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = bindComments;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        //gridComment.DataSource = dt;
        //gridComment.DataBind();

    }
}