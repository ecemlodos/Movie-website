<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminContents.aspx.cs" Inherits="AdminContents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="card col-11">
        <div class="card-header">
            <h3 class="card-title">Contents</h3>
        </div>
        <div class="card-body p-0">
            <table class="table table-striped projects">
                <thead>
                    <tr>
                        <th style="width: 20%">Title
                      </th>
                        <th>Content
                      </th>
                        <th style="width: 20%">Date
                      </th>
                        <th style="width: 10%"></th>
                        <th style="width: 10%"></th>
                    </tr>
                </thead>
                <tbody>
                    <asp:ListView runat="server" DataKeyNames="ContentId" DataSourceID="SqlDataSource1">
                        <AlternatingItemTemplate>
                            <tr style="">
                                <td>
                                    <asp:Label ID="ContentTitleLabel" runat="server" Text='<%# Eval("ContentTitle") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ContentTextLabel" runat="server" Text='<%# Eval("ContentText") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ContentDateLabel" runat="server" Text='<%# Eval("ContentDate") %>' />
                                </td>
                                <td>
                                    <button class="btn btn-default">
                                        <a href="EditContent.aspx?ContentId=<%# Eval("ContentId") %>">Edit</a>
                                    </button>
                                </td>

                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                                </td>
                            </tr>
                        </AlternatingItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>

                        <ItemTemplate>
                            <tr style="">


                                <td>
                                    <asp:Label ID="ContentTitleLabel" runat="server" Text='<%# Eval("ContentTitle") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ContentTextLabel" runat="server" Text='<%# Eval("ContentText") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ContentDateLabel" runat="server" Text='<%# Eval("ContentDate") %>' />
                                </td>
                                <td>
                                    <button class="btn btn-default">
                                        <a href="EditContent.aspx?ContentId=<%# Eval("ContentId") %>">Edit</a>
                                    </button>
                                </td>
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                                </td>
                            </tr>
                        </ItemTemplate>
                        <SelectedItemTemplate>
                            <tr style="">


                                <td>
                                    <asp:Label ID="ContentTitleLabel" runat="server" Text='<%# Eval("ContentTitle") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ContentTextLabel" runat="server" Text='<%# Eval("ContentText") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="ContentDateLabel" runat="server" Text='<%# Eval("ContentDate") %>' />
                                </td>
                                <td>
                                    <button class="btn btn-default">
                                        <a href="EditContent.aspx?ContentId=<%# Eval("ContentId") %>">Edit</a>
                                    </button>
                                </td>
                                <td>
                                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                                </td>
                            </tr>
                        </SelectedItemTemplate>

                    </asp:ListView>
                </tbody>
            </table>

        </div>
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MOVIEDBConnectionString %>" DeleteCommand="DELETE FROM Content WHERE ContentId=@ContentId" SelectCommand="SELECT [ContentId], [ContentTitle], [ContentText], [ContentDate] FROM [Content]">
        <DeleteParameters>
            <asp:Parameter Name="ContentId" />
        </DeleteParameters>
    </asp:SqlDataSource>


</asp:Content>

