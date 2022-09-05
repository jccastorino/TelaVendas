unit classe.pedidosProdutos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Gauges, ComCtrls, Menus,
  DBClient, Generics.Collections;





Type

  TPedidosProdutos = class

  private
    Fvalor_unitario: Real;
    Fvalor_total: Real;
    Fnumero_pedido: Integer;
    Fquantidade: Integer;
    Fid_linha: Integer;
    Fcodigo_produto: Integer;
    FConexao: TADOConnection;
    Fdescricao: String;


  public

    property Conexao        : TADOConnection  read FConexao         write FConexao;
    property id_linha       : Integer         read Fid_linha        write Fid_linha;
    property numero_pedido  : Integer         read Fnumero_pedido   write Fnumero_pedido;
    property codigo_produto : Integer         read Fcodigo_produto  write Fcodigo_produto;
    property quantidade     : Integer         read Fquantidade      write Fquantidade;
    property valor_unitario : Real            read Fvalor_unitario  write Fvalor_unitario;
    property valor_total    : Real            read Fvalor_total     write Fvalor_total;
    property descricao      : String          read Fdescricao       write Fdescricao;


    constructor Create( Conexao: TADOConnection);
    destructor Destroy; override;

    function gravaPedidoLinhas(pArrayLinhasPedido: TPedidosProdutos): Boolean;
    function cancelaLinhasPedido(pNumeroPedido: string): Boolean;

end;


var
  QueryAuxiliar : TADOQuery;

implementation

uses
  classe.listaPedido;

var

  FLinhasPedido: TListaPedido;

{ TPedidosProdutos }


constructor TPedidosProdutos.Create(Conexao: TADOConnection);
begin

  FConexao := Conexao;
  QueryAuxiliar := TADOQuery.Create( nil );
  QueryAuxiliar.Connection := FConexao;
end;

destructor TPedidosProdutos.Destroy;
begin
  QueryAuxiliar.Destroy;
  inherited;
end;


function TPedidosProdutos.gravaPedidoLinhas(pArrayLinhasPedido: TPedidosProdutos): Boolean;
begin

  if pArrayLinhasPedido.codigo_produto > 0 then
  begin

    QueryAuxiliar.Close;
    QueryAuxiliar.SQL.Clear;
    QueryAuxiliar.SQL.Add('   insert                    ');
    QueryAuxiliar.SQL.Add('     into pedidos_produtos   ');
    QueryAuxiliar.SQL.Add('        ( numero_pedido      ');
    QueryAuxiliar.SQL.Add('        , codigo_produto     ');
    QueryAuxiliar.SQL.Add('        , quantidade         ');
    QueryAuxiliar.SQL.Add('        , valor_unitario     ');
    QueryAuxiliar.SQL.Add('        , valor_total )      ');
    QueryAuxiliar.SQL.Add('   values                    ');
    QueryAuxiliar.SQL.Add('        ( :numero_pedido     ');
    QueryAuxiliar.SQL.Add('        , :codigo_produto    ');
    QueryAuxiliar.SQL.Add('        , :quantidade        ');
    QueryAuxiliar.SQL.Add('        , :valor_unitario    ');
    QueryAuxiliar.SQL.Add('        , :valor_total )     ');

    QueryAuxiliar.Parameters.ParamByName('numero_pedido').value   := pArrayLinhasPedido.numero_pedido;
    QueryAuxiliar.Parameters.ParamByName('codigo_produto').Value  := pArrayLinhasPedido.codigo_produto;
    QueryAuxiliar.Parameters.ParamByName('quantidade').Value      := pArrayLinhasPedido.quantidade;
    QueryAuxiliar.Parameters.ParamByName('valor_unitario').Value  := pArrayLinhasPedido.valor_unitario;
    QueryAuxiliar.Parameters.ParamByName('valor_total').Value     := pArrayLinhasPedido.valor_total;

    QueryAuxiliar.ExecSQL;
  end;

  Result := True;
end;

function TPedidosProdutos.cancelaLinhasPedido(pNumeroPedido: string): Boolean;
begin

  try
    QueryAuxiliar.Close;
    QueryAuxiliar.SQL.Clear;
    QueryAuxiliar.SQL.Add('delete from pedidos_produtos where numero_pedido = ' + pNumeroPedido);

    QueryAuxiliar.ExecSQL;

    Result := True;

  except
   on E: Exception do
    begin
      Result := False;
      ShowMessage('Erro ao cancelar as linhas do pedido!' + E.Message);
    end;
  end;
end;

end.
