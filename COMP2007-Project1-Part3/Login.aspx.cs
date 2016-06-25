using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//This namespace are required for Identity and OWIN
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace COMP2007_Project1_Part3
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        //This is Login Button click event for allow user to login
        protected void LoginButton_Click(object sender, EventArgs e)
        {
            //create a userStore and userManager objects
            var userStore = new UserStore<IdentityUser>();
            var userManager = new UserManager<IdentityUser>(userStore);

            //search for and create a new user object
            var user = userManager.Find(UserNameTextBox.Text, PasswordTextBox.Text);

            //if the match is found for the user
            if (user != null)
            {
                //authenticate and login new user
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                //Sign in User
                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

                //Redirect to main menu
                Response.Redirect("~/GameTracker/MainMenu.aspx");
            }
            else
            {
                //throw an error to the AlertFlash
                StatusLabel.Text = "Invalid UserName or Password";
                AlertFlash.Visible = true;
            }
        }
    }
}