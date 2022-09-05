program PTelaVendas;

uses
  Forms,
  UFrmPedidoVendas in 'UFrmPedidoVendas.pas' {FrmPedidosVendas},
  classe.clientes in 'classe.clientes.pas',
  classe.pedidos in 'classe.pedidos.pas',
  classe.pedidosProdutos in 'classe.pedidosProdutos.pas',
  classe.produto in 'classe.produto.pas',
  UGlobal in 'UGlobal.pas',
  FrmCancelaPedido in 'FrmCancelaPedido.pas' {FrmCancelamentoPedido},
  FrmConsultaPedidos in 'FrmConsultaPedidos.pas' {FrmConsultarPedidos},
  classe.listaPedido in 'classe.listaPedido.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPedidosVendas, FrmPedidosVendas);
  Application.Run;
end.
