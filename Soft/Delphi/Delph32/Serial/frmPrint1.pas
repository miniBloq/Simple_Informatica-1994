unit frmPrint1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, frmBoxLabels1;

type
  TfrmPrint = class(TForm)
    btnOk: TButton;
    btnCancel: TButton;
    chkInterfaceLabels: TCheckBox;
    chkList: TCheckBox;
    chkBoxLabels: TCheckBox;
    btnSetupPrinter: TButton;
    dlgPrinterSetup: TPrinterSetupDialog;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    chkCursor: TCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnSetupPrinterClick(Sender: TObject);
    procedure btnPreviewClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure chkCursorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrint: TfrmPrint;

implementation

uses frmMain1, frmInterfaceLabels1, frmList1;

{$R *.DFM}

procedure TfrmPrint.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmPrint.btnOkClick(Sender: TObject);
begin
     //Imprime las etiquetas para las cajas:
     if chkBoxLabels.Checked then
        frmBoxLabels.RepBoxLabels.Print;

     //Imprime las etiquetas para las interfaces:
     if chkInterfaceLabels.Checked then
        frmInterfaceLabels.RepInterfaceLabels.Print;

     //Imprime las etiquetas para las interfaces:
     if chkList.Checked then
        frmList.RepList.Print;

     //Marca los n�meros luego de que son impresos:
     if chkInterfaceLabels.Checked then
     begin
          frmMain.qrySerial.First;
          frmMain.qrySerial.Edit;
          frmMain.qrySerial['Usado']:= True;
          while not(frmMain.qrySerial.EOF) do
          begin
               frmMain.qrySerial.Next;
               frmMain.qrySerial.Edit;
               frmMain.qrySerial['Usado']:= True;
          end; //while
     end; //if
     
     Close;
end;

procedure TfrmPrint.btnSetupPrinterClick(Sender: TObject);
begin
     dlgPrinterSetup.Execute;
end;

procedure TfrmPrint.btnPreviewClick(Sender: TObject);
begin
     frmBoxLabels.RepBoxLabels.Preview;
end;

procedure TfrmPrint.Button1Click(Sender: TObject);
begin
     frmInterfaceLabels.RepInterfaceLabels.Preview;
end;

procedure TfrmPrint.Button3Click(Sender: TObject);
begin
     frmList.RepList.Preview;
end;

procedure TfrmPrint.chkCursorClick(Sender: TObject);
begin
     frmInterfaceLabels.qrshpCursor.Visible:= not chkCursor.Checked;
end;

end.
