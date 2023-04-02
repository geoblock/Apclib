program Control;

(* ----------------------------------------------------------------------- *)
(* Confirmation of orbit determination results *)
(* ----------------------------------------------------------------------- *)

uses
  Vcl.Forms,
  fControl in 'fControl.pas' {FormControl};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormControl, FormControl);
  Application.Run;
end.
