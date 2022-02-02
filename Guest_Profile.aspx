<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Guest_Profile.aspx.cs" Inherits="User_Profile" %>

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
        .a:link, .a:visited, .a:hover, .a:active{
            color: white;
            font-size:18px;
            font-weight: bold;
            text-decoration: none;
            font-family:Arial, Helvetica, sans-serif;
            margin-left:10px;
        }
    </style>
        <table>
            <tr>
                <td>
                    <asp:Label ID="labelInfo" runat="server" Text="User Information:"></asp:Label> <br />
                    <asp:Label ID="labelUser" runat="server" Text="User"></asp:Label> <br />
                    <asp:Label ID="labelMail" runat="server" Text="Mail"></asp:Label> <br /> <br /> <br />
                    <asp:Button ID="labelListInfo" runat="server" Text="Lists" OnClick="labelListInfo_Click" class="button"></asp:Button> <br />
                </td>
            </tr>
        </table> <br /> <br />
            <asp:DropDownList ID="listList" CssClass="list" style="margin-right:10px;" runat="server" Visible="False" Width="201px"></asp:DropDownList> 
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Show Titles" Visible="False" class="button" />
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


