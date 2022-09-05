unit FrmCancelaPedido;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Gauges, ComCtrls, Menus,
  DBClient,classe.pedidos, classe.pedidosProdutos, IdBaseComponent, IdComponent;

type
  TFrmCancelamentoPedido = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    EdtNumeroPedidoCancelamento: TEdit;
    BtnCancelaPedido: TButton;
    procedure BtnCancelaPedidoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure cancelaPedido;
    { Private declarations }
  public
    { Public declarations }
    Pedidos         : TPedidos;
    PedidosProdutos : TPedidosProdutos;
    arrayPedidoCabecalho : TPedidos;

  end;

var
  FrmCancelamentoPedido: TFrmCancelamentoPedido;

implementation

uses

  UFrmPedidoVendas, UGlobal;

var
  vPedido                 : TPedidos;
  vPedidoProdutos         : TPedidosProdutos;
{$R *.dfm}

procedure TFrmCancelamentoPedido.BtnCancelaPedidoClick(Sender: TObject);
begin
  cancelaPedido;
end;

procedure TFrmCancelamentoPedido.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCancelamentoPedido.FormCreate(Sender: TObject);
begin
  Pedidos         := TPedidos.Create( FrmPedidosVendas.conexao );
  PedidosProdutos := TPedidosProdutos.Create( FrmPedidosVendas.conexao );
end;

procedure TFrmCancelamentoPedido.cancelaPedido;
var
  vIsok: Boolean;
begin
  vIsok := False;
  if MessageDlg('Deseja Cancelar o pedido ' + EdtNumeroPedidoCancelamento.Text + '?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    try
      FrmPedidosVendas.conexao.BeginTrans;
      vPedido := Pedidos.Create(FrmPedidosVendas.conexao);
      vIsok   := vPedido.cancelaPedido(Trim(EdtNumeroPedidoCancelamento.Text));
      if vIsok then
      begin
        vIsok           := False;
        vPedidoProdutos := PedidosProdutos.Create(FrmPedidosVendas.conexao);
        vIsok           := vPedidoProdutos.cancelaLinhasPedido(Trim(EdtNumeroPedidoCancelamento.Text));
      end;
      if vIsok then
      begin
        ShowMessage('Pedido cancelado com sucesso!');
        FrmPedidosVendas.reiniciaComponentesPedidoProduto;
        FrmPedidosVendas.reiniciaComponentesNovoPedido;
        FrmPedidosVendas.CdsPedidosProdutos.EmptyDataSet;
        FrmPedidosVendas.CdsPedidoCabecalho.EmptyDataSet;
        FrmPedidosVendas.CdsPedidoCabecalho.Close;
        FrmPedidosVendas.CdsPedidoCabecalho.Open;
        FrmPedidosVendas.CdsPedidosProdutos.Close;
        FrmPedidosVendas.CdsPedidosProdutos.Open;
        FrmPedidosVendas.calculaTotaldaVenda;
        FrmPedidosVendas.conexao.CommitTrans;
        FrmCancelamentoPedido.Close;
      end;
    except
      on e: Exception do
      begin
        ShowMessage('Erro: ' + e.Message);
      end;
    end;
  end;
end;

end.
