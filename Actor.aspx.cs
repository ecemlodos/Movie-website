using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Actor : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand command = new SqlCommand("SELECT * FROM PERSON WHERE DEPARTMENTID=13 AND POPULARITY>5.0 AND PROFILE_PATH IS NOT NULL ORDER BY POPULARITY DESC", con.baglanti());
        SqlDataReader read = command.ExecuteReader();
        DataList1.DataSource = read;
        DataList1.DataBind();
    }
}