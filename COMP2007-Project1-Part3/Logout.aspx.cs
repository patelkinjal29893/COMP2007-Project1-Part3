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
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Store session information and authentication methods and authenticationManager object
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            
            //User can Signout now
            authenticationManager.SignOut();

            //Redirect on page of Default
            Response.Redirect("~/Login.aspx");
        }
    }
}