unit dMainViewer;

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
  Vcl.Menus,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Imaging.jpeg,

  GLS.BaseClasses,
  GLS.VectorGeometry,
  GLS.Scene,
  GLS.SceneViewer,
  GLS.Cadencer,
  GLS.Objects,
  GLS.Coordinates,
  GLS.SimpleNavigation,
  GLS.VectorFileObjects,
  GLS.LensFlare,
  GLS.SkyDome,
  GLS.Utils,
  GLS.GeomObjects,

  dAbout,
  dCoords,
  dPointto, GLS.Material;

type
  TdFormViewer = class(TForm)
    GLSceneViewer: TGLSceneViewer;
    GLScene: TGLScene;
    MainMenu: TMainMenu;
    Timer: TTimer;
    GLCadencer: TGLCadencer;
    File1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Save1: TMenuItem;
    SaveAs1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    PasteSpecial1: TMenuItem;
    Find1: TMenuItem;
    Replace1: TMenuItem;
    GoTo1: TMenuItem;
    Links1: TMenuItem;
    Object1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    miTools: TMenuItem;
    miSettings: TMenuItem;
    ArrangeAll1: TMenuItem;
    Hide1: TMenuItem;
    Show1: TMenuItem;
    N6: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    About1: TMenuItem;
    PanelRight: TPanel;
    RadioGroupCoordinates: TRadioGroup;
    Camera: TGLCamera;
    LightSun: TGLLightSource;
    DummyCube: TGLDummyCube;
    sfPlanet: TGLSphere;
    GLSimpleNavigation: TGLSimpleNavigation;
    ffPlanet: TGLFreeForm;
    RadioGroupPlanet: TRadioGroup;
    LensFlareSun: TGLLensFlare;
    GridLines: TGLLines;
    PanelLeft: TPanel;
    TreeView: TTreeView;
    PanelTop: TPanel;
    PanelButton: TPanel;
    SkyDome: TGLSkyDome;
    ConstLines: TGLLines;
    ConstBorders: TGLLines;
    rgConstLines: TRadioGroup;
    TorusEquator: TGLTorus;
    TorusMeridian: TGLTorus;
    DiskEcliptic: TGLDisk;
    StatusBar: TStatusBar;
    TorusEcliptic: TGLTorus;
    N7: TMenuItem;
    Window1: TMenuItem;
    miPointto: TMenuItem;
    miCoordinates: TMenuItem;
    CameraController: TGLCamera;
    SkyBox: TGLSkyBox;
    GLMatLib: TGLMaterialLibrary;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroupPlanetClick(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
    procedure rgConstLinesClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure miCoordinatesClick(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure miPointtoClick(Sender: TObject);
  private
    DataDir, CurrDir: TFileName;
    FileName: TFileName;
    procedure LoadConstLines(const aDataPath: TFileName);
    procedure LoadConstBorders(const aDataPath: TFileName);
  public
    ConstellationsAlpha: Single;
    TimeMultiplier: Single;
  end;

var
  dFormViewer: TdFormViewer;

//------------------------------------------------------------------
implementation
//------------------------------------------------------------------

{$R *.dfm}

//------------------------------------------------------------------

procedure TdFormViewer.LoadConstLines(const aDataPath: TFileName);
var
  sl, line: TStrings;
  pos1, pos2: TAffineVector;
  i: Integer;

begin
  sl := TStringList.CReate;
  line := TStringList.CReate;
  sl.LoadFromFile(aDataPath + 'ConstLines.dat');
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i];
    pos1 := LonLatToPos(StrToFloatDef(line[0]), StrToFloatDef(line[1]));
    ConstLines.AddNode(pos1);
    pos2 := LonLatToPos(StrToFloatDef(line[2]), StrToFloatDef(line[3]));
    ConstLines.AddNode(pos2);
  end;
  sl.Free;
  line.Free;
end;


//------------------------------------------------------------------

procedure TdFormViewer.LoadConstBorders(const aDataPath: TFileName);
var
  sl, line: TStrings;
  skypos: TAffineVector;
  i: Integer;

begin
  sl := TStringList.CReate;
  line := TStringList.CReate;
  sl.LoadFromFile(aDataPath + 'ConstBorders.dat');
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i];
    skypos := LonLatToPos(StrToFloatDef(line[0]), StrToFloatDef(line[1]));
    ConstBorders.AddNode(skypos);
  end;
  sl.Free;
  line.Free;
end;


//--------------------------------------------------------------------

procedure TdFormViewer.FormCreate(Sender: TObject);
begin
  DataDir := ExtractFilePath(ParamStr(0));
  DataDir := DataDir + 'data\';
  SetCurrentDir(DataDir);

  // Loadfile Yale_BSC.stars for GLSkyDome
  SkyDome.Visible := True;
  SkyDome.Bands.Clear;

  CurrDir := DataDir + 'catalog\';
  SetCurrentDir(CurrDir);
  FileName := 'hipparcos_9.stars';
  if FileExists(FileName) then
    SkyDome.Stars.LoadStarsFile(FileName);

  // Load map for Planet
  CurrDir := DataDir + 'map\';
  SetCurrentDir(CurrDir);
  sfPlanet.Material.Texture.Disabled := False;
  RadioGroupPlanetClick(Self);

  rgConstLinesClick(Self);
end;

//------------------------------------------------------------------

procedure TdFormViewer.GLCadencerProgress(Sender: TObject;
  const DeltaTime, NewTime: Double);
begin
  sfPlanet.TurnAngle := 10 * NewTime;
end;

//------------------------------------------------------------------

procedure TdFormViewer.RadioGroupPlanetClick(Sender: TObject);
begin
  case RadioGroupPlanet.ItemIndex of
     0: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('mercury.jpg');
          sfPlanet.Radius := 2440;
          TorusMeridian.MajorRadius := 2440;
          TorusEquator.MajorRadius := 2440;
          TorusEcliptic.PitchAngle := -23.5;
        end;
     1: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('venus.jpg');
          sfPlanet.Radius := 6052;
          TorusMeridian.MajorRadius := 6052;
          TorusEquator.MajorRadius := 6052;
          TorusEcliptic.PitchAngle := -23.5;
        end;
     2: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');
          sfPlanet.Radius := 6371;
          TorusMeridian.MajorRadius := 6371;
          TorusEquator.MajorRadius := 6371;
          // add Moon as child
        end;
     3: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('mars.jpg');
          sfPlanet.Radius := 3390;
          TorusMeridian.MajorRadius := 3390;
          TorusEquator.MajorRadius := 3390;
        end;
     4: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('jupiter.jpg');
          sfPlanet.Radius := 10000; //
          TorusMeridian.MajorRadius := 10000;
          TorusEquator.MajorRadius := 10000;
          // add Io, Europa, Callisto Ganimede as childs
          //        Camera.ToTarget;
        end;
     5: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('saturn.jpg');
          sfPlanet.Radius := 9500; //
          TorusMeridian.MajorRadius := 9500;
          TorusEquator.MajorRadius := 9500;
          // add Titan and Enceladus as childs
        end;
     6: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('uranus.jpg');
          sfPlanet.Radius := 7500; // 3390;
          TorusMeridian.MajorRadius := 7500;
          TorusEquator.MajorRadius := 7500;
          TorusEcliptic.PitchAngle := -28.3;
        end;
     7: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('neptune.jpg');
          sfPlanet.Radius := 8000; //24622;
          TorusMeridian.MajorRadius := 8000; //24622;
          TorusEquator.MajorRadius := 8000; // 24622;
        end;
     8: begin
          sfPlanet.Material.Texture.Image.LoadFromFile('pluto.jpg');
//          ffPlanet.Material.Texture.Image.LoadFromFile('charon.jpg');
          sfPlanet.Radius := 2377;
          TorusMeridian.MajorRadius := 2377;
          TorusEquator.MajorRadius := 2377;
          TorusEcliptic.PitchAngle := -119.3;
          // add Charon as child
        end;
  end;
end;

//------------------------------------------------------------------

procedure TdFormViewer.rgConstLinesClick(Sender: TObject);
begin
  CurrDir := DataDir + 'constellation\';
  ConstLines.Nodes.Clear;
  ConstBorders.Nodes.Clear;
  case rgConstLines.ItemIndex of
    0: begin
         SkyDome.ClearStructureChanged;
       end;
    1: begin
         LoadConstLines(CurrDir);
       end;
    2: begin
         LoadConstBorders(CurrDir);
       end;
  end;
end;

procedure TdFormViewer.miCoordinatesClick(Sender: TObject);
begin
  with TFormCoords.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TdFormViewer.miPointtoClick(Sender: TObject);
begin
  with TFormPointto.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TdFormViewer.About1Click(Sender: TObject);
begin
  //
  with TFormAbout.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;


end;

procedure TdFormViewer.Exit1Click(Sender: TObject);
begin
  Close;
end;

end.
