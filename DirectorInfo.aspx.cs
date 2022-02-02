using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class DirectorInfo : System.Web.UI.Page
{
    connection con = new connection();
    string personid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        personid = Request.QueryString["PERSONID"];
        SqlCommand command = new SqlCommand("SELECT NAME_, CONVERT(VARCHAR,YEAR(BIRTHDAY)) as BIRTHDAY, BIOGRAPHY, PROFILE_PATH FROM PERSON WHERE PERSONID=@p1", con.baglanti());
        command.Parameters.AddWithValue("@p1", personid);
        SqlDataReader read = command.ExecuteReader();
        DataList1.DataSource = read;
        DataList1.DataBind();

        SqlCommand command2 = new SqlCommand("SELECT CONVERT(VARCHAR,YEAR(RELEASE_DATE)) as RELEASE_DATE,M.FILMID, M.TITLE, M.POSTER_PATH FROM CREW_CREDIT CC INNER JOIN PERSON P ON P.PERSONID = CC.PERSONID INNER JOIN MOVIE M ON M.FILMID = CC.FILMID WHERE CC.DEPARTMENTID = 2 AND P.PERSONID = @p2 ORDER BY RELEASE_DATE DESC ", con.baglanti());
        command2.Parameters.AddWithValue("@p2", personid);
        SqlDataReader read2 = command2.ExecuteReader();
        DataList2.DataSource = read2;
        DataList2.DataBind();
    }
}