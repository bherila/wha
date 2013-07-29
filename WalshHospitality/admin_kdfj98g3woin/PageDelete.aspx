<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="PageDelete.aspx.cs" Inherits="WalshHospitality.admin.PageDelete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="c1" runat="server">
<h1>Confirm Delete</h1>
<p>Are you sure you want to permanently delete this page?</p>
<p>
    <asp:LinkButton ID="lnk_confirm" runat="server" onclick="LinkButton1_Click">Yes, delete it.</asp:LinkButton>
    </p>
    <p>
        <asp:LinkButton ID="lnk_cancel" runat="server" onclick="LinkButton2_Click">Cancel</asp:LinkButton>
    </p>
</asp:Content>
