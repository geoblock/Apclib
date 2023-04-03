object FormCoco: TFormCoco
  Left = 0
  Top = 0
  Caption = 'Coco'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Memo1: TMemo
    Left = 120
    Top = 134
    Width = 225
    Height = 151
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object PanelRight: TPanel
    Left = 456
    Top = 0
    Width = 166
    Height = 433
    Align = alRight
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 220
      Width = 7
      Height = 15
      Caption = 'X'
    end
    object Label2: TLabel
      Left = 10
      Top = 266
      Width = 7
      Height = 15
      Caption = 'Y'
    end
    object LabelZ: TLabel
      Left = 13
      Top = 312
      Width = 7
      Height = 15
      Caption = 'Z'
    end
    object Edit2: TEdit
      Left = 32
      Top = 217
      Width = 121
      Height = 23
      TabOrder = 0
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 32
      Top = 262
      Width = 121
      Height = 23
      TabOrder = 1
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 32
      Top = 305
      Width = 121
      Height = 23
      TabOrder = 2
      Text = 'Edit4'
    end
    object rgCoords: TRadioGroup
      Left = 16
      Top = 40
      Width = 137
      Height = 145
      Caption = 'Coordinates'
      ItemIndex = 0
      Items.Strings = (
        'Ecliptic cartesian'
        'Ecliptic polar'
        'Equatorial cartesian'
        'Equatorial polar')
      TabOrder = 3
    end
    object ButtonCalculate: TButton
      Left = 48
      Top = 368
      Width = 75
      Height = 25
      Caption = 'Calculate'
      TabOrder = 4
      OnClick = ButtonCalculateClick
    end
  end
end
