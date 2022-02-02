using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Movie : System.Web.UI.Page
{
    connection con = new connection();
    string genreid = "";
    protected void Page_Load(object sender, EventArgs e)
        
    {
        genreid = Request.QueryString["GENREID"];

        SqlCommand command = new SqlCommand("SELECT M.TITLE, M.POSTER_PATH, M.FILMID, G.GENREID, G.GENRE FROM MOVIE_GENRE MG INNER JOIN GENRE G ON G.GENREID = MG.GENREID INNER JOIN MOVIE M ON M.FILMID = MG.FILMID WHERE G.GENREID = @p1", con.baglanti());
        command.Parameters.AddWithValue("@p1", genreid);
        SqlDataReader read = command.ExecuteReader();
        DataList1.DataSource = read;
        DataList1.DataBind();

        SqlCommand command2 = new SqlCommand("SELECT GENRE FROM GENRE WHERE GENREID=@p2", con.baglanti());
        command2.Parameters.AddWithValue("@p2", genreid);
        SqlDataReader read2 = command2.ExecuteReader();
        DataList2.DataSource = read2;
        DataList2.DataBind();



    }

  

    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Movie_Info.aspx");
    }
}