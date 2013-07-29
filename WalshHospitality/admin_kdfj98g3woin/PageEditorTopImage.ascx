<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PageEditorTopImage.ascx.cs" Inherits="WalshHospitality.PageEditorTopImage" %>

<%@ Register Assembly="Radactive.WebControls.ILoad" Namespace="Radactive.WebControls.ILoad"
    TagPrefix="RAWCIL" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dxtc" %>
<%@ Register Assembly="DevExpress.Web.v10.2, Version=10.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dxw" %>

    <dxtc:ASPxPageControl ID="t" runat="server" ActiveTabIndex="0">
        <TabPages>
            <dxtc:TabPage Text="Single image">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl1" runat="server">
                        <RAWCIL:ILoad ID="m_topimg" runat="server" AddImageButtonText="~" 
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
<SizeConstraint Mode="FixedAspectRatioSize">
<FixedSizeData Size="915, 195"></FixedSizeData>

<FixedAspectRatioSizeData Size="915, 195" LimitedDimension="Width">
<Limits>
<LowLimit Enabled="True" Value="915"></LowLimit>

<HiLimit Enabled="False" Value="915"></HiLimit>
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
<Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition InternalCode="TopImage" Title="Top Image" Mode="Fixed" AdaptiveMaxSize="64, 64" FixedSize="915, 195" Fit="True" ZoomFactor="200" BackgroundColor="White" HTMLBackgroundColor="White" DisableIfSmaller="True" UseSourceImage="False" ApplyCrop="True" ApplyRotateFlip="True"></Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition>
</ResizeDefinitions>
</Radactive.WebControls.ILoad.Configuration.WebImageDefinition>
<Radactive.WebControls.ILoad.Configuration.WebImageDefinition InternalCode="Slim" Title="Slim">
<SizeConstraint Mode="FixedAspectRatioSize">
<FixedSizeData Size="915, 95"></FixedSizeData>

<FixedAspectRatioSizeData Size="915, 95" LimitedDimension="Width">
<Limits>
<LowLimit Enabled="True" Value="915"></LowLimit>

<HiLimit Enabled="False" Value="915"></HiLimit>
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
<Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition InternalCode="TopImage" Title="Top Image" Mode="Fixed" AdaptiveMaxSize="64, 64" FixedSize="915, 95" Fit="True" ZoomFactor="200" BackgroundColor="White" HTMLBackgroundColor="White" DisableIfSmaller="True" UseSourceImage="False" ApplyCrop="True" ApplyRotateFlip="True"></Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition>
</ResizeDefinitions>
</Radactive.WebControls.ILoad.Configuration.WebImageDefinition>
</WebImageDefinitions>

<WindowsAppearance>
<ImageUploadWizardWindow WindowTitle="RADactive I-load" TopLogoImageUrl="" ShowWelcomePage="True" ShowSummaryPage="True" WelcomePageText="" ShowImagePreviewBeforeFileUpload="True" ShowSaveButtonDuringImageEdit="True" CropperCanvasColor="White" HTMLCropperCanvasColor="White" AutoZoomCropperView="True"></ImageUploadWizardWindow>

<PreviewWindow WindowTitle="RADactive I-load - Preview" AllowImageDownload="True" AllowImagePrint="True"></PreviewWindow>
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
<LowLimit Enabled="True" Value="95"></LowLimit>

<HiLimit Enabled="False" Value="400"></HiLimit>
</SourceImageSizeLimitsH>

<FileExtensionValidator DefaultBehavior="AcceptAll" AcceptedFileExtensions="" NotAcceptedFileExtensions=""></FileExtensionValidator>
</InputOptions>

<ImageCropperOptions AllowImageResize="True" AllowImageZoom="True" AllowImageRotate="True" AllowImageFlip="True"></ImageCropperOptions>
</Configuration>
</RAWCIL:ILoad>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
            <dxtc:TabPage Text="3 images">
                <ContentCollection>
                    <dxw:ContentControl ID="ContentControl2" runat="server">
                        <div>
                            <RAWCIL:ILoad ID="m_imgTopLeft" runat="server" AddImageButtonText="~" AllowAddImage="True"
                                AllowEditImage="True" AllowPreviewWindow="True" AllowRemoveImage="True" Appearance="Default"
                                AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False"
                                AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" ButtonsSpaceWidth="100px"
                                Culture="" CustomWindowProvider_Close="" CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False"
                                EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" IconCustomResize=""
                                IconSpaceWidth="42px" OnClientControlInitialized="" OnClientValueChanged="" RemoveImageButtonText="~"
                                ShowImageDetails="True" ShowImageIcon="True" Width="312px" WindowMode="Auto">
<Configuration ManualTemporaryFolder="False" OnCompleteBehavior="MoveFilesToDestinationFolder" WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" GenerateIconImage="True" GenerateSelectedImage="False" GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="/images" UrlMode="Manual" ManualUrl="/images"></DestinationFolder>
<WebImageDefinitions>
<Radactive.WebControls.ILoad.Configuration.WebImageDefinition InternalCode="Default" Title="Default">
<SizeConstraint Mode="FixedAspectRatioSize">
<FixedSizeData Size="400, 300"></FixedSizeData>

<FixedAspectRatioSizeData Size="250, 195" LimitedDimension="Width">
<Limits>
<LowLimit Enabled="True" Value="250"></LowLimit>

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
<Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition 
        InternalCode="TopImage" Title="Left Column" Mode="Adaptive" 
        AdaptiveMaxSize="250, 195" FixedSize="64, 64" Fit="False" ZoomFactor="250" 
        BackgroundColor="White" HTMLBackgroundColor="White" DisableIfSmaller="True" 
        UseSourceImage="False" ApplyCrop="True" ApplyRotateFlip="True"></Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition>
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
                            


</RAWCIL:ILoad>
                            <br />
                            <RAWCIL:ILoad ID="m_imgTopCenter" runat="server" AddImageButtonText="~" AllowAddImage="True"
                                AllowEditImage="True" AllowPreviewWindow="True" AllowRemoveImage="True" Appearance="Default"
                                AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False"
                                AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" ButtonsSpaceWidth="100px"
                                Culture="" CustomWindowProvider_Close="" CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False"
                                EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" IconCustomResize=""
                                IconSpaceWidth="42px" OnClientControlInitialized="" OnClientValueChanged="" RemoveImageButtonText="~"
                                ShowImageDetails="True" ShowImageIcon="True" Width="312px" WindowMode="Auto">
<Configuration ManualTemporaryFolder="False" OnCompleteBehavior="MoveFilesToDestinationFolder" WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" GenerateIconImage="True" GenerateSelectedImage="False" GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="/images" UrlMode="Manual" ManualUrl="/images"></DestinationFolder>
<WebImageDefinitions>
<Radactive.WebControls.ILoad.Configuration.WebImageDefinition InternalCode="Default" Title="Default">
<SizeConstraint Mode="FixedAspectRatioSize">
<FixedSizeData Size="400, 300"></FixedSizeData>

<FixedAspectRatioSizeData Size="375, 195" LimitedDimension="Width">
<Limits>
<LowLimit Enabled="True" Value="375"></LowLimit>

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
<Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition 
        InternalCode="TopImage" Title="Left Column" Mode="Adaptive" 
        AdaptiveMaxSize="375, 195" FixedSize="64, 64" Fit="False" ZoomFactor="250" 
        BackgroundColor="White" HTMLBackgroundColor="White" DisableIfSmaller="True" 
        UseSourceImage="False" ApplyCrop="True" ApplyRotateFlip="True"></Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition>
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
                            


</RAWCIL:ILoad>
                            <br />
                            <RAWCIL:ILoad ID="m_imgTopRight" runat="server" AddImageButtonText="~" AllowAddImage="True"
                                AllowEditImage="True" AllowPreviewWindow="True" AllowRemoveImage="True" Appearance="Default"
                                AutomaticallyClearTemporaryFiles="True" AutomaticallyDeleteRemovedFiles="False"
                                AutoPostBack="False" BackColor="White" BorderColor="#E0E0E0" ButtonsSpaceWidth="100px"
                                Culture="" CustomWindowProvider_Close="" CustomWindowProvider_Open="" CustomWindowProvider_UseGetOpener="False"
                                EditImageButtonText="~" EmptyText="~" ForeColor="Black" Height="50px" IconCustomResize=""
                                IconSpaceWidth="42px" OnClientControlInitialized="" OnClientValueChanged="" RemoveImageButtonText="~"
                                ShowImageDetails="True" ShowImageIcon="True" Width="312px" WindowMode="Auto">
<Configuration ManualTemporaryFolder="False" OnCompleteBehavior="MoveFilesToDestinationFolder" WebPublishedDestinationFolder="True" CutMode="Manual" KeepSourceImage="True" GenerateIconImage="True" GenerateSelectedImage="False" GenerateIndexXMLFile="True" InternalCode="" Title="">
<TemporaryFolder Path="" UrlMode="Automatic" ManualUrl=""></TemporaryFolder>

<DestinationFolder Path="/images" UrlMode="Manual" ManualUrl="/images"></DestinationFolder>
<WebImageDefinitions>
<Radactive.WebControls.ILoad.Configuration.WebImageDefinition InternalCode="Default" Title="Default">
<SizeConstraint Mode="FixedAspectRatioSize">
<FixedSizeData Size="400, 300"></FixedSizeData>

<FixedAspectRatioSizeData Size="250, 195" LimitedDimension="Width">
<Limits>
<LowLimit Enabled="True" Value="250"></LowLimit>

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
<Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition 
        InternalCode="TopImage" Title="Left Column" Mode="Adaptive" 
        AdaptiveMaxSize="250, 195" FixedSize="64, 64" Fit="False" ZoomFactor="250" 
        BackgroundColor="White" HTMLBackgroundColor="White" DisableIfSmaller="True" 
        UseSourceImage="False" ApplyCrop="True" ApplyRotateFlip="True"></Radactive.WebControls.ILoad.Configuration.WebImageResizeDefinition>
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
                            


</RAWCIL:ILoad>
                        </div>
                    </dxw:ContentControl>
                </ContentCollection>
            </dxtc:TabPage>
        </TabPages>
    </dxtc:ASPxPageControl>