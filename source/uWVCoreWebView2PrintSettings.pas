unit uWVCoreWebView2PrintSettings;

{$IFDEF FPC}{$MODE Delphi}{$ENDIF}

{$I webview2.inc}

interface

uses
  {$IFDEF DELPHI16_UP}
  System.Types, Winapi.ActiveX,
  {$ELSE}
  ActiveX,
  {$ENDIF}
  uWVTypeLibrary, uWVTypes;

type
  TCoreWebView2PrintSettings = class
    protected
      FBaseIntf   : ICoreWebView2PrintSettings;
      FBaseIntf2  : ICoreWebView2PrintSettings2;

      function  GetInitialized : boolean;
      function  GetOrientation : TWVPrintOrientation;
      function  GetScaleFactor : double;
      function  GetPageWidth : double;
      function  GetPageHeight : double;
      function  GetMarginTop : double;
      function  GetMarginBottom : double;
      function  GetMarginLeft : double;
      function  GetMarginRight : double;
      function  GetShouldPrintBackgrounds : boolean;
      function  GetShouldPrintSelectionOnly : boolean;
      function  GetShouldPrintHeaderAndFooter : boolean;
      function  GetHeaderTitle : wvstring;
      function  GetFooterUri : wvstring;
      function  GetPageRanges : wvstring;
      function  GetPagesPerSide : integer;
      function  GetCopies : integer;
      function  GetCollation : TWVPrintCollation;
      function  GetColorMode : TWVPrintColorMode;
      function  GetDuplex : TWVPrintDuplex;
      function  GetMediaSize : TWVPrintMediaSize;
      function  GetPrinterName : wvstring;

      procedure SetOrientation(aValue : TWVPrintOrientation);
      procedure SetScaleFactor(const aValue : double);
      procedure SetPageWidth(const aValue : double);
      procedure SetPageHeight(const aValue : double);
      procedure SetMarginTop(const aValue : double);
      procedure SetMarginBottom(const aValue : double);
      procedure SetMarginLeft(const aValue : double);
      procedure SetMarginRight(const aValue : double);
      procedure SetShouldPrintBackgrounds(aValue : boolean);
      procedure SetShouldPrintSelectionOnly(aValue : boolean);
      procedure SetShouldPrintHeaderAndFooter(aValue : boolean);
      procedure SetHeaderTitle(const aValue : wvstring);
      procedure SetFooterUri(const aValue : wvstring);
      procedure SetPageRanges(const aValue : wvstring);
      procedure SetPagesPerSide(aValue : integer);
      procedure SetCopies(aValue : integer);
      procedure SetCollation(aValue : TWVPrintCollation);
      procedure SetColorMode(aValue : TWVPrintColorMode);
      procedure SetDuplex(aValue : TWVPrintDuplex);
      procedure SetMediaSize(aValue : TWVPrintMediaSize);
      procedure SetPrinterName(const aValue : wvstring);

    public
      constructor Create(const aBaseIntf : ICoreWebView2PrintSettings); reintroduce;
      destructor  Destroy; override;

      property Initialized                : boolean                         read GetInitialized;
      property BaseIntf                   : ICoreWebView2PrintSettings      read FBaseIntf;

      // ICoreWebView2PrintSettings
      property Orientation                : TWVPrintOrientation             read GetOrientation                   write SetOrientation;
      property ScaleFactor                : double                          read GetScaleFactor                   write SetScaleFactor;
      property PageWidth                  : double                          read GetPageWidth                     write SetPageWidth;
      property PageHeight                 : double                          read GetPageHeight                    write SetPageHeight;
      property MarginTop                  : double                          read GetMarginTop                     write SetMarginTop;
      property MarginBottom               : double                          read GetMarginBottom                  write SetMarginBottom;
      property MarginLeft                 : double                          read GetMarginLeft                    write SetMarginLeft;
      property MarginRight                : double                          read GetMarginRight                   write SetMarginRight;
      property ShouldPrintBackgrounds     : boolean                         read GetShouldPrintBackgrounds        write SetShouldPrintBackgrounds;
      property ShouldPrintSelectionOnly   : boolean                         read GetShouldPrintSelectionOnly      write SetShouldPrintSelectionOnly;
      property ShouldPrintHeaderAndFooter : boolean                         read GetShouldPrintHeaderAndFooter    write SetShouldPrintHeaderAndFooter;
      property HeaderTitle                : wvstring                        read GetHeaderTitle                   write SetHeaderTitle;
      property FooterUri                  : wvstring                        read GetFooterUri                     write SetFooterUri;

      // ICoreWebView2PrintSettings2
      property PageRanges                 : wvstring                        read GetPageRanges                    write SetPageRanges;
      property PagesPerSide               : integer                         read GetPagesPerSide                  write SetPagesPerSide;
      property Copies                     : integer                         read GetCopies                        write SetCopies;
      property Collation                  : TWVPrintCollation               read GetCollation                     write SetCollation;
      property ColorMode                  : TWVPrintColorMode               read GetColorMode                     write SetColorMode;
      property Duplex                     : TWVPrintDuplex                  read GetDuplex                        write SetDuplex;
      property MediaSize                  : TWVPrintMediaSize               read GetMediaSize                     write SetMediaSize;
      property PrinterName                : wvstring                        read GetPrinterName                   write SetPrinterName;
  end;

implementation

uses
  uWVMiscFunctions, uWVConstants;

constructor TCoreWebView2PrintSettings.Create(const aBaseIntf: ICoreWebView2PrintSettings);
begin
  inherited Create;

  FBaseIntf := aBaseIntf;

  if Initialized then
    LoggedQueryInterface(FBaseIntf, IID_ICoreWebView2PrintSettings2, FBaseIntf2);
end;

destructor TCoreWebView2PrintSettings.Destroy;
begin
  FBaseIntf  := nil;
  FBaseIntf2 := nil;

  inherited Destroy;
end;

function TCoreWebView2PrintSettings.GetInitialized : boolean;
begin
  Result := assigned(FBaseIntf);
end;

function TCoreWebView2PrintSettings.GetOrientation : TWVPrintOrientation;
var
  TempResult : COREWEBVIEW2_PRINT_ORIENTATION;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_Orientation(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetScaleFactor : double;
var
  TempResult : double;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_ScaleFactor(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetPageWidth : double;
var
  TempResult : double;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_PageWidth(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetPageHeight : double;
var
  TempResult : double;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_PageHeight(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetMarginTop : double;
var
  TempResult : double;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_MarginTop(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetMarginBottom : double;
var
  TempResult : double;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_MarginBottom(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetMarginLeft : double;
var
  TempResult : double;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_MarginLeft(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetMarginRight : double;
var
  TempResult : double;
begin
  if Initialized and
     succeeded(FBaseIntf.Get_MarginRight(TempResult)) then
    Result := TempResult
   else
    Result := 0;
end;

function TCoreWebView2PrintSettings.GetShouldPrintBackgrounds : boolean;
var
  TempResult : integer;
begin
  Result := Initialized and
            succeeded(FBaseIntf.Get_ShouldPrintBackgrounds(TempResult)) and
            (TempResult <> 0);
end;

function TCoreWebView2PrintSettings.GetShouldPrintSelectionOnly : boolean;
var
  TempResult : integer;
begin
  Result := Initialized and
            succeeded(FBaseIntf.Get_ShouldPrintSelectionOnly(TempResult)) and
            (TempResult <> 0);
end;

function TCoreWebView2PrintSettings.GetShouldPrintHeaderAndFooter : boolean;
var
  TempResult : integer;
begin
  Result := Initialized and
            succeeded(FBaseIntf.Get_ShouldPrintHeaderAndFooter(TempResult)) and
            (TempResult <> 0);
end;

function TCoreWebView2PrintSettings.GetHeaderTitle : wvstring;
var
  TempString : PWideChar;
begin
  Result     := '';
  TempString := nil;

  if Initialized and
     succeeded(FBaseIntf.get_HeaderTitle(TempString)) then
    begin
      Result := TempString;
      CoTaskMemFree(TempString);
    end;
end;

function TCoreWebView2PrintSettings.GetFooterUri : wvstring;
var
  TempString : PWideChar;
begin
  Result     := '';
  TempString := nil;

  if Initialized and
     succeeded(FBaseIntf.get_FooterUri(TempString)) then
    begin
      Result := TempString;
      CoTaskMemFree(TempString);
    end;
end;

function TCoreWebView2PrintSettings.GetPageRanges : wvstring;
var
  TempString : PWideChar;
begin
  Result     := '';
  TempString := nil;

  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_PageRanges(TempString)) then
    begin
      Result := TempString;
      CoTaskMemFree(TempString);
    end;
end;

function TCoreWebView2PrintSettings.GetPagesPerSide : integer;
var
  TempResult : SYSINT;
begin
  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_PagesPerSide(TempResult)) then
    Result := TempResult
   else
    Result := WEBVIEW4DELPHI_PRINT_PAGESPERSIDE_DEFAULT;
end;

function TCoreWebView2PrintSettings.GetCopies : integer;
var
  TempResult : SYSINT;
begin
  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_Copies(TempResult)) then
    Result := TempResult
   else
    Result := WEBVIEW4DELPHI_PRINT_COPIES_DEFAULT;
end;

function TCoreWebView2PrintSettings.GetCollation : TWVPrintCollation;
var
  TempResult : COREWEBVIEW2_PRINT_COLLATION;
begin
  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_Collation(TempResult)) then
    Result := TempResult
   else
    Result := COREWEBVIEW2_PRINT_COLLATION_DEFAULT;
end;

function TCoreWebView2PrintSettings.GetColorMode : TWVPrintColorMode;
var
  TempResult : COREWEBVIEW2_PRINT_COLOR_MODE;
begin
  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_ColorMode(TempResult)) then
    Result := TempResult
   else
    Result := COREWEBVIEW2_PRINT_COLOR_MODE_DEFAULT;
end;

function TCoreWebView2PrintSettings.GetDuplex : TWVPrintDuplex;
var
  TempResult : COREWEBVIEW2_PRINT_DUPLEX;
begin
  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_Duplex(TempResult)) then
    Result := TempResult
   else
    Result := COREWEBVIEW2_PRINT_DUPLEX_DEFAULT;
end;

function TCoreWebView2PrintSettings.GetMediaSize : TWVPrintMediaSize;
var
  TempResult : COREWEBVIEW2_PRINT_MEDIA_SIZE;
begin
  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_MediaSize(TempResult)) then
    Result := TempResult
   else
    Result := COREWEBVIEW2_PRINT_MEDIA_SIZE_DEFAULT;
end;

function TCoreWebView2PrintSettings.GetPrinterName : wvstring;
var
  TempString : PWideChar;
begin
  Result     := '';
  TempString := nil;

  if assigned(FBaseIntf2) and
     succeeded(FBaseIntf2.Get_PrinterName(TempString)) then
    begin
      Result := TempString;
      CoTaskMemFree(TempString);
    end;
end;

procedure TCoreWebView2PrintSettings.SetOrientation(aValue : TWVPrintOrientation);
begin
  if Initialized then
    FBaseIntf.Set_Orientation(aValue);
end;

procedure TCoreWebView2PrintSettings.SetScaleFactor(const aValue : double);
begin
  if Initialized then
    FBaseIntf.Set_ScaleFactor(aValue);
end;

procedure TCoreWebView2PrintSettings.SetPageWidth(const aValue : double);
begin
  if Initialized then
    FBaseIntf.Set_PageWidth(aValue);
end;

procedure TCoreWebView2PrintSettings.SetPageHeight(const aValue : double);
begin
  if Initialized then
    FBaseIntf.Set_PageHeight(aValue);
end;

procedure TCoreWebView2PrintSettings.SetMarginTop(const aValue : double);
begin
  if Initialized then
    FBaseIntf.Set_MarginTop(aValue);
end;

procedure TCoreWebView2PrintSettings.SetMarginBottom(const aValue : double);
begin
  if Initialized then
    FBaseIntf.Set_MarginBottom(aValue);
end;

procedure TCoreWebView2PrintSettings.SetMarginLeft(const aValue : double);
begin
  if Initialized then
    FBaseIntf.Set_MarginLeft(aValue);
end;

procedure TCoreWebView2PrintSettings.SetMarginRight(const aValue : double);
begin
  if Initialized then
    FBaseIntf.Set_MarginRight(aValue);
end;

procedure TCoreWebView2PrintSettings.SetShouldPrintBackgrounds(aValue : boolean);
begin
  if Initialized then
    FBaseIntf.Set_ShouldPrintBackgrounds(ord(aValue));
end;

procedure TCoreWebView2PrintSettings.SetShouldPrintSelectionOnly(aValue : boolean);
begin
  if Initialized then
    FBaseIntf.Set_ShouldPrintSelectionOnly(ord(aValue));
end;

procedure TCoreWebView2PrintSettings.SetShouldPrintHeaderAndFooter(aValue : boolean);
begin
  if Initialized then
    FBaseIntf.Set_ShouldPrintHeaderAndFooter(ord(aValue));
end;

procedure TCoreWebView2PrintSettings.SetHeaderTitle(const aValue : wvstring);
begin
  if Initialized then
    FBaseIntf.Set_HeaderTitle(PWideChar(aValue));
end;

procedure TCoreWebView2PrintSettings.SetFooterUri(const aValue : wvstring);
begin
  if Initialized then
    FBaseIntf.Set_FooterUri(PWideChar(aValue));
end;

procedure TCoreWebView2PrintSettings.SetPageRanges(const aValue : wvstring);
begin
  if assigned(FBaseIntf2) then
    FBaseIntf2.Set_PageRanges(PWideChar(aValue));
end;

procedure TCoreWebView2PrintSettings.SetPagesPerSide(aValue : integer);
begin
  if assigned(FBaseIntf2) and (aValue in WEBVIEW4DELPHI_PRINT_PAGESPERSIDE_VALID) then
    FBaseIntf2.Set_PagesPerSide(aValue);
end;

procedure TCoreWebView2PrintSettings.SetCopies(aValue : integer);
begin
  if assigned(FBaseIntf2) then
    FBaseIntf2.Set_Copies(aValue);
end;

procedure TCoreWebView2PrintSettings.SetCollation(aValue : TWVPrintCollation);
begin
  if assigned(FBaseIntf2) then
    FBaseIntf2.Set_Collation(aValue);
end;

procedure TCoreWebView2PrintSettings.SetColorMode(aValue : TWVPrintColorMode);
begin
  if assigned(FBaseIntf2) then
    FBaseIntf2.Set_ColorMode(aValue);
end;

procedure TCoreWebView2PrintSettings.SetDuplex(aValue : TWVPrintDuplex);
begin
  if assigned(FBaseIntf2) then
    FBaseIntf2.Set_Duplex(aValue);
end;

procedure TCoreWebView2PrintSettings.SetMediaSize(aValue : TWVPrintMediaSize);
begin
  if assigned(FBaseIntf2) then
    FBaseIntf2.Set_MediaSize(aValue);
end;

procedure TCoreWebView2PrintSettings.SetPrinterName(const aValue : wvstring);
begin
  // Use EnumPrinters to enumerate available printers.
  // https://learn.microsoft.com/en-us/windows/win32/printdocs/enumprinters

  if assigned(FBaseIntf2) then
    FBaseIntf2.Set_PrinterName(PWideChar(aValue));
end;

end.
