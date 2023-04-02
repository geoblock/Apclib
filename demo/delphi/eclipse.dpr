program Eclipse;

uses
  Vcl.Forms,
  fEclipse in 'fEclipse.pas' {FormEclipse};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormEclipse, FormEclipse);
  Application.Run;
end.
