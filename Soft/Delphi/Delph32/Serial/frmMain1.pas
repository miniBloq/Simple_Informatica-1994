unit frmMain1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Grids, DB, DBTables, Spin, ExtCtrls, DBGrids;

type
  TfrmMain = class(TForm)
    btnExit: TButton;
    qrySerial: TQuery;
    btnSearchNumber: TButton;
    edtTargetNumber: TEdit;
    pnlTools: TPanel;
    btnGen: TButton;
    spinNumbersCant: TSpinEdit;
    stpnlStatus: TStatusBar;
    btnPrintLabels: TButton;
    datasrcSerial: TDataSource;
    dbGrdSerial: TDBGrid;
    btnEditData: TButton;
    qryNotUsed: TQuery;
    datasrcNotUsed: TDataSource;
    chkUsed: TCheckBox;
    lblReg: TLabel;
    btnDelete: TButton;
    procedure btnExitClick(Sender: TObject);
    procedure btnGenClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPrintLabelsClick(Sender: TObject);
    procedure btnSearchNumberClick(Sender: TObject);
    procedure dbGrdSerialDblClick(Sender: TObject);
    procedure chkUsedClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses frmDataEdit1, frmPrint1;

{$R *.DFM}

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmMain.btnGenClick(Sender: TObject);
var
   j, Cont: SmallInt;
   TempStr1, TempStr2: String;
begin
     dbGrdSerial.Fields[1].REadOnly:= False;
     dbGrdSerial.Enabled:= False;
     Screen.Cursor:= crHourGlass;

     stpnlStatus.SimpleText:= 'Generando...';
     Randomize;
     Cont:= 0;
     while Cont < spinNumbersCant.Value do
     begin
          TempStr1:= TimeToStr(Now);
          for j:= 1 to Length(TempStr1) - 1 do
          begin
               if TempStr1[j] = ':' then
               begin
                    //TempStr2:= IntToStr(Trunc(Random(9)));
                    //TempStr1[j]:= TempStr2[1];
                    TempStr1[j]:= '-';
               end; //if
          end; //for j
          TempStr2:= TempStr1 + IntToStr(Trunc(Random(99999)));
          if Length(TempStr2) < 13 then //Los números cortos no sirven.
             Continue;
          Inc(Cont);
          qrySerial.Append;
          qrySerial['Serial']:= TempStr2;
          qrySerial['Usado']:= False;
     end; //while
     qrySerial.Post;
     stpnlStatus.SimpleText:= '';

     dbGrdSerial.Fields[1].ReadOnly:= True;
     dbGrdSerial.Enabled:= True;
     Screen.Cursor:= crDefault;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
     with qrySerial do
     begin
          Close;
          //DataBaseName:= ExtractFilePath(Application.ExeName) + 'NumbersBase';
          DataBaseName:= '.\NumbersBase';
          SQL.Clear;
          SQL.Add('SELECT * FROM SerialBase.db');
          Open;
          FieldByName('Comprador').DisplayWidth:= 50;
     end; //with
     with qryNotUsed do
     begin
          Close;
          DataBaseName:= ExtractFilePath(Application.ExeName) + 'NumbersBase';
          SQL.Clear;
          SQL.Add('SELECT * FROM SerialBase.db WHERE usado = "False"');
          Open;
          FieldByName('Comprador').DisplayWidth:= 50;
     end; //with

     dbGrdSerial.Fields[0].REadOnly:= True;
     dbGrdSerial.Fields[1].REadOnly:= True;
end;

procedure TfrmMain.btnPrintLabelsClick(Sender: TObject);
begin
     // Imprime todas las etiquetas que tengan el campo USADO en False, pues este
     // indica si fueron o no impresas:
     frmPrint.ShowModal;
end;

procedure TfrmMain.btnSearchNumberClick(Sender: TObject);
begin
     try
        if edtTargetNumber.Text <> '' then
        begin
             qrySerial.Filter:= '(Serial = ' + edtTargetNumber.Text + ')';
             if not qrySerial.FindFirst then
                ShowMessage('No se encontró el número');
        end; //if
     except
           ShowMessage('Formato de número incorrecto');
     end; //try-except
end;

procedure TfrmMain.dbGrdSerialDblClick(Sender: TObject);
begin
     //frmDataEdit.ShowModal;
end;

procedure TfrmMain.chkUsedClick(Sender: TObject);
begin
     if chkUsed.Checked then
        dbGrdSerial.DataSource:= datasrcNotUsed
     else
         dbGrdSerial.DataSource:= datasrcSerial;
end;

procedure TfrmMain.btnDeleteClick(Sender: TObject);
begin
(*     try
       if chkUsed.Checked then
           qrySerial.Items[GridFocus]).delete
        else

        //TQuery(QueryList.Items[GridFocus]).delete;
     except
           MessageDlg('No es posible borrar el registro.', mtWarning, [mbOK], 0);
     end; {try-except}*)
end;

end.
