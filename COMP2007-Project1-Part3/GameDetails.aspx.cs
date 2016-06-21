﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements required for EF DB access
using COMP2007_Project1_Part3.Models;
using System.Web.ModelBinding;

namespace COMP2007_Project1_Part3
{
    public partial class GameDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if ((!IsPostBack) && (Request.QueryString.Count > 0))
            {
                this.GetGames();
            }
        }
        private void GetGames()
        {
            // populate the form with existing game data from the db
            int gameID = Convert.ToInt32(Request.QueryString["gameID"]);

            // connect to the EF DB
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                // populate a game instance with the gameID from the URL parameter
                Game updateGame = (from game in db.Games
                                   where game.gameID == gameID
                                   select game).FirstOrDefault();

                // map the game properties to the form controls
                if (updateGame != null)
                {
                    GameNameTextBox.Text = updateGame.gameName;
                    GameDateTextBox.Text = updateGame.gameDate.ToString("yyyy-MM-dd");
                    TeamNameTextBox.Text = updateGame.teamName;
                    DescriptionTextBox.Text = updateGame.description;
                    GameScoreTextBox.Text = updateGame.gameScore.ToString();
                }
            }
        }
        protected void CancelButton_Click(object sender, EventArgs e)
        {
            // Redirect back to Games page
            Response.Redirect("~/Games.aspx");
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            // Use EF to connect to the server
            using (DefaultConnection1 db = new DefaultConnection1())
            {
                // use the GameTracker model to create a new game object and
                // save a new record
                Game newGame = new Game();

                int gameID = 0;

                if (Request.QueryString.Count > 0)
                {
                    // get the id from url
                    gameID = Convert.ToInt32(Request.QueryString["gameID"]);

                    // get the current game from EF DB
                    newGame = (from game in db.Games
                               where game.gameID == gameID
                               select game).FirstOrDefault();
                }

                // add form data to the new game record
                newGame.gameName = GameNameTextBox.Text;
                newGame.gameDate = Convert.ToDateTime(GameDateTextBox.Text);
                newGame.teamName = TeamNameTextBox.Text;
                newGame.description = DescriptionTextBox.Text;
                newGame.gameScore = Convert.ToInt32(GameScoreTextBox.Text);

                // use LINQ to ADO.NET to add / insert new game into the database

                // check to see if a new game is being added
                if (gameID == 0)
                {
                    db.Games.Add(newGame);
                }

                // save our changes - run an update
                db.SaveChanges();

                // Redirect back to the updated games page
                Response.Redirect("~/Games.aspx");
            }
        }
    }
}