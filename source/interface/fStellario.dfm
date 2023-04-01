object FormStellario: TFormStellario
  Left = 0
  Top = 0
  Caption = 'Stellario'
  ClientHeight = 433
  ClientWidth = 622
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poScreenCenter
  TextHeight = 15
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 456
    Height = 433
    PenAsTouch = False
    Align = alClient
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
      Width = 20
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
      Width = 129
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
  end
  object GLScene1: TGLScene
    Left = 34
    Top = 34
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 56
    object File1: TMenuItem
      Caption = '&File'
      object New1: TMenuItem
        Caption = '&New'
      end
      object Open1: TMenuItem
        Caption = '&Open...'
      end
      object Save1: TMenuItem
        Caption = '&Save'
        ShortCut = 16467
      end
      object SaveAs1: TMenuItem
        Caption = 'Save &As...'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Print1: TMenuItem
        Caption = '&Print...'
      end
      object PrintSetup1: TMenuItem
        Caption = 'P&rint Setup...'
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'E&xit'
      end
    end
    object Edit1: TMenuItem
      Caption = '&Edit'
      object Undo1: TMenuItem
        Caption = '&Undo'
        ShortCut = 16474
      end
      object Repeat1: TMenuItem
        Caption = '&Repeat <command>'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Caption = 'Cu&t'
        ShortCut = 16472
      end
      object Copy1: TMenuItem
        Caption = '&Copy'
        ShortCut = 16451
      end
      object Paste1: TMenuItem
        Caption = '&Paste'
        ShortCut = 16470
      end
      object PasteSpecial1: TMenuItem
        Caption = 'Paste &Special...'
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Find1: TMenuItem
        Caption = '&Find...'
      end
      object Replace1: TMenuItem
        Caption = 'R&eplace...'
      end
      object GoTo1: TMenuItem
        Caption = '&Go To...'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Links1: TMenuItem
        Caption = 'Lin&ks...'
      end
      object Object1: TMenuItem
        Caption = '&Object'
      end
    end
    object Window1: TMenuItem
      Caption = '&Window'
      object NewWindow1: TMenuItem
        Caption = '&New Window'
      end
      object Tile1: TMenuItem
        Caption = '&Tile'
      end
      object Cascade1: TMenuItem
        Caption = '&Cascade'
      end
      object ArrangeAll1: TMenuItem
        Caption = '&Arrange All'
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Hide1: TMenuItem
        Caption = '&Hide'
      end
      object Show1: TMenuItem
        Caption = '&Show...'
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object Contents1: TMenuItem
        Caption = '&Contents'
      end
      object SearchforHelpOn1: TMenuItem
        Caption = '&Search for Help On...'
      end
      object HowtoUseHelp1: TMenuItem
        Caption = '&How to Use Help'
      end
      object About1: TMenuItem
        Caption = '&About...'
      end
    end
  end
  object Timer1: TTimer
    Left = 48
    Top = 176
  end
  object GLCadencer1: TGLCadencer
    Left = 128
    Top = 168
  end
end
