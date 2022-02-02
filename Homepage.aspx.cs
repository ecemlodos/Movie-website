using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Homepage : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        string dateTime = DateTime.Now.ToString("M/dd/yyyy");
        SqlCommand command = new SqlCommand("select * from Content where ContentDate='" + dateTime + "'", con.baglanti());
        SqlDataReader dataReader = command.ExecuteReader();
        dataReader.Read();

        try
        {
            TitleLabel.Text = dataReader.GetString(1);
            ContentLabel.Text = dataReader.GetString(2);
            ContentImage.ImageUrl = dataReader.GetString(3);
        }
        catch (Exception)
        {
            TitleLabel.Text = "";
            ContentLabel.Text = "";
            ContentImage.ImageUrl = "";

        }
        //string title = TitleLabel.Text;
        //SqlCommand getmovie = new SqlCommand("SELECT FILMID FROM MOVIE WHERE TITLE=@title", con.baglanti());
        //getmovie.Parameters.AddWithValue("@title", title);
        //getmovie.ExecuteReader();


        con.baglanti().Close();
    }

    protected void gotomovie_Click(object sender, EventArgs e)
    {
        string title = TitleLabel.Text;
        SqlCommand getmovie = new SqlCommand("SELECT FILMID FROM MOVIE WHERE TITLE=@title", con.baglanti());
        getmovie.Parameters.AddWithValue("@title", title);
        getmovie.ExecuteReader();
        SqlDataReader dataReader2 = getmovie.ExecuteReader();
        string filmid = dataReader2.GetString(1);

        Response.Redirect("Movie_Info.aspx?FILMID=" + filmid);

    }
}