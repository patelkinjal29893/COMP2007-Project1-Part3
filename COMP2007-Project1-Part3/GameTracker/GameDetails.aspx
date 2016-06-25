<%@ Page Title="Games Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GameDetails.aspx.cs" Inherits="COMP2007_Project1_Part3.GameDetails" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-offset-3 col-md-6">
                <h1>Game Details</h1>
                <h5>All Fields are Required</h5>
                <br />
                <div class="form-group">
                    <label class="control-label" for="WeekNumberTextBox">Week Number</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="WeekNumberTextBox" placeholder="Week Number" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="GameNameTextBox">Game Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="GameNameTextBox" placeholder="Game Name" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="TeamNameTextBox">Team Name</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="TeamNameTextBox" placeholder="Team Name" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="GameDateTextBox">Game Date</label>
                    <asp:TextBox runat="server" TextMode="Date" CssClass="form-control" ID="GameDateTextBox" placeholder="Game Date Format: mm/dd/yyyy" required="true"></asp:TextBox>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Invalid Date! Format: mm/dd/yyyy"
                        ControlToValidate="GameDateTextBox" MinimumValue="01/01/2000" MaximumValue="01/01/2999"
                        Type="Date" Display="Dynamic" BackColor="Red" ForeColor="White" Font-Size="Large"></asp:RangeValidator>
                </div>
                <div class="form-group">
                    <label class="control-label" for="DescriptionTextBox">Description</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="DescriptionTextBox" placeholder="Description" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="GameScoreTextBox">Game Score</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="GameScoreTextBox" placeholder="Game Score" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="GameSpectatorTextBox">Game Spectator</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="GameSpectatorTextBox" placeholder="Game Spectator" required="true"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label" for="WinningTeamTextBox">Winning Team</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="WinningTeamTextBox" placeholder="Winning Team" required="true"></asp:TextBox>
                </div>
                <div class="text-right">
                    <asp:Button Text="Cancel" ID="CancelButton" CssClass="btn btn-warning btn-lg" runat="server"
                        UseSubmitBehavior="false" CausesValidation="false" OnClick="CancelButton_Click" />
                    <asp:Button Text="Save" ID="SaveButton" CssClass="btn btn-primary btn-lg" runat="server" OnClick="SaveButton_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
