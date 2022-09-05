unit classe.pedidos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Gauges, ComCtrls, Menus,
  DBClient;

Type
  TPedidos = class

  private

    Fdata_emissao: TDateTime;
    Fcodigo_cliente: Integer;
    Fnumero_pedido: Integer;
    FConexao: TADOConnection;
    Fvalor_total: Real;
    Fnumero_pedido_recuperado: Integer;


  public

    property Conexao        : TADOConnection  read FConexao write FConexao;
    property numero_pedido  : Integer         read Fnumero_pedido write Fnumero_pedido;
    property data_emissao   : TDateTime       read Fdata_emissao write Fdata_emissao;
    property codigo_cliente : Integer         read Fcodigo_cliente write Fcodigo_cliente;
    property valor_total    : Real            read Fvalor_total write Fvalor_total;
    property numero_pedido_recuperado :Integer read Fnumero_pedido_recuperado write Fnumero_pedido_recuperado;

    constructor Create( Conexao: TADOConnection);
    destructor Destroy; override;

    function consultaPedidos(pNumeroPedido: string): TPedidos;
    function cancelaPedido(pNumeroPedido: string): Boolean;
    function gravaPedidoCabecalho(pPedido: TPedidos): Boolean;
    function numeroPedidoExiste(pNumeroPedido: String): Boolean;
    function recuperaNumeroPedido(): Integer;

  end;


var
  QueryConsulta : TADOQuery;
  vNumeroPedidoRecuperado : Integer;

implementation

uses
  UGlobal;

{ TPedidos }

function TPedidos.cancelaPedido(pNumeroPedido: string): Boolean;
begin
  if numeroPedidoExiste(pNumeroPedido) then
  begin

    try
      QueryConsulta.Close;
      QueryConsulta.SQL.Clear;
      QueryConsulta.SQL.Add('delete from pedidos where numero_pedido = ' + pNumeroPedido);

      QueryConsulta.ExecSQL;

      Result := True;

    except
     on E: Exception do
      begin
        Result := False;
        ShowMessage('Erro ao cancelar o pedido!' + E.Message);
      end;
    end;
  end
  else
  begin
    Result := False;
    ShowMessage('Número do pedido não exsite para cancelamento');
  end;
end;

function TPedidos.consultaPedidos(pNumeroPedido: string): TPedidos;
var
  vPedido: TPedidos;
begin
  try
    vPedido := TPedidos.Create( FConexao );

    QueryConsulta.Close;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('select numero_pedido                     ');
    QueryConsulta.SQL.Add('     , data_emissao                      ');
    QueryConsulta.SQL.Add('     , codigo_cliente                    ');
    QueryConsulta.SQL.Add('     , valor_total                       ');
    QueryConsulta.SQL.Add('  from pedidos                           ');
    QueryConsulta.SQL.Add(' where numero_pedido = ' + pNumeroPedido ) ;

    QueryConsulta.Open;

    if QueryConsulta.RecordCount > 0 then
    begin
      vPedido.numero_pedido := QueryConsulta.FieldByName('numero_pedido').AsInteger;
      vPedido.data_emissao := QueryConsulta.FieldByName('data_emissao').AsDateTime;
      vPedido.Fcodigo_cliente := QueryConsulta.FieldByName('codigo_cliente').AsInteger;
      vPedido.Fvalor_total := QueryConsulta.FieldByName('valor_total').AsFloat;

      Result:= vPedido;

    end;

  except
   on E: Exception do
    begin
      ShowMessage('Erro ao atualizar o item do pedido. Por favor revise as informações e tente novamente' + ''#13'' + E.Message);
    end;
  end;
end;

constructor TPedidos.Create(Conexao: TADOConnection);
begin
  FConexao := Conexao;
  QueryConsulta := TADOQuery.Create( nil );
  QueryConsulta.Connection := FConexao;
end;

destructor TPedidos.Destroy;
begin
  QueryConsulta.Destroy;
  inherited;
end;

function TPedidos.gravaPedidoCabecalho(pPedido: TPedidos): Boolean;
begin
  try
    QueryConsulta.Close;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('   insert                    ');
    QueryConsulta.SQL.Add('     into pedidos            ');
    QueryConsulta.SQL.Add('        ( data_emissao       ');
    QueryConsulta.SQL.Add('        , codigo_cliente     ');
    QueryConsulta.SQL.Add('        , valor_total )      ');
    QueryConsulta.SQL.Add('   values                    ');
    QueryConsulta.SQL.Add('        ( :data_emissao      ');
    QueryConsulta.SQL.Add('        , :codigo_cliente    ');
    QueryConsulta.SQL.Add('        , :valor_total )     ');

    QueryConsulta.Parameters.ParamByName('data_emissao').Value    := FormatDateTime('yyyy-MM-dd', pPedido.Fdata_emissao);
    QueryConsulta.Parameters.ParamByName('codigo_cliente').Value  := pPedido.Fcodigo_cliente;
    QueryConsulta.Parameters.ParamByName('valor_total').Value     := tiraPonto(FloatToStr(pPedido.valor_total));

    QueryConsulta.ExecSQL;

    Result := True;

  except
    on E: Exception do
    begin
      Result := False;
      ShowMessage('Erro ao inserir o pedido. Entre em contato com o suporte para analise do erro!' + ''#13'' + E.Message);
    end;
  end;

end;

function TPedidos.numeroPedidoExiste(pNumeroPedido: String): Boolean;
begin
  if Length(pNumeroPedido) = 0 then
  begin
    Result := False;
  end
  else
  begin
    QueryConsulta.Close;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('select count(*) qtd ');
    QueryConsulta.SQL.Add('  from pedidos      ');
    QueryConsulta.SQL.Add(' where numero_pedido = ' + Trim(pNumeroPedido));

    QueryConsulta.Open;

    if QueryConsulta.FieldByName('qtd').AsInteger > 0 then
      Result := True
    else
      Result := False;
  end;
end;

function TPedidos.recuperaNumeroPedido(): Integer;
begin
  QueryConsulta.Close;
  QueryConsulta.SQL.Clear;
  QueryConsulta.SQL.Add('select last_insert_id() numero_pedido');

  QueryConsulta.Open;

  Result := QueryConsulta.FieldByName('numero_pedido').AsInteger;
end;

end.
