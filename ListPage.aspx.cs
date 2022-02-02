using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class ListPage : System.Web.UI.Page
{
    string TITLE;
    connection connection = new connection();
    string filmid;
    protected void Page_Load(object sender, EventArgs e)
    {
        TITLE = Request.QueryString["TITLE"].ToString();
        filmid = Request.QueryString["FILMID"].ToString();

    }

    protected void yeni_Click(object sender, EventArgs e)
    {
        listName.Visible = true;
        create.Visible = true;
    }

    protected void create_Click(object sender, EventArgs e)
    {
        SqlCommand command1 = new SqlCommand("INSERT INTO USER_LISTS (USERID, TITLE, LIST_NAME, FILMID) VALUES('" + Session["User"] + "','" + TITLE + "','" + listName.Text + "','" + filmid + "')", connection.baglanti());
        command1.ExecuteNonQuery();
        connection.baglanti().Close();
        Label1.Text = "Film was added to the list.";

    }

    protected void varolan_Click(object sender, EventArgs e)
    {
        listList.Visible = true;
        Button2.Visible = true;
        varolan.Visible = false;
        SqlCommand command = new SqlCommand("SELECT distinct LIST_NAME FROM USER_LISTS WHERE USERID=@username", connection.baglanti());
        command.Parameters.AddWithValue("@username", Session["User"]);

        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            listList.Items.Add(reader["LIST_NAME"].ToString());
        }
    }

    protected void ListName_Click(object sender, EventArgs e)
    {
        SqlCommand command1 = new SqlCommand("INSERT INTO USER_LISTS (USERID, TITLE, LIST_NAME, FILMID) VALUES('" + Session["User"] + "','" + TITLE + "','" + listList.Text + "','" + filmid + "')", connection.baglanti());
        command1.ExecuteNonQuery();
        connection.baglanti().Close();
        Label1.Text="Film was added to the list.";

    }

    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}