<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="Pages.aspx.cs" Inherits="WalshHospitality.admin.Pages" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Xpo.v10.2.Web, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Xpo" tagprefix="dxxpo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c1" runat="server">
    <dxwgv:ASPxGridView ID="m_grid" runat="server" AutoGenerateColumns="False" KeyFieldName="Oid">
        <SettingsBehavior AutoExpandAllGroups="True" EncodeErrorHtml="True" />
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <SettingsCookies CookiesID="pageGridSettings" Enabled="True" 
            StoreColumnsVisiblePosition="False" StoreColumnsWidth="False" Version="3" />
    <Columns>
        <dxwgv:GridViewCommandColumn VisibleIndex="0">
            <ClearFilterButton Visible="True">
            </ClearFilterButton>
        </dxwgv:GridViewCommandColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Oid" ReadOnly="True" VisibleIndex="1">
        </dxwgv:GridViewDataTextColumn>
        <dxwgv:GridViewDataColumn FieldName="Guid" VisibleIndex="2">
            <DataItemTemplate>
                <asp:HyperLink runat="server" NavigateUrl='<%# Eval("Guid", "PageEditor.aspx?id={0}") %>' Text='Edit' />
            </DataItemTemplate>
        </dxwgv:GridViewDataColumn>
        <dxwgv:GridViewDataTextColumn FieldName="Heading1" VisibleIndex="3" />
        <dxwgv:GridViewDataTextColumn FieldName="Heading2" VisibleIndex="4" />
        <dxwgv:GridViewDataTextColumn FieldName="SortOrder" VisibleIndex="5" SortIndex="0" SortOrder="Ascending" />
<%--        <dxwgv:GridViewDataTextColumn FieldName="ImgTop" VisibleIndex="5" />
        <dxwgv:GridViewDataTextColumn FieldName="ImgLeft1" VisibleIndex="6" />
        <dxwgv:GridViewDataTextColumn FieldName="ImgLeft2" VisibleIndex="7" />
        <dxwgv:GridViewDataTextColumn FieldName="ImgLeft3" VisibleIndex="8" />
        <dxwgv:GridViewDataTextColumn FieldName="ImgLeft4" VisibleIndex="9" />--%>
        <dxwgv:GridViewDataTextColumn FieldName="Category" VisibleIndex="10" />
    </Columns>
        <Settings ShowFilterRow="True" />
</dxwgv:ASPxGridView>
    <br />
    <a href="PageEditor.aspx">Create a new page</a>
</asp:Content>
