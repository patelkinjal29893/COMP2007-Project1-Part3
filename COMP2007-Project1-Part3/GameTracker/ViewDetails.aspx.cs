using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

// using statements that are required to connect to EF DB
using COMP2007_Project1_Part3.Models;
using System.Web.ModelBinding;
using System.Linq.Dynamic;

namespace COMP2007_Project1_Part3.GameTracker
{
    public partial class ViewDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // if loading the page for the first time, populate the game grid
            if (!IsPostBack)
            {
                Session["SortColumn"] = "gameID";
                Session["SortDirection"] = "ASC";
                // Get the game data
                this.GetGames();
            }
        }
        /**
        * <summary>
        * This method gets the games data from the DB
        * </summary>
        * 
        * @method GetGames
        * @returns {void}
        */
        protected void GetGames()
        {
            string sortString = Session["SortColumn"].ToString() + " " + Session["SortDirection"].ToString();

            // connect to EF
            using (GameTrackerConnection db = new GameTrackerConnection())
            {
                // query the Games Table using EF and LINQ
                var Games = (from allGames in db.Games
                             select allGames);

                // bind the result to the GridView
                GamesGridView.DataSource = Games.AsQueryable().OrderBy(sortString).ToList();
                GamesGridView.DataBind();
            }
        }
        protected void PageSizeDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            // set new page size
            GamesGridView.PageSize = Convert.ToInt32(PageSizeDropDownList.SelectedValue);

            // refresh the grid
            this.GetGames();
        }
        protected void GamesGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            // Set the new page number
            GamesGridView.PageIndex = e.NewPageIndex;

            // refresh the grid
            this.GetGames();
        }
        protected void GamesGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            // get the column to sort by
            Session["SortColumn"] = e.SortExpression;

            // refresh the grid
            this.GetGames();

            // toggle the direction
            Session["SortDirection"] = Session["SortDirection"].ToString() == "ASC" ? "DESC" : "ASC";
        }
        protected void GamesGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (IsPostBack)
            {
                if (e.Row.RowType == DataControlRowType.Header) // check to see if the click is on the header row
                {
                    LinkButton linkbutton = new LinkButton();

                    for (int index = 0; index < GamesGridView.Columns.Count; index++)
                    {
                        if (GamesGridView.Columns[index].SortExpression == Session["SortColumn"].ToString())
                        {
                            if (Session["SortDirection"].ToString() == "ASC")
                            {
                                linkbutton.Text = " <i class='fa fa-caret-up fa-lg'></i>";
                            }
                            else
                            {
                                linkbutton.Text = " <i class='fa fa-caret-down fa-lg'></i>";
                            }

                            e.Row.Cells[index].Controls.Add(linkbutton);
                        }
                    }
                }
            }
        }
    }
}