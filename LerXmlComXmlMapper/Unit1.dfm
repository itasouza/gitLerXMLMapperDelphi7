object Form1: TForm1
  Left = 1729
  Top = 132
  Width = 891
  Height = 480
  Caption = 'leitor de XML com XML Mapping'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lbQtdArquivosLidos: TLabel
    Left = 442
    Top = 174
    Width = 38
    Height = 13
    Caption = '.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object gbImportacao: TGroupBox
    Left = 24
    Top = 26
    Width = 404
    Height = 175
    TabOrder = 0
    object Label1: TLabel
      Left = 20
      Top = 18
      Width = 100
      Height = 13
      Caption = 'Arquivo Origem XML:'
    end
    object Label2: TLabel
      Left = 19
      Top = 62
      Width = 89
      Height = 13
      Caption = 'Arquivo Final XTR:'
    end
    object btnArquivoFim: TSpeedButton
      Left = 344
      Top = 79
      Width = 27
      Height = 22
      Cursor = crHandPoint
      Caption = '...2'
      OnClick = btnArquivoFimClick
    end
    object btnArquivoInicio: TSpeedButton
      Left = 344
      Top = 33
      Width = 26
      Height = 24
      Cursor = crHandPoint
      Caption = '...1'
      OnClick = btnArquivoInicioClick
    end
    object btnGera: TSpeedButton
      Left = 20
      Top = 113
      Width = 157
      Height = 33
      Cursor = crHandPoint
      Hint = 'Gera arquivo selecionado'
      Caption = 'Importar Arquivo '
      ParentShowHint = False
      ShowHint = True
      OnClick = btnGeraClick
    end
    object editArquivoOrigem: TEdit
      Left = 19
      Top = 34
      Width = 321
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'C:\SelecionarArquivoXml.xml'
    end
    object editArquivoFim: TEdit
      Left = 19
      Top = 80
      Width = 321
      Height = 21
      Color = clMoneyGreen
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = 'C:\SelecionarArquivoXTR.xtr'
    end
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 208
    Width = 833
    Height = 217
    DataSource = dsLeitorXml
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'numero1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data-deposito'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data-concessao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data-vigencia'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'despacho_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'despacho_nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'texto-complementar'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigoServico'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'requerente_nome-razao-social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'pais'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'procurador1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cessionario_nome-razao-social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome-razao-social'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'titular_pais'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'uf2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'classe-nice_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'classe-nice_especificacao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'apostila'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'procurador2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'apresentacao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'natureza'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marca_nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'processo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'marca'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'edicao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'classe-vienna_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'prioridade_pais'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'classe-nacional_codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'classe-nacional_especificacao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'codigo'
        Visible = True
      end>
  end
  object XMLTransformProvider1: TXMLTransformProvider
    Left = 568
    Top = 88
  end
  object cdsLeitorXml: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'XMLTransformProvider1'
    Left = 560
    Top = 32
    object cdsLeitorXmlnumero1: TStringField
      FieldName = 'numero1'
      Size = 10
    end
    object cdsLeitorXmldatadeposito: TStringField
      DisplayWidth = 13
      FieldName = 'data-deposito'
      Size = 10
    end
    object cdsLeitorXmldataconcessao: TStringField
      DisplayWidth = 15
      FieldName = 'data-concessao'
      Size = 10
    end
    object cdsLeitorXmldatavigencia: TStringField
      DisplayWidth = 13
      FieldName = 'data-vigencia'
      Size = 10
    end
    object cdsLeitorXmldespacho_codigo: TStringField
      DisplayWidth = 17
      FieldName = 'despacho_codigo'
      Size = 7
    end
    object cdsLeitorXmldespacho_nome: TStringField
      DisplayWidth = 113
      FieldName = 'despacho_nome'
      Size = 94
    end
    object cdsLeitorXmltextocomplementar: TStringField
      DisplayWidth = 1719
      FieldName = 'texto-complementar'
      Size = 1432
    end
    object cdsLeitorXmlnumero2: TStringField
      DisplayWidth = 8
      FieldName = 'numero2'
      Size = 4
    end
    object cdsLeitorXmldata1: TStringField
      DisplayWidth = 12
      FieldName = 'data1'
      Size = 10
    end
    object cdsLeitorXmlcodigoServico: TStringField
      DisplayWidth = 14
      FieldName = 'codigoServico'
      Size = 5
    end
    object cdsLeitorXmlrequerente_nomerazaosocial: TStringField
      DisplayWidth = 156
      FieldName = 'requerente_nome-razao-social'
      Size = 130
    end
    object cdsLeitorXmlpais: TStringField
      DisplayWidth = 4
      FieldName = 'pais'
      Size = 2
    end
    object cdsLeitorXmluf1: TStringField
      DisplayWidth = 3
      FieldName = 'uf1'
      Size = 2
    end
    object cdsLeitorXmlprocurador1: TStringField
      DisplayWidth = 96
      FieldName = 'procurador1'
      Size = 80
    end
    object cdsLeitorXmlcessionario_nomerazaosocial: TStringField
      DisplayWidth = 156
      FieldName = 'cessionario_nome-razao-social'
      Size = 130
    end
    object cdsLeitorXmlnomerazaosocial: TStringField
      DisplayWidth = 156
      FieldName = 'nome-razao-social'
      Size = 130
    end
    object cdsLeitorXmltitular_pais: TStringField
      DisplayWidth = 10
      FieldName = 'titular_pais'
      Size = 2
    end
    object cdsLeitorXmluf2: TStringField
      DisplayWidth = 3
      FieldName = 'uf2'
      Size = 2
    end
    object cdsLeitorXmlclassenice_codigo: TStringField
      DisplayWidth = 20
      FieldName = 'classe-nice_codigo'
      Size = 7
    end
    object cdsLeitorXmlclassenice_especificacao: TMemoField
      DisplayWidth = 25
      FieldName = 'classe-nice_especificacao'
      BlobType = ftMemo
    end
    object cdsLeitorXmlapostila: TStringField
      DisplayWidth = 203
      FieldName = 'apostila'
      Size = 169
    end
    object cdsLeitorXmlprocurador2: TStringField
      DisplayWidth = 96
      FieldName = 'procurador2'
      Size = 80
    end
    object cdsLeitorXmlapresentacao: TStringField
      DisplayWidth = 17
      FieldName = 'apresentacao'
      Size = 14
    end
    object cdsLeitorXmlnatureza: TStringField
      DisplayWidth = 12
      FieldName = 'natureza'
      Size = 10
    end
    object cdsLeitorXmlmarca_nome: TStringField
      DisplayWidth = 165
      FieldName = 'marca_nome'
      Size = 137
    end
    object cdsLeitorXmlprocesso: TStringField
      DisplayWidth = 11
      FieldName = 'processo'
      Size = 9
    end
    object cdsLeitorXmlmarca: TStringField
      DisplayWidth = 81
      FieldName = 'marca'
      Size = 67
    end
    object cdsLeitorXmledicao: TStringField
      DisplayWidth = 7
      FieldName = 'edicao'
      Size = 1
    end
    object cdsLeitorXmlclassevienna_codigo: TStringField
      DisplayWidth = 21
      FieldName = 'classe-vienna_codigo'
      Size = 7
    end
    object cdsLeitorXmldata2: TStringField
      DisplayWidth = 12
      FieldName = 'data2'
      Size = 10
    end
    object cdsLeitorXmlnumero3: TStringField
      DisplayWidth = 8
      FieldName = 'numero3'
      Size = 4
    end
    object cdsLeitorXmlprioridade_pais: TStringField
      DisplayWidth = 14
      FieldName = 'prioridade_pais'
      Size = 2
    end
    object cdsLeitorXmlclassenacional_codigo: TStringField
      DisplayWidth = 22
      FieldName = 'classe-nacional_codigo'
      Size = 7
    end
    object cdsLeitorXmlclassenacional_especificacao: TMemoField
      DisplayWidth = 29
      FieldName = 'classe-nacional_especificacao'
      BlobType = ftMemo
    end
    object cdsLeitorXmlcodigo: TStringField
      DisplayWidth = 9
      FieldName = 'codigo'
      Size = 7
    end
  end
  object OpenDialog2: TOpenDialog
    Filter = 'Arquivo xtr|*.xtr'
    Left = 440
    Top = 89
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivo xml|*.xml'
    Left = 440
    Top = 41
  end
  object dsLeitorXml: TDataSource
    DataSet = cdsLeitorXml
    Left = 728
    Top = 80
  end
end
