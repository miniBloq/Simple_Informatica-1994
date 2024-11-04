'Copyright (c)1998 Julián da Silva Gillig
'Todos los derechos reservados

Option Explicit

Declare Sub Inicializar Lib "i723.DLL" (ByVal PortID As Integer)
Declare Sub ApagaTodo Lib "i723.DLL" ()
Declare Sub EscribeMotor Lib "i723.DLL" (ByVal MotorID As Integer, ByVal Accion As Integer)
Declare Sub EscribeSalida Lib "i723.DLL" (ByVal ReleID As Integer, ByVal Accion As Integer)

Declare Function LeeMotor Lib "i723.DLL" (ByVal MotorID As Integer) As Integer
Declare Function LeeSalida Lib "i723.DLL" (ByVal ReleID As Integer) As Integer
Declare Function LeeSensor Lib "i723.DLL" (ByVal senID As Integer) As Integer

Declare Sub out Lib "i723.DLL" (ByVal ID As Integer, ByVal Valor As Integer)
Declare Function inp Lib "i723.DLL" (ByVal ID As Integer) As Integer

