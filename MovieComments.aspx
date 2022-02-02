<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="MovieComments.aspx.cs" Inherits="MovieComments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:DataList ID="DataList1" runat="server" Width="900px">
        <ItemTemplate>
            <table align="center">
                <tr>
                    <td align="left" valign="top" height="450">
                        <table class="auto-style9">
                            <tr>
                                <td>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("POSTER_PATH") %>' Style="height: 400px; width: 350px; margin-left: 200px;" BorderStyle="Double" BorderWidth="7px" />
                                </td>
                                <td>
                                    <table class="auto-style9">
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("TITLE") %>' Font-Underline="True" Font-Names="Helvetica" Font-Size="14pt" Style="text-align: left"></asp:Label>
                                                <asp:Label ID="Label16" runat="server" Text="("></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("RELEASE_DATE") %>' Font-Italic="True" ForeColor="#999999" Font-Names="Helvetica" Font-Size="10pt" Style="text-align: left"></asp:Label>
                                                <asp:Label ID="Label17" runat="server" Text=")"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("RUNTIME") %>' Font-Names="Helvetica" Font-Size="12pt" Style="text-align: start"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("GENRES") %>' Font-Names="Helvetica" Font-Size="12pt" Style="text-align: left"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("VOTE_AVERAGE") %>' Font-Names="Helvetica" Font-Size="12pt" Style="text-align: left"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Text="Director: " Font-Names="Helvetica" Font-Size="12pt" Style="text-align: left"></asp:Label>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Eval("Director") %>' Font-Names="Helvetica" Font-Size="12pt" Style="text-align: left"></asp:Label>


                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <asp:Label ID="Label7" runat="server" Font-Italic="True" Text='<%# Eval("TAGLINE") %>' Font-Names="Helvetica" Font-Size="10pt" Style="text-align: left" ForeColor="#666666"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr align="center">

                    <td align="center">
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Text="Overview: " Font-Names="Helvetica" Font-Size="12pt" Style="text-align: left"></asp:Label>
                        <asp:Label ID="Label8" runat="server" Text='<%# Eval("OVERVIEW") %>' Font-Names="Helvetica" Font-Size="12pt" Style="text-align: center"></asp:Label>

                    </td>
                </tr>
                <tr>
                    <td>
                        <table class="auto-style9">
                        </table>
                    </td>
                </tr>
                <tr></tr>
                <tr>
                    <td></td>
                </tr>

            </table>
        </ItemTemplate>
    </asp:DataList>

    <%-- <asp:Label ID="labelCommentError" runat="server" style="color:red" Text=""></asp:Label>
           <br />
    <asp:GridView ID="gridComment" AutoGenerateColumns="false" runat="server">
        <Columns>
            <asp:BoundField ItemStyle-Width="150px" DataField="username" />
            <asp:BoundField ItemStyle-Width="500px" DataField="comment_text" />
            <asp:ButtonField Text="Delete" ButtonType="Button" CommandName="DeleteComment" />
        </Columns>
    </asp:GridView>--%>


    <div class="col-md-9">
        <div class="card card-primary card-outline">
            <div class="card-header">
                <h3 class="card-title">Comments</h3>
            </div>
            <div class="card-body p-0">
                <div class="table-responsive mailbox-messages">
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="comment_id" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <table class="table table-hover table-striped">
                                <tr style="">
                                    <td class="mailbox-name col-3">
                                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                                    </td>
                                    <td class="mailbox-subject col-6">
                                        <asp:Label ID="comment_textLabel" runat="server" Text='<%# Eval("comment_text") %>' />
                                    </td>
                                    <td class="mailbox-attachment col-1">
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                                    </td>
                                </tr>
                            </table>

                        </ItemTemplate>

                        <AlternatingItemTemplate>
                            <table class="table table-hover table-striped">
                                <tr style="">
                                    <td class="mailbox-name col-3">
                                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                                    </td>
                                    <td class="mailbox-subject col-6">
                                        <asp:Label ID="comment_textLabel" runat="server" Text='<%# Eval("comment_text") %>' />
                                    </td>
                                    <td class="mailbox-attachment col-1">
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
                                    </td>
                                </tr>
                            </table>
                        </AlternatingItemTemplate>

                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>No data was returned.</td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>

                        <SelectedItemTemplate>
                            <table class="table table-hover table-striped">
                                <tr style="">
                                    <td class="mailbox-name col-3">
                                        <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                                    </td>
                                    <td class="mailbox-subject col-6">
                                        <asp:Label ID="comment_textLabel" runat="server" Text='<%# Eval("comment_text") %>' />
                                    </td>
                                    <td class="mailbox-attachment col-1">
                                        <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" class="btn btn-danger" />
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





<%--    <asp:ListView runat="server" DataKeyNames="comment_id" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" />
                </td>

                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="comment_textLabel" runat="server" Text='<%# Eval("comment_text") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Güncelleştir" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="İptal" />
                </td>

                <td>
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                </td>
                <td>
                    <asp:TextBox ID="comment_textTextBox" runat="server" Text='<%# Bind("comment_text") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>Hiçbir veri döndürülmedi.</td>
                </tr>
            </table>
        </EmptyDataTemplate>

        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" />
                </td>

                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="comment_textLabel" runat="server" Text='<%# Eval("comment_text") %>' />
                </td>
            </tr>
        </ItemTemplate>

        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Sil" />
                </td>

                <td>
                    <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                </td>
                <td>
                    <asp:Label ID="comment_textLabel" runat="server" Text='<%# Eval("comment_text") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>

    </asp:ListView>--%>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MOVIEDBConnectionString %>" DeleteCommand="DELETE FROM Comments WHERE comment_id = @comment_id" SelectCommand="SELECT [comment_id], [username], [comment_text] FROM [Comments] WHERE ([movie_id] = @movie_id)">
        <DeleteParameters>
            <asp:Parameter Name="comment_id" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="" Name="movie_id" QueryStringField="FILMID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>

