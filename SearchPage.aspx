<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SearchPage.aspx.cs" Inherits="SearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
       
    <style>

.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40%;
  background-color: #F4A460;
  font-family:'OCR A Std, monospace';
}

.card:hover {
  box-shadow: 0 16px 16px 0 rgba(0,0,0,0.5);
}
.a:link, .a:visited, .a:hover, .a:active{
            color: white;
            font-size:large;
            font-weight: bold;
            text-decoration: none;
            font-family:Arial, Helvetica, sans-serif;
        }

</style>
<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br /><br />

    <table>
        <tr>
            <td valign="top">
                <asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False" RowStyle-CssClass="card" Caption="Movies" Width="290px">
                <Columns>
                    <asp:ImageField DataImageUrlField="POSTER_PATH" ControlStyle-Width="100" ItemStyle-Width="100" ControlStyle-Height="150" ItemStyle-Height="150" />
                    <asp:HyperLinkField DataTextField="TITLE" DataNavigateUrlFields="FILMID,TITLE" DataNavigateUrlFormatString="Movie_Info.aspx?FILMID={0}&TITLE={1}" ControlStyle-CssClass="a" />
               </Columns>
               </asp:GridView>
            </td>
            <td valign="top">
                <asp:GridView ID="GridView2" runat="server" GridLines="None" RowStyle-CssClass="card" AutoGenerateColumns="False"  Caption="Actors" Width="290px">
                <Columns>
                    <asp:ImageField DataImageUrlField="PROFILE_PATH" ControlStyle-Width="100" ItemStyle-Width="100" ControlStyle-Height="150" ItemStyle-Height="150" />
                    <asp:HyperLinkField DataTextField="NAME_" DataNavigateUrlFields="PERSONID" DataNavigateUrlFormatString="ActorInfo.aspx?PERSONID={0}" ControlStyle-CssClass="a"/>
               </Columns>
               </asp:GridView>
            </td>
            <td valign="top">
                <asp:GridView ID="GridView3" runat="server" GridLines="None" AutoGenerateColumns="False" RowStyle-CssClass="card" Caption="Directors" Width="290px">
                <Columns>
                    <asp:ImageField DataImageUrlField="PROFILE_PATH" ControlStyle-Width="100" ItemStyle-Width="100" ControlStyle-Height="150" ItemStyle-Height="150" />
                    <asp:HyperLinkField DataTextField="NAME_" DataNavigateUrlFields="PERSONID" DataNavigateUrlFormatString="DirectorInfo.aspx?PERSONID={0}" ControlStyle-CssClass="a" />
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    
</asp:Content>

