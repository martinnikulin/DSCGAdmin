unit GeolReportUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls;

type
  TGeolReportForm = class(TForm)
    Label1: TLabel;
    NameEdit: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    ConditionBox: TDBLookupComboBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GeolReportForm: TGeolReportForm;

implementation
  uses
    DMUnit;
{$R *.dfm}

procedure TGeolReportForm.Button1Click(Sender: TObject);
begin
    ModalResult := mrOK;
    CloseModal;
end;

procedure TGeolReportForm.Button2Click(Sender: TObject);
begin
    ModalResult := mrCancel;
    CloseModal;
end;

procedure TGeolReportForm.FormShow(Sender: TObject);
begin
  DM.ConnectToGDB(DM.Projects.FieldByName('Database').AsString);
  DM.Variants.Active := True;
end;

end.
