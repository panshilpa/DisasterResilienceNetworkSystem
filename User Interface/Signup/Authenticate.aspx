﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Authenticate.aspx.cs" Inherits="DRSN.User_Interface.Signup.Authenticate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Authenticate your account in DRSN</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="assets/image/png" href="assets/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="assets/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="assets/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="assets/css/util.css">
	<link rel="stylesheet" type="text/css" href="assets/css/main.css">
<!--===============================================================================================-->
</head>
<body>

	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(images/bg-01.jpg);">
					<span class="login100-form-title-1">
						Authenticate your email and moile number
					</span>
				</div>

				<div>
					<asp:Label runat="server" ID="otp" Font-Italic="True" Font-Names="Georgia" ForeColor="Red"></asp:Label>
				</div>

				<form id="form2" runat="server">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Email otp required">
						<span class="label-input100">Email otp</span>
						<asp:TextBox class="input100" type="text" name="username" placeholder="Enter email otp" runat="server" ID="aemail"/>
						<span class="focus-input100"></span>
					</div>
					<div class="container-login100-form-btn">
						<%--<asp:Button class="login100-form-btn" runat="server" Text="Authenticate Email" ID="eauth" OnClick="eauth_Click">
							
						</asp:Button>--%>
					    <asp:Button ID="Button1" runat="server" Text="Authenticate Email" class="login100-form-btn" Height="22px" OnClick="Button1_Click" Width="178px" />
					</div>

					<div>
					<asp:Label runat="server" ID="everified" Font-Bold="True" Font-Names="Verdana" ForeColor="#009900"></asp:Label>
				</div>

					<div>
						<asp:Label runat="server" ID="enverified" ForeColor="Red"></asp:Label>
				        <br /><br /></div>
					<div class="wrap-input100 validate-input m-b-18" data-validate = "Mobile otp required">
						<span class="label-input100">Mobile otp</span>
						<asp:TextBox class="input100" type="password" name="pass" placeholder="Enter mobile otp" runat="server" ID="amobile"/>
						<span class="focus-input100"></span>
					</div>


					<div class="container-login100-form-btn">
						<%--<asp:Button class="login100-form-btn" runat="server" Text="Authenticate Mobile" ID="mauth" OnClick="mauth_Click">
							
						</asp:Button>--%>
					    <asp:Button ID="Button2" runat="server" Text="Authenticate Mobile"  class="login100-form-btn" Height="22px" OnClick="Button2_Click" Width="181px"/>
					</div>

					<div>
					<asp:Label runat="server" ID="mverified" Font-Bold="True" Font-Names="Verdana" ForeColor="#009900"></asp:Label>
				        <br />
						<asp:Label runat="server" ID="mnverified" ForeColor="Red"></asp:Label>
				</div>

					<div>
						<br />
						<br />
						<br />
						<%--<asp:Button class="login100-form-btn" runat="server" ForeColor="#CC00CC" Text="Return to Login" ID="push" OnClick="pushdata">
								
							</asp:Button>--%>

						<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Submit" class="login100-form-btn" />

						</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="assets/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/bootstrap/js/popper.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/daterangepicker/moment.min.js"></script>
	<script src="assets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="assets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="assets/js/main.js"></script>

</body>
</html>
