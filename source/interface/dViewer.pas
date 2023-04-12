unit dViewer;

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
  GLS.Utils;

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
    Print1: TMenuItem;
    PrintSetup1: TMenuItem;
    Exit1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit1: TMenuItem;
    Undo1: TMenuItem;
    Repeat1: TMenuItem;
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
    Window1: TMenuItem;
    NewWindow1: TMenuItem;
    Tile1: TMenuItem;
    Cascade1: TMenuItem;
    ArrangeAll1: TMenuItem;
    Hide1: TMenuItem;
    Show1: TMenuItem;
    N6: TMenuItem;
    Help1: TMenuItem;
    Contents1: TMenuItem;
    SearchforHelpOn1: TMenuItem;
    HowtoUseHelp1: TMenuItem;
    About1: TMenuItem;
    PanelRight: TPanel;
    RadioGroupCoordinates: TRadioGroup;
    Camera: TGLCamera;
    LightSun: TGLLightSource;
    DummyCube: TGLDummyCube;
    sphPlanet: TGLSphere;
    GLSimpleNavigation: TGLSimpleNavigation;
    RadioGroupForm: TRadioGroup;
    ffPlanet: TGLFreeForm;
    RadioGroupPlanet: TRadioGroup;
    LensFlareSun: TGLLensFlare;
    LinesEquator: TGLLines;
    PanelLeft: TPanel;
    TreeView: TTreeView;
    PanelTop: TPanel;
    PanelButton: TPanel;
    SkyDome: TGLSkyDome;
    ConstLines: TGLLines;
    ConstBorders: TGLLines;
    rgConstLines: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroupPlanetClick(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
    procedure rgConstLinesClick(Sender: TObject);
  private
    DataDir, CurrDir: TFileName;
    procedure LoadConstLines(const aDataPath: TFileName);
    procedure LoadConstBorders(const aDataPath: TFileName);
  public
    ConstellationsAlpha: Single;
    TimeMultiplier: Single;
  end;

var
  dFormViewer: TdFormViewer;

//---------------------------------------------
implementation
//---------------------------------------------

{$R *.dfm}

function LonLatToPos(Lon, Lat: Single): TAffineVector;
var
  F: Single;
begin
  SinCosine(Lat * (PI / 180), Result.Y, F);
  SinCosine(Lon * (360 / 24 * PI / 180), F, Result.X, Result.Z);
end;

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

procedure TdFormViewer.LoadConstBorders(const aDataPath: TFileName);
var
  sl, line: TStrings;
  pos1, pos2: TAffineVector;
  i: Integer;

begin
  sl := TStringList.CReate;
  line := TStringList.CReate;
  sl.LoadFromFile(aDataPath + 'ConstBorders.dat');
  for i := 0 to sl.Count - 1 do
  begin
    line.CommaText := sl[i];
    pos1 := LonLatToPos(StrToFloatDef(line[0]), StrToFloatDef(line[1]));
    ConstBorders.AddNode(pos1);
    pos2 := LonLatToPos(StrToFloatDef(line[2]), StrToFloatDef(line[3]));
    ConstBorders.AddNode(pos2);
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
  SkyDome.Stars.LoadStarsFile('hipparcos.stars');

  // Load map for Planet
  CurrDir := DataDir + 'map\';
  SetCurrentDir(CurrDir);
  sphPlanet.Material.Texture.Disabled := False;
  RadioGroupPlanetClick(Self);

  rgConstLinesClick(Self);
end;

procedure TdFormViewer.GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
begin
  //sphPlanet.TurnAngle := 10 * NewTime;
end;

procedure TdFormViewer.RadioGroupPlanetClick(Sender: TObject);
begin
  case RadioGroupPlanet.ItemIndex of
     0: begin
          sphPlanet.Radius := 2440;
          sphPlanet.Material.Texture.Image.LoadFromFile('mercury.jpg');
        end;
     1: begin
          sphPlanet.Radius := 6052;
          sphPlanet.Material.Texture.Image.LoadFromFile('venus.jpg');
        end;
     2: begin
          sphPlanet.Radius := 6371;
          sphPlanet.Material.Texture.Image.LoadFromFile('earth.jpg');
        end;
     3: begin
          sphPlanet.Radius := 3390;
          sphPlanet.Material.Texture.Image.LoadFromFile('mars.jpg');
        end;
  end;
end;

procedure TdFormViewer.rgConstLinesClick(Sender: TObject);
begin
  CurrDir := DataDir + 'constellation\';
  ConstLines.Nodes.Clear;
  ConstBorders.Nodes.Clear;
  case rgConstLines.ItemIndex of
    0: begin
         SkyDome.Bands.Clear;
       end;
    1: begin
         LoadConstLines(CurrDir);
       end;
    2: begin
         LoadConstBorders(CurrDir);
       end;
  end;
end;

end.
