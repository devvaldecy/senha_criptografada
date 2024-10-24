unit u_dm;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, DB, ZConnection, ZDataset, md5;

type

  { TDM }

  TDM = class(TDataModule)
    Con: TZConnection;
    DSQryUsuarios: TDataSource;
    QryUsuarios: TZQuery;
    Qry: TZQuery;
  private

  public
       function Encriptar(ASemente, AValor : String) : String;
       function Gravar(ANome, AUsuario, ASenha: String): Boolean;
       function Alterar(AId: Integer;ANome, AUsuario, ASenha: String ): Boolean;
  end;

var
  DM: TDM;

const
  SEMENTE = 'OPx*9';

implementation

{$R *.lfm}

{ TDM }

function TDM.Encriptar(ASemente, AValor: String): String;
begin
  Result := MD5Print(MD5String(ASemente+AValor+ASemente));
end;

function TDM.Gravar(ANome, AUsuario, ASenha: String): Boolean;
  var vSQL: String;
begin
  Result := False;
  vSQL := 'INSERT INTO USUARIO VALUES (NULL, :nome, :usuario, :senha)';
  with Qry do
  begin
    SQL.Clear;
    SQL.Add(vSQL);
    ParamByName('nome').AsString    := ANome;
    ParamByName('usuario').AsString := AUsuario;
    ParamByName('senha').AsString   := Encriptar(SEMENTE, ASenha);
    ExecSQL;
    Result := True;
  end;
end;

function TDM.Alterar(AId: Integer; ANome, AUsuario, ASenha: String): Boolean;
begin

end;

end.

