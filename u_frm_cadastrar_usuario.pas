unit u_frm_cadastrar_usuario;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBCtrls, DBGrids,
  ExtCtrls, StdCtrls, u_dm;

type

  { TFrmUsuario }

  TFrmUsuario = class(TForm)
    BtnNovoGravar: TButton;
    BtnCancelar: TButton;
    DBUsuarios: TDBGrid;
    EdtNome: TEdit;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    PnlCampos: TPanel;
    procedure BtnNovoGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

    procedure LimparCampos();
  end;

var
  FrmUsuario: TFrmUsuario;
  RegistroAtual: Integer;

implementation

{$R *.lfm}

{ TFrmUsuario }

procedure TFrmUsuario.BtnNovoGravarClick(Sender: TObject);
begin
  if (BtnNovoGravar.Caption = 'Novo') then
  begin
    LimparCampos();
    BtnNovoGravar.Caption := 'Gravar';
    PnlCampos.Enabled := True;
  end else if (BtnNovoGravar.Caption = 'Gravar') then
  begin
    if (RegistroAtual < 0) then //novo registro
    begin
      DM.Gravar(EdtNome.Text, EdtUsuario.Text, EdtSenha.Text);
      LimparCampos();
      DM.QryUsuarios.Refresh;
    end else //alterando registro
    begin

    end;

    BtnNovoGravar.Caption := 'Novo';
    PnlCampos.Enabled := False;
    RegistroAtual:= -1;
  end;
end;

procedure TFrmUsuario.FormShow(Sender: TObject);
begin
  RegistroAtual:= -1;
end;

procedure TFrmUsuario.LimparCampos();
begin
  EdtNome.Text:= '';
  EdtUsuario.Text:= '';
  EdtSenha.Text:= '';
end;

end.

