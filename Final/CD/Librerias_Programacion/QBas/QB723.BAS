'Copyright (c)1998 Juli n da Silva Gillig
'Todos los derechos reservados

DECLARE SUB ApagaTodo ()
DECLARE SUB Inicializar (PortID AS INTEGER)
DECLARE SUB EscribeMotor (MotorID AS INTEGER, Acicon AS INTEGER)
DECLARE SUB EscribeSalida (ReleID AS INTEGER, Accion AS INTEGER)
DECLARE FUNCTION LeeSensor! (Sensor AS INTEGER)
DECLARE FUNCTION LeeMotor! (MotorID AS INTEGER)
DECLARE FUNCTION LeeSalida! (ReleID AS INTEGER)

CONST LPT1Out = 888      'Port de datos del Lpt1
CONST LPT2Out = 956      'Port de datos del Lpt2
CONST LPT3Out = 632      'Port de datos del Lpt3

CONST LPT1In = 889       'Port de status del Lpt1
CONST LPT2In = 957       'Port de status del Lpt2
CONST LPT3In = 633       'Port de status del LPT3

CONST TODO = 4
CONST ALTO = 0
CONST DA = 1
CONST IZ = 2

'Variables globales que guardan el port  de salida selecionado:
COMMON SHARED PortOut
COMMON SHARED PortIn
COMMON SHARED InicialPIn

SUB ApagaTodo
        OUT PortOut, 0
END SUB

SUB EscribeMotor (MotorID AS INTEGER, Accion AS INTEGER)

EstadoSalida = INP(PortOut)

    IF MotorID = 1 THEN
        EstadoSalida = EstadoSalida OR 12
        IF (Accion = 1) THEN
            EstadoSalida = EstadoSalida - 8
        ELSEIF (Accion = 2) THEN
            EstadoSalida = EstadoSalida - 4
        ELSEIF (Accion = 0) THEN
            EstadoSalida = EstadoSalida - 12
        END IF
    ELSEIF MotorID = 2 THEN
        EstadoSalida = EstadoSalida OR 48
        IF (Accion = 1) THEN
            EstadoSalida = EstadoSalida - 32
        ELSEIF (Accion = 2) THEN
            EstadoSalida = EstadoSalida - 16
        ELSEIF (Accion = 0) THEN
            EstadoSalida = EstadoSalida - 48
        END IF
    ELSEIF MotorID = 3 THEN
        EstadoSalida = EstadoSalida OR 192
        IF (Accion = 1) THEN
            EstadoSalida = EstadoSalida - 128
        ELSEIF (Accion = 2) THEN
            EstadoSalida = EstadoSalida - 64
        ELSEIF (Accion = 0) THEN
            EstadoSalida = EstadoSalida - 192
        END IF
    ELSEIF (MotorID = 12) OR (MotorID = 21) THEN
        EscribeMotor 1, Accion
        EscribeMotor 2, Accion
        EXIT SUB
    ELSEIF (MotorID = 13) OR (MotorID = 31) THEN
        EscribeMotor 1, Accion
        EscribeMotor 3, Accion
        EXIT SUB
    ELSEIF (MotorID = 23) OR (MotorID = 32) THEN
        EscribeMotor 2, Accion
        EscribeMotor 3, Accion
        EXIT SUB
    ELSEIF (MotorID = 123) OR (MotorID = 132) OR (MotorID = 213) OR (MotorID = 231) OR (MotorID = 312) OR (MotorID = 321) THEN
        EscribeMotor 1, Accion
        EscribeMotor 2, Accion
        EscribeMotor 3, Accion
        EXIT SUB
    END IF
   
    'Salida definitiva en el Port:
    OUT PortOut, EstadoSalida

END SUB

SUB EscribeSalida (ReleID AS INTEGER, Accion AS INTEGER)
   
    EstadoSalida = INP(PortOut)

    IF ReleID = 1 THEN
            IF (Accion = 1) THEN
                EstadoSalida = EstadoSalida OR 1
            ELSEIF (Accion = 0) THEN
                EstadoSalida = EstadoSalida OR 1
                EstadoSalida = EstadoSalida - 1
            END IF
    ELSEIF ReleID = 2 THEN
            IF (Accion = 1) THEN
                EstadoSalida = EstadoSalida OR 2
            ELSEIF (Accion = 0) THEN
                EstadoSalida = EstadoSalida OR 2
                EstadoSalida = EstadoSalida - 2
            END IF
    ELSEIF (ReleID = 12) OR (ReleID = 21) THEN
        EscribeSalida 1, Accion
        EscribeSalida 2, Accion
        EXIT SUB
    END IF

    OUT PortOut, EstadoSalida

END SUB

SUB Inicializar (PortID AS INTEGER)

        SELECT CASE PortID
        CASE 1
                PortOut = LPT1Out
                PortIn = LPT1In
                InicialPIn = INP(LPT1In)
        CASE 2
                PortOut = LPT2Out
                PortIn = LPT2In
                InicialPIn = INP(LPT12n)
        CASE 3
                PortOut = LPT3Out
                PortIn = LPT3In
                InicialPIn = INP(LPT3In)
        END SELECT
        ApagaTodo

END SUB

FUNCTION LeeMotor (MotorID AS INTEGER)
  
DIM EstadoTemp AS INTEGER

    EstadoTemp = INP(PortOut)

    SELECT CASE MotorID
        CASE 1
            EstadoTemp = (EstadoTemp OR 243)
            IF ((EstadoTemp = 255) OR (EstadoTemp = 243)) THEN
                LeeMotor = ALTO
            END IF
            IF (EstadoTemp = 247) THEN
                LeeMotor = DA
            END IF
            IF (EstadoTemp = 251) THEN
                LeeMotor = IZ
            END IF
        CASE 2
            EstadoTemp = (EstadoTemp OR 207)
            IF ((EstadoTemp = 255) OR (EstadoTemp = 207)) THEN
                LeeMotor = ALTO
            END IF
            IF (EstadoTemp = 223) THEN
                LeeMotor = DA
            END IF
            IF (EstadoTemp = 239) THEN
                LeeMotor = IZ
            END IF
        CASE 3
            EstadoTemp = (EstadoTemp OR 63)
            IF ((EstadoTemp = 255) OR (EstadoTemp = 63)) THEN
                LeeMotor = ALTO
            END IF
            IF (EstadoTemp = 127) THEN
                LeeMotor = DA
            END IF
            IF (EstadoTemp = 191) THEN
                LeeMotor = IZ
            END IF
    END SELECT

END FUNCTION

FUNCTION LeeSalida (ReleID AS INTEGER)

DIM EstadoTemp AS INTEGER

    EstadoTemp = INP(PortOut)

    SELECT CASE ReleID
        CASE 1
             EstadoTemp = (EstadoTemp OR 254)
             IF (EstadoTemp = 255) THEN
                LeeSalida = 1
             END IF
             IF (EstadoTemp = 254) THEN
                LeeSalida = 0
             END IF
    CASE 2
             EstadoTemp = (EstadoTemp OR 253)
             IF (EstadoTemp = 255) THEN
                LeeSalida = 1
             END IF
             IF (EstadoTemp = 253) THEN
                LeeSalida = 0
             END IF
    END SELECT

END FUNCTION

FUNCTION LeeSensor (SensorID AS INTEGER)
    
     IF INP(PortIn) = InicialPIn THEN LeeSensor = False
     SELECT CASE SensorID
        CASE 1
                LeeSensor = NOT ((INP(PortIn) AND 64) = 64)
        CASE 2
                LeeSensor = NOT ((INP(PortIn) AND 32) = 32)
        CASE 3
                LeeSensor = NOT ((INP(PortIn) AND 16) = 16)
        CASE 4
                LeeSensor = NOT ((INP(PortIn) AND 8) = 8)
        CASE ELSE
                LeeSensor = False
    END SELECT

END FUNCTION

