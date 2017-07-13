using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DDAC
{
    public partial class AddCargo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void confirmButton_Click(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                string query = "INSERT INTO Cargo ([ItemName], [Origin], [Destination], [Quantity], [Date]) VALUES (@itemName, @origin, @destination, @quantity, @date)";
                SqlCommand cmd1 = new SqlCommand(query, con);
                cmd1.Parameters.AddWithValue("@itemName", itemTextBox.Text);
                cmd1.Parameters.AddWithValue("@origin", locationTextBox.Text);
                cmd1.Parameters.AddWithValue("@destination", destinationTextBox.Text);
                cmd1.Parameters.AddWithValue("@quantity", quantityTextBox.Text);
                cmd1.Parameters.AddWithValue("@date", dateTextBox.Text);
                cmd1.ExecuteNonQuery();
                

                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Cargo has been added')", true);

                con.Close();

                itemTextBox.Text = "";
                locationTextBox.Text = "";
                destinationTextBox.Text = "";
                quantityTextBox.Text = "";
                dateTextBox.Text = "";

                Response.Redirect(Request.RawUrl);
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.ToString());
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error occured')", true);

                itemTextBox.Text = "";
                locationTextBox.Text = "";
                destinationTextBox.Text = "";
                quantityTextBox.Text = "";
                dateTextBox.Text = "";

                Response.Redirect(Request.RawUrl);
            }
        }
    }
}