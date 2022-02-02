<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Genre.aspx.cs" Inherits="Genre" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        auto-style1 {
            text-align:center;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center; margin:auto;">
        <asp:DataList ID="DataList1" runat="server" Width="897px">
            <ItemTemplate>
                <a href="Movie.aspx?GENREID=<%# Eval("GENREID") %>">
                    <asp:Label ID="Label1" runat="server" class="auto-style1"
                        Text='<%# Eval("GENRE") %>' Font-Bold="True" BorderStyle="Solid" BorderColor="#784501" BorderWidth="15px" ForeColor="#FFCC99" Width="300px" Font-Names="Helvetica" ></asp:Label></a>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

