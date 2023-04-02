program Coco;

uses
  Vcl.Forms,
  fCoco in 'fCoco.pas' {FormCoco};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormCoco, FormCoco);
  Application.Run;
end.
