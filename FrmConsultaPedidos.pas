unit FrmConsultaPedidos;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Gauges, ComCtrls, Menus,
  DBClient,classe.pedidos, classe.pedidosProdutos, IdBaseComponent, IdComponent,
  Generics.Collections;

type
  TFrmConsultarPedidos = class(TForm)
    grp1: TGroupBox;
    LblNumeroPedido: TLabel;
    EdtNumeroPedidoConsultado: TEdit;
    BtnConsultarPedido: TButton;
    procedure BtnConsultarPedidoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  FrmConsultarPedidos: TFrmConsultarPedidos;

implementation

uses
  UFrmPedidoVendas, FrmCancelaPedido;

{$R *.dfm}

procedure TFrmConsultarPedidos.BtnConsultarPedidoClick(Sender: TObject);
begin
  FrmPedidosVendas.consultarPedido(EdtNumeroPedidoConsultado.Text);
  FrmConsultarPedidos.close;
end;

procedure TFrmConsultarPedidos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;
end.
