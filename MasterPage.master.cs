using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session.IsNewSession)
        {
            Session.Add("User", "");
            Session.Add("ID", "");
        }
        if (Session["User"].ToString() != "")
        {
            buttonLogin.Text = "Logout";
            textboxUsername.Visible = textboxPassword.Visible = false;
            labelError.Text = "Welcome, " + Session["User"].ToString() + "!";
        }
    }

    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Homepage.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "Genre")
        {
            Response.Redirect("Genre.aspx");
        }

        if (DropDownList1.SelectedValue == "Actor")
        {
            Response.Redirect("Actor.aspx");
        }


        if (DropDownList1.SelectedValue == "Director")
        {
            Response.Redirect("Director.aspx");
        }
    }
    
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
         Response.Redirect("User_Profile.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchPage.aspx?search=" + TextBox1.Text);
    }

    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("Contact.aspx");
    }

    protected void buttonLogin_Click(object sender, EventArgs e)
    {
        if (buttonLogin.Text == "Login")
        {
            if (textboxUsername.Text == "" || textboxPassword.Text == "")
            {
                labelError.Text = "Please fill in the necessary information!";
            }
            else
            {
                if (textboxUsername.Text == "admin" && textboxPassword.Text == "123456")
                {
                    Session["Admin"] = "admin";
                    Session["AdminPassword"] = "123456";
                    Response.Redirect("AdminHomepage.aspx");
                }
                else
                {
                    try
                    {
                        string username = textboxUsername.Text;
                        string password = textboxPassword.Text;
                        int user_id = 0;
                        connection con = new connection();

                        SqlCommand command = new SqlCommand("SELECT * FROM [Users] WHERE username=@Username AND password=@Password", con.baglanti());
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Password", password);
                        SqlDataReader sdr = command.ExecuteReader();
                        if (sdr.Read())
                        {
                            user_id = (int)sdr["user_id"];
                            Session["User"] = textboxUsername.Text;
                            Session["ID"] = user_id.ToString();
                            Response.Redirect(Request.RawUrl);
                        }
                        else
                        {
                            labelError.Text = "Incorrect username or password. Try again";

                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.Message);
                    }
                }
                
            }
        }
        else
        {
            Session["User"] = "";
            Session["ID"] = "";
            buttonLogin.Text = "Login";
            textboxUsername.Visible = textboxPassword.Visible = true;
            Response.Redirect("Homepage.aspx");
        }
    }

    protected void buttonSignUp_Click(object sender, EventArgs e)
    {
        Session["User"] = "";
        Session["ID"] = "";
        Response.Redirect("User_Profile.aspx");
    }
}
