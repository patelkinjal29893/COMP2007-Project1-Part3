<%@ Page Title="Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="COMP2007_Project1_Part3.Admin.Users" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <h1>Users</h1>
                <a href="/Admin/UserDetails.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>Register New User</a>
                <asp:GridView runat="server" ID="UsersGridView" AutoGenerateColumns="False"
                    CssClass="table table-bordered table-striped table-hover" OnRowDeleting="UsersGridView_RowDeleting" DataKeyNames="Id">
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="User Name" Visible="true" />
                        <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" Visible="true" />
                        <asp:BoundField DataField="Email" HeaderText="Email" Visible="true" />
                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/Admin/UserDetails.aspx"
                            DataNavigateUrlFields="Id" DataNavigateUrlFormatString="UserDetails.aspx?Id={0}"
                            ControlStyle-CssClass="btn btn-primary btn-sm">
                            <ControlStyle CssClass="btn btn-primary btn-sm"></ControlStyle>
                        </asp:HyperLinkField>
                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="&lt;i class='fa fa-trash-o fa-lg'&gt;&lt;/i&gt; Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:LinkButton>
                            </ItemTemplate>
                            <ControlStyle CssClass="btn btn-danger btn-sm" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
