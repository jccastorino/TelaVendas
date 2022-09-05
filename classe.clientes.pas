unit classe.clientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, DB, ADODB, DBClient, classe.pedidos, classe.pedidosProdutos,
  Generics.Collections;

Type
  TClientes = class

  private
    Fuf: string;
    Fcodigo_cliente: Integer;
    Fnome: string;
    Fcidade: String;
    FConexao: TADOConnection;
    FpedidoLinhas: TList<TPedidosProdutos>;
    Fpedidos: TList<TPedidos>;

  public

    property Conexao        : TADOConnection  read FConexao   write FConexao;
    property codigo_cliente : Integer   read Fcodigo_cliente  write Fcodigo_cliente;
    property nome           : string    read Fnome            write Fnome;
    property cidade         : String    read Fcidade          write Fcidade;
    property uf             : string    read Fuf              write Fuf;
    property pedidos        : TList<TPedidos>     read Fpedidos         write Fpedidos;
    property pedidoLinhas   : TList<TPedidosProdutos>     read FpedidoLinhas    write FpedidoLinhas;

    constructor Create( Conexao: TADOConnection);
    destructor Destroy; override;

    function consultaClientes(pCodigocliente: string): TClientes;

  end;

var
  QueryConsulta : TADOQuery;

implementation

{ TClientes }

function TClientes.consultaClientes(pCodigocliente: string): TClientes;
var
  vCliente: TClientes;
begin

  vCliente := TClientes.Create( FConexao );

  QueryConsulta.Close;
  QueryConsulta.SQL.Clear;
  QueryConsulta.SQL.Add('select codigo_cliente    ');
  QueryConsulta.SQL.Add('     , nome              ');
  QueryConsulta.SQL.Add('     , cidade            ');
  QueryConsulta.SQL.Add('     , uf                ');
  QueryConsulta.SQL.Add('  from clientes          ');
  QueryConsulta.SQL.Add(' where codigo_cliente = ' + Trim(pCodigocliente));

  QueryConsulta.Open;

  if QueryConsulta.RecordCount > 0 then
  begin
    vCliente.Fcodigo_cliente  := QueryConsulta.FieldByName('codigo_cliente').AsInteger;
    vCliente.Fnome            := QueryConsulta.FieldByName('nome').AsString;
    vCliente.Fcidade          := QueryConsulta.FieldByName('cidade').AsString;
    vCliente.Fuf              := QueryConsulta.FieldByName('uf').AsString;
  end;

  Result := vCliente;

end;

constructor TClientes.Create(Conexao: TADOConnection);
begin

  FConexao                  := Conexao;
  QueryConsulta             := TADOQuery.Create( nil );;
  QueryConsulta.Connection  := FConexao  ;
  FpedidoLinhas             := TList<TPedidosProdutos>.Create;
  Fpedidos                  := TList<Tpedidos>.Create;

end;

destructor TClientes.Destroy;
begin
  QueryConsulta.Destroy;
  inherited;
end;

end.
