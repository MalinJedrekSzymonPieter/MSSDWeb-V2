<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SKLEP_ASP.About" %>
    
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <body>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="tytul_film" DataValueField="tytul_film">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" SelectCommand="SELECT DISTINCT tytul_film FROM [FILM]"></asp:SqlDataSource>
    </p>
    <h2><%: Title %>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="Tytuł filmu" HeaderText="Tytuł filmu" SortExpression="Tytuł filmu" />
                <asp:BoundField DataField="Tytuł recenzji" HeaderText="Tytuł recenzji" SortExpression="Tytuł recenzji" />
                <asp:BoundField DataField="Treść recenzji" HeaderText="Treść recenzji" SortExpression="Treść recenzji" />
                <asp:BoundField DataField="Ocena filmu" HeaderText="Ocena filmu" SortExpression="Ocena filmu" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" SelectCommand="SELECT FILM.tytul_film AS 'Tytuł filmu', RECENZJA.tytul_recenzja AS 'Tytuł recenzji', RECENZJA.tresc_recenzja AS 'Treść recenzji', RECENZJA.ocena_recenzja AS 'Ocena filmu'

FROM (((film_aktor INNER JOIN AKTOR ON AKTOR.ID_aktor=film_aktor.ID_aktor)
INNER JOIN FILM ON FILM.ID_film=film_aktor.ID_film)
INNER JOIN RECENZJA ON FILM.ID_film=RECENZJA.ID_film)





WHERE (
tytul_film = @tytul3
OR
@tytul3 = 'Wszystkie')">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="tytul3" PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </h2>
            <p>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ID_recenzja" DataSourceID="SqlDataSource3">
                    <EditItemTemplate>
                        ID_recenzja:
                        <asp:Label ID="ID_recenzjaLabel1" runat="server" Text='<%# Eval("ID_recenzja") %>' />
                        <br />
                        ID_film:
                        <asp:TextBox ID="ID_filmTextBox" runat="server" Text='<%# Bind("ID_film") %>' />
                        <br />
                        tytul_recenzja:
                        <asp:TextBox ID="tytul_recenzjaTextBox" runat="server" Text='<%# Bind("tytul_recenzja") %>' />
                        <br />
                        tresc_recenzja:
                        <asp:TextBox ID="tresc_recenzjaTextBox" runat="server" Text='<%# Bind("tresc_recenzja") %>' />
                        <br />
                        ocena_recenzja:
                        <asp:TextBox ID="ocena_recenzjaTextBox" runat="server" Text='<%# Bind("ocena_recenzja") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        ID_recenzja:
                        <asp:TextBox ID="ID_recenzjaTextBox" runat="server" Text='<%# Bind("ID_recenzja") %>' />
                        <br />
                        ID_film:
                        <asp:TextBox ID="ID_filmTextBox" runat="server" Text='<%# Bind("ID_film") %>' />
                        <br />
                        tytul_recenzja:
                        <asp:TextBox ID="tytul_recenzjaTextBox" runat="server" Text='<%# Bind("tytul_recenzja") %>' />
                        <br />
                        tresc_recenzja:
                        <asp:TextBox ID="tresc_recenzjaTextBox" runat="server" Text='<%# Bind("tresc_recenzja") %>' />
                        <br />
                        ocena_recenzja:
                        <asp:TextBox ID="ocena_recenzjaTextBox" runat="server" Text='<%# Bind("ocena_recenzja") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        ID_recenzja:
                        <asp:Label ID="ID_recenzjaLabel" runat="server" Text='<%# Eval("ID_recenzja") %>' />
                        <br />
                        ID_film:
                        <asp:Label ID="ID_filmLabel" runat="server" Text='<%# Bind("ID_film") %>' />
                        <br />
                        tytul_recenzja:
                        <asp:Label ID="tytul_recenzjaLabel" runat="server" Text='<%# Bind("tytul_recenzja") %>' />
                        <br />
                        tresc_recenzja:
                        <asp:Label ID="tresc_recenzjaLabel" runat="server" Text='<%# Bind("tresc_recenzja") %>' />
                        <br />
                        ocena_recenzja:
                        <asp:Label ID="ocena_recenzjaLabel" runat="server" Text='<%# Bind("ocena_recenzja") %>' />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:filmwebConnectionString %>" DeleteCommand="DELETE FROM [RECENZJA] WHERE [ID_recenzja] = @ID_recenzja" InsertCommand="INSERT INTO [RECENZJA] ([ID_recenzja], [ID_film], [tytul_recenzja], [tresc_recenzja], [ocena_recenzja]) VALUES (@ID_recenzja, @ID_film, @tytul_recenzja, @tresc_recenzja, @ocena_recenzja)" SelectCommand="SELECT * FROM [RECENZJA]" UpdateCommand="UPDATE [RECENZJA] SET [ID_film] = @ID_film, [tytul_recenzja] = @tytul_recenzja, [tresc_recenzja] = @tresc_recenzja, [ocena_recenzja] = @ocena_recenzja WHERE [ID_recenzja] = @ID_recenzja">
                    <DeleteParameters>
                        <asp:Parameter Name="ID_recenzja" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ID_recenzja" Type="Int32" />
                        <asp:Parameter Name="ID_film" Type="Int32" />
                        <asp:Parameter Name="tytul_recenzja" Type="String" />
                        <asp:Parameter Name="tresc_recenzja" Type="String" />
                        <asp:Parameter Name="ocena_recenzja" Type="Decimal" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ID_film" Type="Int32" />
                        <asp:Parameter Name="tytul_recenzja" Type="String" />
                        <asp:Parameter Name="tresc_recenzja" Type="String" />
                        <asp:Parameter Name="ocena_recenzja" Type="Decimal" />
                        <asp:Parameter Name="ID_recenzja" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
    </p>
            <p>&nbsp;</p>
    <h3>&nbsp;</h3>
    </asp:Content>
