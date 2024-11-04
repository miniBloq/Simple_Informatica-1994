{Copyright (c)1998 Julián da Silva Gillig
 Todos los derechos reservados}

program Ejempl1;

uses
  Forms,
  Ejemp1 in 'ejemp1.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
