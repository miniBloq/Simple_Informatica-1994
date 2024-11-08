/* Copyright (c) 1998 Juli�n da Silva Gillig 
   Todos los derechos reservados */ 

#include<dos.h>

/* Prototipos de las funciones */
void Inicializar(int);
void ApagaTodo(void);
void EscribeMotor(int, int);
void EscribeSalida(int, int);
int LeeMotor(int);
int LeeSalida (int);
int LeeSensor(int);

const LPT1 = 888;
const LPT2 = 956;
const LPT3 = 632;

const ALTO = 0;
const DA = 1;
const IZ = 2;
const SI = 1;
const NO = 0;

int PortOut;
int PortIn;

/* Estas variables son para saber en todo momento el estado de cada motor
   y cada salida de la interfaz: */
int Motor1, Motor2, Motor3;
int Salida1, Salida2;

void Inicializar(int PortID)
{
	switch (PortID)
	{
		case 1: PortOut = LPT1;
				PortIn = LPT1 + 1;
				break;
		case 2: PortOut = LPT2;
				PortIn = LPT2 + 1;
				break;
		case 3: PortOut = LPT3;
				PortIn = LPT3 + 1;
				break;
	}
}

void ApagaTodo(void)
{
	outp(PortOut, 0);
	Motor1 = Motor2 = Motor3 = Salida1 = Salida2 = 0;
}

void EscribeMotor(int MotorID, int Accion)
{
	 int EstadoTemp = inp(PortOut);
	 int EstadoSalida = inp(PortOut);
	 if (MotorID == 1)
	 { switch(Accion)
		{
		case DA: EstadoSalida = ((EstadoSalida | 12)-8); Motor1 = DA;
				 break;
		case IZ: EstadoSalida = ((EstadoSalida | 12)-4);  Motor1 = IZ;
				 break;
		case ALTO: EstadoSalida = ((EstadoTemp | 12)-12);  Motor1 = ALTO;
				   break;
		default: EstadoSalida = EstadoTemp;
		}
	 }
	 if (MotorID == 2)
     {
		switch(Accion)
		{
		case DA: EstadoSalida = ((EstadoSalida | 48)-32); Motor2 = DA;
				 break;
		case IZ: EstadoSalida = ((EstadoSalida | 48)-16); Motor2 = IZ;
				 break;
		case ALTO: EstadoSalida = ((EstadoTemp | 48)-48); Motor2 = ALTO;
				   break;
		default: EstadoSalida = EstadoTemp;
		}
	 }
	 if (MotorID == 3)
	 {
		switch(Accion)
		{
		case DA: EstadoSalida = ((EstadoSalida | 192)-128); Motor3 = DA;
				 break;
		case IZ: EstadoSalida = ((EstadoSalida | 192)-64); Motor3 = IZ;
				 break;
		case ALTO: EstadoSalida = ((EstadoTemp | 192)-192); Motor3 = ALTO;
				   break;
		default: EstadoSalida = EstadoTemp;
		}
	 }
	 if ((MotorID == 123) || (MotorID == 132) || (MotorID == 213) ||
		 (MotorID == 231) || (MotorID == 312) || (MotorID == 321))
	 {
		switch(Accion)
		{
		case DA: EstadoSalida = ((EstadoSalida | 252)-168);
				 Motor1 = Motor2 = Motor3 = DA;
				 break;
		case IZ: EstadoSalida = ((EstadoSalida | 252)-84);
				 Motor1 = Motor2 = Motor3 = IZ;
				 break;
		case ALTO: EstadoSalida = ((EstadoTemp | 252)-252);
				   Motor1 = Motor2 = Motor3 = ALTO;
				   break;
		default: EstadoSalida = EstadoTemp;
		}
	 }
	 if ((MotorID == 12) || (MotorID == 21))
	 {
		switch(Accion)
		{
		case DA: EstadoSalida = ((EstadoSalida | 60)-40);
				 Motor1 = Motor2 = DA;
				 break;
		case IZ: EstadoSalida = ((EstadoSalida | 60)-20);
				 Motor1 = Motor2 = Motor3 = IZ;
				 break;
		case ALTO: EstadoSalida = ((EstadoTemp | 60)-60);
				   Motor1 = Motor2 = ALTO;
				   break;
		default: EstadoSalida = EstadoTemp;
		}
	 }
	 if ((MotorID == 13) || (MotorID == 31))
	 {
		switch(Accion)
		{
			case DA: EstadoSalida = ((EstadoSalida | 204)-136);
					 Motor1 = Motor3 = DA;
					 break;
			case IZ: EstadoSalida = ((EstadoSalida | 204)-68);
					 Motor1 = Motor3 = IZ;
					 break;
			case ALTO: EstadoSalida = ((EstadoTemp | 204)-204);
					   Motor1 = Motor3 = ALTO;
					   break;
			default: EstadoSalida = EstadoTemp;
		}
	 }
	 if ((MotorID == 23) || (MotorID == 32))
	 {
		switch(Accion)
		{
		case DA: EstadoSalida = ((EstadoSalida | 240)-160);
				 Motor2 = Motor3 = DA;
				 break;
		case IZ: EstadoSalida = ((EstadoSalida | 240)-80);
				 Motor2 = Motor3 = IZ;
				 break;
		case ALTO: EstadoSalida = ((EstadoTemp | 240)-240);
				   Motor2 = Motor3 = ALTO;
				   break;
		default: EstadoSalida = EstadoTemp;
		}
	 }

	 outp(PortOut, EstadoSalida);
}

void EscribeSalida(int ReleID, int Accion)
{
	int EstadoSalida = inp(PortOut);
	int EstadoTemp = inp(PortOut);

	if (ReleID == 1)
	{
		switch(Accion)
		{
			case SI: EstadoSalida = (EstadoSalida | 1);
					 Salida1 = SI;
					 break;
			case NO: EstadoSalida = ((EstadoSalida | 1) - 1);
					 Salida1 = NO;
					 break;
			default: EstadoSalida = EstadoTemp;
		}
	}
	if (ReleID == 2)
	{
		switch(Accion)
		{
			case SI: EstadoSalida = (EstadoSalida | 2);
					 Salida2 = SI;
					 break;
			case NO: EstadoSalida = ((EstadoSalida | 2) - 2);
					 Salida2 = NO;
					 break;
			default: EstadoSalida = EstadoTemp;
		}
	}
	if ((ReleID == 12) || (ReleID == 21))
	{
		switch(Accion)
		{
			case SI: EstadoSalida = (EstadoSalida | 3);
					 Salida1 = Salida2 = SI;
					 break;
			case NO: EstadoSalida = ((EstadoSalida | 3) - 3);
					 Salida1 = Salida2 = NO;
					 break;
			default: EstadoSalida = EstadoTemp;
		}
	}

	outp(PortOut, EstadoSalida);
}

int LeeSensor(int senID)
{
	int nTemp = 1;
	int EstTemp = inp(PortIn);
	switch(senID)
	{
	case 1: if ((EstTemp & 64) == 64) nTemp = 0; break;
	case 2: if ((EstTemp & 32) == 32) nTemp = 0; break;
	case 3: if ((EstTemp & 16) == 16) nTemp = 0; break;
	case 4: if ((EstTemp & 8) == 8) nTemp = 0; break;
	}
	return nTemp;
}

int LeeMotor(int MotorID)
{
	switch (MotorID)
	{
		case 1: return Motor1;
		case 2: return Motor2;
		case 3: return Motor3;
	}
}

int LeeSalida(int ReleID)
{
	switch (ReleID)
	{
		case 1: return Salida1;
		case 2: return Salida2;
	}
}

/* Programa de demostraci�n sencillo utilizando algunas
funciones de control:
void main(void)
{
	Inicializar(3);
	ApagaTodo();
	EscribeMotor(31, DA);
	EscribeMotor(2, IZ);
	EscribeSalida(2, SI);
	int a = LeeMotor(1);
	a = LeeMotor(2);
	a = LeeMotor(3);
	a = LeeSalida(1);
	a = LeeSalida(2);
} */
