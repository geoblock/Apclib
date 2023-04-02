program Newmoon;

uses
  Vcl.Forms,
  fNewmoon in 'fNewmoon.pas' {FormNewmoon};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormNewmoon, FormNewmoon);
  Application.Run;
end.
