unit worklist;

interface

uses XMLIntf, XmlDoc;

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
    procedure CriaNo(NoRaiz: IXMLNODE; campo: String);
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

uses TypInfo, Dialogs, SysUtils;

procedure TWorklist.CriarXML(caminho: String);
var
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

  // Criação dos nós varrendo o array de propriedades da classe, usando reflection
  count := GetPropList(Self.ClassInfo, tkAny, @lista);
//  for I := 0 to count - 1 do
//  begin
//    campo := lista[I]^.Name;
//    CurNode := RootNode.AddChild(UpperCase(campo));
//    CurNode.Text := GetPropValue(Self, campo);
//  end;

  // Criação dos nós de forma manual
  Self.CriaNo(RootNode, 'Site');
  Self.CriaNo(RootNode, 'Patient_Id');
  Self.CriaNo(RootNode, 'Patient_Name');
  Self.CriaNo(RootNode, 'Patient_Birthdate');
  Self.CriaNo(RootNode, 'Patient_Sex');
  Self.CriaNo(RootNode, 'Patient_Location');
  Self.CriaNo(RootNode, 'Accession_Number');
  Self.CriaNo(RootNode, 'Referring_Physician');
  Self.CriaNo(RootNode, 'Requesting_Physician');
  Self.CriaNo(RootNode, 'Requesting_Service');
  Self.CriaNo(RootNode, 'Modality');
  Self.CriaNo(RootNode, 'Requested_Procedure_Description');
  Self.CriaNo(RootNode, 'Station_Ae_Title');
  Self.CriaNo(RootNode, 'Scheduled_Station_Ae_Title');
  Self.CriaNo(RootNode, 'Scheduled_Procedure_Step_Id');
  Self.CriaNo(RootNode, 'Date');
  Self.CriaNo(RootNode, 'Time');
  Self.CriaNo(RootNode, 'Requested_Procedure_Id');

  XMl.SaveToFile(caminho+'\Accession_Number_'+Self.Accession_Number+'.xml');
end;

procedure TWorklist.CriaNo(NoRaiz: IXMLNODE; campo: String);
var NoAtual: IXMLNODE;
begin
  NoAtual := NoRaiz.AddChild(UpperCase(campo));
  NoAtual.Text := GetPropValue(Self, campo);
end;

end.
