unit fStellario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, GLS.BaseClasses, GLS.Scene, GLS.SceneViewer, Vcl.ExtCtrls,
  Vcl.Menus, GLS.Cadencer, Vcl.StdCtrls;

type
  TFormStellario = class(TForm)
    GLSceneViewer1: TGLSceneViewer;
    GLScene1: TGLScene;
    MainMenu1: TMainMenu;
    Timer1: TTimer;
    GLCadencer1: TGLCadencer;
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
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    rgCoords: TRadioGroup;
    Label1: TLabel;
    Label2: TLabel;
    LabelZ: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormStellario: TFormStellario;

implementation

{$R *.dfm}

end.
