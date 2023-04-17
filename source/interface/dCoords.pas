unit dCoords;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,

  GLS.SceneViewer,
  GLS.Scene,
  GLS.VectorGeometry,
  GLS.VectorTypes,
  GLS.Objects,
  GLS.Cadencer,
  GLS.Coordinates,

  GLS.BaseClasses,
  GLS.SimpleNavigation, GLS.GeomObjects;

type
  TFormCoords = class(TForm)
    GLScene1: TGLScene;
    GLSceneViewer1: TGLSceneViewer;
    GLCamera1: TGLCamera;
    GLLightSource1: TGLLightSource;
    Globe: TGLSphere;
    sphNorth: TGLSphere;
    sphEquator: TGLSphere;
    Ball: TGLSphere;
    GLCadencer1: TGLCadencer;
    GLSimpleNavigation1: TGLSimpleNavigation;
    GLDisk1: TGLDisk;
    GLDummyCube1: TGLDummyCube;
    sphSouth: TGLSphere;
    GLLines1: TGLLines;
    procedure GLCadencer1Progress(Sender: TObject; const deltaTime,
      newTime: Double);
    procedure FormCreate(Sender: TObject);
  private
     
  public
     
    p1, p2, v1, v2: TAffineVector;
    theta : Single;
  end;

var
  FormCoords: TFormCoords;

implementation

{$R *.dfm}

procedure TFormCoords.GLCadencer1Progress(Sender: TObject; const deltaTime,
  newTime: Double);
var
  t, x, y: Single;
begin
  t := Frac(newTime);
  SinCosine(theta*t,y,x);
  Ball.Position.SetPoint(VectorCombine(v1,v2,x,y));
end;

procedure TFormCoords.FormCreate(Sender: TObject);
begin


  p1 := sphNorth.Position.AsAffineVector;
  p2 := sphEquator.Position.AsAffineVector;

  theta := ArcCosine(VectorAngleCosine(p1,p2));
  // if R is radius of sphere, then theta*R  is the distance between points
  v1 := p1;
  v2 := p2;
  SubtractVector(v2,VectorScale(v1,VectorDotProduct(v1,v2)));
  NormalizeVector(v2);
end;

end.
