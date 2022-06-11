<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SKLEP_ASP.About" %>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <body>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="nazwisko_rezyser" DataValueField="nazwisko_rezyser">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" SelectCommand="SELECT DISTINCT nazwisko_rezyser FROM [REZYSER]"></asp:SqlDataSource>
    </p>
    <h2><%: Title %>
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Imię i nazwisko reżysera" HeaderText="Imię i nazwisko reżysera" ReadOnly="True" SortExpression="Imię i nazwisko reżysera" />
                <asp:BoundField DataField="Data urodzenia reżysera" HeaderText="Data urodzenia reżysera" SortExpression="Data urodzenia reżysera" />
                <asp:BoundField DataField="Tytuł filmu wyreżyserowanego" HeaderText="Tytuł filmu wyreżyserowanego" SortExpression="Tytuł filmu wyreżyserowanego" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" DeleteCommand="DELETE FROM [REZYSER] WHERE [ID_rezyser] = @ID_rezyser" InsertCommand="INSERT INTO [REZYSER] ([ID_rezyser], [imie_rezyser], [nazwisko_rezyser], [data_ur_rezyser]) VALUES (@ID_rezyser, @imie_rezyser, @nazwisko_rezyser, @data_ur_rezyser)" SelectCommand="SELECT REZYSER.imie_rezyser +' '+ REZYSER.nazwisko_rezyser AS 'Imię i nazwisko reżysera', REZYSER.data_ur_rezyser AS 'Data urodzenia reżysera', FILM.tytul_film AS 'Tytuł filmu wyreżyserowanego'
FROM (([film_rezyser] INNER JOIN [REZYSER] ON REZYSER.ID_rezyser=film_rezyser.ID_rezyser)
INNER JOIN [FILM] ON FILM.ID_film=film_rezyser.ID_film)

WHERE nazwisko_rezyser = @nazwisko


" UpdateCommand="UPDATE [REZYSER] SET [imie_rezyser] = @imie_rezyser, [nazwisko_rezyser] = @nazwisko_rezyser, [data_ur_rezyser] = @data_ur_rezyser WHERE [ID_rezyser] = @ID_rezyser">
            <DeleteParameters>
                <asp:Parameter Name="ID_rezyser" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ID_rezyser" Type="Int32" />
                <asp:Parameter Name="imie_rezyser" Type="String" />
                <asp:Parameter Name="nazwisko_rezyser" Type="String" />
                <asp:Parameter Name="data_ur_rezyser" Type="DateTime" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="nazwisko" PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="imie_rezyser" Type="String" />
                <asp:Parameter Name="nazwisko_rezyser" Type="String" />
                <asp:Parameter Name="data_ur_rezyser" Type="DateTime" />
                <asp:Parameter Name="ID_rezyser" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </h2>
    <h3>&nbsp;</h3>
    </asp:Content>
