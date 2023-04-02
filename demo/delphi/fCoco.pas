unit fCoco;

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
  Vcl.StdCtrls,
  Vcl.ExtCtrls,

  Apc.Mathem,
  Apc.PrecNut,
  Apc.Spheric,
  Apc.Sun,
  Apc.Time;

var
  X, Y, Z, XS, YS, ZS: Double;
  T, TEQX, TEQXN: Double;
  LS, BS, RS: Double;
  A: Double33;
  IsEclipt: Boolean;
  CharMode: Char;

type
  TFormCoco = class(TForm)
    Memo1: TMemo;
    PanelRight: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    LabelZ: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    rgCoords: TRadioGroup;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCoco: TFormCoco;

implementation

{$R *.dfm}

end.
