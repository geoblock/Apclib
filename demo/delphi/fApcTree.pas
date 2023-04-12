unit fApcTree;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TFormTree = class(TForm)
    PanelLeft: TPanel;
    TreeView: TTreeView;
    PanelTop: TPanel;
    PanelBottom: TPanel;
    StatusBar: TStatusBar;
    ControlBar: TControlBar;
    MainMenu: TMainMenu;
    PageControl: TPageControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTree: TFormTree;

implementation

{$R *.dfm}

end.
