using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace customerProject
{
    public class DataAccess
    {
        public static SqlConnection dbConn = null;
        public bool isConnectionOpen()
        {
            try
            {
                dbConn.Open();
                return true;
            }
            catch (SqlException error)
            {
                return false;
            }
        }
        public SqlDataReader executeFetchQuery(string query)
        {
            SqlCommand cmd = new SqlCommand(query, dbConn);
            return cmd.ExecuteReader().HasRows ? cmd.ExecuteReader(): null;
        }
        public bool executeSP(string procedureName, TextBox [] objs)
        {

            SqlCommand cmd = new SqlCommand(procedureName, dbConn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            if (!procedureName.Equals("deleteCustomer"))
            {
                cmd.Parameters.AddWithValue("@customerCNIC", objs[0].Text);
                cmd.Parameters.AddWithValue("@customerPhone", objs[1].Text);
                cmd.Parameters.AddWithValue("@customerName", objs[2].Text);
                cmd.Parameters.AddWithValue("@customerAddress", objs[3].Text);
                cmd.Parameters.AddWithValue("@emailAddress", objs[4].Text);
            }
            else
            {
                cmd.Parameters.AddWithValue("@customerCNIC", objs[0].Text);
            }
            
            try
            {
                dbConn.Open();
                int rowAffected = cmd.ExecuteNonQuery();
            }
            catch(SqlException error)
            {
                dbConn.Close();
                return false;
            }
            dbConn.Close();
            return true;
        }
        public DataAccess()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["DBConn"];
            dbConn = new SqlConnection(connectionFromConfiguration.ConnectionString);
        }
    }
}
