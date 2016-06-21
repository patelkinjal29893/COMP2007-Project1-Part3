<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="COMP2007_Project1_Part3.Default" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<bs3:Jumbotron runat="server" ID="Jumbotron1">
        <BodyContent>
            <h1>Welcome!</h1>
        </BodyContent>
    </bs3:Jumbotron>--%>
    
    <div class="container">
        <div class="row">
            <div class="col-md-offset-2 col-md-8">
                <h1>Game Score Board</h1>                

                <asp:GridView runat="server" CssClass="table table-bordered table-striped table-hover" 
                    ID="GamesGridView" AutoGenerateColumns="False" DataKeyNames="gameID">
                    <Columns>
                        <asp:BoundField DataField="gameID" HeaderText="Game ID" Visible="true" SortExpression="gameID" />
                        <asp:BoundField DataField="gameName" HeaderText="Game Name" Visible="true" SortExpression="gameName"/>  
                        <asp:BoundField DataField="gameDate" HeaderText="Game Date" Visible="true" SortExpression="gameDate"
                            DataFormatString="{0:MMM dd, yyyy}" />
                        <asp:BoundField DataField="teamName" HeaderText="Team Name" Visible="true" SortExpression="teamName"/>                        
                        <asp:BoundField DataField="description" HeaderText="Description" Visible="true" SortExpression="description"/>   
                        <asp:BoundField DataField="gameScore" HeaderText="Game Score" Visible="true" SortExpression="gameScore"/>                                                                                                
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>
