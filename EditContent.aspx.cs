using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class EditContent : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {       
        string contentid = Request.QueryString["ContentId"];

        SqlCommand getcontent = new SqlCommand("select * from Content where ContentId='" + contentid + "'", con.baglanti());
        SqlDataReader dataReader = getcontent.ExecuteReader();
        dataReader.Read();

        //if(dataReader.GetString(3) != "")
        //{
        //    TitleTextBox.Text = dataReader.GetString(1);
        //    ContentTextBox.Text = dataReader.GetString(2);
        //    Image.ImageUrl = dataReader.GetString(3);
        //    DateTextBox.Text = dataReader.GetString(4);
        //}
        //else
        //{
            TitleTextBox.Text = dataReader.GetString(1);
            ContentTextBox.Text = dataReader.GetString(2);
            //DateTextBox.Text = dataReader.GetValue(4);
        //}
        
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        string contentid = Request.QueryString["ContentId"];

        string title = TitleTextBox.Text;
        string content = ContentTextBox.Text;
        string dateTime = DateTextBox.Text;
        string imageUrl = "";

        if (title == "" || content == "")
        {
            Label1.Text = "Title and content can not be empty";
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

                            imageUrl = "~/images/" + FileUpload1.FileName;


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

            string updateQuery = "update Content SET ContentTitle=@contentTitle, ContentText=@contentText, ContentDate=@contentDate, ContentImageUrl=@contentImage where ContentId= " + contentid;
            SqlCommand cmd = new SqlCommand(updateQuery, con.baglanti());
            cmd.Parameters.AddWithValue("@contentTitle", title);
            cmd.Parameters.AddWithValue("@contentText", content);
            cmd.Parameters.AddWithValue("@contentDate", dateTime);
            cmd.Parameters.AddWithValue("@contentImage", imageUrl);

            cmd.ExecuteNonQuery();
            con.baglanti().Close();

        }

        Label1.Text = "Content updated successfully";
        TitleTextBox.Text = "";
        ContentTextBox.Text = "";
        LabelUpload.Text = "";
    }
}