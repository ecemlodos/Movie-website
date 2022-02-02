using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class User_Profile : System.Web.UI.Page
{
    string username;
    protected void Page_Load(object sender, EventArgs e)
    {
        username = Request.QueryString["username"].ToString();


        SqlCommand command = new SqlCommand("SELECT * FROM [Users] WHERE username=@Username", con.baglanti());
        command.Parameters.AddWithValue("@Username", username);
        SqlDataReader sdr = command.ExecuteReader();
        if (sdr.Read())
        {
            labelUser.Text = sdr["username"].ToString();
            labelMail.Text = sdr["email"].ToString();
        }
    }

    connection con = new connection();



    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand command = new SqlCommand("SELECT MOVIE.POSTER_PATH, USER_LISTS.TITLE, USER_LISTS.FILMID FROM MOVIE INNER JOIN USER_LISTS ON MOVIE.FILMID=USER_LISTS.FILMID WHERE USERID='" + username + "' AND LIST_NAME='" + listList.Text + "'", con.baglanti());
        SqlDataReader reader = command.ExecuteReader();
        gridMovies.DataSource = reader;
        gridMovies.DataBind();
    }

    protected void labelListInfo_Click(object sender, EventArgs e)
    {
        labelListInfo.Visible = false;
        Button2.Visible = true;
        listList.Visible = true;
        if (listList.Visible == true)
        {
            SqlCommand command = new SqlCommand("SELECT distinct LIST_NAME FROM USER_LISTS WHERE USERID=@username", con.baglanti());
            command.Parameters.AddWithValue("@username", username);
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                listList.Items.Add(reader["LIST_NAME"].ToString());

            }

        }
    }
}