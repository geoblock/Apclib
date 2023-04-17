program ApsViewer;

uses
  Vcl.Forms,
  dMainViewer in 'source\interface\dMainViewer.pas' {dFormViewer},
  vsop2013 in 'source\code\vsop2013.pas',
  astronomy in 'source\astronomy\astronomy.pas',
  Apc.DE in 'source\apc\Apc.DE.pas',
  Apc.Kepler in 'source\apc\Apc.Kepler.pas',
  Apc.Mathem in 'source\apc\Apc.Mathem.pas',
  Apc.Moon in 'source\apc\Apc.Moon.pas',
  Apc.Physic in 'source\apc\Apc.Physic.pas',
  Apc.Planets in 'source\apc\Apc.Planets.pas',
  Apc.PrecNut in 'source\apc\Apc.PrecNut.pas',
  Apc.Spheric in 'source\apc\Apc.Spheric.pas',
  Apc.Sun in 'source\apc\Apc.Sun.pas',
  Apc.Time in 'source\apc\Apc.Time.pas',
  dAbout in 'source\interface\dAbout.pas' {FormAbout},
  Astap.Constellations in 'source\code\Astap.Constellations.pas',
  Astap.Ephemerides in 'source\code\Astap.Ephemerides.pas',
  sofa in 'source\sofa\sofa.pas',
  dCoords in 'source\interface\dCoords.pas' {FormCoords},
  dPointto in 'source\interface\dPointto.pas' {FormPointto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdFormViewer, dFormViewer);
  Application.CreateForm(TFormCoords, FormCoords);
  Application.CreateForm(TFormPointto, FormPointto);
  Application.Run;
end.
