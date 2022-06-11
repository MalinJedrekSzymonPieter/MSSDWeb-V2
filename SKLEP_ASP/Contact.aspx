<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="SKLEP_ASP.Contact" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="MainContent">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="nazwisko" DataValueField="nazwisko">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SKLEPConnectionString1 %>" SelectCommand="SELECT * FROM [PRACOWNICY]"></asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." Height="299px" Width="677px" DataKeyNames="id_sprzedawcy">
        <Columns>
            <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
            <asp:BoundField DataField="imie" HeaderText="imie" SortExpression="imie" />
            <asp:BoundField DataField="id_sprzedawcy" HeaderText="id_sprzedawcy" ReadOnly="True" SortExpression="id_sprzedawcy" />
            <asp:BoundField DataField="stanowisko" HeaderText="stanowisko" SortExpression="stanowisko" />
            <asp:BoundField DataField="data_zatrudnienia" HeaderText="data_zatrudnienia" SortExpression="data_zatrudnienia" />
            <asp:BoundField DataField="PESEL" HeaderText="PESEL" SortExpression="PESEL" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SKLEPConnectionString1 %>" SelectCommand="SELECT [nazwisko], [imie], [id_sprzedawcy], [stanowisko], [data_zatrudnienia], [PESEL] FROM [PRACOWNICY] WHERE PRACOWNICY.nazwisko = @param" InsertCommand="INSERT INTO PRACOWNICY(id_sprzedawcy, imie, nazwisko, stanowisko, data_zatrudnienia, PESEL) VALUES (,,,,,)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" DefaultValue="Serek" Name="param" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id_produktu" DataSourceID="SqlDataSource2" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id_produktu" HeaderText="id_produktu" ReadOnly="True" SortExpression="id_produktu" />
            <asp:BoundField DataField="id_sprzedawcy" HeaderText="id_sprzedawcy" SortExpression="id_sprzedawcy" />
            <asp:BoundField DataField="typ" HeaderText="typ" SortExpression="typ" />
            <asp:BoundField DataField="ostatnia_cena" HeaderText="ostatnia_cena" SortExpression="ostatnia_cena" />
            <asp:BoundField DataField="rozmiar" HeaderText="rozmiar" SortExpression="rozmiar" />
            <asp:BoundField DataField="kolor" HeaderText="kolor" SortExpression="kolor" />
            <asp:BoundField DataField="material" HeaderText="material" SortExpression="material" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SKLEPConnectionString1 %>" DeleteCommand="DELETE FROM [PRODUKTY] WHERE [id_produktu] = @id_produktu" InsertCommand="INSERT INTO [PRODUKTY] ([id_produktu], [id_sprzedawcy], [typ], [ostatnia_cena], [rozmiar], [kolor], [material]) VALUES (@id_produktu, @id_sprzedawcy, @typ, @ostatnia_cena, @rozmiar, @kolor, @material)" ProviderName="<%$ ConnectionStrings:SKLEPConnectionString1.ProviderName %>" SelectCommand="SELECT [id_produktu], [id_sprzedawcy], [typ], [ostatnia_cena], [rozmiar], [kolor], [material] FROM [PRODUKTY]" UpdateCommand="UPDATE [PRODUKTY] SET [id_sprzedawcy] = @id_sprzedawcy, [typ] = @typ, [ostatnia_cena] = @ostatnia_cena, [rozmiar] = @rozmiar, [kolor] = @kolor, [material] = @material WHERE [id_produktu] = @id_produktu">
        <DeleteParameters>
            <asp:Parameter Name="id_produktu" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="id_produktu" Type="Int32" />
            <asp:Parameter Name="id_sprzedawcy" Type="Int32" />
            <asp:Parameter Name="typ" Type="String" />
            <asp:Parameter Name="ostatnia_cena" Type="Decimal" />
            <asp:Parameter Name="rozmiar" Type="String" />
            <asp:Parameter Name="kolor" Type="String" />
            <asp:Parameter Name="material" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="id_sprzedawcy" Type="Int32" />
            <asp:Parameter Name="typ" Type="String" />
            <asp:Parameter Name="ostatnia_cena" Type="Decimal" />
            <asp:Parameter Name="rozmiar" Type="String" />
            <asp:Parameter Name="kolor" Type="String" />
            <asp:Parameter Name="material" Type="String" />
            <asp:Parameter Name="id_produktu" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

