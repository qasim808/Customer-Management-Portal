using System;
using System.Collections.Generic;
using System.Data;
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
        public void closeConnection()
        {
            dbConn.Close();
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
                if (procedureName.Equals("updateCustomerRecord"))
                {
                    cmd.Parameters.AddWithValue("@newCustomerCNIC", objs[5].Text);
                }
            }
            else
            {
                cmd.Parameters.AddWithValue("@customerCNIC", objs[0].Text);
            }
            
            try
            {
                dbConn.Open();
                int rowAffected = cmd.ExecuteNonQuery();
                return rowAffected > 0 ? true : false;
            }
            catch(SqlException error)
            {
                dbConn.Close();
                return false;
            }
            dbConn.Close();
            return true;
        }
        public DataTable gridViewSP(string procedureName)
        {
            SqlCommand cmd = new SqlCommand(procedureName, dbConn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            using (cmd)
            {
                using (SqlDataAdapter adapt = new SqlDataAdapter())
                {
                    adapt.SelectCommand = cmd;
                    using (DataTable table = new DataTable())
                    {
                        adapt.Fill(table);
                        return table;
                        
                    }
                }
                
            }
        }
        public string[] executeQuery(string query)
        {
            SqlCommand cmd = new SqlCommand(query, dbConn);
            SqlDataReader reader = cmd.ExecuteReader();
            string[] values = new string[5];
            
            if (reader.Read())
            {
                values[0] = reader.GetValue(0).ToString();
                values[1] = (string)reader.GetValue(1);
                values[2] = (string)reader.GetValue(2);
                values[3] = (string)reader.GetValue(3);
                values[4] = (string)reader.GetValue(4);
                return values;
            }
            else
                return null;
        }
        public bool executeAdminSPs(string procedureName, string [] objs)
        {
            SqlCommand cmd = new SqlCommand(procedureName, dbConn);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", objs[0]);
            cmd.Parameters.AddWithValue("@password", objs[1]);
            using (cmd)
            {
                try
                {
                    dbConn.Open();
                    int rowAffected = cmd.ExecuteNonQuery();
                    return rowAffected > 0 ? true : false;
                }
                catch(SqlException error)
                {
                    return false;
                }
            }
        }
        public DataAccess()
        {
            var connectionFromConfiguration = WebConfigurationManager.ConnectionStrings["DBConn"];
            dbConn = new SqlConnection(connectionFromConfiguration.ConnectionString);
        }
    }
}
