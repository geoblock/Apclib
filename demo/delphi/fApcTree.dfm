object FormTree: TFormTree
  Left = 0
  Top = 0
  Caption = 'Apc Tree'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  TextHeight = 15
  object PanelLeft: TPanel
    Left = 0
    Top = 50
    Width = 185
    Height = 364
    Align = alLeft
    TabOrder = 0
    ExplicitLeft = 184
    ExplicitTop = 160
    ExplicitHeight = 41
    object TreeView: TTreeView
      Left = 1
      Top = 42
      Width = 183
      Height = 280
      Align = alClient
      Indent = 19
      TabOrder = 0
      ExplicitLeft = 32
      ExplicitTop = 128
      ExplicitWidth = 121
      ExplicitHeight = 97
    end
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 41
      Align = alTop
      TabOrder = 1
      ExplicitLeft = 16
      ExplicitTop = 40
      ExplicitWidth = 185
    end
    object PanelBottom: TPanel
      Left = 1
      Top = 322
      Width = 183
      Height = 41
      Align = alBottom
      TabOrder = 2
      ExplicitLeft = 16
      ExplicitTop = 40
      ExplicitWidth = 185
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 414
    Width = 622
    Height = 19
    Panels = <>
    ExplicitLeft = 240
    ExplicitTop = 408
    ExplicitWidth = 0
  end
  object ControlBar: TControlBar
    Left = 0
    Top = 0
    Width = 622
    Height = 50
    Align = alTop
    TabOrder = 2
    ExplicitLeft = 280
    ExplicitTop = 152
    ExplicitWidth = 100
  end
  object PageControl: TPageControl
    Left = 185
    Top = 50
    Width = 437
    Height = 364
    Align = alClient
    TabOrder = 3
    ExplicitLeft = 256
    ExplicitTop = 112
    ExplicitWidth = 289
    ExplicitHeight = 193
  end
  object MainMenu: TMainMenu
    Left = 88
    Top = 128
  end
end
