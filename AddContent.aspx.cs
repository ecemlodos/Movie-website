using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddContent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        connection con = new connection();

        string title = TitleTextBox.Text;
        string content = ContentTextBox.Text;
        string dateTime = DateTextBox.Text;
        string imageUrl = "";

        if (title == "" || content == "")
        {
            Label1.Text = "Title and content cant be empty";
        }
        else
        {
            if (FileUpload1.HasFile)
            {
                try
                {
                    if (FileUpload1.PostedFile.ContentLength < 102400)
                    {
                        string filename = Path.GetFileName(FileUpload1.FileName);

                        if (filename != "")
                        {
                            FileUpload1.SaveAs(Server.MapPath("~/Images/") + filename);
                            LabelUpload.Text = filename + " file uploaded!";

                            imageUrl = "~/Images/" + FileUpload1.FileName;


                        }
                    }
                    else
                        LabelUpload.Text = "100 KB'dan düşük olmalı!";
                }
                catch (Exception ex)
                {
                    LabelUpload.Text = "File not uploaded: " + ex.Message;
                }
            }

            string insertQuery = "insert into Content(ContentTitle, ContentText, AdminId, ContentDate, ContentImageUrl)values (@contentTitle, @contentText, @adminId, @contentDate, @contentImage)";
            SqlCommand cmd = new SqlCommand(insertQuery, con.baglanti());
            cmd.Parameters.AddWithValue("@contentTitle", title);
            cmd.Parameters.AddWithValue("@contentText", content);
            cmd.Parameters.AddWithValue("@contentDate", dateTime);
            cmd.Parameters.AddWithValue("@contentImage", imageUrl);
            cmd.Parameters.AddWithValue("@adminId", 1);

            cmd.ExecuteNonQuery();
            con.baglanti().Close();

        }
       
        Label1.Text = "Content added successfully";
        TitleTextBox.Text = "";
        ContentTextBox.Text = "";
        LabelUpload.Text = "";
    }
}