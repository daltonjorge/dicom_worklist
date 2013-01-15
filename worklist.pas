unit worklist;

interface

{$METHODINFO ON}
type TWorklist = class
  procedure CriarXML(caminho: String);
  private
    FSite: String;
    FPatientId: String;
    FPatientName: String;
    FPatientBirthdate: String;
    FPatientSex: String;
    FPatientLocation: String;
    FAccessionNumber: String;
    FReferringPhysician: String;
    FRequestingPhysician: String;
    FRequestingService: String;
    FModality: String;
    FRequestedProcedureDescription: String;
    FStationAeTitle: String;
    FScheduledStationAeTitle: String;
    FScheduledProcedureStepId: String;
    FDate: String;
    FTime: String;
    FRequestedProcedureId: String;
  published
    property Site: String read FSite write FSite;
    property Patient_Id: String read FPatientId write FPatientId;
    property Patient_Name: String read FPatientName write FPatientName;
    property Patient_Birthdate: String read FPatientBirthdate write FPatientBirthdate;
    property Patient_Sex: String read FPatientSex write FPatientSex;
    property Patient_Location: String read FPatientLocation write FPatientLocation;
    property Accession_Number: String read FAccessionNumber write FAccessionNumber;
    property Referring_Physician: String read FReferringPhysician write FReferringPhysician;
    property Requesting_Physician: String read FRequestingPhysician write FRequestingPhysician;
    property Requesting_Service: String read FRequestingService write FRequestingService;
    property Modality: String read FModality write FModality;
    property Requested_Procedure_Description: String read FRequestedProcedureDescription write FRequestedProcedureDescription;
    property Station_Ae_Title: String read FStationAeTitle write FStationAeTitle;
    property Scheduled_Station_Ae_Title: String read FScheduledStationAeTitle write FScheduledStationAeTitle;
    property Scheduled_Procedure_Step_Id: String read FScheduledProcedureStepId write FScheduledProcedureStepId;
    property Date: String read FDate write FDate;
    property Time: String read FTime write FTime;
    property Requested_Procedure_Id: String read FRequestedProcedureId write FRequestedProcedureId;
  end;

implementation

uses XMLIntf, XmlDoc, TypInfo, Dialogs, SysUtils;

procedure TWorklist.CriarXML(caminho: String);
Var
  XML : IXMLDOCUMENT;
  RootNode, CurNode : IXMLNODE;
  lista : TPropList;
  count, I : integer;
  campo: String;
begin
  XML := NewXMLDocument;
  XML.Encoding := 'utf-8';
  XML.Options := [doNodeAutoIndent];
  RootNode := XML.AddChild('MWL_ITEM');
  count := GetPropList(Self.ClassInfo, tkAny, @lista);
  for I := 0 to count - 1 do
  begin
    campo := lista[I]^.Name;
    CurNode := RootNode.AddChild(UpperCase(campo));
    CurNode.Text := GetPropValue(Self, campo);
  end;
  XMl.SaveToFile(caminho+'\Accession_Number_'+Self.Accession_Number+'.xml');
end;

end.
