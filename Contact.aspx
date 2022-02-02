<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

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
    </style>
    <div>
        <asp:Label ID="Label1" runat="server" Style="font-family:Arial, Helvetica, sans-serif" Text="Write your suggestions and complaints."></asp:Label>
        <asp:Label ID="Label2" runat="server" Style="font-family:Arial, Helvetica, sans-serif" Text="Please sign in"></asp:Label><br /><br />
    </div>
    <div>

        <asp:TextBox ID="TextBox2" runat="server" Height="216px" TextMode="MultiLine" Width="894px"></asp:TextBox><br /><br />

    </div>

    <asp:Button ID="ButtonSend" runat="server" Height="47px" OnClick="ButtonSend_Click" CssClass="button" Text="Send" Width="127px" /><br />
    <asp:Label ID="Label3" runat="server"></asp:Label>
</asp:Content>

