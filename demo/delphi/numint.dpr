program Numint;

uses
  Vcl.Forms,
  fNumint in 'fNumint.pas' {FormNumint};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormNumint, FormNumint);
  Application.Run;
end.
