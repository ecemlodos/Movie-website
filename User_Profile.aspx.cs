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
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"].ToString() == "")
        {
            labelEmail.Visible = labelUsername.Visible = labelPassword.Visible = labelConfirm.Visible = true;
            textboxEmail.Visible = textboxUsername.Visible = textboxPassword.Visible = textboxConfirm.Visible = true;
            buttonSignup.Visible = labelError.Visible = true;

            labelInfo.Visible = labelUser.Visible = labelMail.Visible = labelListInfo.Visible = listList.Visible = gridMovies.Visible = false;
        }
        else
        {
            SqlCommand command = new SqlCommand("SELECT * FROM [Users] WHERE username=@Username", con.baglanti());
            command.Parameters.AddWithValue("@Username", Session["User"].ToString());
            SqlDataReader sdr = command.ExecuteReader();
            if (sdr.Read())
            {
                labelUser.Text = sdr["username"].ToString();
                labelMail.Text = sdr["email"].ToString();
            }
        }


    }

    connection con = new connection();

    protected void buttonSignup_Click(object sender, EventArgs e)
    {
        if (textboxUsername.Text == "" || textboxPassword.Text == ""
   || textboxEmail.Text == "" || textboxConfirm.Text == "")
        {
            labelError.Text = "Please fill all necessary information!";
        }
        else if (textboxPassword.Text != textboxConfirm.Text)
        {
            labelError.Text = "Passwords must match each other!";
        }
        else
        {
            try
            {
                SqlCommand command = new SqlCommand("INSERT INTO Users([email], [username], [password]) VALUES(@email, @username, @password)", con.baglanti());
                command.Parameters.AddWithValue("@email", textboxEmail.Text);
                command.Parameters.AddWithValue("@username", textboxUsername.Text);
                command.Parameters.AddWithValue("@password", textboxPassword.Text);
                command.ExecuteNonQuery();

                SqlCommand command2 = new SqlCommand("SELECT user_id FROM [Users] WHERE username=@Username", con.baglanti());
                command2.Parameters.AddWithValue("@Username", textboxUsername.Text);
                SqlDataReader sdr = command2.ExecuteReader();
                if (sdr.Read())
                {
                    int user_id = (int)sdr["user_id"];
                    Session["User"] = textboxUsername.Text;
                    Session["ID"] = user_id.ToString();
                    Response.Redirect("Homepage.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }

    protected void buttonChange_Click(object sender, EventArgs e)
    {
        labelNewUsername.Visible = labelNewMail.Visible = labelNewPassword.Visible = labelNewUser.Visible = true;
        textboxNewUsername.Visible = textboxNewMail.Visible = textboxNewPassword.Visible = buttonSave.Visible = true;
        buttonChange.Visible = false;
        SqlCommand command = new SqlCommand("SELECT * FROM [Users] WHERE username=@Username", con.baglanti());
        command.Parameters.AddWithValue("@Username", Session["User"].ToString());
        SqlDataReader sdr = command.ExecuteReader();
        if (sdr.Read())
        {
            textboxNewUsername.Text = sdr["username"].ToString();
            textboxNewMail.Text = sdr["email"].ToString();
            textboxNewPassword.Text = sdr["password"].ToString();
        }

    }

    protected void buttonSave_Click(object sender, EventArgs e)
    {
        if (textboxNewUsername.Text == "" || textboxNewMail.Text == "" || textboxNewPassword.Text == "")
        {
            labelNewUser.Text = "Please fill all necessary information!";
        }
        else
        {
            SqlCommand command = new SqlCommand("UPDATE Users SET username=@username, email=@email, password=@password WHERE user_id=@user_id", con.baglanti());
            command.Parameters.AddWithValue("@user_id", Session["ID"].ToString());
            command.Parameters.AddWithValue("@username", textboxNewUsername.Text);
            command.Parameters.AddWithValue("@email", textboxNewMail.Text);
            command.Parameters.AddWithValue("@password", textboxNewPassword.Text);
            command.ExecuteNonQuery();
            Session["User"] = textboxNewUsername.Text;
            Response.Redirect(Request.RawUrl);
        }
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlCommand command = new SqlCommand("SELECT MOVIE.POSTER_PATH, USER_LISTS.TITLE, USER_LISTS.FILMID FROM MOVIE INNER JOIN USER_LISTS ON MOVIE.FILMID=USER_LISTS.FILMID WHERE USERID='" + Session["User"] + "' AND LIST_NAME='" + listList.Text + "'", con.baglanti());
        SqlDataReader reader = command.ExecuteReader();
        gridMovies.DataSource = reader;
        gridMovies.DataBind();
    }

    protected void labelListInfo_Click(object sender, EventArgs e)
    {
        Button2.Visible = true;
        listList.Visible = true;
        labelListInfo.Visible = false;
        if (listList.Visible == true)
        {
            SqlCommand command = new SqlCommand("SELECT distinct LIST_NAME FROM USER_LISTS WHERE USERID=@username", con.baglanti());
            command.Parameters.AddWithValue("@username", labelUser.Text);

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {

                listList.Items.Add(reader["LIST_NAME"].ToString());

            }

        }
    }
}