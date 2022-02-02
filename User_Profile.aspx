<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="User_Profile.aspx.cs" Inherits="User_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .button{
            background-color: black;
            border: none;
            color: white;
            padding: 14px 30px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 12px;
            margin: 4px 2px;
            transition-duration: 0.4s;
            cursor: pointer;
        }
        .button:hover{
            background-color: white;
            color: black;
        }
        .textbox{
            padding: 10px 15px;
            margin: 5px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }
        .list{
            color: white;
            font-size: 14px;
            padding: 5px 10px;
            border-radius: 6px;
            background-color: maroon;
            font-weight: bold;
        }
        .auto-style11 {
            width: 77px;
        }
        .auto-style12 {
            width: 256px;
        }
        .a:link, .a:visited, .a:hover, .a:active{
            color: white;
            font-size:18px;
            font-weight: bold;
            text-decoration: none;
            font-family:Arial, Helvetica, sans-serif;
            margin-left:10px;
        }
    </style>
        <div>
        <table>
            <tr>
                <td style="width:200px;">
                    <asp:Label ID="labelEmail" runat="server" Text="E-mail:" Visible="False"></asp:Label><asp:TextBox ID="textboxEmail" style="width:200px;" runat="server" Visible="False" class="textbox"></asp:TextBox><br />
                    <asp:Label ID="labelUsername" runat="server" Text="Username:" Visible="False"></asp:Label><asp:TextBox ID="textboxUsername" style="width:200px;" runat="server" Visible="False" class="textbox"></asp:TextBox><br />
                    <asp:Label ID="labelPassword" runat="server" Text="Password:" Visible="False"></asp:Label><asp:TextBox ID="textboxPassword" style="width:200px;" runat="server" Visible="False" TextMode="Password" class="textbox"></asp:TextBox><br />
                    <asp:Label ID="labelConfirm" runat="server" Text="Confirm Password:" Visible="False"></asp:Label><asp:TextBox ID="textboxConfirm" style="width:200px;" runat="server" Visible="False" TextMode="Password" class="textbox"></asp:TextBox><br />

                </td>
                <td style="width:300px">
                    <asp:Button ID="buttonSignup" runat="server" Text="Sign Up" OnClick="buttonSignup_Click" Visible="False" class="button"/><br />
                    <asp:Label ID="labelError" style="color:red" runat="server" Visible="False" Text=""></asp:Label>
                </td>
            </tr>
        </table>
    </div>
        <table style="margin-left:130px">
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="labelInfo" runat="server" Style="font-size:20px; font-weight:bolder; text-decoration:underline;" Text="User Information:"></asp:Label> <br />
                    <asp:Label ID="labelUser" Style="font-size:18px;" runat="server" Text="User"></asp:Label> <br />
                    <asp:Label ID="labelMail" Style="font-size:18px;" runat="server" Text="Mail"></asp:Label> <br /> <br /> <br />
                    <asp:Button ID="buttonChange" runat="server" Text="Change Information" OnClick="buttonChange_Click" class="button" /> <br />
                </td>
                <td class="auto-style11">
                    <asp:Label ID="labelNewUsername" runat="server" Text="Username:" Visible="False"></asp:Label> <asp:TextBox ID="textboxNewUsername" runat="server" Visible="False" class="textbox"></asp:TextBox> <br /> 
                    <asp:Label ID="labelNewMail" runat="server" Text="Email:" Visible="False"></asp:Label> <asp:TextBox ID="textboxNewMail" runat="server" Visible="False" class="textbox"></asp:TextBox> <br /> 
                    <asp:Label ID="labelNewPassword" runat="server" Text="Password:" Visible="False"></asp:Label> <asp:TextBox ID="textboxNewPassword" runat="server" Visible="False" class="textbox"></asp:TextBox> <br />
                </td>
                <td>        
                    <asp:Label ID="labelNewUser" runat="server" Text="Change Information"></asp:Label><br />
                    <asp:Button ID="buttonSave" runat="server" Text="Save Changes" Visible="False" OnClick="buttonSave_Click" class="button" /> <br /><br />
                </td>
            </tr>
        </table> <br /> <br />
        <asp:Button ID="labelListInfo" runat="server" Text="Lists" OnClick="labelListInfo_Click" class="button"></asp:Button> <br /><br /><br />
        <asp:DropDownList ID="listList" runat="server" Visible="False" class="list" style="margin-right:20px;" Width="203px"></asp:DropDownList> 
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Show Titles" Visible="False" class="button" Height="49px" />
        <br /> <br />
        <asp:GridView ID="gridMovies" runat="server" GridLines="None" RowStyle-CssClass="list" AutoGenerateColumns="false">
            <Columns>
                 <asp:ImageField DataImageUrlField="POSTER_PATH" ControlStyle-Width="100" ItemStyle-Width="100" ControlStyle-Height="150" ItemStyle-Height="150" />
                 <asp:HyperLinkField DataTextField="TITLE" DataNavigateUrlFields="FILMID,TITLE" DataNavigateUrlFormatString="Movie_Info.aspx?FILMID={0}&TITLE={1}" ControlStyle-CssClass="a" />
            </Columns>
        </asp:GridView> <br /> <br />
    <div>

    </div>
</asp:Content>