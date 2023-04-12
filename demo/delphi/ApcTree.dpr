program ApcTree;

uses
  Vcl.Forms,
  fApcTree in 'fApcTree.pas' {FormTree},
  Apc.DE in '..\..\source\apc\Apc.DE.pas',
  Apc.Kepler in '..\..\source\apc\Apc.Kepler.pas',
  Apc.Mathem in '..\..\source\apc\Apc.Mathem.pas',
  Apc.Moon in '..\..\source\apc\Apc.Moon.pas',
  Apc.Physic in '..\..\source\apc\Apc.Physic.pas',
  Apc.Planets in '..\..\source\apc\Apc.Planets.pas',
  Apc.PrecNut in '..\..\source\apc\Apc.PrecNut.pas',
  Apc.Spheric in '..\..\source\apc\Apc.Spheric.pas',
  Apc.Sun in '..\..\source\apc\Apc.Sun.pas',
  Apc.Time in '..\..\source\apc\Apc.Time.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormTree, FormTree);
  Application.Run;
end.
