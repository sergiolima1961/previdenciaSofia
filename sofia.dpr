program sofia;

uses
  Vcl.Forms,
  Uhistorico in 'Uhistorico.pas' {Fhistorico};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFhistorico, Fhistorico);
  Application.Run;
end.
