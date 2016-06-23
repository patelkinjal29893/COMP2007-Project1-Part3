﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

//required for EF DB User Access 
using COMP2007_Project1_Part3.Models;
using System.Web.ModelBinding;

//This namespace are required for Identity and OWIN
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;

namespace COMP2007_Project1_Part3.Admin
{
    public partial class UserDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if(Request.QueryString.Count > 0)
                {
                    PasswordPlaceHolder.Visible = false;
                    this.GetUser();                
                }
                else
                {
                    PasswordPlaceHolder.Visible = true;
                }
            }
        }

        protected void GetUser()
        {
            string UserID = Request.QueryString["Id"].ToString();

            using (UserConnection db = new UserConnection())
            {
                AspNetUser updatedUser = (from user in db.AspNetUsers
                                          where user.Id == UserID
                                          select user).FirstOrDefault();

                if(updatedUser != null)
                {
                    UserNameTextBox.Text = updatedUser.UserName;
                    PhoneNumberTextBox.Text = updatedUser.PhoneNumber;
                    EmailTextBox.Text = updatedUser.Email;
                }
            }
        }

       
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            //redirect to Users page
            Response.Redirect("~/Admin/Users.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            string UserID = "";

            //if updating User
            if (Request.QueryString.Count > 0)
            {
                using (UserConnection db = new UserConnection())
                {
                    AspNetUser newUser = new AspNetUser();

                    UserID = Request.QueryString["Id"].ToString();

                    newUser = (from users in db.AspNetUsers
                               where users.Id == UserID
                               select users).FirstOrDefault();

                    newUser.UserName = UserNameTextBox.Text;
                    newUser.PhoneNumber = PhoneNumberTextBox.Text;
                    newUser.Email = EmailTextBox.Text;

                    db.SaveChanges();

                    //Redirect to the Users List
                    Response.Redirect("~/Admin/Users.aspx");
                }
            }
            //if creating new user 
            if (UserID == "")
            {
                //create a userStore and userManager objects
                var userStore = new UserStore<IdentityUser>();
                var userManager = new UserManager<IdentityUser>(userStore);

                //create new user object
                var user = new IdentityUser()
                {
                    UserName = UserNameTextBox.Text,
                    PhoneNumber = PhoneNumberTextBox.Text,
                    Email = EmailTextBox.Text
                };
                //create new User in the DB and store the result
                IdentityResult result = userManager.Create(user, PasswordTextBox.Text);

                if(result.Succeeded)
                {
                    Response.Redirect("~/Admin/Users.aspx");
                }
                else
                {
                    StatusLabel.Text = result.Errors.FirstOrDefault();
                    AlertFlash.Visible = true;
                }
            }
        }       
    }
}