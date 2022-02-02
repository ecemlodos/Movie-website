using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Movie_Info : System.Web.UI.Page
{
    connection con = new connection();
    string filmid = "";
    string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        filmid = Request.QueryString["FILMID"];
        title = Request.QueryString["TITLE"];
        SqlCommand command = new SqlCommand("SELECT TITLE,(SELECT GENRE + ',' FROM MOVIE_GENRE MG INNER JOIN GENRE G ON G.GENREID = MG.GENREID WHERE MG.FILMID = M.FILMID FOR XML PATH('')) GENRES, CONVERT(VARCHAR,YEAR(RELEASE_DATE)) as RELEASE_DATE, OVERVIEW, TAGLINE, POSTER_PATH, CONVERT (VARCHAR,RUNTIME/60)+'h '+CONVERT(VARCHAR,RUNTIME%60)+'m ' as RUNTIME, VOTE_AVERAGE, (SELECT P.NAME_ + ',' FROM CREW_CREDIT CC INNER JOIN DEPARTMENT D ON D.ID = CC.DEPARTMENTID INNER JOIN JOB J ON J.ID = CC.JOBID INNER JOIN PERSON P ON P.PERSONID = CC.PERSONID WHERE FILMID = M.FILMID AND J.JOB IN('Director') FOR XML PATH('')) Director FROM MOVIE M WHERE FILMID=@p1", con.baglanti());
        command.Parameters.AddWithValue("@p1", filmid);
        SqlDataReader read = command.ExecuteReader();
        DataList1.DataSource = read;
        DataList1.DataBind();

        SqlCommand command2 = new SqlCommand("SELECT P.NAME_, P.PERSONID, P.PROFILE_PATH, CC.CHARACTER_ FROM CAST_CREDIT CC INNER JOIN MOVIE M ON M.FILMID = CC.FILMID INNER JOIN PERSON P ON P.PERSONID = CC.PERSONID WHERE M.FILMID = @p2 ORDER BY ORDER_", con.baglanti());
        command2.Parameters.AddWithValue("@p2", filmid);
        SqlDataReader read2 = command2.ExecuteReader();
        DataList2.DataSource = read2;
        DataList2.DataBind();

        bindComments();
        if (gridComment.Rows.Count == 0)
        {
            labelCommentError.Text = "There are no comments yet.";
        }
        if (Session["User"].ToString() == "")
        {
            labelCommentError.Text += " Please login to comment.";

        }
    }

    protected void bindComments()
    {
        SqlCommand bindComments = new SqlCommand("SELECT username, comment_text FROM Comments WHERE movie_id=@movie_id", con.baglanti());
        bindComments.Parameters.AddWithValue("@movie_id", filmid);
        SqlDataAdapter sda = new SqlDataAdapter();
        sda.SelectCommand = bindComments;
        DataTable dt = new DataTable();
        sda.Fill(dt);
        gridComment.DataSource = dt;
        gridComment.DataBind();
    }

    protected void buttonComment_Click(object sender, EventArgs e)
    {
        if (Session["User"].ToString() == "")
        {
            labelCommentError.Text = "You must login to comment!";
        }
        else if (textboxComment.Text == "")
        {
            labelCommentError.Text = "Your comment can't be empty!";
        }
        else
        {
            SqlCommand command = new SqlCommand("INSERT INTO Comments VALUES(@movie_id, @username, @comment_text)", con.baglanti());
            command.Parameters.AddWithValue("@movie_id", filmid);
            command.Parameters.AddWithValue("@username", Session["User"].ToString());
            command.Parameters.AddWithValue("@comment_text", textboxComment.Text);
            command.ExecuteNonQuery();
            bindComments();
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void Liste_Click(object sender, EventArgs e)
    {
        if (Session["User"].ToString() == "")
        {
            Label21.Text += " Please login to add to list.";

        }
        else
        {
            Response.Redirect("ListPage.aspx?TITLE=" + title + "&FILMID=" + filmid);
        }

    }
}