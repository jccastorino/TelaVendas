unit classe.produto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, DB, ADODB, DBClient;

Type
  TProduto = class

  private
    Fcodigo_produto: Integer;
    Fpreco_venda: Real;
    Fdescricao: String;
    FConexao: TADOConnection;


  public
    property Conexao        : TADOConnection  read FConexao   write FConexao;
    property codigo_produto : Integer         read Fcodigo_produto write Fcodigo_produto;
    property descricao      : String          read Fdescricao write Fdescricao;
    property preco_venda    : Real            read Fpreco_venda write Fpreco_venda;

    constructor Create( Conexao: TADOConnection );
    destructor Destroy; override;

    function consultaProduto(pCodigoProduto: String): TProduto;

  end;

var
  QueryConsulta : TADOQuery;

implementation

{ TProduto }

function TProduto.consultaProduto(pCodigoProduto: String): TProduto;
var
  vProduto: TProduto;
begin
    vProduto := TProduto.Create(FConexao);

    QueryConsulta.Close;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('select codigo_produto    ');
    QueryConsulta.SQL.Add('     , descricao         ');
    QueryConsulta.SQL.Add('     , preco_venda       ');
    QueryConsulta.SQL.Add('  from produtos          ');
    QueryConsulta.SQL.Add(' where codigo_produto = ' + Trim(pCodigoProduto));

    QueryConsulta.Open;

    if QueryConsulta.RecordCount > 0 then
    begin
      vProduto.Fcodigo_produto := QueryConsulta.FieldByName('codigo_produto').AsInteger;
      vProduto.Fdescricao      := QueryConsulta.FieldByName('descricao').AsString;
      vProduto.Fpreco_venda    := QueryConsulta.FieldByName('preco_venda').AsFloat;
    end;

    Result := vProduto;
 end;

constructor TProduto.Create(Conexao: TADOConnection);
begin

  FConexao := Conexao;
  QueryConsulta := TADOQuery.Create( nil );
  QueryConsulta.Connection := FConexao;
end;

destructor TProduto.Destroy;
begin
  QueryConsulta.Destroy;
  inherited;
end;

end.
