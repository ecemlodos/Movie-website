<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Movie_Info.aspx.cs" Inherits="Movie_Info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      
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
        .card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  transition: 0.3s;
  width: 40%;
  height: 70px;
  padding: 20px;
  background-color: white;
  color: black;
  font-family:Arial, Helvetica, sans-serif;
  font-size:15px;
  border-bottom:double;
  border-top:double;
}

.card:hover {
  box-shadow: 0 16px 16px 0 rgba(0,0,0,0.5);
}
.a:link, .a:visited, .a:hover, .a:active{
            color: maroon;
            font-size:18px;
            font-weight: bold;
            text-decoration: none;
            font-family:Arial, Helvetica, sans-serif;
            margin-left:10px;
        }
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:Button Class="button" ID="Liste" runat="server" Text="Add to the list" OnClick="Liste_Click" /><br />
        <asp:Label ID="Label21" runat="server"></asp:Label>
    </div>
    <div>
        <div style="text-align:center; background-color:#CC9900">

             <a href="#overview"> <asp:Label ID="Label13" runat="server" Text="Overview" Font-Names="Helvetica" Font-Size="12pt" ForeColor="#FFFF99"></asp:Label></a>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
             <a href="#cast"> <asp:Label ID="Label14" runat="server" Text="Cast" Font-Names="Helvetica" Font-Size="12pt" ForeColor="#FFFF99"></asp:Label></a>
            <label>&nbsp;&nbsp;&nbsp;&nbsp;</label>
            <a href="#comment"> <asp:Label ID="Label15" runat="server" Text="Comment" Font-Names="Helvetica" Font-Size="12pt" ForeColor="#FFFF99"></asp:Label></a>

        </div>
        <asp:DataList ID="DataList1" runat="server" Width="900px">
            <ItemTemplate>
                <table align="center">
                    <tr>
                        <td align="left" valign="top" height="450">
                            <table class="auto-style9">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("POSTER_PATH") %>' Style="height: 450px; width: 300px; margin-left: 250px;" BorderStyle="Double" BorderWidth="7px" />
                                    </td>
                                    <td>
                                        <table class="auto-style9">
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("TITLE") %>' Font-Underline="True" Font-Names="Helvetica" Font-Size="14pt" style="text-align:left"></asp:Label>
                                                    <asp:Label ID="Label16" runat="server" Text="("></asp:Label>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("RELEASE_DATE") %>' Font-Italic="True" ForeColor="#999999" Font-Names="Helvetica" Font-Size="10pt" style="text-align:left"></asp:Label>
                                                    <asp:Label ID="Label17" runat="server" Text=")"></asp:Label>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("RUNTIME") %>' Font-Names="Helvetica" Font-Size="12pt" style="text-align:start"></asp:Label>
                                                   
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("GENRES") %>' Font-Names="Helvetica" Font-Size="12pt" style="text-align:left"></asp:Label>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("VOTE_AVERAGE") %>' Font-Names="Helvetica" Font-Size="12pt" style="text-align:left"></asp:Label>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Director: " Font-Names="Helvetica" Font-Size="12pt" style="text-align:left"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("Director") %>' Font-Names="Helvetica" Font-Size="12pt" style="text-align:left"></asp:Label>
                                                    
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label7" runat="server" Font-Italic="True" Text='<%# Eval("TAGLINE") %>' Font-Names="Helvetica" Font-Size="10pt" style="text-align:left" ForeColor="#666666"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr align="center">
                        
                        <td align="center">
                             <br />
                            <br />
                            <br />
                            <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Overview: " Font-Names="Helvetica" Font-Size="12pt" style="text-align:left"></asp:Label>
                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("OVERVIEW") %>' Font-Names="Helvetica" Font-Size="12pt" style="text-align:center"></asp:Label>
                            
                        </td>
                    </tr><a name="overview"></a>
                    <tr>
                        <td>
                            <table class="auto-style9">
                            </table>
                        </td>
                    </tr>
                    <tr></tr>
                    <tr><td></td></tr>
                    <tr>
                        <td align="center" valign="bottom" height="80">
                            <asp:Label ID="Label12" Name="cast" runat="server" Font-Bold="True" Font-Italic="true" Font-Underline="true" Text="Cast" Font-Names="Helvetica" Font-Size="14pt"></asp:Label>
                        </td>
                    </tr>
                </table>
                </ItemTemplate>
                </asp:DataList>

                <asp:DataList ID="DataList2" RepeatDirection="Vertical" RepeatColumns="5" runat="server" Width="900px">
                    <ItemTemplate>
                        <table class="auto-style9"> <a name="cast"></a>
                                                       
                            <tr>
                                <td>
                                    <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl='<%# Eval("PROFILE_PATH") %>' Style="height: 200px; width: 150px;" BorderStyle="Ridge" BorderWidth="8px" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="ActorInfo.aspx?PERSONID=<%# Eval("PERSONID") %>">
                                        <asp:Label ID="Label11" runat="server" Text='<%# Eval("NAME_") %>' Font-Names="Helvetica" Font-Size="10pt"></asp:Label></a>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:DataList>
            
        <br /><br />
        <asp:Label ID="labelCommentError" runat="server"  style="color:red; margin-left:100px;" Text=""></asp:Label>
           <br />
            <asp:TextBox ID="textboxComment" runat="server" style="margin-left:100px;" TextMode="MultiLine" Height="100px" Width="650px"></asp:TextBox><br />
            <asp:Button ID="buttonComment" runat="server" Text="Comment!" style="margin-left:100px;" OnClick="buttonComment_Click" class="button" /> <br /> <br />
                    <asp:GridView ID="gridComment" AutoGenerateColumns="false" GridLines="None" RowStyle-CssClass="card" style="margin-left:100px;" runat="server">
                    <Columns>
                        <asp:HyperLinkField ItemStyle-Width="150px" DataTextField="username" DataNavigateUrlFields="username" DataNavigateUrlFormatString="Guest_Profile.aspx?username={0}" ControlStyle-CssClass="a" />
                        <asp:BoundField ItemStyle-Width="500px" DataField="comment_text" />
                    </Columns>
            </asp:GridView> <a name="comment"></a>
    </div>
    <br /><br /><br /><br />
            <asp:Label ID="ContentLabel" runat="server" Text="" CssClass="label"></asp:Label><br /><br /><br />
    <asp:Label ID="Label1" runat="server" CssClass="label"  Text="ALL RIGHTS RESERVED ® "></asp:Label>
    <br /><br />
</asp:Content>