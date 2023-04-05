program ApcViewer;

uses
  Vcl.Forms,
  dViewer in '..\..\source\interface\dViewer.pas' {dFormViewer},
  vsop2013 in '..\..\source\code\vsop2013.pas',
  astronomy in '..\..\source\astronomy\astronomy.pas',
  Apc.DE in '..\..\source\apc\Apc.DE.pas',
  Apc.Kepler in '..\..\source\apc\Apc.Kepler.pas',
  Apc.Mathem in '..\..\source\apc\Apc.Mathem.pas',
  Apc.Moon in '..\..\source\apc\Apc.Moon.pas',
  Apc.Physic in '..\..\source\apc\Apc.Physic.pas',
  Apc.Planets in '..\..\source\apc\Apc.Planets.pas',
  Apc.PrecNut in '..\..\source\apc\Apc.PrecNut.pas',
  Apc.Spheric in '..\..\source\apc\Apc.Spheric.pas',
  Apc.Sun in '..\..\source\apc\Apc.Sun.pas',
  Apc.Time in '..\..\source\apc\Apc.Time.pas',
  dAbout in '..\..\source\interface\dAbout.pas' {Form1},
  Astap.Constellations in '..\..\source\code\Astap.Constellations.pas',
  Astap.Ephemerides in '..\..\source\code\Astap.Ephemerides.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdFormViewer, dFormViewer);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
