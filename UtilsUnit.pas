unit UtilsUnit;

interface
uses
  Classes, SysUtils, StrUtils, IOUtils, IniFiles, ADODB, Menus, Dialogs, Windows,
  cxGridCustomView, cxGridDBTableView, cxGridDBBandedTableView, cxGridTableView;

const
  IniFileName = 'DSCG.ini';

type
  TNetType = (ntLocal, ntInternet);
type
  TUserRole = (urNone, urUser, urAdmin, urSuperAdmin);
type
  TConnAttr = record
    ServerName: string;
    ServerAddr: string;
    ProjectName: string;
    DatabaseName: string;
    Login: string;
    Password: string;
    NetType: TNetType;
  end;
type
  TGDBConnAttr = record
    ConnString: string;
    UserRole: TUserRole;
  end;

function ReadLogins(Section: string): TStringList;
function OpenIniFile(): TIniFile;
function GetIniFileSection(Section: string): TStrings;
function GetConnSubString(Value, Section: string): string;
procedure StoreIniRecord(Section, VarName, Value: string);
procedure RequeryGridView(Sender: TObject); overload;
procedure RequeryGridView(TableView: TcxGridDBTableView); overload;
procedure RequeryGridView(TableView: TcxGridDBBandedTableView); overload;
procedure ExecProgram(FileName: string);

implementation

procedure ExecProgram(FileName: String);
var
  LInfo: TStartupInfo;
  LPI: TProcessInformation;
begin
  // ��������� ���������
  FillChar(LInfo, SizeOf(LInfo), 0);
  LInfo.cb := SizeOf(LInfo);
  LInfo.dwFlags := STARTF_USESHOWWINDOW;
  LInfo.wShowWindow := SW_HIDE;
  // ��������� ���������
  Win32Check(CreateProcess(
    nil,        // lpApplicationName,
    PChar(FileName),      // lpCommandLine,
    nil,              // lpProcessAttributes,
    nil,              // lpThreadAttributes,
    False,            // bInheritHandles,
    CREATE_NO_WINDOW, // dwCreationFlags,
    nil,              // lpEnvironment,
    nil,              // lpCurrentDirectory,
    LInfo,            // lpStartupInfo,
    LPI               // lpProcessInformation
  ));
  try
    // ��������� ����� �������� ������ (�� ��� �� �����)
    CloseHandle(LPI.hThread);
    // ���� ���������� ��������
    Win32Check(WaitForSingleObject(LPI.hProcess, INFINITE) <> WAIT_FAILED);
  finally
    // ��������� ����� ��������
    CloseHandle(LPI.hProcess);
  end;
end;

function ReadLogins(Section: string): TStringList;//
begin
  Result := GetIniFileSection(Section) as TStringList;
end;

function OpenIniFile: TIniFile;
begin
  Result := TIniFile.Create(TPath.GetDocumentsPath + PathDelim + IniFileName);
end;

function GetIniFileSection(Section: string): TStrings;
var
  SettingsFile: TIniFile;
begin
  SettingsFile := OpenIniFile();
  Result := TStringList.Create;
  try
    SettingsFile.ReadSectionValues(Section, Result);
  finally
  SettingsFile.Free;
  end;
end;

procedure StoreIniRecord(Section, VarName, Value: string);//
var
  SettingsFile: TIniFile;
begin
  SettingsFile := OpenIniFile();
  try
    SettingsFile.WriteString(Section, VarName, Value);
  finally
    SettingsFile.Free;
  end;
end;

function GetConnSubString(Value, Section: string): string;
var
  i: Integer;
begin
  i := Pos(Section, Value);
  if i > 0 then begin
    Value := MidStr(Value, i + Length(Section) + 1, MaxInt);
    i := Pos(';', Value);
    if i > 0 then
      Value := LeftStr(Value, i - 1)
    else
      Value := LeftStr(Value, MaxInt);
    Result := Value;
  end;
end;

procedure RequeryGridView(Sender: TObject);
var
  GridView: TcxCustomGridView;
begin
  GridView := (((Sender as TMenuItem).GetParentComponent as TPopupMenu).PopupComponent as TcxGridSite).GridView;
  if GridView.ClassName = 'TcxGridDBBandedTableView' then
    RequeryGridView(GridView as TcxGridDBBandedTableView)
  else if GridView.ClassName = 'TcxGridDBTableView' then
    RequeryGridView(GridView as TcxGridDBTableView)

end;

procedure RequeryGridView(TableView: TcxGridDBTableView);
var
  FirstRecord: Integer;
  FocusedRecord: Integer;
begin
  FirstRecord := TableView.Controller.TopRowIndex;
  FocusedRecord := TableView.Controller.FocusedRowIndex;
  (TableView.DataController.DataSet as TADOQuery).Requery();
  TableView.Controller.FocusedRowIndex := FocusedRecord;
  TableView.Controller.TopRowIndex := FirstRecord;
end;

procedure RequeryGridView(TableView: TcxGridDBBandedTableView);
var
  FirstRecord: Integer;
  FocusedRecord: Integer;
begin
  FirstRecord := TableView.Controller.TopRowIndex;
  FocusedRecord := TableView.Controller.FocusedRowIndex;
  (TableView.DataController.DataSet as TADOQuery).Requery();
  TableView.Controller.FocusedRowIndex := FocusedRecord;
  TableView.Controller.TopRowIndex := FirstRecord;
end;
end.
