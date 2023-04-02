program Orbdet;

uses
  Vcl.Forms,
  fOrbdet in 'fOrbdet.pas' {FormOrbdet};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormOrbdet, FormOrbdet);
  Application.Run;
end.
