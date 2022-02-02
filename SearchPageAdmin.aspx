<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="SearchPageAdmin.aspx.cs" Inherits="SearchPageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <p>
    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderText="Movies">
        <Columns>
            <asp:ImageField DataImageUrlField="POSTER_PATH" ControlStyle-Width="100" ItemStyle-Width="100" ControlStyle-Height="150" ItemStyle-Height="150" />
            <asp:HyperLinkField DataTextField="TITLE" DataNavigateUrlFields="FILMID" DataNavigateUrlFormatString="MovieComments.aspx?FILMID={0}" />
        </Columns>
    </asp:GridView>


    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="false" HeaderText="Actors">
        <Columns>
            <asp:ImageField DataImageUrlField="PROFILE_PATH" ControlStyle-Width="100" ItemStyle-Width="100" ControlStyle-Height="150" ItemStyle-Height="150" />
            <asp:HyperLinkField DataTextField="NAME_" DataNavigateUrlFields="PERSONID" DataNavigateUrlFormatString="ActorInfo.aspx?PERSONID={0}" />
        </Columns>
    </asp:GridView>


    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="false" HeaderText="Directors">
        <Columns>
            <asp:ImageField DataImageUrlField="PROFILE_PATH" ControlStyle-Width="100" ItemStyle-Width="100" ControlStyle-Height="150" ItemStyle-Height="150" />
            <asp:HyperLinkField DataTextField="NAME_" DataNavigateUrlFields="PERSONID" DataNavigateUrlFormatString="DirectorInfo.aspx?PERSONID={0}" />
        </Columns>
    </asp:GridView>
</asp:Content>

