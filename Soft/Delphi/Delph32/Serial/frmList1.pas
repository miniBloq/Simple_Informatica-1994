unit frmList1;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Quickrep, ExtCtrls, DB, DBTables;

type
  TfrmList = class(TForm)
    RepList: TQuickReport;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRDBText2: TQRDBText;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmList: TfrmList;

implementation

{$R *.DFM}

end.
