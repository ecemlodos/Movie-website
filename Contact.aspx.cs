using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


public partial class Contact : System.Web.UI.Page
{
    connection connection = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"].ToString() == "")
        {
            ButtonSend.Visible = TextBox2.Visible = false;
            Label2.Visible = true;
        }
        else
        {
            ButtonSend.Visible = TextBox2.Visible = true;
            Label2.Visible = false;
        }
    }



    protected void ButtonSend_Click(object sender, EventArgs e)
    {
        string dateTime = DateTime.Now.ToString("M/dd/yyyy");
        SqlCommand command = new SqlCommand("insert into USER_CONTACT (USER_NAME, CONTENT, MESSAGEDATE) VALUES ('" + Session["User"] + "','" + TextBox2.Text + "', '" + dateTime + "')", connection.baglanti());
        command.ExecuteNonQuery();
        Label3.Text = "Your message has been sent to the admin.";
        TextBox2.Text = "";
        
    }
}