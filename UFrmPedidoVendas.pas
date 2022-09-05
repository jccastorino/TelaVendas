unit UFrmPedidoVendas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, Buttons, DB, ADODB, Gauges, ComCtrls, Menus,
  DBClient, classe.pedidos, classe.clientes, classe.pedidosProdutos, classe.produto,
  Generics.Collections, Mask, classe.listaPedido;

type
  TFrmPedidosVendas = class(TForm)
    GbArea: TGroupBox;
    GbClientes: TGroupBox;
    LbCodigoCLiente: TLabel;
    EdtCodigoCliente: TEdit;
    EdtNomeCliente: TEdit;
    LblCidade: TLabel;
    EdtCidade: TEdit;
    LblUf: TLabel;
    EdtUf: TEdit;
    GbProdutos: TGroupBox;
    LblCodigoProduto: TLabel;
    EdtCodigoProduto: TEdit;
    EdtDescricaoProduto: TEdit;
    lbl1: TLabel;
    EdtPrecoVenda: TEdit;
    lblLblQuantidade: TLabel;
    EdtQuantidade: TEdit;
    grpBoxBotoes: TGroupBox;
    lbl2: TLabel;
    btnBtnIncluirProduto: TButton;
    GbListaPedidos: TGroupBox;
    DbProdutosVenda: TDBGrid;
    GbTotais: TGroupBox;
    lblLblTotalVenda: TLabel;
    lblLblValorTotalVenda: TLabel;
    conexao: TADOConnection;
    DsPedidoProdutos: TDataSource;
    LbTotalItem: TLabel;
    CdsPedidosProdutos: TClientDataSet;
    CdsPedidosProdutoscodigo_produto: TIntegerField;
    CdsPedidosProdutosquantidade: TIntegerField;
    CdsPedidosProdutosvalor_unitario: TFloatField;
    CdsPedidosProdutosvalor_total: TFloatField;
    CdsPedidosProdutosid_linha: TAutoIncField;
    CdsPedidosProdutosdescricao: TStringField;
    EdtValorTotalItem: TEdit;
    btnNovo: TSpeedButton;
    BtnGravarPedido: TSpeedButton;
    PmMenu: TPopupMenu;
    BtnConsultaPedido: TSpeedButton;
    Novo: TMenuItem;
    GravarPedido: TMenuItem;
    CancelarPedido1: TMenuItem;
    ConsultarPedido1: TMenuItem;
    BtnCancelarPedido: TSpeedButton;
    CdsPedidoCabecalho: TClientDataSet;
    ds1: TDataSource;
    CdsPedidoCabecalhocodigo_cliente: TIntegerField;
    CdsPedidoCabecalhodata_emissao: TDateField;
    CdsPedidoCabecalhonumero_pedido: TIntegerField;
    CdsPedidoCabecalhovalor_total: TFloatField;
    BtnLimparTela: TSpeedButton;
    LimparTela1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure EdtCodigoClienteExit(Sender: TObject);
    procedure EdtCodigoProdutoExit(Sender: TObject);
    procedure DbProdutosVendaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPrecoVendaExit(Sender: TObject);
    procedure EdtPrecoVendaKeyPress(Sender: TObject; var Key: Char);
    procedure btnBtnIncluirProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure EdtQuantidadeExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure NovoClick(Sender: TObject);
    procedure BtnGravarPedidoClick(Sender: TObject);
    procedure GravarPedidoClick(Sender: TObject);
    procedure BtnCancelarPedidoClick(Sender: TObject);
    procedure CancelarPedido1Click(Sender: TObject);
    procedure BtnConsultaPedidoClick(Sender: TObject);
    procedure ConsultarPedido1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnLimparTelaClick(Sender: TObject);
    procedure LimparTela1Click(Sender: TObject);

  private
    function consultaClientes(): Boolean;
    procedure consultaProduto;
    procedure excluiItemPedido;
    procedure iniciaComponentes;
    procedure inserirAtualizarDadosPedido(pCaption: string; pPosicao: Integer);
    procedure calculaTotalItem;
    procedure criarNovoPedido;
    procedure inserirPedido;
    procedure cancelaPedidoPendente;
    procedure finalizaPedido;
    procedure abreFormCancelamento(Sender: TObject);
    procedure abreFormConsulta(Sender: TObject);
    procedure limpaDataSet;
    procedure limparTela;

    { Private declarations }
  public
    Produto         : TProduto;
    Cliente         : TClientes;
    Pedidos         : TPedidos;
    PedidosProdutos : TPedidosProdutos;
    ListaPedido     : TListaPedido;
    function procuraForm(pForm: TForm): Boolean;
    procedure reiniciaComponentesNovoPedido;
    function calculaTotaldaVenda(): Real;
    procedure reiniciaComponentesPedidoProduto;
    procedure consultarPedido(pNumeroPedido: string);
    var vTela       : string;

    { Public declarations }
  end;

var
  FrmPedidosVendas        : TFrmPedidosVendas;
  vNumeroPedido           : Integer;
  vProduto                : TProduto;
  vCliente                : TClientes;
  vPedido                 : TPedidos;
  vPedidoProdutos         : TPedidosProdutos;
  vListaPedido            : TListaPedido;


implementation


uses
  UGlobal, FrmCancelaPedido, FrmConsultaPedidos;


{$R *.dfm}

function TFrmPedidosVendas.procuraForm(pForm: TForm): Boolean;
var
  I: Integer;
begin

  Result := True;
  for I := 0 to (FrmPedidosVendas.MDIChildCount - 1) do
    if FrmPedidosVendas.MDIChildren[I] = pForm then
    begin
      Result := False;
      Break;
    end;
end;

procedure TFrmPedidosVendas.EdtCodigoClienteExit(Sender: TObject);
begin
  if vTela <> 'Consulta' then
  begin
    if EdtCodigoCliente.Text = EmptyStr then
    begin
      reiniciaComponentesIndividuais(EdtNomeCliente);
      reiniciaComponentesIndividuais(EdtCidade);
      reiniciaComponentesIndividuais(EdtUf);
      habilitaDesabilitacomponentes(btnNovo, False);
      habilitaDesabilitacomponentes(BtnCancelarPedido, True);
      visualizarEncondercomponentes(BtnCancelarPedido, True);
      habilitaDesabilitacomponentes(BtnConsultaPedido, True);
      visualizarEncondercomponentes(BtnConsultaPedido, True);
      habilitaDesabilitacomponentes(BtnLimparTela, True);
      visualizarEncondercomponentes(BtnLimparTela, True);
      habilitaDesabilitacomponentes(BtnGravarPedido, False);
      habilitaDesabilitacomponentes(GbProdutos, False);
    end
    else
    begin
      if CdsPedidosProdutos.IsEmpty then
      begin
        if consultaClientes then
        begin
          habilitaDesabilitacomponentes(BtnCancelarPedido, False);
          visualizarEncondercomponentes(BtnCancelarPedido, False);
          habilitaDesabilitacomponentes(BtnConsultaPedido, False);
          visualizarEncondercomponentes(BtnConsultaPedido, False);
          habilitaDesabilitacomponentes(BtnLimparTela, False);
          visualizarEncondercomponentes(BtnLimparTela, False);
          habilitaDesabilitacomponentes(btnNovo, True);
          habilitaDesabilitacomponentes(BtnGravarPedido, True);
        end
        else
        begin
          habilitaDesabilitacomponentes(btnNovo, False);
          habilitaDesabilitacomponentes(BtnGravarPedido, False);
        end;
      end
      else
      begin
        ShowMessage('Já existem itens separados no pedido para o cliente + ' + EdtCodigoCliente.Text +  ' - ' + EdtNomeCliente.Text + ' Encerre primeiro o pedido ou cancelea!');
        SetafocoEdit(EdtCodigoProduto);
      end;
    end;
  end
  else
    vTela := '';
end;

procedure TFrmPedidosVendas.EdtCodigoProdutoExit(Sender: TObject);
begin
  if EdtCodigoProduto.Text = EmptyStr then
  begin
    reiniciaComponentesIndividuais(EdtQuantidade);
    reiniciaComponentesIndividuais(EdtPrecoVenda);
    reiniciaComponentesIndividuais(EdtValorTotalItem);
    reiniciaComponentesIndividuais(EdtDescricaoProduto);
  end
  else
  begin
    consultaProduto;
    EdtQuantidade.Text := '0';
  end;
end;

procedure TFrmPedidosVendas.EdtPrecoVendaExit(Sender: TObject);
begin
  if EdtPrecoVenda.Text = EmptyStr then
    EdtPrecoVenda.Text := Trim('0,00')
  else
    calculaTotalItem;
end;

procedure TFrmPedidosVendas.EdtPrecoVendaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Length(EdtPrecoVenda.Text) <> 0 then
    EdtPrecoVenda.Text := FormatFloat('###,###,###,##0.00', tiraPonto(Trim(EdtPrecoVenda.Text)));
end;

procedure TFrmPedidosVendas.EdtQuantidadeExit(Sender: TObject);
   begin
  if EdtQuantidade.Text = EmptyStr then
    EdtQuantidade.Text := '0';
end;

function TFrmPedidosVendas.consultaClientes(): Boolean;
var
  vIsOk: Boolean;
begin
  vIsOk := False;

  if Length(EdtCodigoCliente.Text) > 0 then
  begin
    vCliente := Cliente.Create( FrmPedidosVendas.conexao);
    vCliente := vCliente.consultaClientes(Trim(EdtCodigoCliente.Text));

    if Length(vCliente.nome) > 0 then
    begin
      habilitaDesabilitacomponentes(GbProdutos, True);

      EdtNomeCliente.Text := vCliente.nome;
      EdtCidade.Text      := vCliente.cidade;
      EdtUf.Text          := vCliente.uf;

      vIsOk               := True;

      SetafocoEdit(EdtCodigoProduto);
    end
    else
    begin
      vIsOk := False;

      habilitaDesabilitacomponentes(GbProdutos, False);

      ShowMessage('Não foi localizado o cadastro do cliente com o código informado, verifique o código digitado e tente novamente!');
      SetafocoEdit(EdtCodigoCliente);
    end;
  end;

  Result := vIsOk;
end;

procedure TFrmPedidosVendas.consultaProduto;
begin
  if Length(EdtCodigoProduto.Text) > 0 then
  begin
    vProduto := Produto.Create( FrmPedidosVendas.conexao );
    vProduto := produto.consultaProduto(Trim(EdtCodigoProduto.Text));

    if Length(vProduto.descricao) > 0 then
    begin
      EdtDescricaoProduto.Text  := vProduto.descricao;
      EdtPrecoVenda.Text        := FormatFloat('###,###,###,##0.00',vProduto.preco_venda);
    end
    else
    begin
      ShowMessage('Não foi localizado o produto para o código informado, verifique o número digitado e tente novamente!');
      SetafocoEdit(EdtCodigoProduto);
    end;
  end;
end;

procedure TFrmPedidosVendas.consultarPedido(pNumeroPedido: string);
var
  vIsok, vRetorno     : Boolean;
  i,j                 : Integer;
  vListaPedido        : TListaPedido;
  vLinhas             : TPedidosProdutos;
  vPedidoRetornado    : TList<TClientes>;

begin
  vIsok := False;
  vTela := 'Consulta';
  if MessageDlg('Deseja consultar o pedido ' + pNumeroPedido + '?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    try
      conexao.BeginTrans;
      vPedido         := Pedidos.Create(FrmPedidosVendas.conexao);
      vPedidoProdutos := PedidosProdutos.Create(FrmPedidosVendas.conexao);
      vListaPedido    := ListaPedido.Create( FrmPedidosVendas.conexao);

      if vListaPedido.adicionarCLientePedido(Trim(pNumeroPedido)) then
      begin
        vPedidoRetornado := vListaPedido.buscaClientePedido;
        limpaDataSet;
            
        for i := 0 to vListaPedido.countCabecalho - 1 do
        begin
          habilitaDesabilitacomponentes(EdtCodigoCliente, False);

          EdtCodigoCliente.Text         := IntToStr(vPedidoRetornado[i].codigo_cliente);
          EdtNomeCliente.Text           := vPedidoRetornado[i].nome;
          EdtCidade.Text                := vPedidoRetornado[i].cidade;
          EdtUf.Text                    := vPedidoRetornado[i].uf;
          lblLblValorTotalVenda.Caption := FormatFloat('###,###,###,##0.00', vPedidoRetornado[i].pedidos[i].valor_total);

          for j := 0 to vListaPedido.countLinhas - 1 do
          begin
            CdsPedidosProdutos.Append;
            CdsPedidosProdutos.FieldByName('codigo_produto').AsInteger  := vPedidoRetornado[i].pedidoLinhas[j].codigo_produto;
            CdsPedidosProdutos.FieldByName('descricao').AsString        := vPedidoRetornado[i].pedidoLinhas[j].descricao;
            CdsPedidosProdutos.FieldByName('quantidade').AsInteger      := vPedidoRetornado[i].pedidoLinhas[j].quantidade;
            CdsPedidosProdutos.FieldByName('preco_venda').AsFloat       := vPedidoRetornado[i].pedidoLinhas[j].valor_unitario;
            CdsPedidosProdutos.FieldByName('valor_total').AsFloat       := vPedidoRetornado[i].pedidoLinhas[j].valor_total;
            CdsPedidosProdutos.Post;
          end;          
        end;
      end;
      
      conexao.CommitTrans;
    except
      on e: Exception do
      begin
        ShowMessage('Erro: ' + e.Message);
      end;
    end;
  end;
end;

procedure TFrmPedidosVendas.limparTela;
begin
  reiniciaComponentesNovoPedido;
  reiniciaComponentesTelaVendas(FrmPedidosVendas);
  limpaDataSet;
end;

procedure TFrmPedidosVendas.LimparTela1Click(Sender: TObject);
begin
  if (BtnLimparTela.Visible) and (BtnLimparTela.Enabled) then
  begin
    limparTela;
  end;
end;

procedure TFrmPedidosVendas.limpaDataSet;
begin
  CdsPedidosProdutos.Close;
  CdsPedidosProdutos.Open;
  CdsPedidosProdutos.EmptyDataSet;
  CdsPedidoCabecalho.Close;
  CdsPedidoCabecalho.Open;
  CdsPedidoCabecalho.EmptyDataSet;
end;

procedure TFrmPedidosVendas.ConsultarPedido1Click(Sender: TObject);
begin
  if (BtnConsultaPedido.Visible) and (BtnConsultaPedido.Enabled) then
  begin
    abreFormConsulta(Sender);
  end;
end;

procedure TFrmPedidosVendas.DbProdutosVendaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if vTela <> 'Consulta' then
  begin
    if not CdsPedidosProdutos.IsEmpty then
    begin
      if (Key = VK_DELETE) then
      begin
        if MessageDlg('Deseja excluir o item ' + CdsPedidosProdutos.FieldByName('codigo_produto').AsString + ' - ' + CdsPedidosProdutos.FieldByName('descricao').AsString  + ' quantidade ' + CdsPedidosProdutos.FieldByName('quantidade').AsString + ' do pedido', mtConfirmation, mbYesNo, 0) = mrYes then
        begin
          conexao.BeginTrans;

          try
            excluiItemPedido;
            conexao.CommitTrans;
            reiniciaComponentesPedidoProduto;
            SetafocoEdit(EdtCodigoProduto);
            calculaTotaldaVenda;

            ShowMessage('Item deletado com sucesso!');

          except
            on E: Exception do
            begin
              conexao.RollbackTrans;
              ShowMessage('Não foi possível excluir o item desejado, favor entrar em contato com o setor de desenvolvimento!' + ''#13'' + E.Message);
            end;
          end;
        end;
      end
      else
      if (Key = 13) then
      begin

        EdtCodigoProduto.Text         := CdsPedidosProdutos.FieldByName('codigo_produto').AsString;
        EdtDescricaoProduto.Text      := CdsPedidosProdutos.FieldByName('descricao').AsString;
        EdtPrecoVenda.Text            := FormatFloat('###,###,###,##0.00', CdsPedidosProdutos.FieldByName('preco_venda').AsFloat);
        EdtQuantidade.Text            := CdsPedidosProdutos.FieldByName('quantidade').AsString;
        EdtValorTotalItem.Text        := FormatFloat('###,###,###,##0.00', CdsPedidosProdutos.FieldByName('valor_total').AsFloat);

        habilitaDesabilitacomponentes(EdtCodigoProduto, False);
        EdtCodigoProduto.ReadOnly     := True;
        EdtQuantidade.SetFocus;

        btnBtnIncluirProduto.Caption  := 'Atualizar Produto';

      end;
    end;
  end;
end;

procedure TFrmPedidosVendas.btnBtnIncluirProdutoClick(Sender: TObject);
var
  vPosicao : Integer;
  vTexto : String;
begin
  if validaCampoNulo(EdtCodigoProduto, ' o Código do Produto') then
    if validaCampoNulo(EdtQuantidade,  ' a Quantidade do item') then
      if validaCampoNulo(EdtPrecoVenda, ' o valor do item') then
      begin
        if (StrToInt(EdtQuantidade.Text) <= 0) then
        begin
          ShowMessage('A quantidade informada não pode ser menor ou igual a zero, favor digitar um valor positvo para a quantidade');
          EdtQuantidade.SetFocus;
        end
        else
        if (tiraPonto(EdtPrecoVenda.Text) <= StrToFloat('0')) or (EdtPrecoVenda.Text = EmptyStr) then
        begin
          ShowMessage('A preço de venda do produto não pode ser menor ou igual a zero, favor digitar um valor positvo para o preço do produto');
          EdtPrecoVenda.SetFocus;
        end
        else
        begin
          calculaTotalItem;
          vPosicao := CdsPedidosProdutos.RecNo;
          vTexto   := btnBtnIncluirProduto.Caption;
          inserirAtualizarDadosPedido(vTexto, vPosicao);
          reiniciaComponentesPedidoProduto;
          SetafocoEdit(EdtCodigoProduto);
          habilitaDesabilitacomponentes(EdtCodigoCliente, False);
          calculaTotaldaVenda;

        end;
      end;
end;

procedure TFrmPedidosVendas.reiniciaComponentesPedidoProduto;
begin
  EdtCodigoProduto.Clear;
  EdtDescricaoProduto.Clear;
  EdtQuantidade.Clear;
  EdtPrecoVenda.Clear;
  EdtValorTotalItem.Clear;
end;

procedure TFrmPedidosVendas.abreFormCancelamento(Sender: TObject);
begin
  if ProcuraForm(FrmCancelamentoPedido) then
  begin
    Application.CreateForm(TFrmCancelamentoPedido, FrmCancelamentoPedido);
    FrmCancelamentoPedido.ShowModal;
  end
  else
    FrmCancelamentoPedido.ShowModal;
end;

procedure TFrmPedidosVendas.abreFormConsulta(Sender: TObject);
begin
  if ProcuraForm(FrmConsultarPedidos) then
  begin
    Application.CreateForm(TFrmConsultarPedidos, FrmConsultarPedidos);
    FrmConsultarPedidos.ShowModal;
  end
  else
    FrmConsultarPedidos.BringToFront;
end;

procedure TFrmPedidosVendas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmPedidosVendas.FormCreate(Sender: TObject);
begin
  iniciaComponentes;
  try
    conexao.Open();
    EdtPrecoVenda.Text := '0,00';
    Produto         := TProduto.Create( FrmPedidosVendas.conexao );
    Cliente         := TClientes.Create( FrmPedidosVendas.conexao );
    Pedidos         := TPedidos.Create( FrmPedidosVendas.conexao );
    PedidosProdutos := TPedidosProdutos.Create( FrmPedidosVendas.conexao );
    ListaPedido     := TListaPedido.Create( FrmPedidosVendas.conexao );


  except
    on e: Exception do
    ShowMessage('Erro: ' + e.Message);
  end;
end;

procedure TFrmPedidosVendas.FormDestroy(Sender: TObject);
begin
  Produto.Destroy;
end;

procedure TFrmPedidosVendas.FormShow(Sender: TObject);
begin
  SetafocoEdit(EdtCodigoCliente);
end;

procedure TFrmPedidosVendas.GravarPedidoClick(Sender: TObject);
begin
  if (BtnGravarPedido.Visible) and (BtnGravarPedido.Enabled) then
  begin
    finalizaPedido;
  end;
end;

procedure TFrmPedidosVendas.excluiItemPedido;
begin
  CdsPedidosProdutos.Delete;
end;

procedure TFrmPedidosVendas.iniciaComponentes;
begin
  CdsPedidosProdutos.CreateDataSet;
  CdsPedidosProdutos.Open;
  CdsPedidosProdutos.EmptyDataSet;
  CdsPedidosProdutos.First;
  CdsPedidoCabecalho.CreateDataSet;
  CdsPedidoCabecalho.Open;
  CdsPedidoCabecalho.EmptyDataSet;
  CdsPedidoCabecalho.First;
  habilitaDesabilitacomponentes(btnNovo, False);
  habilitaDesabilitacomponentes(BtnGravarPedido, False);
  TFloatField(CdsPedidosProdutos.FieldByName('preco_venda')).Currency := True;
  TFloatField(CdsPedidosProdutos.FieldByName('valor_total')).Currency := True;
end;

procedure TFrmPedidosVendas.inserirAtualizarDadosPedido(pCaption: String; pPosicao: Integer);
var
  vTipoMsg  : Integer;
  vContinue : Boolean;
begin

  vContinue := False;

  try
    if pCaption = 'Incluir Produto' then
    begin
      inserirPedido;
      CdsPedidosProdutos.Append;
      vTipoMsg := 1;
      vContinue := true;
    end
    else
    begin
      if MessageDlg('Deseja Atualzar o item ' + EdtDescricaoProduto.Text + ', para o valor de R$ ' +
      EdtPrecoVenda.Text + ' com a quantidade ' + EdtQuantidade.Text + '?', mtConfirmation, mbYesNo, 0) = mrYes then
      begin
        habilitaDesabilitacomponentes(EdtCodigoProduto, true);
        EdtCodigoProduto.ReadOnly     := False;
        CdsPedidosProdutos.RecNo      := pPosicao;
        CdsPedidosProdutos.Edit;
        btnBtnIncluirProduto.Caption  := 'Incluir Produto';
        vTipoMsg                      := 2;
        vContinue                     := true;
      end
      else
      begin
        reiniciaComponentesPedidoProduto;
        habilitaDesabilitacomponentes(EdtCodigoProduto, True);
        EdtCodigoProduto.SetFocus;
      end;
    end;

    if vContinue then
    begin

      CdsPedidosProdutos.FieldByName('codigo_produto').AsInteger  := StrToInt(Trim(EdtCodigoProduto.Text));
      CdsPedidosProdutos.FieldByName('descricao').AsString        := Trim(EdtDescricaoProduto.Text);
      CdsPedidosProdutos.FieldByName('quantidade').AsInteger      := StrToInt(Trim(EdtQuantidade.Text));
      CdsPedidosProdutos.FieldByName('preco_venda').AsFloat       := tiraPonto(Trim(EdtPrecoVenda.Text));
      CdsPedidosProdutos.FieldByName('valor_total').AsFloat       := tiraPonto(Trim(EdtValorTotalItem.Text));

      CdsPedidosProdutos.Post;
    end;

  except
    on E: Exception do
    begin
      if vTipoMsg = 1 then
        ShowMessage('Erro ao inserir o item do pedido. Por favor revise as informações e tente novamente' + ''#13'' + E.Message)
      else
        ShowMessage('Erro ao atualizar o item do pedido. Por favor revise as informações e tente novamente' + ''#13'' + E.Message);
    end;
  end;
end;

procedure TFrmPedidosVendas.NovoClick(Sender: TObject);
begin
  if (btnNovo.Visible) and (btnNovo.Enabled) then
  begin
    criarNovoPedido;
  end;
end;

procedure TFrmPedidosVendas.calculaTotalItem;
begin

  EdtValorTotalItem.Text  := FormatFloat('###,###,###,##0.00', StrToFloat(Trim(EdtQuantidade.Text)) * tiraPonto(Trim(EdtPrecoVenda.Text)));
  EdtPrecoVenda.Text      := FormatFloat('###,###,###,##0.00', tiraPonto(Trim(StringReplace(EdtPrecoVenda.Text, ',',',', [rfReplaceAll]  ))));
end;

procedure TFrmPedidosVendas.BtnCancelarPedidoClick(Sender: TObject);
begin
  abreFormCancelamento(Sender);
end;

procedure TFrmPedidosVendas.BtnConsultaPedidoClick(Sender: TObject);
begin
  abreFormConsulta(Sender);

end;

procedure TFrmPedidosVendas.BtnGravarPedidoClick(Sender: TObject);
begin
  finalizaPedido;
end;

procedure TFrmPedidosVendas.btnNovoClick(Sender: TObject);
begin
  criarNovoPedido;
end;

procedure TFrmPedidosVendas.BtnLimparTelaClick(Sender: TObject);
begin
  limparTela;
  vTela := '';
end;

function TFrmPedidosVendas.calculaTotaldaVenda(): Real;
var
  vValorVenda: Real;
  I : Integer;
begin
  vValorVenda := 0;
  CdsPedidosProdutos.First;

  if not CdsPedidosProdutos.IsEmpty then
  begin
    while not CdsPedidosProdutos.Eof do
    begin
      vValorVenda := vValorVenda + tiraPonto(CdsPedidosProdutos.FieldByName('valor_total').AsString);
      CdsPedidosProdutos.Next;
    end;
  end;

  lblLblValorTotalVenda.Caption := FormatFloat('###,###,###,##0.00', vValorVenda);

  Result := vValorVenda;

end;

procedure TFrmPedidosVendas.criarNovoPedido;
begin
  if CdsPedidosProdutos.IsEmpty then
  begin
    if MessageDlg('Deseja criar um novo pedido', mtConfirmation, mbYesNo, 0) = mrYes then
    begin
      limparTela;
    end;
  end
  else
  begin
    if MessageDlg('Existem linhas pendentes para finalização em um pedido anterior. deseja criar um novo pedido mesmo assim?', mtConfirmation, mbYesNo, 0) = mrYes then
    begin
      cancelaPedidoPendente;
      reiniciaComponentesNovoPedido;
      limpaDataSet;
    end;
  end;
end;

procedure TFrmPedidosVendas.inserirPedido;
begin
  if CdsPedidoCabecalho.IsEmpty then
  begin
    CdsPedidoCabecalho.Append;
    CdsPedidoCabecalho.FieldByName('codigo_cliente').AsString := Trim(EdtCodigoCliente.Text);
    CdsPedidoCabecalho.FieldByName('numero_pedido').AsInteger := 00;
    CdsPedidoCabecalho.FieldByName('data_emissao').AsDateTime := Date;
    CdsPedidoCabecalho.FieldByName('valor_total').AsFloat     := StrToFloat(lblLblValorTotalVenda.Caption);
    CdsPedidoCabecalho.Post;

  end;
end;

procedure TFrmPedidosVendas.cancelaPedidoPendente;
var
  vIsok: Boolean;
begin
  vIsok := False;

  try
    CdsPedidoCabecalho.EmptyDataSet;
    CdsPedidosProdutos.EmptyDataSet;
    vIsok := True;


    if vIsok then
    begin
      reiniciaComponentesTelaVendas(FrmPedidosVendas);
      ShowMessage('Pedido pendente cancelado com sucesso!');
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Erro ao cancelar o pedido pendente na tela. Favor entrar em contato com o suporte para análise do problema.' + ''#13'' + E.Message);
    end;
  end;
end;

procedure TFrmPedidosVendas.CancelarPedido1Click(Sender: TObject);
begin
if (BtnCancelarPedido.Visible) and (BtnCancelarPedido.Enabled) then
  begin
    abreFormCancelamento(Sender);
  end;
end;

procedure TFrmPedidosVendas.reiniciaComponentesNovoPedido;
begin
  habilitaDesabilitacomponentes(btnNovo, False);
  habilitaDesabilitacomponentes(BtnGravarPedido, False);
  reiniciaComponentesTelaVendas(FrmPedidosVendas);
  habilitaDesabilitacomponentes(GbProdutos, False);
  habilitaDesabilitacomponentes(EdtCodigoCliente, True);
  SetafocoEdit(EdtCodigoCliente);
  habilitaDesabilitacomponentes(BtnCancelarPedido, True);
  visualizarEncondercomponentes(BtnCancelarPedido, True);
  habilitaDesabilitacomponentes(BtnConsultaPedido, True);
  visualizarEncondercomponentes(BtnConsultaPedido, True);
  habilitaDesabilitacomponentes(BtnLimparTela, True);
  visualizarEncondercomponentes(BtnLimparTela, True);
  EdtQuantidade.Text := '0';
  EdtPrecoVenda.Text := '0,00';
  lblLblValorTotalVenda.Caption := '0,00';
end;

procedure TFrmPedidosVendas.finalizaPedido;
var
  vIsOk: Boolean;
begin
  vIsOk := False;

  if not CdsPedidosProdutos.IsEmpty then
  begin
    if MessageDlg('Deseja finalizar o pedido?', mtConfirmation, mbYesNo, 0) = mrYes then
    begin
      conexao.BeginTrans;
      try
        begin
          vPedido                 := Pedidos.Create(FrmPedidosVendas.conexao);
          vPedido.data_emissao    := StrToDate(CdsPedidoCabecalho.FieldByName('data_emissao').AsString);
          vPedido.codigo_cliente  := CdsPedidoCabecalho.FieldByName('codigo_cliente').AsInteger;
          vPedido.valor_total     := calculaTotaldaVenda();
          vIsOk                   := vPedido.gravaPedidoCabecalho(vPedido);

          if vIsOk then
          begin
            vIsOk := False;
            vNumeroPedidoRecuperado := vPedido.recuperaNumeroPedido;
            vIsOk := True;
          end;
        end;

        if vIsOk then
        begin
          vIsOk := False;
          CdsPedidosProdutos.First;
          while not CdsPedidosProdutos.Eof do
          begin
            vPedidoProdutos := PedidosProdutos.Create(FrmPedidosVendas.conexao);

            vPedidoProdutos.numero_pedido   := vNumeroPedidoRecuperado;
            vPedidoProdutos.codigo_produto  := CdsPedidosProdutos.FieldByName('codigo_produto').AsInteger;
            vPedidoProdutos.quantidade      := CdsPedidosProdutos.FieldByName('quantidade').AsInteger;
            vPedidoProdutos.valor_unitario  := StrToFloat(CdsPedidosProdutos.FieldByName('preco_venda').AsString);
            vPedidoProdutos.valor_total     := StrToFloat(CdsPedidosProdutos.FieldByName('valor_total').AsString);

            vIsOk := vPedidoProdutos.gravaPedidoLinhas(vPedidoProdutos);

            CdsPedidosProdutos.Next;
          end;
        end;
        if vIsOk then
        begin
          ShowMessage('Pedido número ' + IntToStr(vNumeroPedidoRecuperado) + ' gravado com sucesso!');
          reiniciaComponentesPedidoProduto;
          reiniciaComponentesNovoPedido;
          limpaDataSet;
          calculaTotaldaVenda;
          conexao.CommitTrans;
        end;

      except
      on E: Exception do
        begin
          conexao.RollbackTrans;
          ShowMessage('Erro ao atualizar o item do pedido. Por favor revise as informações e tente novamente' + ''#13'' + E.Message);
        end;
      end;
    end;
  end;
end;

end.
