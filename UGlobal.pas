unit UGlobal;

interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, ExtCtrls, StdCtrls, DB, ADODB, Menus, WinTypes,
  ImgList, Winsock,Consts,Grids,Mask,Math,ToolWin,Printers,ComObj,
  idSMTP,idMessage,ShellAPI,TLHelp32;


  function tiraMascara(pString: string): string;
  function tiraPonto(Texto: String):Currency;
  function validaCampoNulo(pCampo: TObject; pDescricao: string): Boolean;
  function habilitaDesabilitacomponentes(pComponente: TObject; pEstado: Boolean): Boolean;
  procedure reiniciaComponentesTelaVendas(pForm: TForm);
  function visualizarEncondercomponentes(pComponente: TObject; pEstado: Boolean): Boolean;
  function reiniciaComponentesIndividuais(pComponente: TObject): Boolean;
  procedure SetafocoEdit(pNomeComponente: TEdit);

implementation


function tiraPonto(Texto: string): Currency;
var nI: Integer;
TextoLimpo: String;
begin
   StringReplace(Texto, '.',',', [rfReplaceAll]);
   TextoLimpo := '';
   For nI := 1 to Length(Texto) do
  begin
     if Texto[nI] in ['0'..'9',','] then
         TextoLimpo := Trim(TextoLimpo) + Trim(Texto[nI]);
  end;
  Result := StrToFloat(TextoLimpo);
end;

function tiraMascara(pString: string): string;
begin
  while pos('-', pString) <> 0 do
    delete(pString,pos('-', pString),1);

  while pos('.', pString) <> 0 do
    delete(pString,pos('.', pString),1);

  while pos('/', pString) <> 0 do
    delete(pString,pos('/', pString),1);

  while pos(',', pString) <> 0 do
    delete(pString,pos(',', pString),1);

  while pos('R', pString) <> 0 do
    delete(pString,pos(',', pString),1);

  while pos('$', pString) <> 0 do
    delete(pString,pos(',', pString),1);

  Result := pString;
end;

function validaCampoNulo(pCampo: TObject;
  pDescricao: string): Boolean;
begin
  Result := True;

  if pCampo is TEdit then
    if Trim(TEdit(pCampo).Text) = '' then
    begin
      ShowMessage('Favor informar ' + pDescricao);
      TEdit(pCampo).SetFocus;
      Result := False;
    end;

  if pCampo is TComboBox then
    if Trim(TComboBox(pCampo).Text) = '' then
    begin
      ShowMessage('Favor informar ' + pDescricao);
      TComboBox(pCampo).SetFocus;
      Result := False;
    end;
end;

function habilitaDesabilitacomponentes(pComponente: TObject; pEstado: Boolean): Boolean;
begin
  if pComponente is TEdit then
  begin
     TEdit(pComponente).enabled := pEstado;
  end;
  if pComponente is TGroupBox then
  begin
     TGroupBox(pComponente).enabled := pEstado;
  end;
  if pComponente is TSpeedButton then
  begin
     TSpeedButton(pComponente).enabled := pEstado;
  end;
  if pComponente is TButton then
  begin
     TButton(pComponente).enabled := pEstado;
  end;
  if pComponente is TGroupBox then
  begin
    TGroupBox(pComponente).Enabled := pEstado;
  end;
end;

procedure reiniciaComponentesTelaVendas(pForm: TForm);
var
  i: integer;
begin
  for i := 0 to pForm.ComponentCount -1 do
  begin
    if pForm.Components[i] is TEdit then
      TEdit(pForm.Components[i]).Clear;
    if pForm.Components[i] is TComboBox then
      TComboBox(pForm.Components[i]).Clear;
    if pForm.Components[i] is TCheckBox then
      TCheckBox(pForm.Components[i]).Checked := False;
  end;
end;

function visualizarEncondercomponentes(pComponente: TObject; pEstado: Boolean): Boolean;
begin
  if pComponente is TEdit then
  begin
     TEdit(pComponente).Visible := pEstado;
  end;
  if pComponente is TGroupBox then
  begin
     TGroupBox(pComponente).Visible := pEstado;
  end;
  if pComponente is TSpeedButton then
  begin
     TSpeedButton(pComponente).Visible := pEstado;
  end;
  if pComponente is TButton then
  begin
     TButton(pComponente).Visible := pEstado;
  end;
  if pComponente is TGroupBox then
  begin
    TGroupBox(pComponente).Visible := pEstado;
  end;
end;


function reiniciaComponentesIndividuais(pComponente: TObject): Boolean;
begin
  Result := True;

  if pComponente is TEdit then
  begin
      TEdit(pComponente).Clear;
      Result := False;
  end;

end;

procedure SetafocoEdit(pNomeComponente: TEdit);
begin
  pNomeComponente.SetFocus;
end;

end.
