object FrmCancelamentoPedido: TFrmCancelamentoPedido
  Left = 638
  Top = 336
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Cancelamento de Pedido'
  ClientHeight = 204
  ClientWidth = 467
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object grp1: TGroupBox
    Left = 0
    Top = 0
    Width = 467
    Height = 204
    Align = alClient
    TabOrder = 0
    object lbl1: TLabel
      Left = 76
      Top = 29
      Width = 310
      Height = 29
      Caption = 'Informe o N'#250'mero do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object EdtNumeroPedidoCancelamento: TEdit
      Left = 76
      Top = 64
      Width = 310
      Height = 53
      Alignment = taCenter
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
    end
    object BtnCancelaPedido: TButton
      Left = 140
      Top = 123
      Width = 177
      Height = 49
      Caption = 'Cancelar Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnCancelaPedidoClick
    end
  end
end
