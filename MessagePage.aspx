<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MessagePage.aspx.cs" Inherits="MessagePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="col-md-9">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Inbox</h3>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive mailbox-messages">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="CONTENTID" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <table class="table table-hover table-striped">
                                <tr style="">
                                    <td class="mailbox-name col-3">
                                        <asp:Label ID="USER_NAMELabel" runat="server" Text='<%# Eval("USER_NAME") %>' />
                                    </td>
                                    <td class="mailbox-subject col-6">
                                        <asp:Label ID="CONTENTLabel" runat="server" Text='<%# Eval("CONTENT") %>' />
                                    </td>
                                    <td class="mailbox-attachment col-1">
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-default"/>
                                    </td>
                                </tr>
                            </table>

                        </ItemTemplate>

                        <AlternatingItemTemplate>
                            <table class="table table-hover table-striped">
                                <tr style="">
                                    <td class="mailbox-name col-3">
                                        <asp:Label ID="USER_NAMELabel" runat="server" Text='<%# Eval("USER_NAME") %>' />
                                    </td>
                                    <td class="mailbox-subject col-6">
                                        <asp:Label ID="CONTENTLabel" runat="server" Text='<%# Eval("CONTENT") %>' />
                                    </td>
                                    <td class="mailbox-attachment col-1">
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-default"/>
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>

                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>Hiçbir veri döndürülmedi.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        
                        <SelectedItemTemplate>
                            <table class="table table-hover table-striped">
                                <tr style="">
                                    <td class="mailbox-name col-3">
                                        <asp:Label ID="USER_NAMELabel" runat="server" Text='<%# Eval("USER_NAME") %>' />
                                    </td>
                                    <td class="mailbox-subject col-6">
                                        <asp:Label ID="CONTENTLabel" runat="server" Text='<%# Eval("CONTENT") %>' />
                                    </td>
                                    <td class="mailbox-attachment col-1">
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-default"/>
                                    </td>
                                </tr>
                            </table>
                        </SelectedItemTemplate>
                    </asp:ListView>

                </div>
            </div>
            <div class="card-footer p-0">
                <div class="mailbox-controls">
                </div>
            </div>
        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=DESKTOP-SBTL8OM\SQLEXPRESS;Initial Catalog=MOVIEDB;Integrated Security=True" DeleteCommand="DELETE FROM USER_CONTACT WHERE CONTENTID = @CONTENTID" SelectCommand="SELECT * FROM [USER_CONTACT]">
        <DeleteParameters>
            <asp:Parameter Name="CONTENTID" />
        </DeleteParameters>
    </asp:SqlDataSource>

</asp:Content>

