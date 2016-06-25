<%@ Page Title="Games Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Games.aspx.cs" Inherits="COMP2007_Project1_Part3.Games" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <h1>Games List</h1>
                <a href="/GameTracker/GameDetails.aspx" class="btn btn-success btn-sm"><i class="fa fa-plus"></i>Add Game</a>

                <label for="PageSizeDropDownList">Records per page: </label>
                <asp:DropDownList ID="PageSizeDropDownList" runat="server" AutoPostBack="true"
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="All" Value="10000" />
                </asp:DropDownList>
               
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="GamesGridView" AutoGenerateColumns="False" DataKeyNames="gameID" OnRowDeleting="GamesGridView_RowDeleting"
                    AllowPaging="True" PageSize="3" OnPageIndexChanging="GamesGridView_PageIndexChanging"
                    AllowSorting="True" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound" PagerStyle-CssClass="pagination-ys">
                    <Columns>
                        <asp:BoundField DataField="gameID" HeaderText="Game ID" Visible="true" SortExpression="gameID" />
                        <asp:BoundField DataField="weekNumer" HeaderText="Week Number" Visible="true" SortExpression="weekNumer" />
                        <asp:BoundField DataField="gameName" HeaderText="Game Name" Visible="true" SortExpression="gameName" />
                        <asp:BoundField DataField="teamName" HeaderText="Team Name" Visible="true" SortExpression="teamName" />

                        <asp:HyperLinkField HeaderText="Edit" Text="<i class='fa fa-pencil-square-o fa-lg'></i> Edit" NavigateUrl="~/GameTracker/GameDetails.aspx.cs"
                            DataNavigateUrlFields="gameID" DataNavigateUrlFormatString="GameDetails.aspx?gameID={0}"
                            ControlStyle-CssClass="btn btn-primary btn-sm" ControlStyle-ForeColor="White">
                            <ControlStyle CssClass="btn btn-primary btn-sm" ForeColor="White"></ControlStyle>
                        </asp:HyperLinkField>
                        <asp:TemplateField HeaderText="Delete" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="&lt;i class='fa fa-trash-o fa-lg'&gt;&lt;/i&gt; Delete" OnClientClick="return confirm('Are you sure you want to delete this record?');"></asp:LinkButton>
                            </ItemTemplate>
                            <ControlStyle CssClass="btn btn-danger btn-sm" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:LinkButton ID="LinkButtonViewDetails" runat="server" CausesValidation="False" CommandName="View Details" Text="View Details" CssClass=" btn btn-success btn-lg" OnClick="LinkButtonViewDetails_Click"></asp:LinkButton>
            </div>
        </div>
    </div>
</asp:Content>
