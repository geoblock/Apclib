program Luna;

uses
  Vcl.Forms,
  fLuna in 'fLuna.pas' {FormLuna};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLuna, FormLuna);
  Application.Run;
end.
