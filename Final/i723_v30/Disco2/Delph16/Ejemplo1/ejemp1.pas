{Copyright (c)1998 Julián da Silva Gillig
 Todos los derechos reservados}

unit Ejemp1;

interface

uses
  SysUtils, WinTypes, WinProcs, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls, Ctrl723;

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
    Label4: TLabel;
    Label5: TLabel;
    Salida1No: TButton;
    Salida1Si: TButton;
    Salida2No: TButton;
    Salida2Si: TButton;
    Reset: TButton;
    port1: TRadioButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label3: TLabel;
    Label6: TLabel;
    i723: TControl723;
    procedure motor1DAClick(Sender: TObject);
    procedure i723Change(Sender: TObject);
    procedure motor2DAClick(Sender: TObject);
    procedure motor3DAClick(Sender: TObject);
    procedure motor1ALTOClick(Sender: TObject);
    procedure motor2ALTOClick(Sender: TObject);
    procedure motor3ALTOClick(Sender: TObject);
    procedure motor3IZClick(Sender: TObject);
    procedure motor2IZClick(Sender: TObject);
    procedure Motor1IZClick(Sender: TObject);
    procedure Salida1NoClick(Sender: TObject);
    procedure Salida2NoClick(Sender: TObject);
    procedure Salida1SiClick(Sender: TObject);
    procedure Salida2SiClick(Sender: TObject);
    procedure ResetClick(Sender: TObject);
    procedure port1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.motor1DAClick(Sender: TObject);
begin
     i723.Motor1:= DA;     
end;

procedure TForm1.i723Change(Sender: TObject);
begin
     chk1.checked:= i723.Sensor1;
     chk2.checked:= i723.Sensor2;
     chk3.checked:= i723.Sensor3;
     chk4.checked:= i723.Sensor4;
end;

procedure TForm1.motor2DAClick(Sender: TObject);
begin
     i723.Motor2:= DA;
end;

procedure TForm1.motor3DAClick(Sender: TObject);
begin
     i723.Motor3:= DA;
end;

procedure TForm1.motor1ALTOClick(Sender: TObject);
begin
     i723.Motor1:= ALTO;
end;

procedure TForm1.motor2ALTOClick(Sender: TObject);
begin
     i723.Motor2:= ALTO;
end;

procedure TForm1.motor3ALTOClick(Sender: TObject);
begin
     i723.Motor3:= ALTO;
end;

procedure TForm1.motor3IZClick(Sender: TObject);
begin
     i723.Motor3:= IZ;
end;

procedure TForm1.motor2IZClick(Sender: TObject);
begin
     i723.Motor2:= IZ;
end;

procedure TForm1.Motor1IZClick(Sender: TObject);
begin
     i723.Motor1:= IZ;
end;

procedure TForm1.Salida1NoClick(Sender: TObject);
begin
     i723.Salida1:= false;
end;

procedure TForm1.Salida2NoClick(Sender: TObject);
begin
     i723.Salida2:= false;
end;

procedure TForm1.Salida1SiClick(Sender: TObject);
begin
     i723.Salida1:= true;
end;

procedure TForm1.Salida2SiClick(Sender: TObject);
begin
     i723.Salida2:= true;
end;

procedure TForm1.ResetClick(Sender: TObject);
begin
     i723.Reset; {Uso del Método reset}
end;

procedure TForm1.port1Click(Sender: TObject);
begin
     i723.Port:= LPT1;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
     i723.Port:= LPT2;
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
     i723.Port:= LPT3;
end;

end.
