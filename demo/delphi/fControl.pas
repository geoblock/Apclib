unit fControl;

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

  Apc.Mathem,
  Apc.PrecNut,
  Apc.Spheric,
  Apc.Sun,
  Apc.Kepler,
  Apc.Time;


var
  Day, Month, Year, I: integer;
  D, MODJD, Hour, T, T0, Q, ECC, TEQX0, TEQX, FAC: Double;
  X, Y, Z, VX, VY, VZ, XS, YS, ZS: Double;
  L, B, R, LS, BS, RS, Ra, Dec, DELTA, DELTA0: Double;
  PQR, A, ASI: Double33;
  dDate: array [1 .. 3] of Double;
  OrbInp, OrbOut: TEXT;

type
  TFormControl = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormControl: TFormControl;



implementation

{$R *.dfm}

end.
