unit frmDataEdit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmDataEdit = class(TForm)
    btnCancel: TButton;
    lblComprador: TLabel;
    lblFecha: TLabel;
    edtComprador: TEdit;
    edtFecha: TEdit;
    btnOk: TButton;
    chkUsado: TCheckBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDataEdit: TfrmDataEdit;

implementation

{$R *.DFM}
uses
    frmMain1;

procedure TfrmDataEdit.btnCancelClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmDataEdit.btnOkClick(Sender: TObject);
begin
     frmMain.qrySerial.Edit;
     frmMain.qrySerial['Comprador']:= edtComprador.Text;
     frmMain.qrySerial['Usado']:= chkUsado.Checked;
     //frmMain.qrySerial['Fecha']:= edtFecha.Text; //aca
     frmMain.qrySerial.Post;

     Close;
end;

procedure TfrmDataEdit.FormActivate(Sender: TObject);
var
   TempStr: string;
begin
     if frmMain.qrySerial.FieldByName('Comprador').AsString = '' then
        caption:= 'mierda';
    // edtComprador.Text:= frmMain.qrySerial['Comprador'].AsString;
    chkUsado.Checked:= frmMain.qrySerial['Usado'];
    // edtFecha.Text:= frmMain.qrySerial['Fecha'];
end;

end.
