using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class SearchPage : System.Web.UI.Page
{
    string search_text;
    connection connection = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        search_text = Request.QueryString["search"].ToString();
        Label1.Text = search_text;


        SqlCommand search_command = new SqlCommand("select POSTER_PATH, TITLE, FILMID from MOVIE where TITLE like '%" + search_text + "%'", connection.baglanti());
        SqlDataReader reader = search_command.ExecuteReader();
        GridView1.DataSource = reader;
        GridView1.DataBind();

        SqlCommand search_command2 = new SqlCommand("select distinct PROFILE_PATH, NAME_, PERSONID, POPULARITY from PERSON where NAME_ like '%" + search_text + "%'and DEPARTMENTID=13 ORDER BY POPULARITY DESC", connection.baglanti());
        SqlDataReader reader2 = search_command2.ExecuteReader();
        GridView2.DataSource = reader2;
        GridView2.DataBind();

        SqlCommand search_command3 = new SqlCommand("select distinct PROFILE_PATH, NAME_, PERSONID, POPULARITY from PERSON where NAME_ like '%" + search_text + "%' and DEPARTMENTID = 2 ORDER BY POPULARITY DESC", connection.baglanti());
        SqlDataReader reader3 = search_command3.ExecuteReader();
        GridView3.DataSource = reader3;
        GridView3.DataBind();

        connection.baglanti().Close();
    }
}