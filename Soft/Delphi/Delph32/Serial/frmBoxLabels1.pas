unit frmBoxLabels1;

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Quickrep, ExtCtrls, DB, DBTables;

type
  TfrmBoxLabels = class(TForm)
    RepBoxLabels: TQuickReport;
    QRBand1: TQRBand;
    QRDBText1: TQRDBText;
    QRBand3: TQRBand;
    QRShape1: TQRShape;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBoxLabels: TfrmBoxLabels;

implementation

{$R *.DFM}

end.
