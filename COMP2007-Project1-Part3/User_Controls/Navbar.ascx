<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Navbar.ascx.cs" Inherits="COMP2007_Project1_Part3.Navbar" %>
<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="Default.aspx"><i class="fa fa-gamepad fa-lg"></i> Game Tracker</a>
           
        </div>
        
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                
                <li id="home" runat="server"><a href="/Default.aspx"><i class="fa fa-home fa-lg"></i> Home</a></li>

                <asp:PlaceHolder ID="PublicPlaceHolder" runat="server">
                 <li id="login" runat="server"><a href="/Login.aspx"><i class="fa fa-sign-in fa-lg"></i> Login</a></li>
                 <li id="register" runat="server"><a href="/Register.aspx"><i class="fa fa-user-plus fa-lg"></i> Register</a></li>
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="UserPlaceHolder" runat="server">
                 <li id="users" runat="server"><a href="/Admin/Users.aspx"><i class="fa fa-users fa-lg"></i> Users</a></li>                                  
                </asp:PlaceHolder>

                <asp:PlaceHolder ID="GameTrackerPlaceHolder" runat="server">
                <li id="menu" runat="server"><a href="/GameTracker/MainMenu.aspx"><i class="fa fa-map-signs fa-lg"></i> Game Menu</a></li>
                <li id="game" runat="server"><a href="/GameTracker/Games.aspx"><i class="fa fa-puzzle-piece fa-lg"></i> Games</a></li>
                <li id="editgame" runat="server"><a href="/GameTracker/GameDetails.aspx"><i class="fa fa-bars fa-lg"></i> Edit Game</a></li>  
                <li id="logout" runat="server"><a href="/Logout.aspx"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li> 
                 </asp:PlaceHolder>
                            
                <li id="contact" runat="server"><a href="/Contact.aspx"><i class="fa fa-phone fa-lg"></i> Contact Us</a></li>
                
            </ul>
        </div>
    
    </div>
    
</nav>
