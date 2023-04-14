object dFormViewer: TdFormViewer
  Left = 0
  Top = 0
  Caption = 'Apc Viewer'
  ClientHeight = 607
  ClientWidth = 1032
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object GLSceneViewer: TGLSceneViewer
    Left = 185
    Top = 0
    Width = 665
    Height = 607
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 161.289718627929700000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object PanelRight: TPanel
    Left = 850
    Top = 0
    Width = 182
    Height = 607
    Align = alRight
    TabOrder = 1
    object RadioGroupCoordinates: TRadioGroup
      Left = 16
      Top = 264
      Width = 145
      Height = 154
      Caption = 'Coordinates'
      ItemIndex = 0
      Items.Strings = (
        'Geodetic'
        'Horizontal'
        'Equatorial'
        'Ecliptic'
        'Galactic'
        'Supergalactic')
      TabOrder = 0
    end
    object RadioGroupForm: TRadioGroup
      Left = 16
      Top = 159
      Width = 145
      Height = 90
      Caption = 'Form'
      ItemIndex = 0
      Items.Strings = (
        'Sphere'
        'Freeform'
        'Ellipsoid')
      TabOrder = 1
    end
    object RadioGroupPlanet: TRadioGroup
      Left = 16
      Top = 16
      Width = 145
      Height = 121
      Caption = 'Planet'
      ItemIndex = 2
      Items.Strings = (
        'Mercury'
        'Venus'
        'Earth'
        'Mars')
      TabOrder = 2
      OnClick = RadioGroupPlanetClick
    end
    object rgConstLines: TRadioGroup
      Left = 16
      Top = 432
      Width = 145
      Height = 97
      Caption = 'Constellation Lines'
      ItemIndex = 0
      Items.Strings = (
        'None'
        'Const Lines'
        'Const Borders')
      TabOrder = 3
      OnClick = rgConstLinesClick
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 607
    Align = alLeft
    TabOrder = 2
    object TreeView: TTreeView
      Left = 1
      Top = 42
      Width = 183
      Height = 523
      Align = alClient
      Indent = 19
      TabOrder = 0
    end
    object PanelTop: TPanel
      Left = 1
      Top = 1
      Width = 183
      Height = 41
      Align = alTop
      TabOrder = 1
    end
    object PanelButton: TPanel
      Left = 1
      Top = 565
      Width = 183
      Height = 41
      Align = alBottom
      TabOrder = 2
    end
  end
  object GLScene: TGLScene
    Left = 203
    Top = 67
    object SkyDome: TGLSkyDome
      Up.Coordinates = {0000803F000000000000000000000000}
      Visible = False
      Bands = <
        item
          StartColor.Color = {0000803F0000803F0000803F0000803F}
          StopAngle = 15.000000000000000000
        end
        item
          StartAngle = 15.000000000000000000
          StopAngle = 90.000000000000000000
          StopColor.Color = {938C0C3E938C0C3E938E0E3F0000803F}
          Stacks = 4
        end>
      Stars = <
        item
          Color = clBlack
        end>
      object ConstLines: TGLLines
        Direction.Coordinates = {00000000000080BF0000000000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        AntiAliased = True
        Nodes = <>
        NodesAspect = lnaInvisible
        SplineMode = lsmSegments
        Options = []
      end
      object ConstBorders: TGLLines
        AntiAliased = True
        Nodes = <>
        NodesAspect = lnaInvisible
        Options = []
      end
    end
    object DummyCube: TGLDummyCube
      Up.Coordinates = {0000803F000000000000008000000000}
      CubeSize = 1.000000000000000000
      VisibleAtRunTime = True
      object LinesEquator: TGLLines
        Nodes = <>
        Options = []
      end
      object sphPlanet: TGLSphere
        Direction.Coordinates = {000000000000803F0000000000000000}
        Up.Coordinates = {00000000000000000000803F00000000}
        Radius = 6371.000000000000000000
        Slices = 128
        Stacks = 128
      end
      object ffPlanet: TGLFreeForm
      end
    end
    object Camera: TGLCamera
      DepthOfView = 100000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = DummyCube
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {00606A4600000000000000000000803F}
      Direction.Coordinates = {0000803F000000000000008000000000}
      Up.Coordinates = {00000000000000000000803F00000000}
      object LightSun: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        LightStyle = lsOmni
        SpotCutOff = 180.000000000000000000
        object LensFlareSun: TGLLensFlare
          Seed = 1465
          FlareIsNotOccluded = True
        end
      end
    end
  end
  object MainMenu: TMainMenu
    Left = 416
    Top = 158
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
        OnClick = Exit1Click
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
  object Timer: TTimer
    Left = 268
    Top = 244
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    OnProgress = GLCadencerProgress
    Left = 264
    Top = 162
  end
  object GLSimpleNavigation: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer
    FormCaption = 'Apc Viewer - %FPS'
    KeyCombinations = <
      item
        ShiftState = [ssLeft, ssRight]
        Action = snaZoom
      end
      item
        ShiftState = [ssLeft]
        Action = snaMoveAroundTarget
      end
      item
        ShiftState = [ssRight]
        Action = snaMoveAroundTarget
      end>
    Left = 414
    Top = 80
  end
end
