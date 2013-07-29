<%@ Page Title="" Language="C#" MasterPageFile="~/Template.master" AutoEventWireup="true" EnableViewState="false"
 CodeBehind="Page.aspx.cs" Inherits="WalshHospitality.Page" %>
<%@ OutputCache Duration="3" VaryByParam="id" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxMenu" tagprefix="dxm" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="m_leftplace" runat="server"><asp:PlaceHolder runat="server" ID="m_ph_h1">
    <h1><asp:Literal runat="server" ID="m_h1" /></h1>
</asp:PlaceHolder>
<div style=" margin-left: 30px; margin-right: 30px;">
    
<div runat="server" ID="m_ph_topimage" style="padding-top: 15px;"></div>
<table border="0" cellpadding="0" cellspacing="0" style="padding-top: 15px; width: 100%;">
<tr>
<td style="padding-right: 28px; text-align: justify;">

    <table border="0" cellpadding="0" cellspacing="0"><tr>
    <td style="padding-right: 20px;">
        <div runat="server" ID="m_ph_leftcol">
        <!-- Left column -->

        </div>
    </td><td>
        <div runat="server" ID="m_ph_content">
        
        <div runat="server" ID="m_ph_h2">
        <!-- h2 -->
            <h2><asp:Literal runat="server" ID="m_h2" /></h2>
            </div>

        <!-- Content -->
        <asp:Literal runat="server" ID="m_content" />
        <div runat="server" ID="m_ph_btmimage"></div>

        </div>
    </td></tr>
    </table>

</td>
<td style="padding: 10px 10px 10px 14px; width: 238px; text-align: left; border-left: 2px solid #678D6B;">
    <!-- Right navigation -->
    
    <asp:PlaceHolder Visible="false" runat="server">
    <h2>More <asp:Literal runat="server" ID="m_catname" />...</h2>
    </asp:PlaceHolder>
    
    <dxm:ASPxMenu ID="m_rtmenu" runat="server" Orientation="Vertical" Width="14em" 
        EnableDefaultAppearance="False" ItemSpacing="7px">
        <ItemStyle Font-Underline="True" ForeColor="#678D6B">
        <SelectedStyle Font-Bold="True" Font-Underline="False" ForeColor="#003300">
        </SelectedStyle>
        </ItemStyle>
    </dxm:ASPxMenu>

</td>
</tr>
</table>

</div>

</asp:Content>
