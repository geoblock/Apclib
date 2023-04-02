program Phys;

uses
  Vcl.Forms,
  fPhys in 'fPhys.pas' {FormPhys};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormPhys, FormPhys);
  Application.Run;
end.
