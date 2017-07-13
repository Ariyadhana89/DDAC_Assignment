<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddCargo.aspx.cs" Inherits="DDAC.AddCargo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-6 col-lg-6">
            <h1 style="margin-bottom: 30px">Add New Cargo</h1>
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
            <asp:Button ID="confirmButton" runat="server" CssClass="button" Text="Confirm" OnClick="confirmButton_Click" />
        </div>
        <div class="col-md-6 col-lg-6" style="margin-top: 100px; max-height: 1000px; overflow: auto">
            <asp:GridView ID="CargoGridView" runat="server" AutoGenerateColumns="False" 
                CellPadding="10" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                GridLines="None" 
                AllowPaging="True" DataKeyNames="Id" AllowSorting="True" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" ></asp:BoundField>
                    <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" ></asp:BoundField>
                    <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" ></asp:BoundField>
                    <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination"></asp:BoundField>
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ></asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date"></asp:BoundField>
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

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cargoesdbConnectionString %>" SelectCommand="SELECT * FROM [Cargo]"></asp:SqlDataSource>

        </div>

    </div>
</asp:Content>
