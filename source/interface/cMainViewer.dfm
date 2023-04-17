object FormViewerC: TFormViewerC
  Left = 0
  Top = 0
  Caption = 'Apc Viewer C'
  ClientHeight = 553
  ClientWidth = 971
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
    Width = 612
    Height = 553
    Camera = Camera
    Buffer.BackgroundColor = clBackground
    FieldOfView = 159.499740600585900000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 797
    Top = 0
    Width = 174
    Height = 553
    Align = alRight
    TabOrder = 1
    object RadioGroupCoordinates: TRadioGroup
      Left = 16
      Top = 328
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
      Left = 16
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
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 553
    Align = alLeft
    TabOrder = 2
    object TreeView: TTreeView
      Left = 1
      Top = 42
      Width = 183
      Height = 469
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
      Top = 511
      Width = 183
      Height = 41
      Align = alBottom
      TabOrder = 2
    end
  end
  object GLCadencer: TGLCadencer
    Scene = GLScene
    OnProgress = GLCadencerProgress
    Left = 160
    Top = 210
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
    Left = 120
    Top = 157
  end
  object MainMenu: TMainMenu
    Left = 280
    Top = 70
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
      object N1: TMenuItem
        Caption = '-'
      end
      object miExit: TMenuItem
        Caption = 'E&xit'
        OnClick = miExitClick
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
      object miAbout: TMenuItem
        Caption = '&About...'
        OnClick = miAboutClick
      end
    end
  end
  object GLScene: TGLScene
    Left = 43
    Top = 43
    object SkyDome: TGLSkyDome
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
      Stars = <>
    end
    object sfPlanet: TGLSphere
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
      CubeSize = 20000.000000000000000000
      VisibleAtRunTime = True
      object ffPlanet: TGLFreeForm
      end
    end
    object Camera: TGLCamera
      DepthOfView = 100000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = DummyCube
      Position.Coordinates = {00401C4600000000000000000000803F}
      object LightSourceSun: TGLLightSource
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
  object Timer: TTimer
    Left = 60
    Top = 220
  end
end
