unit MainUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, 
  dxBar, dxRibbon, dxRibbonForm, dxRibbonSkins, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxClasses, dxRibbonBackstageView, cxBarEditItem,
  dxCore, dxRibbonCustomizationForm, cxTextEdit, cxContainer, cxEdit,
  dxSkinsForm, dxStatusBar, dxRibbonStatusBar, cxLabel, dxGallery,
  dxGalleryControl, dxRibbonBackstageViewGalleryControl, dxBarBuiltInMenu,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  dxDateRanges, dxScrollbarAnnotations, Data.DB, cxDBData, cxDBLookupComboBox,
  Vcl.ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxPC, Vcl.StdCtrls, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, dxBarExtDBItems, dxBarExtItems,
  cxEditRepositoryItems, Vcl.Menus;

const
  UM_SHOWBACKSTAGE = WM_USER +1001;

type
  TMainForm = class(TdxRibbonForm)
    dxBarManager1: TdxBarManager;
    dxRibbon1: TdxRibbon;
    dxRibbon1Tab1: TdxRibbonTab;
    BackStageView: TdxRibbonBackstageView;
    dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet;
    dxSkinController1: TdxSkinController;
    cxBarEditItem1: TcxBarEditItem;
    PageControl: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    ServersGrid: TcxGrid;
    ServersGridView: TcxGridDBTableView;
    ServersGridViewId: TcxGridDBColumn;
    ServersGridViewServerName: TcxGridDBColumn;
    ServersGridViewRemoteServer: TcxGridDBColumn;
    ServersGridViewLocalServer: TcxGridDBColumn;
    ServersGridViewActual: TcxGridDBColumn;
    ServersGridLevel: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    ProjectsGrid: TcxGrid;
    ProjectsGridView: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    ProjectsGridLevel: TcxGridLevel;
    cxTabSheet3: TcxTabSheet;
    UsersGrid: TcxGrid;
    UsersGridView: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridDBColumn7: TcxGridDBColumn;
    RolesColumn: TcxGridDBColumn;
    UsersGridLevel: TcxGridLevel;
    dxRibbon1Tab2: TdxRibbonTab;
    dxRibbon1Tab3: TdxRibbonTab;
    Button1: TButton;
    PasswordEdit: TcxTextEdit;
    Label1: TLabel;
    Label2: TLabel;
    UserCombo: TcxLookupComboBox;
    dxStatusBar1: TdxStatusBar;
    dxBarManager1Bar1: TdxBar;
    ServerCombo1: TdxBarLookupCombo;
    dxBarStatic1: TdxBarStatic;
    dxBarManager1Bar2: TdxBar;
    dxBarStatic2: TdxBarStatic;
    ServerCombo2: TdxBarLookupCombo;
    cxRolesEditRepository: TcxEditRepository;
    cxEditRepository1ComboBoxItem1: TcxEditRepositoryComboBoxItem;
    ProjectsGridViewBackup: TcxGridDBColumn;
    ProjectsPopup: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure BackStageViewPopup(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dxRibbon1TabChanged(Sender: TdxCustomRibbon);
    procedure ServerCombo1CloseUp(Sender: TObject);
    procedure ServerCombo2CloseUp(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    UserId: string;
    Password: string;
    Logins: TStrings;
    procedure UmShowBackstage(var Message: TMessage); message UM_SHOWBACKSTAGE;
    procedure SetUserCombo;
    procedure SetUserProfile;
    procedure StartWork;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation
uses
  DMUnit, ProjectNameUnit, GeolReportUnit, UtilsUnit;

{$R *.dfm}


procedure TMainForm.FormShow(Sender: TObject);
begin
  PostMessage(Handle, UM_SHOWBACKSTAGE, Integer(Sender), 0);
end;

procedure TMainForm.N1Click(Sender: TObject);
begin
  ProjectNameForm.Caption := 'Создать проект';
  if ProjectNameForm.ShowModal = mrOK then
  begin
    DM.CreateProject(ProjectNameForm.NameEdit.Text);
  end;
end;

procedure TMainForm.N2Click(Sender: TObject);
begin
  ProjectNameForm.Caption := 'Копировать проект';
  if ProjectNameForm.ShowModal = mrOK then
  begin
    DM.CopyProject(ProjectNameForm.NameEdit.Text);
  end;
end;

procedure TMainForm.N3Click(Sender: TObject);
var
  DatabaseName: string;
  ConditionId: integer;
begin
  GeolReportForm.Caption := 'Создать базу данных для геологического отчета';
  if GeolReportForm.ShowModal = mrOK then
  begin
    DM.CopyProject(GeolReportForm.NameEdit.Text);
    ConditionId := GeolReportForm.ConditionBox.KeyValue;
    DatabaseName := DM.GetLastProject();
    DM.ConnectToGDB(DatabaseName);
    DM.SetGeolReportDatabase(DatabaseName, ConditionId);
  end;
end;

procedure TMainForm.BackStageViewPopup(Sender: TObject);
begin
  PageControl.Visible := False;
  DM.ConnectToHomeCat;
  //Logins := ReadLogins('DatabaseLogins');
  SetUserCombo;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  UserId := UserCombo.EditValue;
  Password := PasswordEdit.Text;
  DM.ConnectToRemoteCatalog(UserId, Password);
  if DM.UserRole <> 0 then begin
    SetUserProfile;
    StartWork;
    BackStageView.ClosePopup;
  end;
end;

procedure TMainForm.StartWork;
begin
  PageControl.HideTabs := True;
  PageControl.Visible := True;
  ServerCombo1.KeyValue := DM.Servers.FieldByName('Id').AsInteger;
  ServerCombo2.KeyValue := DM.Servers.FieldByName('Id').AsInteger;
end;

procedure TMainForm.ServerCombo1CloseUp(Sender: TObject);
begin
  DM.ConnectToRemoteCatalog(UserId, Password);
  ServerCombo2.KeyValue := ServerCombo1.KeyValue;
end;

procedure TMainForm.ServerCombo2CloseUp(Sender: TObject);
begin
  DM.ConnectToRemoteCatalog(UserId, Password);
  ServerCombo1.KeyValue := ServerCombo2.KeyValue;
end;

procedure TMainForm.SetUserCombo;
begin
  UserCombo.EditValue := DM.HomeUsers.FieldByName('UserId').AsString;
end;

procedure TMainForm.dxRibbon1TabChanged(Sender: TdxCustomRibbon);
begin
  PageControl.ActivePageIndex := dxRibbon1.ActiveTab.Index;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DisableAero := True;
end;

procedure TMainForm.UmShowBackstage(var Message: TMessage);
begin
  dxRibbon1.ApplicationMenuPopup;
end;

procedure TMainForm.SetUserProfile;
begin
  if DM.UserRole = 3 then begin
    dxRibbon1Tab1.Visible := True;
    dxRibbon1Tab1.Active := True;
    PageControl.ActivePageIndex := 0;
  end
  else begin
    dxRibbon1Tab1.Visible := False;
    dxRibbon1Tab2.Active := True;
    PageControl.ActivePageIndex := 1;
  end;
end;
end.
