unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses worklist;

procedure TForm1.Button1Click(Sender: TObject);
var worklist: TWorklist;
begin
  worklist := TWorklist.Create;
  with worklist do
  begin
    Site := 'BORIS';
    Patient_Id := '50799178';
    Patient_Name := 'LUCIENE DO NASCIMENTO MARCELINO';
    Patient_Birthdate := '19611203';
    Patient_Sex := 'F';
    Patient_Location := 'Externo';
    Accession_Number := '51914036';
    Referring_Physician := 'GOMES^JOSE AIRTON FURTADO';
    Requesting_Physician := 'GOMES^JOSE AIRTON FURTADO';
    Requesting_Service := 'TC DA PELVE OU BACIA C/CONT E ANEST';
    Modality := 'CT';
    Requested_Procedure_Description := 'TC DA PELVE OU BACIA C/CONT E ANEST';
    Station_Ae_Title := 'BORIS';
    Scheduled_Station_Ae_Title := 'BORIS';
    Scheduled_Procedure_Step_Id := '151914036';
    Date := '20121206';
    Time := '063201';
    Requested_Procedure_Id := '555';
    CriarXML('C:\Documents and Settings\andre\Desktop');
    Destroy;
  end;
end;

end.
