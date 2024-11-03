{Copyright (c)1998 Juli�n da Silva Gillig
 Todos los derechos reservados}
 
unit Ejemp2;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    motor1DA: TButton;
    chk1: TCheckBox;
    chk2: TCheckBox;
    chk3: TCheckBox;
    chk4: TCheckBox;
    motor2DA: TButton;
    motor3DA: TButton;
    motor1ALTO: TButton;
    motor2ALTO: TButton;
    motor3ALTO: TButton;
    Motor1IZ: TButton;
    motor2IZ: TButton;
    motor3IZ: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Salida1No: TButton;
    Salida1Si: TButton;
    Salida2No: TButton;
    Salida2Si: TButton;
    Reset: TButton;
    port1: TRadioButton;
    Label6: TLabel;
    port2: TRadioButton;
    port3: TRadioButton;
    tmrSensores: TTimer;
    procedure Salida1SiClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure port1Click(Sender: TObject);
    procedure port2Click(Sender: TObject);
    procedure port3Click(Sender: TObject);
    procedure Salida2SiClick(Sender: TObject);
    procedure motor1DAClick(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure Salida1NoClick(Sender: TObject);
    procedure Salida2NoClick(Sender: TObject);
    procedure Motor1IZClick(Sender: TObject);
    procedure motor1ALTOClick(Sender: TObject);
    procedure motor2ALTOClick(Sender: TObject);
    procedure motor2DAClick(Sender: TObject);
    procedure motor2IZClick(Sender: TObject);
    procedure motor3IZClick(Sender: TObject);
    procedure motor3ALTOClick(Sender: TObject);
    procedure motor3DAClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrSensoresTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

   procedure Inicializar(PortID :SmallInt); far; stdcall; external 'i723_32';
   procedure ApagaTodo; far; stdcall; external 'i723_32';
   procedure EscribeMotor(MotorID :SmallInt; Accion :SmallInt); far; stdcall; external 'i723_32';
   procedure EscribeSalida(ReleID, Accion :SmallInt); far; stdcall; external 'i723_32';
   function LeeMotor(MotorID :SmallInt) :SmallInt; far; stdcall; external 'i723_32';
   function LeeSalida(ReleID :SmallInt) :WordBool; far; stdcall; external 'i723_32';
   function LeeSensor(senID :SmallInt) :WordBool; far; stdcall; external 'i723_32';

{Rutinas para control en general:}
   procedure out(ID, Valor: SmallInt); far; stdcall; external 'i723_32';
   function inp(ID: SmallInt): SmallInt; far; stdcall; external 'i723_32'; 

procedure TForm1.Salida1SiClick(Sender: TObject);
begin
     EscribeSalida(1, 1);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     Inicializar(1);
end;

procedure TForm1.port1Click(Sender: TObject);
begin
     Inicializar(1);
end;

procedure TForm1.port2Click(Sender: TObject);
begin
     Inicializar(2);
end;

procedure TForm1.port3Click(Sender: TObject);
begin
     Inicializar(3);
end;

procedure TForm1.Salida2SiClick(Sender: TObject);
begin
     EscribeSalida(2, 1);
end;

procedure TForm1.motor1DAClick(Sender: TObject);
begin
     EscribeMotor(1, 1);
end;

procedure TForm1.ResetClick(Sender: TObject);
begin
     ApagaTodo;
end;

procedure TForm1.Salida1NoClick(Sender: TObject);
begin
     EscribeSalida(1, 0);
end;

procedure TForm1.Salida2NoClick(Sender: TObject);
begin
     EscribeSalida(2, 0);
end;

procedure TForm1.Motor1IZClick(Sender: TObject);
begin
     EscribeMotor(1, 2);
end;

procedure TForm1.motor1ALTOClick(Sender: TObject);
begin
     EscribeMotor(1, 0);
end;

procedure TForm1.motor2ALTOClick(Sender: TObject);
begin
     EscribeMotor(2, 0);
end;

procedure TForm1.motor2DAClick(Sender: TObject);
begin
     EscribeMotor(2, 1);
end;

procedure TForm1.motor2IZClick(Sender: TObject);
begin
     EscribeMotor(2, 2);
end;

procedure TForm1.motor3IZClick(Sender: TObject);
begin
     EscribeMotor(3, 2);
end;

procedure TForm1.motor3ALTOClick(Sender: TObject);
begin
     EscribeMotor(3, 0);
end;

procedure TForm1.motor3DAClick(Sender: TObject);
begin
     EscribeMotor(3, 1);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     ApagaTodo;
end;

procedure TForm1.tmrSensoresTimer(Sender: TObject);
begin
     chk1.Checked:= LeeSensor(1);
     chk2.Checked:= LeeSensor(2);
     chk3.Checked:= LeeSensor(3);
     chk4.Checked:= LeeSensor(4);
end;

end.
