<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeBehind="PageEditor.aspx.cs" Inherits="WalshHospitality.admin.PageEditor" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register assembly="Radactive.WebControls.ILoad" namespace="Radactive.WebControls.ILoad" tagprefix="RAWCIL" %>
<%@ Register assembly="obout_Editor" namespace="OboutInc.Editor" tagprefix="obout" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRoundPanel" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dxtc" %>
<%@ Register assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dxw" %>
<%@ Register src="PageEditorTopImage.ascx" tagname="PageEditorTopImage" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
.placeholder {  border: 1px solid #888; background: #EEE; vertical-align: middle; 
                text-align: center; position: relative; }
</style>

<script type="text/javascript">
//<![CDATA[

    // Dispay the I-Load window using the GreyBox library
    function CustomWindowProvider_WindowOpen (controlId, windowLabel, windowId, url, w, h, modal, center, resizable, title)
    {
        var options = {
            caption: title,
            height: h,
            width: w,
            fullscreen: false,
            show_loading: false,
            center_win: true,
            show_close_img: true
        }
        var win = new GB_Window(options);
        return win.show(url);
    }

    // Hide an I-Load window displayed using the GreyBox library
    function CustomWindowProvider_WindowClose (controlId, windowLabel, windowId, win) {GB_hide(); }
    
//]]>
</script>
    
</asp:Content>
<asp:Content ID="c" ContentPlaceHolderID="c1" runat="server">
    <h1>Edit Page</h1>
    <hr />
    
<table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">
<tr><td valign="top">

    Warning: Any changes you make on this page will not be saved unless you click 
    this button:
    <table border="0" cellpadding="4" cellspacing="0">
    <tr><td>
        <dxe:ASPxButton ID="m_btnsave" runat="server" Text="Save Changes" 
        onclick="DoSave">
        </dxe:ASPxButton>
        </td><td>
            <dxe:ASPxButton ID="m_btnsaveexit" runat="server" Text="Save and Exit" 
                onclick="DoSaveAndExit" >
        </dxe:ASPxButton></td>
        
        <td><dxe:ASPxButton ID="m_btndelete" runat="server" Text="Delete Page" 
                onclick="DoDelete">
        </dxe:ASPxButton></td>
        
        <td>Category:</td>
        <td>
            <asp:DropDownList ID="m_category" runat="server">
            </asp:DropDownList>
        </td>
        
        <td>Sort order:</td>
        <td>
            <asp:TextBox ID="m_sort" runat="server" Width="42px"></asp:TextBox>
        </td>
        </tr>
    </table>
    <br />

<dxe:ASPxTextBox ID="m_h1" runat="server" Width="433px" Font-Size="14pt" 
        NullText="Optional Heading 1">
</dxe:ASPxTextBox>
    <br />
    
        <dxe:ASPxTextBox ID="m_h2" runat="server" Width="266px" Font-Size="13pt" 
        NullText="Optional Heading 2">
        </dxe:ASPxTextBox>
    <br />
        <dxtc:ASPxPageControl runat="server" ActiveTabIndex="1" AutoPostBack="True" 
        SaveStateToCookies="True" SaveStateToCookiesID="xpo_editorstate" 
        Width="600px">
            <TabPages>
                <dxtc:TabPage Text="HTML Content">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                            <obout:Editor ID="c" runat="server" Appearance="custom" 
                                ImageBrowse="myImageBrowse.aspx" PathPrefix="Editor_data/" 
                                ShowQuickFormat="False" Submit="False" Width="580">
                                <Buttons>
                                    <obout:Select Name="FontName" />
                                    <obout:Select Name="FontSize" />
                                    <obout:Toggle Name="Bold" />
                                    <obout:Toggle Name="Italic" />
                                    <obout:Method Name="ForeColor" />
                                    <obout:Method Name="JustifyLeft" />
                                    <obout:Method Name="JustifyCenter" />
                                    <obout:Method Name="JustifyRight" />
                                    <obout:Method Name="ClearStyles" />
                                    <obout:HorizontalSeparator />
                                    <obout:Method Name="Undo" />
                                    <obout:Method Name="InsertIMG" />
                                    <obout:Method Name="InsertTable" />
                                    <obout:Method Name="Paste" />
                                    <obout:Method Name="PasteText" />
                                </Buttons>
                            </obout:Editor>
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
                <dxtc:TabPage Text="Property Information">
                    <ContentCollection>
                        <dxw:ContentControl runat="server">
                        
                        <div style="margin-top: .5em;">Client:</div>
                        <div><dxe:ASPxTextBox ID="m_client" runat="server" NullText="(none)" Width="250px" /></div>
                        
                        <div style="margin-top: .5em;">Location:</div>
                        <div><dxe:ASPxMemo ID="m_location" runat="server" NullText="(none)" Width="250px" Height="64px" /></div>
                        
                        <div style="margin-top: .5em;">Property Information: [-] for new bullet point</div>
                        <div><dxe:ASPxMemo ID="m_propertyinfo" runat="server" NullText="(none)" Width="250px" Height="80px" /></div>
                        
                        <div style="margin-top: .5em;">Scope:</div>
                        <div><dxe:ASPxMemo ID="m_scope" runat="server" NullText="(none)" Width="250px" Height="80px" /></div>
                        
                        </dxw:ContentControl>
                    </ContentCollection>
                </dxtc:TabPage>
            </TabPages>
    </dxtc:ASPxPageControl>

</td><td valign="top">
    <dxrp:ASPxRoundPanel runat="server" HeaderText="Top image" 
        Width="200px">
        <PanelCollection>
<dxp:PanelContent runat="server">
    <uc1:PageEditorTopImage ID="m_top" runat="server" />
    <br />
    
            </dxp:PanelContent>
</PanelCollection>
    </dxrp:ASPxRoundPanel>
        <dxrp:ASPxRoundPanel runat="server" 
        HeaderText="Left-side images" Width="200px">
        <PanelCollection>
            <dxp:PanelContent runat="server">
                <RAWCIL:ILoad ID="m_img1" runat="server" AddImageButtonText="~" 
                    AllowAddImage="True" AllowEditImage="True" AllowPreviewWindow="True" 
                    AllowRemoveImage="True" Appearance="Default" 
                    AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False" 
                    AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" 
                    ButtonsSpaceWidth="100px" Culture="" CustomWindowProvider_Close="" 
                    CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False" 
                    EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" 
                    IconCustomResize="" IconSpaceWidth="42px" OnClientControlInitialized="" 
                    OnClientValueChanged="" RemoveImageButtonText="~" ShowImageDetails="True" 
                    ShowImageIcon="True" Width="312px" WindowMode="Auto">
<Configuration ManualTemporaryFolder="False" OnCompleteBehavior="MoveFilesToDestinationFolder" WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" GenerateIconImage="True" GenerateSelectedImage="False" GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="/images" UrlMode="Manual" ManualUrl="/images"></DestinationFolder>
<WebImageDefinitions>
<Radactive.WebControls.ILoad.Configuration.WebImageDefinition InternalCode="Default" Title="Default">
<SizeConstraint Mode="FreeSize">
<FixedSizeData Size="400, 300"></FixedSizeData>

<FixedAspectRatioSizeData Size="400, 300" LimitedDimension="Width">
<Limits>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</Limits>
</FixedAspectRatioSizeData>

<FreeSizeData>
<LimitsW>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</LimitsW>

<LimitsH>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</LimitsH>
</FreeSizeData>
</SizeConstraint>

<OutputOptions FormatMode="Custom" Format="b96b3cae-0728-11d3-9d7b-0000f81ef32e" JPEGQuality="92" JPEGForceRecompression="False"></OutputOptions>
<ResizeDefinitions>
<Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition InternalCode="LeftCol" Title="Left Column" Mode="Adaptive" AdaptiveMaxSize="250, 999" FixedSize="64, 64" Fit="False" ZoomFactor="250" BackgroundColor="White" HTMLBackgroundColor="White" DisableIfSmaller="True" UseSourceImage="False" ApplyCrop="True" ApplyRotateFlip="True"></Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition>
</ResizeDefinitions>
</Radactive.WebControls.ILoad.Configuration.WebImageDefinition>
</WebImageDefinitions>

<WindowsAppearance>
<ImageUploadWizardWindow WindowTitle="Upload image" TopLogoImageUrl="" ShowWelcomePage="False" ShowSummaryPage="False" WelcomePageText="" ShowImagePreviewBeforeFileUpload="True" ShowSaveButtonDuringImageEdit="True" CropperCanvasColor="White" HTMLCropperCanvasColor="White" AutoZoomCropperView="True"></ImageUploadWizardWindow>

<PreviewWindow WindowTitle="Preview" AllowImageDownload="True" AllowImagePrint="True"></PreviewWindow>
</WindowsAppearance>

<InputOptions>
<UploadableFileSizeLimits>
<LowLimit Enabled="False" Value="1"></LowLimit>

<HiLimit Enabled="True" Value="4194304"></HiLimit>
</UploadableFileSizeLimits>

<SourceImageSizeLimitsW>
<LowLimit Enabled="True" Value="250"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsW>

<SourceImageSizeLimitsH>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsH>

<FileExtensionValidator DefaultBehavior="AcceptAll" AcceptedFileExtensions="" NotAcceptedFileExtensions=""></FileExtensionValidator>
</InputOptions>

<ImageCropperOptions AllowImageResize="True" AllowImageZoom="True" AllowImageRotate="True" AllowImageFlip="True"></ImageCropperOptions>
</Configuration>
</RAWCIL:ILoad><br />
                <RAWCIL:ILoad ID="m_img2" runat="server" AddImageButtonText="~" 
                    AllowAddImage="True" AllowEditImage="True" AllowPreviewWindow="True" 
                    AllowRemoveImage="True" Appearance="Default" 
                    AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False" 
                    AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" 
                    ButtonsSpaceWidth="100px" Culture="" CustomWindowProvider_Close="" 
                    CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False" 
                    EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" 
                    IconCustomResize="" IconSpaceWidth="42px" OnClientControlInitialized="" 
                    OnClientValueChanged="" RemoveImageButtonText="~" ShowImageDetails="True" 
                    ShowImageIcon="True" Width="312px" WindowMode="Auto" >
<Configuration ManualTemporaryFolder="False" OnCompleteBehavior="KeepFilesInTemporaryFolder" WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" GenerateIconImage="True" GenerateSelectedImage="True" GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="" UrlMode="Automatic" ManualUrl=""></DestinationFolder>

<WindowsAppearance>
<ImageUploadWizardWindow WindowTitle="RADactive I-load" TopLogoImageUrl="" ShowWelcomePage="True" ShowSummaryPage="True" WelcomePageText="" ShowImagePreviewBeforeFileUpload="True" ShowSaveButtonDuringImageEdit="True" CropperCanvasColor="White" HTMLCropperCanvasColor="White" AutoZoomCropperView="True"></ImageUploadWizardWindow>

<PreviewWindow WindowTitle="RADactive I-load - Preview" AllowImageDownload="True" AllowImagePrint="True"></PreviewWindow>
</WindowsAppearance>

<InputOptions>
<UploadableFileSizeLimits>
<LowLimit Enabled="False" Value="1"></LowLimit>

<HiLimit Enabled="False" Value="2097152"></HiLimit>
</UploadableFileSizeLimits>

<SourceImageSizeLimitsW>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsW>

<SourceImageSizeLimitsH>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsH>

<FileExtensionValidator DefaultBehavior="AcceptAll" AcceptedFileExtensions="" NotAcceptedFileExtensions=""></FileExtensionValidator>
</InputOptions>

<ImageCropperOptions AllowImageResize="True" AllowImageZoom="True" AllowImageRotate="True" AllowImageFlip="True"></ImageCropperOptions>
</Configuration>
</RAWCIL:ILoad>
                <br />
                <RAWCIL:ILoad ID="m_img3" runat="server" AddImageButtonText="~" 
                    AllowAddImage="True" AllowEditImage="True" AllowPreviewWindow="True" 
                    AllowRemoveImage="True" Appearance="Default" 
                    AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False" 
                    AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" 
                    ButtonsSpaceWidth="100px" Culture="" CustomWindowProvider_Close="" 
                    CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False" 
                    EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" 
                    IconCustomResize="" IconSpaceWidth="42px" OnClientControlInitialized="" 
                    OnClientValueChanged="" RemoveImageButtonText="~" ShowImageDetails="True" 
                    ShowImageIcon="True" Width="312px" WindowMode="Auto" >
<Configuration ManualTemporaryFolder="False" OnCompleteBehavior="KeepFilesInTemporaryFolder" WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" GenerateIconImage="True" GenerateSelectedImage="True" GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="" UrlMode="Automatic" ManualUrl=""></DestinationFolder>

<WindowsAppearance>
<ImageUploadWizardWindow WindowTitle="RADactive I-load" TopLogoImageUrl="" ShowWelcomePage="True" ShowSummaryPage="True" WelcomePageText="" ShowImagePreviewBeforeFileUpload="True" ShowSaveButtonDuringImageEdit="True" CropperCanvasColor="White" HTMLCropperCanvasColor="White" AutoZoomCropperView="True"></ImageUploadWizardWindow>

<PreviewWindow WindowTitle="RADactive I-load - Preview" AllowImageDownload="True" AllowImagePrint="True"></PreviewWindow>
</WindowsAppearance>

<InputOptions>
<UploadableFileSizeLimits>
<LowLimit Enabled="False" Value="1"></LowLimit>

<HiLimit Enabled="False" Value="2097152"></HiLimit>
</UploadableFileSizeLimits>

<SourceImageSizeLimitsW>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsW>

<SourceImageSizeLimitsH>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsH>

<FileExtensionValidator DefaultBehavior="AcceptAll" AcceptedFileExtensions="" NotAcceptedFileExtensions=""></FileExtensionValidator>
</InputOptions>

<ImageCropperOptions AllowImageResize="True" AllowImageZoom="True" AllowImageRotate="True" AllowImageFlip="True"></ImageCropperOptions>
</Configuration>
</RAWCIL:ILoad>
                <br />
                <RAWCIL:ILoad ID="m_img4" runat="server" AddImageButtonText="~" 
                    AllowAddImage="True" AllowEditImage="True" AllowPreviewWindow="True" 
                    AllowRemoveImage="True" Appearance="Default" 
                    AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False" 
                    AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" 
                    ButtonsSpaceWidth="100px" Culture="" CustomWindowProvider_Close="" 
                    CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False" 
                    EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" 
                    IconCustomResize="" IconSpaceWidth="42px" OnClientControlInitialized="" 
                    OnClientValueChanged="" RemoveImageButtonText="~" ShowImageDetails="True" 
                    ShowImageIcon="True" Width="312px" WindowMode="Auto" >
<Configuration ManualTemporaryFolder="False" OnCompleteBehavior="KeepFilesInTemporaryFolder" WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" GenerateIconImage="True" GenerateSelectedImage="True" GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="" UrlMode="Automatic" ManualUrl=""></DestinationFolder>

<WindowsAppearance>
<ImageUploadWizardWindow WindowTitle="RADactive I-load" TopLogoImageUrl="" ShowWelcomePage="True" ShowSummaryPage="True" WelcomePageText="" ShowImagePreviewBeforeFileUpload="True" ShowSaveButtonDuringImageEdit="True" CropperCanvasColor="White" HTMLCropperCanvasColor="White" AutoZoomCropperView="True"></ImageUploadWizardWindow>

<PreviewWindow WindowTitle="RADactive I-load - Preview" AllowImageDownload="True" AllowImagePrint="True"></PreviewWindow>
</WindowsAppearance>

<InputOptions>
<UploadableFileSizeLimits>
<LowLimit Enabled="False" Value="1"></LowLimit>

<HiLimit Enabled="False" Value="2097152"></HiLimit>
</UploadableFileSizeLimits>

<SourceImageSizeLimitsW>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsW>

<SourceImageSizeLimitsH>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsH>

<FileExtensionValidator DefaultBehavior="AcceptAll" AcceptedFileExtensions="" NotAcceptedFileExtensions=""></FileExtensionValidator>
</InputOptions>

<ImageCropperOptions AllowImageResize="True" AllowImageZoom="True" AllowImageRotate="True" AllowImageFlip="True"></ImageCropperOptions>
</Configuration>
</RAWCIL:ILoad>
            </dxp:PanelContent>
        </PanelCollection>
    </dxrp:ASPxRoundPanel>
    <dxrp:ASPxRoundPanel ID="rp_btmimg" runat="server" HeaderText="Bottom image [content centered]" 
        Width="200px">
        <PanelCollection>
<dxp:PanelContent runat="server">
    <RAWCIL:ILoad ID="m_btmimage" runat="server" AddImageButtonText="~" 
        AllowAddImage="True" AllowEditImage="True" AllowPreviewWindow="True" 
        AllowRemoveImage="True" Appearance="Default" 
        AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False" 
        AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" 
        ButtonsSpaceWidth="100px" Culture="" CustomWindowProvider_Close="" 
        CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False" 
        EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" 
        IconCustomResize="" IconSpaceWidth="42px" OnClientControlInitialized="" 
        OnClientValueChanged="" RemoveImageButtonText="~" ShowImageDetails="True" 
        ShowImageIcon="True" Width="312px" WindowMode="Auto">
        
<Configuration ManualTemporaryFolder="False" 
        OnCompleteBehavior="MoveFilesToDestinationFolder" 
        WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" 
        GenerateIconImage="True" GenerateSelectedImage="False" 
        GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="/images" UrlMode="Manual" ManualUrl="/images"></DestinationFolder>
<WebImageDefinitions>
<Radactive.WebControls.ILoad.Configuration.WebImageDefinition InternalCode="Default" Title="Default">
<SizeConstraint Mode="FreeSize">
<FixedSizeData Size="670, 195"></FixedSizeData>

<FixedAspectRatioSizeData Size="670, 195" LimitedDimension="Width">
<Limits>
<LowLimit Enabled="True" Value="670"></LowLimit>

<HiLimit Enabled="False" Value="670"></HiLimit>
</Limits>
</FixedAspectRatioSizeData>

<FreeSizeData>
<LimitsW>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</LimitsW>

<LimitsH>
<LowLimit Enabled="False" Value="300"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</LimitsH>
</FreeSizeData>
</SizeConstraint>

<OutputOptions FormatMode="Custom" Format="b96b3cae-0728-11d3-9d7b-0000f81ef32e" JPEGQuality="92" JPEGForceRecompression="False"></OutputOptions>
<ResizeDefinitions>
<Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition 
        InternalCode="BtmImage" Title="Bottom Image" Mode="Adaptive" 
        AdaptiveMaxSize="520, 480" FixedSize="520, 480" Fit="True" ZoomFactor="200" 
        BackgroundColor="White" HTMLBackgroundColor="White" DisableIfSmaller="True" 
        UseSourceImage="False" ApplyCrop="True" ApplyRotateFlip="True"></Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition>
</ResizeDefinitions>
</Radactive.WebControls.ILoad.Configuration.WebImageDefinition>
</WebImageDefinitions>

<WindowsAppearance>
<ImageUploadWizardWindow WindowTitle="Choose Bottom Image" TopLogoImageUrl="" ShowWelcomePage="True" ShowSummaryPage="True" WelcomePageText="" ShowImagePreviewBeforeFileUpload="True" ShowSaveButtonDuringImageEdit="True" CropperCanvasColor="White" HTMLCropperCanvasColor="White" AutoZoomCropperView="True"></ImageUploadWizardWindow>


<PreviewWindow WindowTitle="Preview Bottom Image" AllowImageDownload="True" AllowImagePrint="True"></PreviewWindow>
</WindowsAppearance>

<InputOptions>
<UploadableFileSizeLimits>
<LowLimit Enabled="False" Value="1"></LowLimit>

<HiLimit Enabled="True" Value="4000000"></HiLimit>
</UploadableFileSizeLimits>

<SourceImageSizeLimitsW>
<LowLimit Enabled="True" Value="670"></LowLimit>

<HiLimit Enabled="False" Value="670"></HiLimit>
</SourceImageSizeLimitsW>

<SourceImageSizeLimitsH>
<LowLimit Enabled="True" Value="195"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsH>

<FileExtensionValidator DefaultBehavior="AcceptAll" AcceptedFileExtensions="" NotAcceptedFileExtensions=""></FileExtensionValidator>
</InputOptions>

<ImageCropperOptions AllowImageResize="True" AllowImageZoom="True" AllowImageRotate="True" AllowImageFlip="True"></ImageCropperOptions>
</Configuration>


</RAWCIL:ILoad>
    
            </dxp:PanelContent>
</PanelCollection>
    </dxrp:ASPxRoundPanel>
</td></tr></table>


</asp:Content>
