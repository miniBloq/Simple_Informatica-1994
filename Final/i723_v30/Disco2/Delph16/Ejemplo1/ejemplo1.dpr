{Copyright (c)1998 Juli�n da Silva Gillig
 Todos los derechos reservados}

program Ejemplo1;

uses
  Forms,
  Ejemp1 in 'EJEMP1.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
