program DSCGAdmin;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  DMUnit in 'DMUnit.pas' {DM: TDataModule},
  ProjectNameUnit in 'ProjectNameUnit.pas' {ProjectNameForm},
  UtilsUnit in 'UtilsUnit.pas',
  GeolReportUnit in 'GeolReportUnit.pas' {GeolReportForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TProjectNameForm, ProjectNameForm);
  Application.CreateForm(TGeolReportForm, GeolReportForm);
  Application.Run;
end.
