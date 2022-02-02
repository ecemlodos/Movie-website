<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DirectorInfo.aspx.cs" Inherits="DirectorInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style9 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:DataList ID="DataList1" runat="server" style="width:900px;">
            <ItemTemplate>
                <table class="auto-style9" align="center">
                    <tr>
                        <td>
                            <table class="auto-style9">
                                <tr>
                                    <td>
                                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PROFILE_PATH") %>' style="height: 400px; width:300px; margin-left:300px" ImageAlign="Middle" />
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("NAME_") %>' Font-Names="Helvetica"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("BIRTHDAY") %>' Font-Names="Helvetica"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr align="center">
                        <td align="center">
                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Biography: "></asp:Label>
                            <asp:Label ID="Label4" runat="server" style="width:875px; text-align:center" Text='<%# Eval("BIOGRAPHY") %>' Font-Names="Helvetica" Width="875"></asp:Label>
                        </td> 
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
        <asp:DataList ID="DataList2" RepeatDirection="Horizontal" RepeatColumns="2" runat="server" Width="900px">
            <ItemTemplate>
                <table class="auto-style9" align="center";>
                    <tr>
                        <td>
                            <table class="auto-style9">
                               <tr>
                                   <td>
                                       <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("POSTER_PATH") %>' style="height: 400px; width:350px;" />
                                   </td>
                               </tr>
                               <tr>
                                   <td> 
                                       <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="TITLE: " Font-Names="Helvetica"></asp:Label>
                                       <a href="Movie_Info.aspx?FILMID=<%# Eval("FILMID") %>&TITLE=<%# Eval("TITLE") %>">
                                           <asp:Label ID="Label5" runat="server" Text='<%# Eval("TITLE") %>'  Font-Names="Helvetica"></asp:Label>
                                       </a>
                                   </td>
                               </tr>
                               <tr>
                                   <td>
                                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Text="RELEASE DATE: " Font-Names="Helvetica" ></asp:Label>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("RELEASE_DATE") %>' Font-Names="Helvetica"></asp:Label>
                                   </td>
                               </tr>
                               </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

