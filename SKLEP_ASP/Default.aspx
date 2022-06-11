<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SKLEP_ASP._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<body>
    <div class="jumbotron">
        <h1>MSSD-WEB - NAJLEPSZY SERWIS FILMOWY NA TWOJEJ UCZELNI</h1>
        <p class="lead">Przy użyciu tego serwisu możesz sprawdzić najnowsze nowinki filmowe. Możesz sprawdzić jaki reżyser/scenarzysta stworzyli filmy, sprawdzić jacy aktorzy w nich grali oraz jakie recenzje dane dzieło zebrało. Możesz sortować filmy oraz artystów po ich imionach, nazwiskach i nawet datach urodzenia. Możesz dodawać recenzje i oceny do filmów, a nawet własne wpisy do bazy danych z filmami. Dzięki wsparciu społeczności projekt ten może osiągnąć niebotyczne rozmiary!</p>
        <p>&nbsp;</p>
    </div>
    <body>
    <div class="row">
        <div class="col-md-4">
            <h2>Najnowsze filmy - sprawdź to!</h2>
            <p>
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="tytul_film" DataValueField="tytul_film">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" SelectCommand="SELECT DISTINCT tytul_film FROM [FILM]

UNION
SELECT 'Wszystkie'

ORDER BY 1 DESC"></asp:SqlDataSource>
            </p>
            <p>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:BoundField DataField="Tytuł filmu" HeaderText="Tytuł filmu" SortExpression="Tytuł filmu" />
                        <asp:BoundField DataField="Gatunek filmu" HeaderText="Gatunek filmu" SortExpression="Gatunek filmu" />
                        <asp:BoundField DataField="Czas trwania" HeaderText="Czas trwania" SortExpression="Czas trwania" />
                        <asp:BoundField DataField="Data produkcji" HeaderText="Data produkcji" SortExpression="Data produkcji" />
                        <asp:BoundField DataField="Szczegółowy opis filmu" HeaderText="Szczegółowy opis filmu" SortExpression="Szczegółowy opis filmu" />
                        <asp:BoundField DataField="Średnia ocen" HeaderText="Średnia ocen" ReadOnly="True" SortExpression="Średnia ocen" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" DeleteCommand="DELETE FROM [FILM] WHERE [ID_film] = @ID_film" InsertCommand="INSERT INTO [FILM] ([ID_film], [tytul_film], [gatunek_film], [czas_trwania_film], [data_prod_film], [opis_film]) VALUES (@ID_film, @tytul_film, @gatunek_film, @czas_trwania_film, @data_prod_film, @opis_film)" SelectCommand="SELECT tytul_film AS 'Tytuł filmu', gatunek_film AS 'Gatunek filmu', czas_trwania_film AS 'Czas trwania', data_prod_film AS 'Data produkcji', opis_film AS 'Szczegółowy opis filmu', 
'Średnia ocen' = (SELECT STR(COALESCE(AVG(RECENZJA.ocena_recenzja), 0), 12, 2)
FROM [RECENZJA]
WHERE RECENZJA.ID_film = FILM.ID_film)

FROM (((((film_aktor INNER JOIN AKTOR ON AKTOR.ID_aktor=film_aktor.ID_aktor)
INNER JOIN FILM ON FILM.ID_film=film_aktor.ID_film)
INNER JOIN RECENZJA ON FILM.ID_film=RECENZJA.ID_recenzja)
INNER JOIN REZYSER ON FILM.ID_film=REZYSER.ID_rezyser)
INNER JOIN SCENARZYSTA ON FILM.ID_film=SCENARZYSTA.ID_scenarzysta)


WHERE (
tytul_film = @tytul
OR
@tytul = 'Wszystkie')
" UpdateCommand="UPDATE [FILM] SET [tytul_film] = @tytul_film, [gatunek_film] = @gatunek_film, [czas_trwania_film] = @czas_trwania_film, [data_prod_film] = @data_prod_film, [opis_film] = @opis_film WHERE [ID_film] = @ID_film">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_film" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID_film" Type="Int32" />
                        <asp:Parameter Name="tytul_film" Type="String" />
                        <asp:Parameter Name="gatunek_film" Type="String" />
                        <asp:Parameter Name="czas_trwania_film" Type="Decimal" />
                        <asp:Parameter Name="data_prod_film" Type="DateTime" />
                        <asp:Parameter Name="opis_film" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="tytul" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tytul_film" Type="String" />
                        <asp:Parameter Name="gatunek_film" Type="String" />
                        <asp:Parameter Name="czas_trwania_film" Type="Decimal" />
                        <asp:Parameter Name="data_prod_film" Type="DateTime" />
                        <asp:Parameter Name="opis_film" Type="String" />
                        <asp:Parameter Name="ID_film" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                &nbsp;</p>
            <p>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID_film" DataSourceID="SqlDataSource3">
                    <EditItemTemplate>
                        ID_film:
                        <asp:Label ID="ID_filmLabel1" runat="server" Text='<%# Eval("ID_film") %>' />
                        <br />
                        tytul_film:
                        <asp:TextBox ID="tytul_filmTextBox" runat="server" Text='<%# Bind("tytul_film") %>' />
                        <br />
                        gatunek_film:
                        <asp:TextBox ID="gatunek_filmTextBox" runat="server" Text='<%# Bind("gatunek_film") %>' />
                        <br />
                        czas_trwania_film:
                        <asp:TextBox ID="czas_trwania_filmTextBox" runat="server" Text='<%# Bind("czas_trwania_film") %>' />
                        <br />
                        data_prod_film:
                        <asp:TextBox ID="data_prod_filmTextBox" runat="server" Text='<%# Bind("data_prod_film") %>' />
                        <br />
                        opis_film:
                        <asp:TextBox ID="opis_filmTextBox" runat="server" Text='<%# Bind("opis_film") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ID_film:
                        <asp:TextBox ID="ID_filmTextBox" runat="server" Text='<%# Bind("ID_film") %>' />
                        <br />
                        tytul_film:
                        <asp:TextBox ID="tytul_filmTextBox" runat="server" Text='<%# Bind("tytul_film") %>' />
                        <br />
                        gatunek_film:
                        <asp:TextBox ID="gatunek_filmTextBox" runat="server" Text='<%# Bind("gatunek_film") %>' />
                        <br />
                        czas_trwania_film:
                        <asp:TextBox ID="czas_trwania_filmTextBox" runat="server" Text='<%# Bind("czas_trwania_film") %>' />
                        <br />
                        data_prod_film:
                        <asp:TextBox ID="data_prod_filmTextBox" runat="server" Text='<%# Bind("data_prod_film") %>' />
                        <br />
                        opis_film:
                        <asp:TextBox ID="opis_filmTextBox" runat="server" Text='<%# Bind("opis_film") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ID_film:
                        <asp:Label ID="ID_filmLabel" runat="server" Text='<%# Eval("ID_film") %>' />
                        <br />
                        tytul_film:
                        <asp:Label ID="tytul_filmLabel" runat="server" Text='<%# Bind("tytul_film") %>' />
                        <br />
                        gatunek_film:
                        <asp:Label ID="gatunek_filmLabel" runat="server" Text='<%# Bind("gatunek_film") %>' />
                        <br />
                        czas_trwania_film:
                        <asp:Label ID="czas_trwania_filmLabel" runat="server" Text='<%# Bind("czas_trwania_film") %>' />
                        <br />
                        data_prod_film:
                        <asp:Label ID="data_prod_filmLabel" runat="server" Text='<%# Bind("data_prod_film") %>' />
                        <br />
                        opis_film:
                        <asp:Label ID="opis_filmLabel" runat="server" Text='<%# Bind("opis_film") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" DeleteCommand="DELETE FROM [FILM] WHERE [ID_film] = @ID_film" InsertCommand="INSERT INTO [FILM] ([ID_film], [tytul_film], [gatunek_film], [czas_trwania_film], [data_prod_film], [opis_film]) VALUES (@ID_film, @tytul_film, @gatunek_film, @czas_trwania_film, @data_prod_film, @opis_film)" SelectCommand="SELECT * FROM [FILM]" UpdateCommand="UPDATE [FILM] SET [tytul_film] = @tytul_film, [gatunek_film] = @gatunek_film, [czas_trwania_film] = @czas_trwania_film, [data_prod_film] = @data_prod_film, [opis_film] = @opis_film WHERE [ID_film] = @ID_film">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_film" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID_film" Type="Int32" />
                        <asp:Parameter Name="tytul_film" Type="String" />
                        <asp:Parameter Name="gatunek_film" Type="String" />
                        <asp:Parameter Name="czas_trwania_film" Type="Decimal" />
                        <asp:Parameter Name="data_prod_film" Type="DateTime" />
                        <asp:Parameter Name="opis_film" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="tytul_film" Type="String" />
                        <asp:Parameter Name="gatunek_film" Type="String" />
                        <asp:Parameter Name="czas_trwania_film" Type="Decimal" />
                        <asp:Parameter Name="data_prod_film" Type="DateTime" />
                        <asp:Parameter Name="opis_film" Type="String" />
                        <asp:Parameter Name="ID_film" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </p>
            <p>
                &nbsp;</p>
        </div>
        <div class="col-md-4">
            <p>
                &nbsp;</p>
            <p>
                &nbsp;</p>
        </div>
    </div>

</asp:Content>
