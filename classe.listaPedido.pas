unit classe.listaPedido;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Gauges, ComCtrls, Menus,
  DBClient, Generics.Collections, classe.clientes, classe.pedidosProdutos, classe.pedidos;

  type
  TListaPedido =  class



  private
    FListaPedidoLinhas: TList<TPedidosProdutos>;
    FListaPedidoCabeca: Tlist<TPedidos>;
    FListaCliente: TList<TClientes>;
    FConexao: TADOConnection;
    function adicionarLinhasPedido(pPedido: String): Boolean;

  public

    property Conexao        : TADOConnection  read FConexao         write FConexao;


    procedure removerLinhas(pIndex: Integer);
    procedure reomverCabecalho(pIndex: Integer);
    function countLinhas(): Integer;
    function countCabecalho(): Integer;
    function adicionarCLientePedido(pPedido: string): Boolean;
    function buscaClientePedido(): TList<TClientes>;


    constructor Create( Conexao: TADOConnection) ;
    destructor Destroy; override;
  end;


var
  QueryAuxiliar : TADOQuery;
  vCliente: TClientes;
  vLinhasPedido: TPedidosProdutos;
  vPedido: TPedidos;

implementation

{ TListaLinhaPedido }

function TListaPedido.adicionarLinhasPedido(pPedido: String): Boolean;
var
  vLinhasPedido: TPedidosProdutos;
  vIsok : Boolean;
begin
  vIsok := False;

  try
    QueryAuxiliar.Close;
    QueryAuxiliar.SQL.Clear;
    QueryAuxiliar.SQL.Add('  select pp.id_linha           ');
    QueryAuxiliar.SQL.Add('       , pp.numero_pedido      ');
    QueryAuxiliar.SQL.Add('       , pp.codigo_produto     ');
    QueryAuxiliar.SQL.Add('       , p.descricao           ');
    QueryAuxiliar.SQL.Add('       , pp.quantidade         ');
    QueryAuxiliar.SQL.Add('       , pp.valor_unitario     ');
    QueryAuxiliar.SQL.Add('       , pp.valor_total        ');
    QueryAuxiliar.SQL.Add('    from pedidos_produtos pp   ');
    QueryAuxiliar.SQL.Add('       , produtos         p    ');
    QueryAuxiliar.SQL.Add('   where pp.codigo_produto = p.codigo_produto');
    QueryAuxiliar.SQL.Add('     and pp.numero_pedido = ' + Trim(pPedido));
    QueryAuxiliar.SQL.Add('order by id_linha              ');

    QueryAuxiliar.Open;

    while not QueryAuxiliar.Eof do
    begin
      vLinhasPedido := TPedidosProdutos.Create(Conexao);

      vLinhasPedido.numero_pedido   := QueryAuxiliar.FieldByName('numero_pedido').AsInteger;
      vLinhasPedido.codigo_produto  := QueryAuxiliar.FieldByName('codigo_produto').AsInteger;
      vLinhasPedido.descricao       := QueryAuxiliar.FieldByName('descricao').AsString;
      vLinhasPedido.quantidade      := QueryAuxiliar.FieldByName('quantidade').AsInteger;
      vLinhasPedido.valor_unitario  := QueryAuxiliar.FieldByName('valor_unitario').AsFloat;
      vLinhasPedido.valor_total     := QueryAuxiliar.FieldByName('valor_total').AsFloat;
      vLinhasPedido.id_linha        := QueryAuxiliar.FieldByName('id_linha').AsInteger;

      vCliente.pedidoLinhas.Add(vLinhasPedido);

      vIsok := True;

      QueryAuxiliar.Next
    end;

    if vIsok then
    begin
      Result := True;
    end;

  except
   on E: Exception do
    begin
      Result := False;
      ShowMessage('Erro ao recuperar os dados das linhas do pedido!' + E.Message);
    end;
  end;
end;

function TListaPedido.buscaClientePedido: TList<TClientes>;
begin
  FListaCliente.Add(vCliente);

  Result := FListaCliente;
end;

function TListaPedido.adicionarCLientePedido(pPedido: String): Boolean;
var
  vIsOk: Boolean;
begin
  vIsOk := False;

  try
    QueryAuxiliar.Close;
    QueryAuxiliar.SQL.Clear;
    QueryAuxiliar.SQL.Add('  select cl.codigo_cliente                       ');
    QueryAuxiliar.SQL.Add('       , cl.nome                                 ');
    QueryAuxiliar.SQL.Add('       , cl.cidade                               ');
    QueryAuxiliar.SQL.Add('       , cl.uf                                   ');
    QueryAuxiliar.SQL.Add('       , pd.data_emissao                         ');
    QueryAuxiliar.SQL.Add('       , pd.numero_pedido                        ');
    QueryAuxiliar.SQL.Add('       , pd.valor_total                          ');
    QueryAuxiliar.SQL.Add('    from clientes cl                             ');
    QueryAuxiliar.SQL.Add('       , pedidos  pd                             ');
    QueryAuxiliar.SQL.Add('   where cl.codigo_cliente = pd.codigo_cliente   ');
    QueryAuxiliar.SQL.Add('     and pd.numero_pedido = ' + Trim(pPedido)     );

    QueryAuxiliar.Open;

    if QueryAuxiliar.RecordCount > 0 then
    begin
      vCliente := TClientes.Create( FConexao );
      vPedido  := TPedidos.Create( FConexao );

      vCliente.codigo_cliente         := QueryAuxiliar.FieldByName('codigo_cliente').AsInteger;
      vCliente.nome                   := QueryAuxiliar.FieldByName('nome').AsString;
      vCliente.cidade                 := QueryAuxiliar.FieldByName('cidade').AsString;
      vCliente.uf                     := QueryAuxiliar.FieldByName('uf').AsString;
      vPedido.data_emissao            := QueryAuxiliar.FieldByName('data_emissao').AsDateTime;
      vpedido.numero_pedido           := QueryAuxiliar.FieldByName('numero_pedido').AsInteger;
      vPedido.valor_total             := QueryAuxiliar.FieldByName('valor_total').AsFloat;

      vCliente.pedidos.Add(vPedido);

      vIsOk := True;

    end
    else
    begin
      ShowMessage('Não foi localizado o pedido com o número digitado, verifique o número digitado e tente novamente!');
    end;

    if vIsOk then
    begin
      Result := adicionarLinhasPedido(pPedido);
    end;

  except
   on E: Exception do
    begin
      Result := False;
      ShowMessage('Erro ao recuperar os dados do cliente e do cabeçalho do pedido!' + E.Message);
    end;
  end;
end;

function TListaPedido.countCabecalho: Integer;
begin
  Result := TClientes(FListaCliente[0]).pedidos.Count;
end;

function TListaPedido.countLinhas(): Integer;
begin
  Result := TClientes(FListaCliente[0]).pedidoLinhas.Count;
end;

constructor TListaPedido.Create( Conexao: TADOConnection );
begin
  FConexao                  := Conexao;
  QueryAuxiliar             := TADOQuery.Create( nil );
  QueryAuxiliar.Connection  := FConexao;
  FListaPedidoLinhas        := TList<TPedidosProdutos>.Create;
  FListaPedidoCabeca        := TList<TPedidos>.Create;
  FListaCliente             := TList<TClientes>.Create;
end;

destructor TListaPedido.Destroy;
begin

  inherited;
  QueryAuxiliar.Destroy;
  FListaPedidoCabeca.Free;
  FListaPedidoLinhas.Free;
  FListaPedidoCabeca.Destroy;
  FListaPedidoLinhas.Destroy;
  FListaCliente.Free;
  FListaCliente.Destroy;

end;

procedure TListaPedido.removerLinhas(pIndex: Integer);
begin
  if pIndex < countLinhas then
     FListaPedidoLinhas.Delete(pIndex)
  else
    ShowMessage('Linha não Localizada para deleção!');
end;

procedure TListaPedido.reomverCabecalho(pIndex: Integer);
begin
  if pIndex < countCabecalho then
     FListaPedidoCabeca.Delete(pIndex)
  else
    ShowMessage('Pedido não localizado para deleção!');
end;

end.
