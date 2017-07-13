<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCargo.aspx.cs" Inherits="DDAC.ManageCargo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <h1 style="margin-bottom: 30px">Manage Cargo</h1>
        <asp:GridView ID="CargoGridView" runat="server" AutoGenerateColumns="False" 
            CellPadding="10" ForeColor="#333333" 
            GridLines="None" OnSelectedIndexChanged="gridview_selectedIndex" 
            AllowPaging="True" AllowSorting="True" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" DataKeyNames="Id" DataSourceID="SqlDataSource1"  >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:CommandField ShowSelectButton="true"/>
                <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" />
                <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            </Columns>
            <FooterStyle BackColor="#101010" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#101010" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#b7b7b7" ForeColor="white" HorizontalAlign="Center" />
            <RowStyle BackColor="#b7b7b7" ForeColor="black" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#00a50d" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Cargo]"></asp:SqlDataSource>
    </div>

    <div class="row" style=" margin-top: 20px; height: 1px; border: 1px solid #101010">

    </div>

    <div class="row">
        <h3>Item Name:</h3>
        <asp:TextBox ID="itemTextBox" CssClass="input" style="width: 500px" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="itemTextBox" runat="server" style="color: #ff0000" ErrorMessage="This field can not be empty."></asp:RequiredFieldValidator>
        <h3>Origin:</h3>
        <asp:TextBox ID="locationTextBox" CssClass="input" style="width: 500px" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="locationTextBox" runat="server" style="color: #ff0000" ErrorMessage="This field can not be empty."></asp:RequiredFieldValidator>
        <h3>Destination:</h3>
        <asp:TextBox ID="destinationTextBox" CssClass="input" style="width: 500px" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="destinationTextBox" runat="server" style="color: #ff0000" ErrorMessage="This field can not be empty."></asp:RequiredFieldValidator>
        <h3>Quantity:</h3>
        <asp:TextBox ID="quantityTextBox" CssClass="input" style="width: 500px" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ControlToValidate="quantityTextBox" runat="server" style="color: #ff0000" ErrorMessage="This field can not be empty."></asp:RequiredFieldValidator>
        <h3>Date:</h3>
        <asp:TextBox ID="dateTextBox" CssClass="input" placeholer="DD/MM/YYYY" style="width: 500px" runat="server"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="dateTextBox" runat="server" style="color: #ff0000" ErrorMessage="This field can not be empty."></asp:RequiredFieldValidator>
        <div class="row">
            <div class="col-md-2 col-lg-2" style="margin-right: 10px;">
                <asp:Button ID="updateButton" runat="server" CssClass="button" Text="Update" OnClick="updateButton_Click" />
            </div>
            <div class="col-md-2 col-lg-2">
                <asp:Button ID="deleteButton" runat="server" CssClass="button" Text="Delete" OnClick="deleteButton_Click" />
            </div>
        </div>
        
    </div>
</asp:Content>
