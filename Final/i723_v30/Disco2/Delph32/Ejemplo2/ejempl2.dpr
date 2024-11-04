{Copyright (c)1998 Julián da Silva Gillig
 Todos los derechos reservados}

program ejempl2;

uses
  Forms,
  Ejemp2 in 'ejemp2.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
