program Planetpos;

uses
  Vcl.Forms,
  fPlanetpos in 'fPlanetpos.pas' {FormPlanetpos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPlanetpos, FormPlanetpos);
  Application.Run;
end.
