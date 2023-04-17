unit dPointto;

interface

uses
  System.SysUtils,
  System.Classes,
  System.Math,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,


  GLS.Objects,
  GLS.Scene,
  GLS.VectorTypes,
  GLS.VectorGeometry,
  GLS.Cadencer,
  GLS.SceneViewer,
  GLS.GeomObjects,

  GLS.Coordinates,
  GLS.BaseClasses,
  GLS.SimpleNavigation;

type
  TFormPointto = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    GLCamera1: TGLCamera;
    DCSphere: TGLDummyCube;
    ArrowLine: TGLArrowLine;
    GLLightSource1: TGLLightSource;
    Planet: TGLSphere;
    DCArrow: TGLDummyCube;
    GLCadencer1: TGLCadencer;
    Disk1: TGLDisk;
    Disk2: TGLDisk;
    Lines1: TGLLines;
    Plane1: TGLPlane;
    Lines2: TGLLines;
    GLSimpleNavigation1: TGLSimpleNavigation;
    Star: TGLSphere;
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure FormCreate(Sender: TObject);
  private
    DataDir, CurrDir: TFileName;

  end;

var
  FormPointto: TFormPointto;

implementation

{$R *.DFM}

procedure TFormPointto.FormCreate(Sender: TObject);
begin
  DataDir := ExtractFilePath(ParamStr(0));
  DataDir := DataDir + 'data\map\';
  SetCurrentDir(DataDir);

  Planet.Material.Texture.Disabled := False;
  Planet.Material.Texture.Image.LoadFromFile('mars.jpg');

end;

procedure TFormPointto.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
begin
   // Make the blue sphere turn and ride a sin
   DCSphere.Turn(deltaTime*30);
   Planet.Position.Y := Sin(DegToRad(newTime*50))*3;

   // Make the arrow turn
   DCArrow.Turn(-deltaTime*15);

   // Make the arrow point toward the sphere, using Y as up reference
   ArrowLine.PointTo(Planet, YHmgVector);
end;

end.
