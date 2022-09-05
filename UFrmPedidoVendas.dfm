object FrmPedidosVendas: TFrmPedidosVendas
  Left = 235
  Top = 98
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pedido De Vendas'
  ClientHeight = 817
  ClientWidth = 1383
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  PopupMenu = PmMenu
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GbArea: TGroupBox
    Left = 0
    Top = 0
    Width = 1383
    Height = 817
    Align = alClient
    TabOrder = 0
    object GbClientes: TGroupBox
      Left = 2
      Top = 55
      Width = 1379
      Height = 154
      Align = alTop
      Caption = '  Dados do Cliente  '
      TabOrder = 0
      DesignSize = (
        1379
        154)
      object LbCodigoCLiente: TLabel
        Left = 24
        Top = 32
        Width = 73
        Height = 13
        Caption = 'C'#243'digo Cliente:'
      end
      object LblCidade: TLabel
        Left = 60
        Top = 72
        Width = 37
        Height = 13
        Caption = 'Cidade:'
      end
      object LblUf: TLabel
        Left = 80
        Top = 112
        Width = 17
        Height = 13
        Caption = 'UF:'
      end
      object BtnConsultaPedido: TSpeedButton
        Left = 523
        Top = 96
        Width = 134
        Height = 34
        Cursor = crHandPoint
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Consulta Pedido - F5'
        Glyph.Data = {
          5E010000424D5E010000000000005E0000002800000010000000100000000100
          08000000000000010000120B0000120B00000A0000000A000000000000006A6A
          6A002A98AB00067BC0002AC0EA00FF00FF0040D4FF0084E0FF0098F4FF00FFFF
          FF00050505050505030303030305050505050505050502020406060604030305
          0505050505020407070700060606040305050505020407070707000707060604
          0305050502080707070700070707060603050505020808070700000007070706
          0305050502080808070100010707070603050505020408080808070707070704
          0305050505020202020202020202020205050505050502070305050502070305
          0505050505050207030505050207030505050505050502040403030304040305
          0505050505050502040707070403050505050505050505050202020203050505
          0505050505050505050505050505050505050505050505050505050505050505
          0505}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnConsultaPedidoClick
      end
      object BtnCancelarPedido: TSpeedButton
        Left = 383
        Top = 96
        Width = 134
        Height = 34
        Cursor = crHandPoint
        Hint = 'Cancelar Pedido'
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Cancelar Pedido - F4'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B000000010000000100000031DE000031
          E7000031EF000031F700FF00FF000031FF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00040404040404
          0404040404040404000004000004040404040404040404000004040000000404
          0404040404040000040404000000000404040404040000040404040402000000
          0404040400000404040404040404000000040000000404040404040404040400
          0101010004040404040404040404040401010204040404040404040404040400
          0201020304040404040404040404030201040403030404040404040404050203
          0404040405030404040404040303050404040404040303040404040303030404
          0404040404040403040403030304040404040404040404040404030304040404
          0404040404040404040404040404040404040404040404040404}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnCancelarPedidoClick
      end
      object BtnLimparTela: TSpeedButton
        Left = 663
        Top = 96
        Width = 134
        Height = 34
        Cursor = crHandPoint
        Hint = 'Novo Pedido'
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Limpar Tela - F6'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B00000001000000010000EFA54A00C684
          6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B00B584
          8400B58C8400CE9C8400B5948C00C6A59400EFCE9400F7CE9400C6A59C00EFCE
          9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500CEB5AD00D6B5AD00C6BD
          AD00F7D6AD00F7DEAD00D6BDB500DEBDB500DEC6B500E7C6B500EFC6B500EFCE
          B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
          C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
          DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373709090909
          09090909090909090937373710302926231A16110E0E0E130937373710302C28
          26221611110E0E110937373714322E2C2826221A11110E110937373714332E2C
          292823221A11110E093737371736322E2E2C2826221A11110937373718383432
          2E2C2928261A1616093737371C383534312E2C292826221A093737371C383835
          34322E2C28262323093737371D3838383532312E2C282822093737371E383838
          3835323131302719093737371F383838383834342E0D0C0A093737371F383838
          383838362A0204000137373725383838383838382B070503373737371F353434
          343434342A070B37373737371F212121211F1F211C0637373737}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnLimparTelaClick
      end
      object EdtCodigoCliente: TEdit
        Left = 103
        Top = 29
        Width = 82
        Height = 21
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 0
        OnExit = EdtCodigoClienteExit
      end
      object EdtNomeCliente: TEdit
        Left = 191
        Top = 29
        Width = 466
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object EdtCidade: TEdit
        Left = 103
        Top = 69
        Width = 362
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object EdtUf: TEdit
        Left = 103
        Top = 109
        Width = 82
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object GbProdutos: TGroupBox
      Left = 2
      Top = 209
      Width = 1379
      Height = 160
      Align = alTop
      Caption = '  Dados Produtos  '
      Enabled = False
      TabOrder = 1
      DesignSize = (
        1379
        160)
      object LblCodigoProduto: TLabel
        Left = 4
        Top = 34
        Width = 93
        Height = 13
        Caption = 'C'#243'digo do Produto:'
      end
      object lbl1: TLabel
        Left = 33
        Top = 74
        Width = 64
        Height = 13
        Caption = 'Pre'#231'o Venda:'
      end
      object lblLblQuantidade: TLabel
        Left = 667
        Top = 34
        Width = 60
        Height = 13
        Caption = 'Quantidade:'
      end
      object LbTotalItem: TLabel
        Left = 241
        Top = 74
        Width = 53
        Height = 13
        Caption = 'Total Item:'
      end
      object btnNovo: TSpeedButton
        Left = 22
        Top = 111
        Width = 134
        Height = 34
        Cursor = crHandPoint
        Hint = 'Novo Pedido'
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Novo Peddo - F2'
        Glyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          08000000000000010000220B0000220B00000001000000010000EFA54A00C684
          6B00BD8C7300CE947300EFB57300FFC67300BD847B00C6947B00CE9C7B00B584
          8400B58C8400CE9C8400B5948C00C6A59400EFCE9400F7CE9400C6A59C00EFCE
          9C00F7CE9C00F7D69C00C6ADA500CEADA500F7D6A500CEB5AD00D6B5AD00C6BD
          AD00F7D6AD00F7DEAD00D6BDB500DEBDB500DEC6B500E7C6B500EFC6B500EFCE
          B500F7D6B500F7DEB500FFDEB500EFCEBD00F7DEBD00E7DEC600F7DEC600F7E7
          C600E7CECE00E7D6CE00F7E7CE00E7D6D600F7E7D600FFE7D600FFEFD600FFEF
          DE00FFEFE700FFF7E700FFF7EF00FFF7F700FFFFF700FF00FF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00373709090909
          09090909090909090937373710302926231A16110E0E0E130937373710302C28
          26221611110E0E110937373714322E2C2826221A11110E110937373714332E2C
          292823221A11110E093737371736322E2E2C2826221A11110937373718383432
          2E2C2928261A1616093737371C383534312E2C292826221A093737371C383835
          34322E2C28262323093737371D3838383532312E2C282822093737371E383838
          3835323131302719093737371F383838383834342E0D0C0A093737371F383838
          383838362A0204000137373725383838383838382B070503373737371F353434
          343434342A070B37373737371F212121211F1F211C0637373737}
        ParentShowHint = False
        ShowHint = True
        OnClick = btnNovoClick
      end
      object BtnGravarPedido: TSpeedButton
        Left = 162
        Top = 112
        Width = 134
        Height = 34
        Cursor = crHandPoint
        Hint = 'Gravar Pedido'
        Anchors = [akLeft, akTop, akBottom]
        Caption = 'Gravar Pedido - F3'
        Glyph.Data = {
          5E020000424D5E020000000000005E0100002800000010000000100000000100
          08000000000000010000210B0000210B00004A0000004A0000007B1616007B1C
          1C00841C1C00842323008F232300842A2A00843131008F313100A13131009838
          3100A13831008F38380098383800A1383800A14038009838400098404000A140
          4000AB404000B6404000C0404000C0484800C0505000CA505000A1585800AB60
          580084606000846A6A00986A6A00A16A6A00B66A6A0098737300A1737300B67B
          7300987B7B00B67B7B008F848400A1848400CA848400AB8F8F00CA8F8F00CA98
          8F00C0989800CA989800D4989800C0A1A100CAA1A100C0ABAB00D4ABAB00E0AB
          AB00E0B6B600B6C0B600C0C0B600B6C0C000C0C0C000CAC0C000E0C0C000E0CA
          C000CACACA00D4CACA00EACACA00D4D4CA00CAD4D400D4D4D400E0D4D400E0E0
          E000EAEAEA00F4EAEA00F4F4EA00F4F4F400FFF4F400FFFFF400FF00FF00FFFF
          FF004848100C072233343433332505050B4848191516111B27384647452D0002
          131048191515111A05184046492E0102121048191515111C03032F4249320001
          12104819151511200601243A493200011210481915151221231D1F27322C0404
          13104819151515151515151313151515160F48190D111E282B292B2828292B26
          150C4819093845444545454545454530130F48190A3C46434343434343434530
          130F48190A3C423A3A3A3A3A3A3A4230130F48190A3C423B3F3F3F3F3F3B4230
          130F48190A3C44404040404040404230130F48190A3C423A3A3A3A3A3A3A4230
          130F48190A3946434343434343434630130F4848092D3A363636363636363A2A
          0748}
        ParentShowHint = False
        ShowHint = True
        OnClick = BtnGravarPedidoClick
      end
      object EdtCodigoProduto: TEdit
        Left = 103
        Top = 31
        Width = 82
        Height = 21
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 0
        OnExit = EdtCodigoProdutoExit
      end
      object EdtDescricaoProduto: TEdit
        Left = 191
        Top = 31
        Width = 466
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object EdtPrecoVenda: TEdit
        Left = 103
        Top = 71
        Width = 128
        Height = 21
        Alignment = taRightJustify
        TabOrder = 3
        OnExit = EdtPrecoVendaExit
      end
      object EdtQuantidade: TEdit
        Left = 733
        Top = 31
        Width = 82
        Height = 21
        Alignment = taCenter
        NumbersOnly = True
        TabOrder = 2
        Text = '0'
        OnExit = EdtQuantidadeExit
      end
      object btnBtnIncluirProduto: TButton
        Left = 681
        Top = 58
        Width = 134
        Height = 34
        Caption = 'Incluir Produto'
        TabOrder = 4
        OnClick = btnBtnIncluirProdutoClick
      end
      object EdtValorTotalItem: TEdit
        Left = 300
        Top = 71
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object grpBoxBotoes: TGroupBox
      Left = 2
      Top = 15
      Width = 1379
      Height = 40
      Align = alTop
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      object lbl2: TLabel
        Left = 631
        Top = 4
        Width = 4
        Height = 14
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object GbListaPedidos: TGroupBox
      Left = 2
      Top = 369
      Width = 1379
      Height = 319
      Align = alTop
      Caption = '  Lista de Produtos  '
      TabOrder = 3
      object DbProdutosVenda: TDBGrid
        Left = 2
        Top = 15
        Width = 1375
        Height = 302
        Align = alClient
        DataSource = DsPedidoProdutos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 0
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnKeyDown = DbProdutosVendaKeyDown
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'codigo_produto'
            Title.Caption = 'C'#243'digo do Produto'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -21
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 237
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descricao'
            Title.Caption = 'Descri'#231#227'o'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -21
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 536
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'quantidade'
            Title.Caption = 'Quantidade'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -21
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 161
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'preco_venda'
            Title.Caption = 'Valor Unit'#225'rio'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -21
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 182
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Title.Caption = 'Valor Total do Item'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -21
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = []
            Width = 207
            Visible = True
          end>
      end
    end
    object GbTotais: TGroupBox
      Left = 2
      Top = 688
      Width = 1379
      Height = 127
      Align = alClient
      TabOrder = 4
      object lblLblTotalVenda: TLabel
        Left = 1005
        Top = 58
        Width = 162
        Height = 23
        Caption = 'Total da Venda R$:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblLblValorTotalVenda: TLabel
        Left = 1148
        Top = 15
        Width = 229
        Height = 110
        Align = alRight
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = '0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 111
      end
    end
  end
  object conexao: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Persist Security Info=False;Data Source=Orige' +
      'mVendas;'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    Left = 602
    Top = 463
  end
  object DsPedidoProdutos: TDataSource
    DataSet = CdsPedidosProdutos
    Left = 706
    Top = 463
  end
  object CdsPedidosProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 1010
    Top = 465
    object CdsPedidosProdutoscodigo_produto: TIntegerField
      FieldName = 'codigo_produto'
    end
    object CdsPedidosProdutosquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object CdsPedidosProdutosvalor_unitario: TFloatField
      FieldName = 'preco_venda'
    end
    object CdsPedidosProdutosvalor_total: TFloatField
      FieldName = 'valor_total'
    end
    object CdsPedidosProdutosid_linha: TAutoIncField
      FieldName = 'id_linha'
      ReadOnly = True
    end
    object CdsPedidosProdutosdescricao: TStringField
      DisplayWidth = 50
      FieldName = 'descricao'
      Size = 100
    end
  end
  object PmMenu: TPopupMenu
    Left = 1106
    Top = 465
    object Novo: TMenuItem
      Caption = 'Novo Pedido'
      Hint = 'Novo Pedido'
      ShortCut = 113
      OnClick = NovoClick
    end
    object GravarPedido: TMenuItem
      Caption = 'Gravar Pedido'
      Hint = 'Gravar Pedido'
      ShortCut = 114
      OnClick = GravarPedidoClick
    end
    object CancelarPedido1: TMenuItem
      Caption = 'Cancelar Pedido'
      Hint = 'Cancelar Pedido'
      ShortCut = 115
      OnClick = CancelarPedido1Click
    end
    object ConsultarPedido1: TMenuItem
      Caption = 'Consultar Pedido'
      Hint = 'Consultar Pedido'
      ShortCut = 116
      OnClick = ConsultarPedido1Click
    end
    object LimparTela1: TMenuItem
      Caption = 'Limpar Tela'
      ShortCut = 117
      OnClick = LimparTela1Click
    end
  end
  object CdsPedidoCabecalho: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 938
    Top = 561
    object CdsPedidoCabecalhocodigo_cliente: TIntegerField
      FieldName = 'codigo_cliente'
    end
    object CdsPedidoCabecalhodata_emissao: TDateField
      FieldName = 'data_emissao'
    end
    object CdsPedidoCabecalhonumero_pedido: TIntegerField
      FieldName = 'numero_pedido'
    end
    object CdsPedidoCabecalhovalor_total: TFloatField
      FieldName = 'valor_total'
    end
  end
  object ds1: TDataSource
    Left = 802
    Top = 561
  end
end
