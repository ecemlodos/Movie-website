<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListPage.aspx.cs" Inherits="ListPage" %>

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
    </style>
    <div>
        <asp:Label ID="Label1" runat="server"></asp:Label><br />
        <asp:Button ID="yeni" runat="server" Text="Create a new list" OnClick="yeni_Click" class="button" /><br /><br />
        <asp:TextBox ID="listName" runat="server" Visible="False" Placeholder="Write the list name" Width="227px" class="textbox"></asp:TextBox><br /><br />
        <asp:Button ID="create" runat="server" OnClick="create_Click" Text="Create" Visible="False" Height="51px" Width="121px" class="button"/>
    </div><br /><br /><br />
    <div>
        <asp:Button ID="varolan" runat="server" Text="Add to existing list" OnClick="varolan_Click" class="button"/>
    </div>
    <div>
        <asp:DropDownList ID="listList" style="margin-right:20px;" runat="server" Visible="False" class="list" Width="212px"></asp:DropDownList> 
        <asp:Button ID="Button2" runat="server" OnClick="ListName_Click" Text="Insert into the list" Visible="False" class="button"/>
        <br /> <br />
        
    </div>
</asp:Content>

