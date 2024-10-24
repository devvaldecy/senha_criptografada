unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, u_frm_cadastrar_usuario, u_dm;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    EdtSenha: TEdit;
    EdtSenhaBD: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public


  end;

var
  Form1: TForm1;
  FrmUsuario : TFrmUsuario;



implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  if (DM.Encriptar(SEMENTE, EdtSenha.Text) = EdtSenhaBD.Text) then
    ShowMessage('Senha Correta!')
  else
    ShowMessage('Senha Errada!');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  FrmUsuario := TFrmUsuario.Create(Self);
  FrmUsuario.ShowModal;
  FreeAndNil(FrmUsuario);
end;

end.

