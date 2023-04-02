program Planetrise;

uses
  Vcl.Forms,
  fPlanetrise in 'fPlanetrise.pas' {FormPlanetrise};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPlanetrise, FormPlanetrise);
  Application.Run;
end.
