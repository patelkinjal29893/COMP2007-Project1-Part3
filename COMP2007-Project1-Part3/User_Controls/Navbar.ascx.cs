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

/**
 * @author: Kinjal patel
 * @date: June 20, 2016
 * @version: 0.0.1 - added SetActivePage method
 */

namespace COMP2007_Project1_Part3
{
    public partial class Navbar : System.Web.UI.UserControl
    {
        private object games;

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                //check if the user is  logged in
                if(HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    //show GameTracker PlaceHolder to only Login users
                    GameTrackerPlaceHolder.Visible = true;
                    PublicPlaceHolder.Visible = false;
                }
                else
                {
                    //Don't show GameTracker Content to not Logged in Users and show only Login and Register
                    GameTrackerPlaceHolder.Visible = false;
                    PublicPlaceHolder.Visible = true;
                }
                SetActivePage();
            }
            
        }

        /**
         * This method adds a css class of "active" to list items
         * relating to the current page
         * 
         * @private
         * @method SetActivePage
         * @return {void}
         */
        private void SetActivePage()
        {
            switch (Page.Title)
            {
                case "Home Page":
                    home.Attributes.Add("class", "active");
                    break;
                case "game":
                    game.Attributes.Add("class", "active");
                    break;
                case "Contact":
                    contact.Attributes.Add("class", "active");
                    break;
                case "GameTracker Menu":
                    menu.Attributes.Add("class", "active");
                    break;
                case "Login":
                    login.Attributes.Add("class", "active");
                    break;
                case "Register":
                    register.Attributes.Add("class", "active");
                    break;
            }
        }
    }
}