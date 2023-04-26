object dFormViewer: TdFormViewer
  Left = 0
  Top = 0
  Caption = 'Apc Viewer'
  ClientHeight = 560
  ClientWidth = 974
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
    Width = 607
    Height = 537
    Camera = Camera
    Buffer.BackgroundColor = clBlack
    FieldOfView = 150.775619506835900000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object PanelRight: TPanel
    Left = 792
    Top = 0
    Width = 182
    Height = 537
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
    object RadioGroupPlanet: TRadioGroup
      Left = 6
      Top = 16
      Width = 145
      Height = 242
      Caption = 'Planet'
      ItemIndex = 2
      Items.Strings = (
        'Mercury'
        'Venus'
        'Earth'
        'Mars'
        'Jupiter'
        'Saturn'
        'Uranus'
        'Neptune'
        'Pluto')
      TabOrder = 1
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
      TabOrder = 2
      OnClick = rgConstLinesClick
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 537
    Align = alLeft
    TabOrder = 2
    object TreeView: TTreeView
      Left = 1
      Top = 42
      Width = 183
      Height = 453
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
      Top = 495
      Width = 183
      Height = 41
      Align = alBottom
      TabOrder = 2
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 537
    Width = 974
    Height = 23
    Panels = <
      item
        Text = 'X:'
        Width = 150
      end
      item
        Text = 'Y:'
        Width = 150
      end
      item
        Text = 'Z:'
        Width = 150
      end>
  end
  object GLScene: TGLScene
    Left = 198
    Top = 28
    object SkyBox: TGLSkyBox
      CloudsPlaneOffset = 0.200000002980232200
      CloudsPlaneSize = 32.000000000000000000
    end
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
    object sfPlanet: TGLSphere
      Direction.Coordinates = {000000000000803F0000000000000000}
      Up.Coordinates = {00000000000000000000803F00000000}
      Radius = 6371.000000000000000000
      Slices = 128
      Stacks = 128
      object TorusMeridian: TGLTorus
        Material.FrontProperties.Ambient.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Diffuse.Color = {00000000000000000000803F0000803F}
        Material.FrontProperties.Emission.Color = {00000000000000000000803F0000803F}
        Direction.Coordinates = {0000803F000000002EBD3BB300000000}
        TurnAngle = 90.000000000000000000
        MajorRadius = 6371.000000000000000000
        MinorRadius = 100.000000000000000000
        Rings = 256
        StopAngle = 360.000000000000000000
        Parts = [toSides, toStartDisk, toStopDisk]
      end
      object TorusEquator: TGLTorus
        Material.FrontProperties.Ambient.Color = {0000803F00000000000000000000803F}
        Material.FrontProperties.Diffuse.Color = {0000803F00000000000000000000803F}
        Material.FrontProperties.Emission.Color = {0000803F00000000000000000000803F}
        Direction.Coordinates = {3A69BCB3000080BF7719C1A500000000}
        Up.Coordinates = {BBF46E3201F03B190000803F00000000}
        MajorRadius = 6371.000000000000000000
        MinorRadius = 100.000000000000000000
        Rings = 256
        StopAngle = 360.000000000000000000
        Parts = [toSides, toStartDisk, toStopDisk]
      end
    end
    object DummyCube: TGLDummyCube
      Up.Coordinates = {0000803F000000000000008000000000}
      CubeSize = 20000.000000000000000000
      VisibleAtRunTime = True
      object TorusEcliptic: TGLTorus
        Material.FrontProperties.Diffuse.Color = {0000803FF8FEFE3E000000000000803F}
        Direction.Coordinates = {00000000D728CCBE73C46A3F00000000}
        PitchAngle = -23.500000000000000000
        Up.Coordinates = {0000000073C46A3FD728CC3E00000000}
        MajorRadius = 10000.000000000000000000
        MinorRadius = 100.000000000000000000
        Rings = 128
        StopAngle = 360.000000000000000000
        Parts = [toSides, toStartDisk, toStopDisk]
      end
      object DiskEcliptic: TGLDisk
        Material.FrontProperties.Diffuse.Color = {0000803F00000000000000009A99993E}
        Material.BlendingMode = bmTransparency
        Direction.Coordinates = {00000000D728CCBE73C46A3F00000000}
        PitchAngle = -23.500000000000000000
        Up.Coordinates = {0000000073C46A3FD728CC3E00000000}
        InnerRadius = 6371.000000000000000000
        OuterRadius = 10000.000000000000000000
        Slices = 64
        SweepAngle = 360.000000000000000000
      end
      object GridLines: TGLLines
        Nodes = <>
        Options = []
      end
      object ffPlanet: TGLFreeForm
      end
    end
    object Camera: TGLCamera
      DepthOfView = 100000.000000000000000000
      FocalLength = 70.000000000000000000
      TargetObject = sfPlanet
      Position.Coordinates = {0050C3C600401CC600409C450000803F}
      Direction.Coordinates = {00000000000080BF0000000000000000}
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
    object CameraController: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
    end
  end
  object MainMenu: TMainMenu
    Left = 376
    Top = 30
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
      Caption = '&View'
      object miPointto: TMenuItem
        Caption = '&Pointto...'
        OnClick = miPointtoClick
      end
      object miCoordinates: TMenuItem
        Caption = '&Coordinates...'
        OnClick = miCoordinatesClick
      end
    end
    object miTools: TMenuItem
      Caption = '&Tools'
      object miSettings: TMenuItem
        Caption = '&Settings...'
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
        Caption = '&Search in Wiki...'
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object About1: TMenuItem
        Caption = '&About...'
        OnClick = About1Click
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
    Left = 282
    Top = 27
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
  object GLMatLib: TGLMaterialLibrary
    Left = 200
    Top = 136
  end
end
