program Sunset;

uses
  Vcl.Forms,
  fSunset in 'fSunset.pas' {FormSunset};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSunset, FormSunset);
  Application.Run;
end.
