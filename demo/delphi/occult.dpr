program Occult;

uses
  Vcl.Forms,
  fOccult in 'fOccult.pas' {FormOccult};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormOccult, FormOccult);
  Application.Run;
end.
