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
  GLS.Scene,
  GLS.SceneViewer,
  GLS.Cadencer,
  GLS.Objects,
  GLS.Coordinates,
  GLS.SimpleNavigation,
  GLS.VectorFileObjects,
  GLS.LensFlare, GLS.SkyDome;

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
    LightSourceSun: TGLLightSource;
    DummyCube: TGLDummyCube;
    sphPlanet: TGLSphere;
    GLSimpleNavigation: TGLSimpleNavigation;
    RadioGroupForm: TRadioGroup;
    ffPlanet: TGLFreeForm;
    RadioGroupPlanet: TRadioGroup;
    LensFlareSun: TGLLensFlare;
    SkyDome: TGLSkyDome;
    LinesEquator: TGLLines;
    PanelLeft: TPanel;
    TreeView: TTreeView;
    PanelTop: TPanel;
    PanelButton: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroupPlanetClick(Sender: TObject);
    procedure GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
  private
    DataDir, CurrDir: TFileName;
  public
  end;

var
  dFormViewer: TdFormViewer;

implementation

{$R *.dfm}

procedure TdFormViewer.FormCreate(Sender: TObject);
begin
  DataDir := ExtractFilePath(ParamStr(0));
  Delete(DataDir,Length(DataDir) - 12, 12);  // only for ..\apps\delphi

  DataDir := DataDir + 'data\';
  SetCurrentDir(DataDir);
  // Loadfile Yale_BSC.stars for GLSkyDome

  // Load map for Planet
  CurrDir := DataDir + 'map\';
  SetCurrentDir(CurrDir);

  sphPlanet.Material.Texture.Disabled := False;
  RadioGroupPlanetClick(Self);
end;

procedure TdFormViewer.GLCadencerProgress(Sender: TObject; const DeltaTime, NewTime: Double);
begin
  sphPlanet.TurnAngle := 10 * NewTime;
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

end.
