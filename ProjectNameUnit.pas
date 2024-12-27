unit ProjectNameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TProjectNameForm = class(TForm)
    Label1: TLabel;
    NameEdit: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ProjectNameForm: TProjectNameForm;

implementation

{$R *.dfm}

procedure TProjectNameForm.Button1Click(Sender: TObject);
begin
    ModalResult := mrOK;
    CloseModal;
end;

procedure TProjectNameForm.Button2Click(Sender: TObject);
begin
    ModalResult := mrCancel;
    CloseModal;
end;

end.
