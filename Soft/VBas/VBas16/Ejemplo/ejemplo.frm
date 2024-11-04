VERSION 2.00
Begin Form Form1 
   BackColor       =   &H00C0C0C0&
   Caption         =   "Ejemplo de uso de la i723.DLL"
   ClientHeight    =   3045
   ClientLeft      =   1770
   ClientTop       =   1500
   ClientWidth     =   5550
   Height          =   3450
   Left            =   1710
   LinkTopic       =   "Form1"
   ScaleHeight     =   3045
   ScaleWidth      =   5550
   Top             =   1155
   Width           =   5670
   Begin CommandButton Motor1IZ 
      Caption         =   "<"
      Height          =   495
      Left            =   1095
      TabIndex        =   26
      Top             =   75
      Width           =   645
   End
   Begin Timer tmrSensores 
      Interval        =   1
      Left            =   1590
      Top             =   2355
   End
   Begin CheckBox Check4 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 4"
      Enabled         =   0   'False
      Height          =   195
      Left            =   225
      TabIndex        =   25
      Top             =   2700
      Width           =   1170
   End
   Begin CheckBox Check3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 3"
      Enabled         =   0   'False
      Height          =   195
      Left            =   225
      TabIndex        =   24
      Top             =   2430
      Width           =   1170
   End
   Begin CheckBox Check2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 2"
      Enabled         =   0   'False
      Height          =   195
      Left            =   225
      TabIndex        =   23
      Top             =   2160
      Width           =   1170
   End
   Begin CheckBox Check1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 1"
      Enabled         =   0   'False
      Height          =   195
      Left            =   225
      TabIndex        =   22
      Top             =   1890
      Width           =   1170
   End
   Begin CommandButton Command5 
      Caption         =   "Reset"
      Height          =   885
      Left            =   4335
      TabIndex        =   21
      Top             =   1875
      Width           =   930
   End
   Begin CommandButton Command4 
      Caption         =   "No"
      Height          =   495
      Left            =   4665
      TabIndex        =   18
      Top             =   615
      Width           =   645
   End
   Begin CommandButton Command3 
      Caption         =   "Si"
      Height          =   495
      Left            =   4020
      TabIndex        =   17
      Top             =   615
      Width           =   645
   End
   Begin CommandButton Command2 
      Caption         =   "No"
      Height          =   495
      Left            =   4665
      TabIndex        =   16
      Top             =   90
      Width           =   645
   End
   Begin CommandButton Command1 
      Caption         =   "Si"
      Height          =   495
      Left            =   4020
      TabIndex        =   15
      Top             =   90
      Width           =   645
   End
   Begin OptionButton Port2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Lpt 2"
      Height          =   225
      Left            =   2640
      TabIndex        =   13
      Top             =   2220
      Width           =   885
   End
   Begin OptionButton Port3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Lpt 3"
      Height          =   225
      Left            =   2640
      TabIndex        =   12
      Top             =   2535
      Width           =   945
   End
   Begin OptionButton Port1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Lpt 1"
      Height          =   225
      Left            =   2640
      TabIndex        =   11
      Top             =   1890
      Value           =   -1  'True
      Width           =   795
   End
   Begin CommandButton Motor3DA 
      Caption         =   ">"
      Height          =   495
      Left            =   2385
      TabIndex        =   7
      Top             =   1125
      Width           =   645
   End
   Begin CommandButton Motor1ALTO 
      Caption         =   "Alto"
      Height          =   495
      Left            =   1740
      TabIndex        =   6
      Top             =   75
      Width           =   645
   End
   Begin CommandButton motor1DA 
      Caption         =   ">"
      Height          =   495
      Left            =   2385
      TabIndex        =   5
      Top             =   75
      Width           =   645
   End
   Begin CommandButton Motor2ALTO 
      Caption         =   "Alto"
      Height          =   495
      Left            =   1740
      TabIndex        =   4
      Top             =   600
      Width           =   645
   End
   Begin CommandButton motor2DA 
      Caption         =   ">"
      Height          =   495
      Left            =   2385
      TabIndex        =   3
      Top             =   600
      Width           =   645
   End
   Begin CommandButton Motor3IZ 
      Caption         =   "<"
      Height          =   495
      Left            =   1095
      TabIndex        =   2
      Top             =   1125
      Width           =   645
   End
   Begin CommandButton Motor3ALTO 
      Caption         =   "Alto"
      Height          =   495
      Left            =   1740
      TabIndex        =   1
      Top             =   1125
      Width           =   645
   End
   Begin CommandButton Motor2IZ 
      Caption         =   "<"
      Height          =   495
      Left            =   1095
      TabIndex        =   0
      Top             =   600
      Width           =   645
   End
   Begin Label Label6 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Salida 1:"
      Height          =   300
      Left            =   3225
      TabIndex        =   20
      Top             =   195
      Width           =   765
   End
   Begin Label Label5 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Salida 2:"
      Height          =   300
      Left            =   3225
      TabIndex        =   19
      Top             =   690
      Width           =   765
   End
   Begin Label Label4 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Port:"
      Height          =   300
      Left            =   2115
      TabIndex        =   14
      Top             =   1860
      Width           =   480
   End
   Begin Label Label3 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Motor 3:"
      Height          =   300
      Left            =   210
      TabIndex        =   10
      Top             =   1245
      Width           =   765
   End
   Begin Label Label2 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Motor 2:"
      Height          =   300
      Left            =   210
      TabIndex        =   9
      Top             =   705
      Width           =   765
   End
   Begin Label Label1 
      BackColor       =   &H00C0C0C0&
      Caption         =   "Motor 1:"
      Height          =   300
      Left            =   210
      TabIndex        =   8
      Top             =   165
      Width           =   765
   End
End
'Copyright (c)1998 Julián da Silva Gillig
'Todos los derechos reservados

Option Explicit

Sub Command1_Click ()
    EscribeSalida 1, 1
End Sub

Sub Command2_Click ()
    EscribeSalida 1, 0
End Sub

Sub Command3_Click ()
    EscribeSalida 2, 1
End Sub

Sub Command4_Click ()
    EscribeSalida 2, 0
End Sub

Sub Command5_Click ()
    ApagaTodo
End Sub

Sub Command6_Click ()
    EscribeMotor 13, 2
End Sub

Sub Form_Load ()
    Inicializar 1
End Sub

Sub Form_Unload (Cancel As Integer)
    ApagaTodo
End Sub

Sub Motor1ALTO_Click ()
    EscribeMotor 1, 0
End Sub

Sub motor1DA_Click ()
    EscribeMotor 1, 1
End Sub

Sub Motor1IZ_Click ()
    EscribeMotor 1, 2
End Sub

Sub Motor2ALTO_Click ()
    EscribeMotor 2, 0
End Sub

Sub motor2DA_Click ()
    EscribeMotor 2, 1
End Sub

Sub Motor2IZ_Click ()
    EscribeMotor 2, 2
End Sub

Sub Motor3ALTO_Click ()
    EscribeMotor 3, 0
End Sub

Sub Motor3DA_Click ()
    EscribeMotor 3, 1
End Sub

Sub Motor3IZ_Click ()
    EscribeMotor 3, 2
End Sub

Sub Port1_Click ()
    Inicializar 1
End Sub

Sub Port2_Click ()
    Inicializar 2
End Sub

Sub Port3_Click ()
    Inicializar 3
End Sub

Sub tmrSensores_Timer ()
    check1 = LeeSensor(1)
    check2 = LeeSensor(2)
    check3 = LeeSensor(3)
    check4 = LeeSensor(4)
End Sub

