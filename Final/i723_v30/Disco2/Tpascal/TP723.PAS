{Copyright (c)1998 Juli�n da Silva Gillig
 Todos los derechos reservados}
unit TP723;

interface

const
     LPT1 = 888;
     LPT2 = 956;
     LPT3 = 632;

     ALTO = 0;
     DA   = 1;
     IZ   = 2;
     SI   = 1;
     NO   = 0;

var
{Variables para las funciones de la i-723}
   EstadoInicial :integer; {Estado inicial del port de entrada para los sensores}
   PortOut       :integer; {Port de salida}
   PortIn        :integer; {Port de entrada para los sensores}

{Rutinas para controlar la interface:}

   procedure Inicializar(PortID :integer);
   procedure ApagaTodo;
   procedure EscribeMotor(MotorID :integer; Accion :integer);
   procedure EscribeSalida(ReleID, Accion :integer);
   function LeeMotor(MotorID :integer) :integer;
   function LeeSalida(ReleID :integer) :Boolean;
   function LeeSensor(senID :integer) :Boolean;

implementation

procedure ApagaTodo;
begin
     port[PortOut]:= 0;
end; {ApagaTodo}

procedure Inicializar(PortID :integer);
begin
     case PortID of
     1: begin
             PortOut:= LPT1;
             PortIn:= (LPT1 + 1);
        end;
     2: begin
             PortOut:= LPT2;
             PortIn:= (LPT2 + 1);
        end;
     3: begin
             PortOut:= LPT3;
             PortIn:= (LPT3 + 1);
        end;
     end {case}
end; {Inicializar}

procedure EscribeMotor(MotorID :integer; Accion :integer);
var
   EstadoSalida :byte;
   EstadoTemp   :byte;
begin
     EstadoTemp:= Port[PortOut];
     EstadoSalida:= Port[PortOut];
     if MotorID = 1 then
     begin
          case Accion of
               DA: EstadoSalida:=((EstadoSalida or 12)-8);
               IZ: EstadoSalida:=((EstadoSalida or 12)-4);
               ALTO: EstadoSalida:=(EstadoTemp or 12)-12;
          else
              EstadoSalida:= EstadoTemp;
          end; {case}
     end; {if-then}
    if MotorID = 2 then
     begin
          case Accion of
               DA: EstadoSalida:= ((EstadoSalida or 48) - 32);
               IZ: EstadoSalida:= ((EstadoSalida or 48) - 16);
               ALTO: EstadoSalida:= (EstadoTemp or 48) - 48;
          else
              EstadoSalida:=EstadoTemp;
          end; {case}
     end; {if-then}
     if MotorID = 3 then
     begin
          case Accion of
               DA: EstadoSalida:=((EstadoSalida or 192) - 128);
               IZ: EstadoSalida:=((EstadoSalida or 192) - 64);
               ALTO: EstadoSalida:=(EstadoTemp or 192) - 192;
          else
              EstadoSalida:=EstadoTemp;
          end; {case}
     end; {if-then}
     if (MotorID = 123) or (MotorID = 132) or (MotorID = 213) or
        (MotorID = 231) or (MotorID = 312) or (MotorID = 321) then
     begin
          case Accion of
               DA: EstadoSalida:= ((EstadoSalida or 252) - 168);
               IZ: EstadoSalida:= ((EstadoSalida or 252) - 84);
               ALTO: EstadoSalida:= ((EstadoTemp or 252) - 252);
          else
              EstadoSalida:=EstadoTemp;
          end; {case}
     end; {if-then}
     if (MotorID = 12) or (MotorID = 21) then
     begin
          case Accion of
               DA: EstadoSalida:= ((EstadoSalida or 60) - 40);
               IZ: EstadoSalida:= ((EstadoSalida or 60) - 20);
               ALTO: EstadoSalida:= ((EstadoSalida or 60) - 60);
          else
              EstadoSalida:=EstadoTemp;
          end; {case}
     end; {if-then}
     if (MotorID = 13) or (MotorID = 31) then
     begin
          case Accion of
               DA: EstadoSalida:=((EstadoSalida or 204) - 136);
               IZ: EstadoSalida:=((EstadoSalida or 204) - 68);
               ALTO: EstadoSalida:=(EstadoSalida or 204) - 204;
          else
              EstadoSalida:=EstadoTemp;
          end; {case}
     end; {if-then}
     if (MotorID = 23) or (MotorID = 32) then
     begin
          case Accion of
               DA: EstadoSalida:=((EstadoSalida or 240) - 160);
               IZ: EstadoSalida:=((EstadoSalida or 240) - 80);
               ALTO: EstadoSalida:=(EstadoSalida or 240) - 240;
          else
              EstadoSalida:=EstadoTemp;
          end; {case}
     end; {if-then}

     port[PortOut]:=EstadoSalida;
end; {EscribeMotor}

function LeeMotor(MotorID :integer) :integer;
var
   EstadoTemp :byte;
begin
     EstadoTemp:= Port[PortOut];
     case MotorID of
     1: begin
             EstadoTemp:= (EstadoTemp or 243);
             if ((EstadoTemp = 255) or (EstadoTemp = 243)) then
                LeeMotor:= ALTO;
             if (EstadoTemp = 247) then
                LeeMotor:= DA;
             if (EstadoTemp = 251) then
                LeeMotor:= IZ;
        end;
     2: begin
             EstadoTemp:= (EstadoTemp or 207);
             if ((EstadoTemp = 255) or (EstadoTemp = 207)) then
                LeeMotor:= ALTO;
             if (EstadoTemp = 223) then
                LeeMotor:= DA;
             if (EstadoTemp = 239) then
                LeeMotor:= IZ;
        end;
     3: begin
             EstadoTemp:= (EstadoTemp or 63);
             if ((EstadoTemp = 255) or (EstadoTemp = 63)) then
                LeeMotor:= ALTO;
             if (EstadoTemp = 127) then
                LeeMotor:= DA;
             if (EstadoTemp = 191) then
                LeeMotor:= IZ;
        end;
     end; {case}
end; {LeeMotor}

procedure EscribeSalida(ReleID, Accion :integer);
var
   EstadoSalida :byte;
   EstadoTemp   :byte;
begin
     EstadoSalida:= Port[PortOut];
     EstadoTemp:= Port[PortOut];

     if ReleID = 1 then
     begin
          case Accion of
          SI: EstadoSalida:= (EstadoSalida or 1);
          NO: EstadoSalida:= ((EstadoSalida or 1) - 1);
          else
              EstadoSalida:= EstadoTemp;
          end; {case}
     end; {if-then}

     if ReleID = 2 then
     begin
          case Accion of
          SI: EstadoSalida:= (EstadoSalida or 2);
          NO: EstadoSalida:= ((EstadoSalida or 2) - 2);
          else
              EstadoSalida:= EstadoTemp;
          end; {case}
     end; {if-then}

     if (ReleID = 12) or (ReleID = 21) then
     begin
          case Accion of
          SI: EstadoSalida:= (EstadoSalida or 3);
          NO: EstadoSalida:= ((EstadoSalida or 3) - 3);
          else
              EstadoSalida:= EstadoTemp;
          end; {case}
     end; {if-then}

     Port[PortOut]:= EstadoSalida;
end; {EscribeSalida}

function LeeSalida(ReleID :integer) :boolean;
var
   EstadoTemp :byte;
begin
     EstadoTemp:= Port[PortOut];

     case ReleID of
     1: if (EstadoTemp and 1) = 1 then
           LeeSalida:= true
        else
            LeeSalida:= false;
     2: if (EstadoTemp and 2) = 2 then
           LeeSalida:= true
        else
            LeeSalida:= false;
     end; {Case}
end; {LeeSalida}

function LeeSensor(senID :integer) :boolean;
begin
{En esta funci�n no utilizo GetBit pues as� es m�s �ptima:}
     if port[PortIn] = EstadoInicial then
        LeeSensor:= false;
     case senID of
     1: begin
             LeeSensor:= not((port[PortIn] and 64) = 64);
        end;
     2: begin
             LeeSensor:= not((port[PortIn] and 32) = 32);
        end;
     3: begin
             LeeSensor:= not((port[PortIn] and 16) = 16);
        end;
     4: begin
             LeeSensor:= not((port[PortIn] and 8) = 8);
        end;
     else LeeSensor:= false;
     end; {Case}
end; {LeeSensor}

begin
end.
