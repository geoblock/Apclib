program Foto;

uses
  Vcl.Forms,
  fFoto in 'fFoto.pas' {FormFoto};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFoto, FormFoto);
  Application.Run;
end.
