<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SKLEP_ASP.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <body>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="nazwisko_aktor" DataValueField="nazwisko_aktor">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" SelectCommand="SELECT DISTINCT nazwisko_aktor FROM [AKTOR]"></asp:SqlDataSource>
    </p>
    <h2>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Imię i nazwisko aktora" HeaderText="Imię i nazwisko aktora" ReadOnly="True" SortExpression="Imię i nazwisko aktora" />
                <asp:BoundField DataField="Data urodzenia aktora" HeaderText="Data urodzenia aktora" SortExpression="Data urodzenia aktora" />
                <asp:BoundField DataField="Tytuł filmu, w którym aktor występuje" HeaderText="Tytuł filmu, w którym aktor występuje" SortExpression="Tytuł filmu, w którym aktor występuje" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" DeleteCommand="DELETE FROM [AKTOR] WHERE [ID_aktor] = @ID_aktor" InsertCommand="INSERT INTO [AKTOR] ([ID_aktor], [imie_aktor], [nazwisko_aktor], [data_ur_aktor]) VALUES (@ID_aktor, @imie_aktor, @nazwisko_aktor, @data_ur_aktor)" SelectCommand="SELECT AKTOR.imie_aktor +' '+ AKTOR.nazwisko_aktor AS 'Imię i nazwisko aktora', AKTOR.data_ur_aktor AS 'Data urodzenia aktora', FILM.tytul_film AS 'Tytuł filmu, w którym aktor występuje'
FROM (([film_aktor] INNER JOIN [AKTOR] ON AKTOR.ID_aktor=film_aktor.ID_aktor)
INNER JOIN [FILM] ON FILM.ID_film=film_aktor.ID_film)

WHERE nazwisko_aktor = @nazwisko


" UpdateCommand="UPDATE [AKTOR] SET [imie_aktor] = @imie_aktor, [nazwisko_aktor] = @nazwisko_aktor, [data_ur_aktor] = @data_ur_aktor WHERE [ID_aktor] = @ID_aktor">
            <DeleteParameters>
                <asp:Parameter Name="ID_aktor" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID_aktor" Type="Int32" />
                <asp:Parameter Name="imie_aktor" Type="String" />
                <asp:Parameter Name="nazwisko_aktor" Type="String" />
                <asp:Parameter Name="data_ur_aktor" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="nazwisko" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="imie_aktor" Type="String" />
                <asp:Parameter Name="nazwisko_aktor" Type="String" />
                <asp:Parameter Name="data_ur_aktor" Type="DateTime" />
                <asp:Parameter Name="ID_aktor" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </h2>
    <h3>&nbsp;</h3>
    <p>&nbsp;</p>
</asp:Content>
