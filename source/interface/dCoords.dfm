object FormCoords: TFormCoords
  Left = 193
  Top = 108
  Caption = 'Coordinates'
  ClientHeight = 587
  ClientWidth = 863
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object GLSceneViewer1: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 863
    Height = 587
    Camera = GLCamera1
    Buffer.BackgroundColor = clBlack
    FieldOfView = 160.664062500000000000
    PenAsTouch = False
    Align = alClient
    TabOrder = 0
  end
  object GLScene1: TGLScene
    Left = 8
    Top = 8
    object GLCamera1: TGLCamera
      DepthOfView = 100000.000000000000000000
      FocalLength = 50.000000000000000000
      TargetObject = Globe
      CameraStyle = csInfinitePerspective
      Position.Coordinates = {00401C4600401C4600401C460000803F}
      Direction.Coordinates = {00000000000000000000803F00000000}
      object GLLightSource1: TGLLightSource
        ConstAttenuation = 1.000000000000000000
        SpotCutOff = 180.000000000000000000
      end
    end
    object GLDummyCube1: TGLDummyCube
      CubeSize = 1.000000000000000000
      object Globe: TGLSphere
        Material.FrontProperties.Ambient.Color = {9A93133FE4DB5B3FEBE0E03E0000803F}
        Radius = 6371.000000000000000000
        Slices = 128
        Stacks = 128
        object sphNorth: TGLSphere
          Material.FrontProperties.Ambient.Color = {CDCC4C3FF8FEFE3EACC8483E0000803F}
          Material.FrontProperties.Diffuse.Color = {0000803FF8FEFE3E000000000000803F}
          Position.Coordinates = {000000000018C745000000000000803F}
          Radius = 500.000000000000000000
        end
        object sphEquator: TGLSphere
          Material.FrontProperties.Ambient.Color = {0000803F000000000000803F0000803F}
          Position.Coordinates = {0018C74500000000000000000000803F}
          Radius = 500.000000000000000000
        end
        object sphSouth: TGLSphere
          Position.Coordinates = {000000000018C7C5000000000000803F}
          Radius = 500.000000000000000000
        end
        object Ball: TGLSphere
          Material.FrontProperties.Ambient.Color = {EBE0E03EE4DB5B3F9A93133F0000803F}
          Material.FrontProperties.Diffuse.Color = {0000803FF8FEFE3E000000000000803F}
          Position.Coordinates = {00000000000000000018C7450000803F}
          Radius = 500.000000000000000000
        end
        object GLDisk1: TGLDisk
          Direction.Coordinates = {000000000000803F0000000000000000}
          Up.Coordinates = {0000000000000000000080BF00000000}
          OuterRadius = 10000.000000000000000000
          Slices = 64
          SweepAngle = 360.000000000000000000
        end
        object GLLines1: TGLLines
          Nodes = <>
          Options = []
        end
      end
    end
  end
  object GLCadencer1: TGLCadencer
    Scene = GLScene1
    OnProgress = GLCadencer1Progress
    Left = 40
    Top = 8
  end
  object GLSimpleNavigation1: TGLSimpleNavigation
    Form = Owner
    GLSceneViewer = GLSceneViewer1
    FormCaption = 'Coordinates - %FPS'
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
    Left = 72
    Top = 80
  end
end
