unit DMUnit;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Dialogs;

type
  TDM = class(TDataModule)
    HomeCatConn: TADOConnection;
    Servers: TADOQuery;
    Projects: TADOQuery;
    dsServers: TDataSource;
    dsProjects: TDataSource;
    RemoteCatConn: TADOConnection;
    Users: TADOQuery;
    dsUsers: TDataSource;
    Roles: TADOQuery;
    dsRoles: TDataSource;
    HomeUsers: TADOQuery;
    dsHomeUsers: TDataSource;
    GDBConnection: TADOConnection;
    Variants: TADOQuery;
    dsVariants: TDataSource;
  private
    FIniConnString: string;
    FProvider: string;
    function ReadConfConnString(): string;
    function GetProvider(ConnString: string): string;
    function GetConnString(DatabaseName: string): string;
    procedure OpenUsers(RoleId: Integer);
    procedure OpenRoles(RoleId: Integer);
    procedure OpenProjects();
    procedure DoSQLQuery(Conn: TADOConnection; SQL: String);
  public
    UserRole: Integer;
    function GetUserRole(UserId: string): Integer;
    function GetLastProject(): string;
    procedure ConnectToHomeCat;
    procedure ConnectToRemoteCatalog(UserId, Password: string);
    procedure ConnectToGDB(DatabaseName: string);
    procedure Connect(Connection: TADOConnection; ConnString: string);
    procedure CreateProject(Name: string);
    procedure CopyProject(Name: string);
    procedure SetGeolReportDatabase(DatabaseName: string; ConditionId: integer);
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDM }

procedure TDM.Connect(Connection: TADOConnection; ConnString: string);
begin
  Connection.Connected := False;
  //ShowMessage('Connect: ' + ConnString);
  Connection.ConnectionString := ConnString;
  Connection.Connected := True;
  //ShowMessage('Connected');
end;

procedure TDM.ConnectToHomeCat;
begin
  FIniConnString := ReadConfConnString() + 'Initial Catalog=DSCGSystem;Persist Security Info=True;User ID=DSCG;Password=DSCG';
  FProvider := GetProvider(FIniConnString);
  Connect(HomeCatConn, FIniConnString);
  Servers.Active := True;
  HomeUsers.Active := True;
end;

procedure TDM.ConnectToRemoteCatalog(UserId, Password: string);
begin
  Connect(RemoteCatConn, GetConnString('DSCGSystem'));
  OpenUsers(MaxInt);
  UserRole := GetUserRole(UserId);
  if UserRole > 0 then begin
    OpenUsers(UserRole);
    OpenRoles(UserRole);
    OpenProjects;
  end;
end;

procedure TDM.ConnectToGDB(DatabaseName: string);
var
  ConnString: string;
begin
  ConnString := GetConnString(DatabaseName);
  Connect(GDBConnection, ConnString)
end;

procedure TDM.CopyProject(Name: string);
begin
  DoSQLQuery(RemoteCatConn, 'exec CopyGDB ' + QuotedStr(Name) + ', 1, ' + QuotedStr(Projects.FieldByName('Database').AsString));
  Projects.Requery();
end;

procedure TDM.CreateProject(Name: string);
begin
  DoSQLQuery(RemoteCatConn, 'exec CopyGDB ' + QuotedStr(Name) + ', 1, ' + QuotedStr('GDB52'));
  Projects.Requery();
end;

function TDM.GetUserRole(UserId: string): Integer;
begin
  if Users.Locate('UserId', UserId, []) then
    Result := Users.FieldByName('RoleId').AsInteger
  else
    Result := 0;
end;

procedure TDM.OpenProjects;
begin
    Projects.Active := True;
end;

procedure TDM.OpenRoles(RoleId: Integer);
begin
  Roles.Active := False;
  Roles.Parameters.ParamByName('RoleId').Value := RoleId;
  Roles.Active := True;
end;

procedure TDM.OpenUsers(RoleId: Integer);
begin
  Users.Active := False;
  Users.Parameters.ParamByName('RoleId').Value := RoleId;
  Users.Active := True;
end;

function TDM.GetProvider(ConnString: string): string;
var
  Strings: TStringList;
begin
  Strings := TStringList.Create;
  Strings.Delimiter := ';';
  Strings.StrictDelimiter := True;
  Strings.DelimitedText := ConnString;
  Result := Strings[0];
end;

function TDM.GetConnString(DatabaseName: string): string;
begin
  Result := FProvider + ';Initial Catalog=' + DatabaseName +  ';Data Source=' +
            Servers.FieldByName('RemoteServer').AsString +
            ';Persist Security Info=True;User ID=DSCG;Password=DSCG';
end;

function TDM.ReadConfConnString(): string;
var
  Strings: TStrings;
begin
  Strings := TStringList.Create;
  Strings.LoadFromFile('DSCG.conf');
  Result := Strings[0];
end;

procedure TDM.SetGeolReportDatabase(DatabaseName: string; ConditionId: integer);
begin
  DM.DoSQLQuery(GDBConnection, 'update Settings set ParamValue = 2 where Section = ''Database'' and ParamName = ''GDBType''');
  DM.DoSQLQuery(GDBConnection, 'delete from SeamConds where ConditionId <> ' + ConditionId.ToString);
  DM.DoSQLQuery(GDBConnection, 'delete from BlockUnits');
  DM.DoSQLQuery(GDBConnection, 'delete from BlockDetails');
  DM.DoSQLQuery(GDBConnection, 'delete from Blocks');
end;

function TDM.GetLastProject(): string;
var
  ADOQuery: TADOQuery;
begin
  ADOQuery := TADOQuery.Create(nil);
  ADOQuery.Connection := RemoteCatConn;
  ADOQuery.SQL.Text := 'select top(1) [Database] from Projects order by Id desc';
  ADOQuery.Open;
  Result := ADOQuery.FieldByName('Database').AsString;
end;

procedure TDM.DoSQLQuery(Conn: TADOConnection; SQL: String);
var
  ADOQuery: TADOQuery;
begin
  ADOQuery := TADOQuery.Create(nil);
  ADOQuery.Connection := Conn;
  ADOQuery.SQL.Text := SQL;
  ADOQuery.ExecSQL;
end;

end.
