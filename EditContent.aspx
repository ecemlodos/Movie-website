<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="EditContent.aspx.cs" Inherits="EditContent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="col-10">
        <div class="card card-info">
        <div class="card-header">
            <h3 class="card-title">Edit Movie of the Day</h3>
        </div>
        <div class="card-body">
            <div class="form-group row">
                <asp:Label ID="TitleLabel" runat="server" CssClass="col-sm-2 col-form-label">Title</asp:Label>
                <div class="col-sm-10">  
                    <asp:TextBox ID="TitleTextBox" runat="server" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <asp:Label ID="ContentLabel" runat="server" class="col-sm-2 col-form-label">Content</asp:Label>
                <div class="col-sm-10">
                    <asp:TextBox ID="ContentTextBox" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <asp:Image ID="Image" runat="server"/>
                 <asp:Label ID="ImageLabel" runat="server" class="col-sm-2 col-form-label">Add Image</asp:Label>
                <asp:FileUpload ID="FileUpload1" runat="server"/>
                <asp:Label ID="LabelUpload" runat="server"></asp:Label>
            </div>
            <div class="form-group row">
                    <asp:Label ID="DateLabel" runat="server" class="col-sm-2 col-form-label">Date</asp:Label>
                    <div class="input-group col-4">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="far fa-calendar-alt"></i></span>
                        </div>
                        <asp:TextBox ID="DateTextBox" runat="server" class="form-control" data-inputmask-alias="datetime" data-inputmask-inputformat="mm/dd/yyyy" placeholder="mm/dd/yyyy"></asp:TextBox>
                    </div>
                </div>
        </div>
        <div class="card-footer">
            <asp:Label ID="Label1" runat="server" class="col-form-label" ForeColor="MediumTurquoise" Text=""></asp:Label>
            <asp:Button ID="SaveButton" runat="server" Text="Save Changes" OnClick="SaveButton_Click" class="btn btn-default float-right"/>
        </div>
    </div>
    </div>
</asp:Content>

