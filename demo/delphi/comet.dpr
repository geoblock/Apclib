program Comet;

uses
  Vcl.Forms,
  fComet in 'fComet.pas' {frmComets};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmComets, frmComets);
  Application.Run;
end.
