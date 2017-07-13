<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="DDAC.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <img src="/Images/Maersk_Group_Logo.jpeg" style="width:30%; margin-top: 20px">
    <h3>The Better Service for Customer</h3>
      <h2></h2>  
      <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
          <li data-target="#myCarousel" data-slide-to="1"></li>
          
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" style="max-height: 650px">
          <div class="item active">
            <a href="/MaerksLineInfo"><img src="/Images/maerksline.jpg" style="width:100%;"></a> 
          </div>

          <div class="item">
            <a  href="/MaerksContainerInfo"><img src="/Images/maerksContainer.jpg"  style="width:100%;"></a>
          </div>
   
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
</asp:Content>
