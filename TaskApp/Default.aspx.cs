using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TaskApp.DAL;

namespace TaskApp
{
    public partial class Default : System.Web.UI.Page
    {
        private Db _db;

        public Default()
        {
            _db = new Db();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            divError.Visible = false;
            divSucc.Visible = false;
            if (!IsPostBack)
            {
                LoadGrd();
            }
        }

        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (Validation())
            {

                List<SqlParameter> sqlParameters = new List<SqlParameter>
                {
                    new SqlParameter {Value = txtTaskId.Text, ParameterName = "@Id"},
                    new SqlParameter {Value = txtTaskName.Text, ParameterName = "@name"},
                    new SqlParameter {Value = txtDescription.Text, ParameterName = "@description"},
                };
                int count = _db.ExecuteNonQuery("Sp_Task_InsertUpdate", sqlParameters);
                if (count > 0)
                {
                    ShowSuccMsg(!string.IsNullOrWhiteSpace(txtTaskId.Text)
                        ? "Saved Successfully"
                        : "Update Successfully");
                    LoadGrd();
                    Clear();
                }
                else
                {
                    ShowErrorMsg("Failed to save/update");
                }
            }
        }
        private bool Validation()
        {
            bool result = true;
            string msg = string.Empty;
            if (string.IsNullOrWhiteSpace(txtTaskName.Text))
            {
                msg += "Task name is empty" + "<br>";
            }
            if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                msg += "Task description is empty" + "<br>";
            }
            if (!string.IsNullOrWhiteSpace(msg))
            {
                result = false;
                ShowErrorMsg(msg);
            }
            return result;
        }

        private void ShowSuccMsg(string msg)
        {
            lblSuccess.Text = msg;
            divSucc.Visible = true;
        }
        private void ShowErrorMsg(string msg)
        {
            lblError.Text = msg;
            divError.Visible = true;
        }

        private void LoadGrd()
        {
            DataSet ds = _db.GetDataSet("Sp_Task");
            grdTask.DataSource = ds;
            grdTask.DataBind();
        }

        private void Clear()
        {
            txtTaskName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtTaskId.Text = string.Empty;
        }
        protected void btnEdit_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string id = ((Label)gvr.FindControl("lblid")).Text;
            string name = ((Label)gvr.FindControl("lblname")).Text;
            string desc = ((Label)gvr.FindControl("lbldescription")).Text;

            txtTaskId.Text = id;
            txtDescription.Text = desc;
            txtTaskName.Text = name;

        }

        protected void btnDelete_OnClick(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            GridViewRow gvr = (GridViewRow)btn.NamingContainer;
            string id = ((Label)gvr.FindControl("lblid")).Text;

            int c = _db.ExecuteNonQuery("Sp_Task_Delete", new List<SqlParameter> { new SqlParameter { Value = id, ParameterName = "@Id" } });
            if (c > 0)
            {
                ShowSuccMsg("Delete Successfully");
                LoadGrd();
                Clear();
            }
            else
            {
                ShowErrorMsg("Failed to delete");
            }
        }

        protected void btnCancel_OnClick(object sender, EventArgs e)
        {
            Clear();
        }
    }
}