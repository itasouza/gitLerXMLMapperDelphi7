unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, xmldom, DB, DBClient, Provider, Xmlxform, StdCtrls, Buttons,
  Grids, DBGrids;

type
  TForm1 = class(TForm)
    gbImportacao: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btnArquivoFim: TSpeedButton;
    btnArquivoInicio: TSpeedButton;
    btnGera: TSpeedButton;
    editArquivoOrigem: TEdit;
    editArquivoFim: TEdit;
    XMLTransformProvider1: TXMLTransformProvider;
    cdsLeitorXml: TClientDataSet;
    cdsLeitorXmlnumero1: TStringField;
    cdsLeitorXmldatadeposito: TStringField;
    cdsLeitorXmldataconcessao: TStringField;
    cdsLeitorXmldatavigencia: TStringField;
    cdsLeitorXmldespacho_codigo: TStringField;
    cdsLeitorXmldespacho_nome: TStringField;
    cdsLeitorXmltextocomplementar: TStringField;
    cdsLeitorXmlnumero2: TStringField;
    cdsLeitorXmldata1: TStringField;
    cdsLeitorXmlcodigoServico: TStringField;
    cdsLeitorXmlrequerente_nomerazaosocial: TStringField;
    cdsLeitorXmlpais: TStringField;
    cdsLeitorXmluf1: TStringField;
    cdsLeitorXmlprocurador1: TStringField;
    cdsLeitorXmlcessionario_nomerazaosocial: TStringField;
    cdsLeitorXmlnomerazaosocial: TStringField;
    cdsLeitorXmltitular_pais: TStringField;
    cdsLeitorXmluf2: TStringField;
    cdsLeitorXmlclassenice_codigo: TStringField;
    cdsLeitorXmlclassenice_especificacao: TMemoField;
    cdsLeitorXmlapostila: TStringField;
    cdsLeitorXmlprocurador2: TStringField;
    cdsLeitorXmlapresentacao: TStringField;
    cdsLeitorXmlnatureza: TStringField;
    cdsLeitorXmlmarca_nome: TStringField;
    cdsLeitorXmlprocesso: TStringField;
    cdsLeitorXmlmarca: TStringField;
    cdsLeitorXmledicao: TStringField;
    cdsLeitorXmlclassevienna_codigo: TStringField;
    cdsLeitorXmldata2: TStringField;
    cdsLeitorXmlnumero3: TStringField;
    cdsLeitorXmlprioridade_pais: TStringField;
    cdsLeitorXmlclassenacional_codigo: TStringField;
    cdsLeitorXmlclassenacional_especificacao: TMemoField;
    cdsLeitorXmlcodigo: TStringField;
    OpenDialog2: TOpenDialog;
    OpenDialog1: TOpenDialog;
    dsLeitorXml: TDataSource;
    DBGrid1: TDBGrid;
    lbQtdArquivosLidos: TLabel;
    procedure btnArquivoInicioClick(Sender: TObject);
    procedure btnArquivoFimClick(Sender: TObject);
    procedure btnGeraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnArquivoInicioClick(Sender: TObject);
begin

         OpenDialog1.Execute;
       if FileExists(OpenDialog1.FileName) then
        begin
          editArquivoOrigem.Text := OpenDialog1.FileName;
          XMLTransformProvider1.XMLDataFile:= editArquivoOrigem.Text;
        end;


end;

procedure TForm1.btnArquivoFimClick(Sender: TObject);
begin

         OpenDialog2.Execute;
       if FileExists(OpenDialog2.FileName) then
        begin
          editArquivoFim.Text := OpenDialog2.FileName;
          XMLTransformProvider1.TransformRead.TransformationFile := editArquivoFim.Text;
          XMLTransformProvider1.TransformWrite.TransformationFile:= editArquivoFim.Text;
        end;



end;

procedure TForm1.btnGeraClick(Sender: TObject);
begin
     //cdsleitor já com os campos carregados

     cdsLeitorXml.Close;
     cdsLeitorXml.Active := True;
     lbQtdArquivosLidos.Caption := 'Quantidade de Arquivos lidos : ' + IntToStr(cdsLeitorXml.RecordCount);
end;

 //função para limpar o arquivo
function RetiraMascaraFormatar(Valor: string): string;
begin
  Result := StringReplace(Valor, ';', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '(', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '"', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ':', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ')', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '--', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '.', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&quot', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&apos', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '[', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ']', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, ',', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '@', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '#0', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&#', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '&amp', '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, '#34', '', [rfReplaceAll, rfIgnoreCase]);
end;


{    gravando os dados no banco de dados
procedure TfrmOperacoesGenericas.GravaDadosBanco;
 var
  Sql,vclassenice_especificacao,
  vcdsLeitorXmlapostila,
  vcdsLeitorXmlprocurador2,
  vcdsLeitorXmlnumero3,
  vcdsLeitorXmlprioridade_pais,
  vcdsLeitorXmlclassenacional_codigo,
  vcdsLeitorXmlclassenacional_especificacao , vcdsLeitorXmlnumero1, vcdsLeitorXmlnomerazaosocial :String;
  TamanhoString :Integer;
begin


     Try
      frmPrincipal.ProgressPosicao.Max := cdsLeitorXml.RecordCount;
      cdsLeitorXml.DisableControls;
      cdsLeitorXml.First;
    While (cdsLeitorXml.Eof=False) Do Begin

      frmPrincipal.ProgressPosicao.Position := frmPrincipal.ProgressPosicao.Position + 1;
      frmPrincipal.ProgressPosicao.Refresh;

      frmPrincipal.lbIndicacao.Caption := 'Quantidade de registros gravados : ' + IntToStr(frmPrincipal.ProgressPosicao.Position);
      frmPrincipal.lbIndicacao.Refresh;

      Memo1.Lines.Clear;

      TamanhoString := 0;
      TamanhoString := Length(cdsLeitorXmlclassenice_especificacao.AsString);
      if TamanhoString > 1 then
          vclassenice_especificacao :=  RetiraMascaraFormatar(cdsLeitorXmlclassenice_especificacao.AsString)
      else
         vclassenice_especificacao  :=  '';

      if cdsLeitorXmlapostila.AsString <> '' then
         vcdsLeitorXmlapostila := QuotedStr(RetiraMascaraFormatar(cdsLeitorXmlapostila.AsString))
      else
         vcdsLeitorXmlapostila := QuotedStr('');

      if cdsLeitorXmlprocurador2.AsString <> '' then
         vcdsLeitorXmlprocurador2 :=  QuotedStr(RetiraMascaraFormatar(cdsLeitorXmlprocurador2.AsString))
      else
         vcdsLeitorXmlprocurador2 :=  QuotedStr('');

      if cdsLeitorXmlnumero3.AsString <> '' then
         vcdsLeitorXmlnumero3 :=  QuotedStr(RetiraMascaraFormatar(cdsLeitorXmlnumero3.AsString))
      else
         vcdsLeitorXmlnumero3 :=  QuotedStr('');

      if cdsLeitorXmlprioridade_pais.AsString <> '' then
         vcdsLeitorXmlprioridade_pais :=  QuotedStr(RetiraMascaraFormatar(cdsLeitorXmlprioridade_pais.AsString))
      else
         vcdsLeitorXmlprioridade_pais :=  QuotedStr('');

       TamanhoString := 0;
       TamanhoString := Length(cdsLeitorXmlclassenacional_codigo.AsString);
      if TamanhoString > 1 then
         vcdsLeitorXmlclassenacional_codigo :=  QuotedStr(cdsLeitorXmlclassenacional_codigo.AsString)
      else
         vcdsLeitorXmlclassenacional_codigo :=  QuotedStr('');

       TamanhoString := 0;
       TamanhoString := Length(cdsLeitorXmlclassenacional_especificacao.AsString);
      if TamanhoString > 1 then
         vcdsLeitorXmlclassenacional_especificacao :=  QuotedStr(RetiraMascaraFormatar(cdsLeitorXmlclassenacional_especificacao.AsString))
      else
         vcdsLeitorXmlclassenacional_especificacao :=  QuotedStr('');


      vcdsLeitorXmlnumero1         :=  cdsLeitorXmlnumero1.AsString;
      vcdsLeitorXmlnomerazaosocial :=  cdsLeitorXmlnomerazaosocial.AsString;
      ConsultaTabelaCliente(vcdsLeitorXmlnumero1,vcdsLeitorXmlnomerazaosocial);
    try


            sql :=  'INSERT INTO ' + NomeDaTabela  + ' ( '+
                                          'NUMERO_REVISTA,        '+
                                          'DATA_DA_REVISTA,       '+
                                          'NUMERO1,               '+
                                          'DATA_DEPOSITO,         '+
                                          'DATA_CONCESSAO,        '+
                                          'DATA_VIGENCIA,         '+
                                          'DESPACHO_CODIGO,       '+
                                          'DESPACHO_NOME,         '+
                                          'TEXTO_COMPLEMENTAR,    '+
                                          'NUMERO2,               '+
                                          'DATA1,                 '+
                                          'CODIGOSERVICO,         '+
                                          'REQUERENTE_NOME_RAZAO_SOCIAL,'+
                                          'PAIS,                  '+
                                          'UF1,                   '+
                                          'PROCURADOR1,           '+
                                          'CESSIONARIO_NOME_RAZAO_SOCIAL,'+
                                          'NOME_RAZAO_SOCIAL,     '+
                                          'TITULAR_PAIS,          '+
                                          'UF2,                   '+
                                          'CLASSE_NICE_CODIGO,    '+
                                          'CLASSE_NICE_ESPECIFICACAO,'+
                                          'APOSTILA,                 '+
                                          'PROCURADOR2,              '+
                                          'APRESENTACAO,             '+
                                          'NATUREZA,                 '+
                                          'NOME_MARCA,               '+
                                          'PROCESSO,                 '+
                                          'MARCA,                    '+
                                          'EDICAO,                   '+
                                          'CLASSE_VIENA_CODIGO,      '+
                                          'DATA2,                    '+
                                          'NUMERO3,                  '+
                                          'PRIORIDADE_PAIS,          '+
                                          'CLASSE_NACIONAL_CODIGO,   '+
                                          'CLASSE_NACIONAL_ESPECIFICACAO, '+
                                          'CODIGO )                       '+
                                          'VALUES ( '+
                                           QuotedStr(NumeroRevista)  + ',' +
                                           QuotedStr(FormatDateTime('yyyy-mm-dd',DataRevista)) + ',' +
                                           QuotedStr(cdsLeitorXmlnumero1.AsString) + ',' +     //número do processo
                                           QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(cdsLeitorXmldatadeposito.AsVariant,0))) + ',' +
                                           QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(cdsLeitorXmldataconcessao.AsVariant,0))) + ',' +
                                           QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(cdsLeitorXmldatavigencia.AsVariant,0))) + ',' +
                                           QuotedStr(cdsLeitorXmldespacho_codigo.AsString) + ',' +
                                           QuotedStr(RetiraMascaraFormatar( RemoveChar1(cdsLeitorXmldespacho_nome.AsString,#34))) + ',' +
                                           QuotedStr(RetiraMascaraFormatar( RemoveChar1(cdsLeitorXmltextocomplementar.AsString,#34 ))) + ',' +
                                           QuotedStr(cdsLeitorXmlnumero2.AsString) + ',' +
                                           QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(cdsLeitorXmldata1.AsVariant,0))) + ',' +
                                           QuotedStr(cdsLeitorXmlcodigoServico.AsString) + ',' +
                                           QuotedStr(RetiraMascaraFormatar( RemoveChar1(cdsLeitorXmlrequerente_nomerazaosocial.AsString,#34))) + ',' +
                                           QuotedStr(cdsLeitorXmlpais.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmluf1.AsString) + ',' +
                                           QuotedStr(RetiraMascaraFormatar( RemoveChar1( cdsLeitorXmlprocurador1.AsString,#34))) + ',' +
                                           QuotedStr(RetiraMascaraFormatar( RemoveChar1(cdsLeitorXmlcessionario_nomerazaosocial.AsString,#34))) + ',' +
                                           QuotedStr(RetiraMascaraFormatar( RemoveChar1(cdsLeitorXmlnomerazaosocial.AsString,#34))) + ',' +
                                           QuotedStr(cdsLeitorXmltitular_pais.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmluf2.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmlclassenice_codigo.AsString) + ',' +
                                           QuotedStr(RetiraMascaraFormatar(vclassenice_especificacao))                           + ',' +
                                           vcdsLeitorXmlapostila                              + ',' +
                                           vcdsLeitorXmlprocurador2                           + ',' +
                                           QuotedStr(cdsLeitorXmlapresentacao.AsString)      + ',' +
                                           QuotedStr(cdsLeitorXmlnatureza.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmlmarca_nome.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmlprocesso.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmlmarca.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmledicao.AsString) + ',' +
                                           QuotedStr(cdsLeitorXmlclassevienna_codigo.AsString) + ',' +
                                           QuotedStr(FormatDateTime('yyyy-mm-dd',StrToDateDef(cdsLeitorXmldata2.AsString,0))) + ',' +
                                           vcdsLeitorXmlnumero3                                                                + ',' +
                                           vcdsLeitorXmlprioridade_pais                                                        + ',' +
                                           vcdsLeitorXmlclassenacional_codigo                                                  + ',' +
                                           vcdsLeitorXmlclassenacional_especificacao                                           + ',' +
                                           QuotedStr(cdsLeitorXmlcodigo.AsString) + ')';


                     dmGenerico.cdsGenerico.Close;
                     dmGenerico.cdsGenerico.CommandText := '';
                     dmGenerico.cdsGenerico.CommandText := Sql;
                     dmGenerico.cdsGenerico.Execute;

           except on e : exception do
            begin
              frmPrincipal.ProgressPosicao.Refresh;
              Memo1.Lines.Add(Sql);
              Memo1.Lines.SaveToFile(CaminhoLogGravacaoUnidade + ':\' +
                                      'ArquivoDeLogErro-'+NumeroRevista+ '-' +
                                      FormatDateTime('dd-mm-yyyy',DataRevista) + '.txt' );
            end;

     	  end;
      cdsLeitorXml.Next;
    End;
  Finally
    cdsLeitorXml.EnableControls;
    frmPrincipal.ProgressPosicao.Position := 100;
    frmPrincipal.ProgressPosicao.Refresh;
    ShowMessage('Arquivo Importado para o banco de dados');
    frmPrincipal.ProgressPosicao.Position := 0;
    frmPrincipal.gbImportacao.Visible :=False;
  end;

end;
}



end.
