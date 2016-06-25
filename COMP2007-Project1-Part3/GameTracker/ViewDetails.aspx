<%@ Page Title="View Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="COMP2007_Project1_Part3.GameTracker.ViewDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-10">
                <h1>Games Details List</h1>
                <label for="PageSizeDropDownList">Records per page: </label>                
                <asp:DropDownList ID="PageSizeDropDownList" runat="server" AutoPostBack="true"
                    CssClass="btn btn-default btn-sm dropdown-toggle" OnSelectedIndexChanged="PageSizeDropDownList_SelectedIndexChanged">
                    <asp:ListItem Text="3" Value="3" />
                    <asp:ListItem Text="5" Value="5" />
                    <asp:ListItem Text="All" Value="10" />
                </asp:DropDownList>                
                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover"
                    ID="GamesGridView" AutoGenerateColumns="False" DataKeyNames="gameID"
                    AllowPaging="True" PageSize="3" OnPageIndexChanging="GamesGridView_PageIndexChanging"
                    AllowSorting="True" OnSorting="GamesGridView_Sorting" OnRowDataBound="GamesGridView_RowDataBound" PagerStyle-CssClass="pagination-ys">
                    <Columns>
                        <asp:BoundField DataField="weekNumer" HeaderText="Week Number" Visible="true" SortExpression="weekNumer" />
                        <asp:BoundField DataField="gameName" HeaderText="Game Name" Visible="true" SortExpression="gameName" />
                        <asp:BoundField DataField="teamName" HeaderText="Team Name" Visible="true" SortExpression="teamName" />
                        <asp:BoundField DataField="gameDate" HeaderText="Game Date" Visible="true" SortExpression="gameDate" DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:BoundField DataField="description" HeaderText="Description" Visible="true" SortExpression="description" />
                        <asp:BoundField DataField="gameScore" HeaderText="Game Score" Visible="true" SortExpression="gameScore" />
                        <asp:BoundField DataField="Spectator" HeaderText="Game Spectator" Visible="true" SortExpression="Spectator" />
                        <asp:BoundField DataField="winningTeam" HeaderText="Winning Team" Visible="true" SortExpression="winningTeam" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
