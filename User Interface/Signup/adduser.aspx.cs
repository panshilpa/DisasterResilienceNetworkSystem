﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DRSN.Business_Application;
using System.Net;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using DRSN.Common;
using DRSN.Data_Access;

namespace DRSN.User_Interface.Signup
{
    public partial class adduser : System.Web.UI.Page

    {

        Common.Signup sign = new Common.Signup();
        public string emailc = String.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Common.Signup common = new Common.Signup();
            string name1 = name.Text;
            common.name = name1;
            common.email = email.Text;
            common.mobile = mobile.Text;
            common.password = password.Text;

            string NewGUID = System.Guid.NewGuid().ToString();
            common.accointid = NewGUID;

            Random random = new Random();
            int value = random.Next(100001, 999999);
            string destinationaddr = "91" + common.mobile;
            string message = "Your OTP Number is " + value + ". " + NewGUID +" ( Sent By : DRSN Team )";
            
            String message1 = HttpUtility.UrlEncode(message);

            using (var wb = new WebClient())
            {
                byte[] response = wb.UploadValues("https://api.textlocal.in/send/", new NameValueCollection()
                {
                {"apikey" , "your key"}, //your textlocal api key
                {"numbers" , destinationaddr},
                {"message" , message1},
                {"sender" , "TXTLCL"}
                });
                string result = System.Text.Encoding.UTF8.GetString(response);

                Session["otp"] = value;
            }
            accountcreate ac = new accountcreate();
            Signupform si = new Signupform();
            si.parametersinsert(common.email);

            
            Session["email"] = common.email;
            Session["mobile"] = common.mobile;
            Session["name"] = common.name;
            Session["password"] = common.password;
            Session["accountid"] = common.accointid;

            

            



            Response.Redirect("Authenticate.aspx");
        }

        protected void password_TextChanged(object sender, EventArgs e)
        {

        }
    }
}