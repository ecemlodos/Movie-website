<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Director.aspx.cs" Inherits="Director" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:DataList ID="DataList1" RepeatDirection="Horizontal" RepeatColumns="5" runat="server">
            <ItemTemplate>
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl='<%# Eval("PROFILE_PATH") %>' style="height: 250px; width:170px;" />
                <a href="DirectorInfo.aspx?PERSONID=<%# Eval("PERSONID") %>">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("NAME_") %>'></asp:Label></a>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

