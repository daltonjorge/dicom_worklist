program dicom_worklist;

uses
  ExceptionLog,
  Forms,
  main in 'main.pas' {Form1},
  worklist in 'worklist.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
