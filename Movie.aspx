<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Movie.aspx.cs" Inherits="Movie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <style >
        .a:link, .a:visited, .a:hover, .a:active{
           
            text-decoration: none;
            
        }
    </style>
    <div>
        
         <div style="text-align:center">
        <asp:DataList ID="DataList2" runat="server" Width="900px"> 
            <ItemTemplate>
               
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("GENRE") %>' Font-Names="Helvetica" Font-Size="20pt" ForeColor="#993300" Font-Bold="true" ></asp:Label>
                <label>&nbsp;&nbsp;</label>
                <asp:Label ID="Label3" runat="server" Text="Movies" Font-Names="Helvetica" Font-Size="20pt" ForeColor="#993300" Font-Bold="true" ></asp:Label>
                
            </ItemTemplate>
        </asp:DataList>
            </div>
        
            <div style="margin-left:40px;">
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                   <a  href="Movie_Info.aspx?FILMID=<%# Eval("FILMID") %>&TITLE=<%# Eval("TITLE") %>">   
                <asp:ImageButton ID="ImageButton5" runat="server" ImageUrl='<%# Eval("POSTER_PATH") %>' OnClick="ImageButton5_Click" style="height: 250px; width:200px; margin-top:20px;" ImageAlign="Middle"/> </a>
                    <a class="a" href="Movie_Info.aspx?FILMID=<%# Eval("FILMID") %>&TITLE=<%# Eval("TITLE") %>">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("TITLE") %>' Font-Names="Helvetica" Font-Size="16pt" ForeColor="#CC6600"></asp:Label>
                    </a>
            </ItemTemplate>
        </asp:DataList>
                </div>
            
    </div>
</asp:Content>

