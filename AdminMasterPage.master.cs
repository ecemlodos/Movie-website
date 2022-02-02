using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddContentButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddContent.aspx");
    }

    protected void MessagesButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("MessagePage.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (DropDownList1.SelectedValue == "Genre")
        //{
        //    Response.Redirect("Genre.aspx");
        //}

        //if (DropDownList1.SelectedValue == "Actor")
        //{
        //    Response.Redirect("Actor.aspx");
        //}


        //if (DropDownList1.SelectedValue == "Director")
        //{
        //    Response.Redirect("Director.aspx");
        //}
    }

    protected void HomepageButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("AdminHomepage.aspx");
    }

    protected void Comments_Click(object sender, EventArgs e)
    {
        Response.Redirect("MovieComments.aspx");

    }
    protected void SearchButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("SearchPageAdmin.aspx?search=" + SearchTextBox.Text);
    }
    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session["Admin"] = "";
        Session["AdminPassword"] = "";
        Response.Redirect("Homepage.aspx");
    }
}
