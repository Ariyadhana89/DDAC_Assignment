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
    public partial class ManageCargo : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gridview_selectedIndex(object sender, EventArgs e)
        {
            GridViewRow row = CargoGridView.SelectedRow;
            string id = row.Cells[1].Text;
            Session["id"] = id;
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT [ItemName],[Origin],[Destination],[Quantity],[Date] FROM Cargo WHERE [Id]=@id", con);
                cmd.Parameters.AddWithValue("@id", Convert.ToInt32(id));
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    itemTextBox.Text = reader.GetString(reader.GetOrdinal("ItemName"));
                    locationTextBox.Text = reader.GetString(reader.GetOrdinal("Origin"));
                    destinationTextBox.Text = reader.GetString(reader.GetOrdinal("Destination"));
                    quantityTextBox.Text = Convert.ToString(reader.GetInt32(reader.GetOrdinal("Quantity")));
                    dateTextBox.Text = reader.GetString(reader.GetOrdinal("Date"));
                }
                reader.Close();
                con.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error occured')", true);
            }
        }

        protected void updateButton_Click(object sender, EventArgs e)
        {
            if (!Session["id"].Equals("")) {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Cargo WHERE [Id]=@id", con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["id"].ToString()));
                    int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    if (count > 0)
                    {
                        SqlCommand cmd1 = new SqlCommand("UPDATE Cargo SET [ItemName]=@name,[Origin]=@origin,[Destination]=@destination,[Quantity]=@quantity, [Date]=@date WHERE [Id]=@id", con);
                        cmd1.Parameters.AddWithValue("@name", itemTextBox.Text);
                        cmd1.Parameters.AddWithValue("@origin", locationTextBox.Text);
                        cmd1.Parameters.AddWithValue("@destination", destinationTextBox.Text);
                        cmd1.Parameters.AddWithValue("@quantity", Convert.ToInt32(quantityTextBox.Text));
                        cmd1.Parameters.AddWithValue("@date", dateTextBox.Text);
                        cmd1.Parameters.AddWithValue("@id", Session["id"].ToString());
                        cmd1.ExecuteNonQuery();
                        con.Close();
                        itemTextBox.Text = "";
                        locationTextBox.Text = "";
                        destinationTextBox.Text = "";
                        quantityTextBox.Text = "";
                        dateTextBox.Text = "";

                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Account is not registered')", true);
                        itemTextBox.Text = "";
                        locationTextBox.Text = "";
                        destinationTextBox.Text = "";
                        quantityTextBox.Text = "";
                        dateTextBox.Text = "";

                        Response.Redirect(Request.RawUrl);
                    }
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write(ex);
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error occured')", true);
                }
            } else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "You need to select first!", true);
            }
        }

        protected void deleteButton_Click(object sender, EventArgs e)
        {
            if (!Session["id"].Equals(""))
            {
                try
                {
                    con.Open();
                    string query = "SELECT COUNT(*) FROM Cargo WHERE [Id]=@id";
                    SqlCommand cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@id", Convert.ToInt32(Session["id"].ToString()));
                    int check = Convert.ToInt32(cmd.ExecuteScalar().ToString());
                    if (check > 0)
                    {
                        SqlCommand cmd1 = new SqlCommand("DELETE FROM Cargo WHERE [Id] = @id", con);
                        cmd1.Parameters.AddWithValue("@id", Convert.ToInt32(Session["id"].ToString()));
                        cmd1.ExecuteNonQuery();
                        con.Close();
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Delete has been successful')", true);
                        itemTextBox.Text = "";
                        locationTextBox.Text = "";
                        destinationTextBox.Text = "";
                        quantityTextBox.Text = "";
                        dateTextBox.Text = "";

                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('E-mail is not registered')", true);
                        itemTextBox.Text = "";
                        locationTextBox.Text = "";
                        destinationTextBox.Text = "";
                        quantityTextBox.Text = "";
                        dateTextBox.Text = "";

                        Response.Redirect(Request.RawUrl);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('An error occured')", true);
                }
            } else
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "You need to select first!", true);
            }
        }
    }
}