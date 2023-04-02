program Ecltimer;

uses
  Vcl.Forms,
  fEcltimer in 'fEcltimer.pas' {FormEcltimer};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEcltimer, FormEcltimer);
  Application.Run;
end.
