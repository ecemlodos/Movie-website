<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Homepage.aspx.cs" Inherits="Homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        .title{
            font-family: Arial;
            font-size: x-large;

        }

        .image{
            margin: 10px 200px;
            width: auto;
            align-content: center
        }

        .label{
            font-family: Arial;
            padding: 10px 15px;
            margin: 5px 50px;
            display: inline-block;
            box-sizing: border-box;
            align-content: center;
            text-align: center
        }

        .box{
            text-align: center
        }

        .text{
            color: goldenrod;
            font-family: Arial;
            font-size:large
        }


    </style>

    <div class="box">
        <asp:Label runat="server" class="text">Movie of the Day</asp:Label>
    </div>
    <div class="box">
        <asp:Label ID="TitleLabel" runat="server" Text="" class="title"></asp:Label>
        <%--<a href="Movie_Info.aspx?FILMID=">go to movie</a>
        <asp:Button runat="server" ID="gotomovie" Text="go to movie" OnClick="gotomovie_Click"/>--%>
    </div>
        <asp:Label ID="DateLabel" runat="server" Text="" class="align-content-end"></asp:Label>
        <br />
        <div class="image">
            <asp:Image ID="ContentImage" runat="server" />
        </div>
            <asp:Label ID="ContentLabel" runat="server" Text="" CssClass="label"></asp:Label>

    <br /><br /><br /><br />
            <asp:Label ID="Label1" runat="server" Text="" CssClass="label"></asp:Label><br /><br /><br />
    <asp:Label ID="Label2" runat="server" CssClass="label"  Text="ALL RIGHTS RESERVED ® "></asp:Label>
    <br /><br />

</asp:Content>

