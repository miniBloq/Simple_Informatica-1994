{Copyright (c)1998 Julián da Silva Gillig
 Todos los derechos reservados}

program Ejempl2;

uses
  Forms,
  Ejemp2 in 'EJEMP2.PAS' {Form1};

{$R *.RES}

begin
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
