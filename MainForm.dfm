object frmCaixaProenca: TfrmCaixaProenca
  Left = 0
  Top = 0
  Caption = 'Projeto Proen'#231'a - CAIXA'
  ClientHeight = 554
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 554
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 16
    ExplicitTop = -24
    ExplicitWidth = 472
    object pnlCabec: TPanel
      Left = 1
      Top = 1
      Width = 699
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitWidth = 470
      object btnNovoPedido: TButton
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 89
        Height = 38
        Align = alLeft
        Caption = 'Novo Pedido'
        TabOrder = 0
        OnClick = btnNovoPedidoClick
        ExplicitLeft = 237
        ExplicitTop = -2
        ExplicitHeight = 44
      end
    end
    object pnlPedido: TPanel
      Left = 1
      Top = 45
      Width = 699
      Height = 508
      Align = alClient
      TabOrder = 1
      Visible = False
      ExplicitTop = 46
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 697
        Height = 347
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 428
        object lblTotal: TLabel
          AlignWithMargins = True
          Left = 3
          Top = 325
          Width = 691
          Height = 19
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitTop = 381
          ExplicitWidth = 5
        end
        object mmPedido: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 691
          Height = 316
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          ExplicitWidth = 223
          ExplicitHeight = 475
        end
      end
      object pnlIncluirItem: TPanel
        Left = 1
        Top = 404
        Width = 697
        Height = 56
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 697
          Height = 56
          Align = alClient
          Caption = 'Manipular Produto '
          TabOrder = 0
          ExplicitLeft = 3
          ExplicitTop = 4
          object btnPersistirItem: TButton
            AlignWithMargins = True
            Left = 633
            Top = 18
            Width = 59
            Height = 33
            Align = alRight
            Caption = 'Concluir'
            TabOrder = 0
            OnClick = btnPersistirItemClick
            ExplicitLeft = 634
          end
          object edtItemProduto: TLabeledEdit
            Left = 76
            Top = 21
            Width = 61
            Height = 21
            EditLabel.Width = 68
            EditLabel.Height = 13
            EditLabel.Caption = 'Cod. Produto:'
            LabelPosition = lpLeft
            NumbersOnly = True
            TabOrder = 1
          end
          object edtItemDesc: TLabeledEdit
            Left = 187
            Top = 21
            Width = 113
            Height = 21
            EditLabel.Width = 42
            EditLabel.Height = 13
            EditLabel.Caption = 'Produto:'
            LabelPosition = lpLeft
            TabOrder = 2
          end
          object edtItemQtde: TLabeledEdit
            Left = 339
            Top = 21
            Width = 50
            Height = 21
            EditLabel.Width = 32
            EditLabel.Height = 13
            EditLabel.Caption = 'Qtde.:'
            LabelPosition = lpLeft
            NumbersOnly = True
            TabOrder = 3
          end
          object edtItemValor: TLabeledEdit
            Left = 426
            Top = 21
            Width = 50
            Height = 21
            EditLabel.Width = 28
            EditLabel.Height = 13
            EditLabel.Caption = 'Valor:'
            LabelPosition = lpLeft
            NumbersOnly = True
            TabOrder = 4
          end
        end
      end
      object pnlManipularPedido: TPanel
        Left = 1
        Top = 460
        Width = 697
        Height = 47
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 2
        object btnFinalizarPedido: TButton
          AlignWithMargins = True
          Left = 585
          Top = 3
          Width = 109
          Height = 41
          Align = alRight
          Caption = '&Finalizar Pedido'
          TabOrder = 0
          ExplicitLeft = 588
          ExplicitTop = 0
          ExplicitHeight = 47
        end
        object btnHabilitarManipulacao: TButton
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 99
          Height = 41
          Align = alLeft
          Caption = 'Adicionar Item'
          TabOrder = 1
          OnClick = btnHabilitarManipulacaoClick
          ExplicitLeft = -1
          ExplicitTop = 0
          ExplicitHeight = 47
        end
        object btnHabilitarRemocao: TButton
          AlignWithMargins = True
          Left = 108
          Top = 3
          Width = 99
          Height = 41
          Align = alLeft
          Caption = 'Remover Item'
          TabOrder = 2
          OnClick = btnHabilitarRemocaoClick
          ExplicitLeft = 4
          ExplicitTop = 0
          ExplicitHeight = 47
        end
      end
      object pnlRemoverItem: TPanel
        Left = 1
        Top = 348
        Width = 697
        Height = 56
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 3
        Visible = False
        ExplicitLeft = 0
        ExplicitTop = 0
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 697
          Height = 56
          Align = alClient
          Caption = 'Remover Produto'
          TabOrder = 0
          object bntRemoverItem: TButton
            AlignWithMargins = True
            Left = 633
            Top = 18
            Width = 59
            Height = 33
            Align = alRight
            Caption = 'Concluir'
            TabOrder = 0
            OnClick = bntRemoverItemClick
            ExplicitLeft = 636
            ExplicitTop = 15
            ExplicitHeight = 39
          end
          object edtRemoveProd: TLabeledEdit
            Left = 76
            Top = 25
            Width = 61
            Height = 21
            EditLabel.Width = 65
            EditLabel.Height = 13
            EditLabel.Caption = 'Identificador:'
            LabelPosition = lpLeft
            NumbersOnly = True
            TabOrder = 1
          end
          object edtRemoveQtde: TLabeledEdit
            Left = 183
            Top = 25
            Width = 50
            Height = 21
            EditLabel.Width = 32
            EditLabel.Height = 13
            EditLabel.Caption = 'Qtde.:'
            LabelPosition = lpLeft
            NumbersOnly = True
            TabOrder = 2
          end
        end
      end
    end
  end
end
