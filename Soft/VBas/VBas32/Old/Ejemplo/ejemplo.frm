VERSION 4.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H00C0C0C0&
   Caption         =   "Ejemplo de uso de la i723.DLL"
   ClientHeight    =   3045
   ClientLeft      =   1770
   ClientTop       =   1500
   ClientWidth     =   5550
   BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
      Name            =   "MS Sans Serif"
      Size            =   8.25
      Charset         =   0
      Weight          =   700
      Underline       =   -1  'True
      Italic          =   -1  'True
      Strikethrough   =   -1  'True
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   3450
   Left            =   1710
   LinkTopic       =   "Form1"
   ScaleHeight     =   3045
   ScaleWidth      =   5550
   Top             =   1155
   Width           =   5670
   Begin VB.CommandButton Motor1IZ 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "<"
      Height          =   495
      Left            =   1095
      TabIndex        =   26
      Top             =   75
      Width           =   645
   End
   Begin VB.Timer tmrSensores 
      Interval        =   1
      Left            =   1590
      Top             =   2355
   End
   Begin VB.CheckBox Check4 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 4"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   225
      TabIndex        =   25
      Top             =   2700
      Width           =   1170
   End
   Begin VB.CheckBox Check3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 3"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   225
      TabIndex        =   24
      Top             =   2430
      Width           =   1170
   End
   Begin VB.CheckBox Check2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 2"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   225
      TabIndex        =   23
      Top             =   2160
      Width           =   1170
   End
   Begin VB.CheckBox Check1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Sensor 1"
      Enabled         =   0   'False
      ForeColor       =   &H80000008&
      Height          =   195
      Left            =   225
      TabIndex        =   22
      Top             =   1890
      Width           =   1170
   End
   Begin VB.CommandButton Command5 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Reset"
      Height          =   885
      Left            =   4335
      TabIndex        =   21
      Top             =   1875
      Width           =   930
   End
   Begin VB.CommandButton Command4 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "No"
      Height          =   495
      Left            =   4665
      TabIndex        =   18
      Top             =   615
      Width           =   645
   End
   Begin VB.CommandButton Command3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Si"
      Height          =   495
      Left            =   4020
      TabIndex        =   17
      Top             =   615
      Width           =   645
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "No"
      Height          =   495
      Left            =   4665
      TabIndex        =   16
      Top             =   90
      Width           =   645
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Si"
      Height          =   495
      Left            =   4020
      TabIndex        =   15
      Top             =   90
      Width           =   645
   End
   Begin VB.OptionButton Port2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Lpt 2"
      ForeColor       =   &H80000008&
      Height          =   225
      Left            =   2640
      TabIndex        =   13
      Top             =   2220
      Width           =   885
   End
   Begin VB.OptionButton Port3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Lpt 3"
      ForeColor       =   &H80000008&
      Height          =   225
      Left            =   2640
      TabIndex        =   12
      Top             =   2535
      Width           =   945
   End
   Begin VB.OptionButton Port1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Lpt 1"
      ForeColor       =   &H80000008&
      Height          =   225
      Left            =   2640
      TabIndex        =   11
      Top             =   1890
      Value           =   -1  'True
      Width           =   795
   End
   Begin VB.CommandButton Motor3DA 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   ">"
      Height          =   495
      Left            =   2385
      TabIndex        =   7
      Top             =   1125
      Width           =   645
   End
   Begin VB.CommandButton Motor1ALTO 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Alto"
      Height          =   495
      Left            =   1740
      TabIndex        =   6
      Top             =   75
      Width           =   645
   End
   Begin VB.CommandButton motor1DA 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   ">"
      Height          =   495
      Left            =   2385
      TabIndex        =   5
      Top             =   75
      Width           =   645
   End
   Begin VB.CommandButton Motor2ALTO 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Alto"
      Height          =   495
      Left            =   1740
      TabIndex        =   4
      Top             =   600
      Width           =   645
   End
   Begin VB.CommandButton motor2DA 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   ">"
      Height          =   495
      Left            =   2385
      TabIndex        =   3
      Top             =   600
      Width           =   645
   End
   Begin VB.CommandButton Motor3IZ 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "<"
      Height          =   495
      Left            =   1095
      TabIndex        =   2
      Top             =   1125
      Width           =   645
   End
   Begin VB.CommandButton Motor3ALTO 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Alto"
      Height          =   495
      Left            =   1740
      TabIndex        =   1
      Top             =   1125
      Width           =   645
   End
   Begin VB.CommandButton Motor2IZ 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "<"
      Height          =   495
      Left            =   1095
      TabIndex        =   0
      Top             =   600
      Width           =   645
   End
   Begin VB.Label Label6 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Salida 1:"
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   3225
      TabIndex        =   20
      Top             =   195
      Width           =   765
   End
   Begin VB.Label Label5 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Salida 2:"
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   3225
      TabIndex        =   19
      Top             =   690
      Width           =   765
   End
   Begin VB.Label Label4 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Port:"
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   2115
      TabIndex        =   14
      Top             =   1860
      Width           =   480
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Motor 3:"
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   210
      TabIndex        =   10
      Top             =   1245
      Width           =   765
   End
   Begin VB.Label Label2 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Motor 2:"
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   210
      TabIndex        =   9
      Top             =   705
      Width           =   765
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H00C0C0C0&
      Caption         =   "Motor 1:"
      ForeColor       =   &H80000008&
      Height          =   300
      Left            =   210
      TabIndex        =   8
      Top             =   165
      Width           =   765
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
Option Explicit

Private Sub Command1_Click()
    EscribeSalida 1, 1
End Sub

Private Sub Command2_Click()
    EscribeSalida 1, 0
End Sub

Private Sub Command3_Click()
    EscribeSalida 2, 1
End Sub

Private Sub Command4_Click()
    EscribeSalida 2, 0
End Sub

Private Sub Command5_Click()
    ApagaTodo
End Sub

Private Sub Command6_Click()
    EscribeMotor 13, 2
End Sub

Private Sub Form_Load()
    Inicializar 1
End Sub

Private Sub Form_Unload(Cancel As Integer)
    ApagaTodo
End Sub

Private Sub Motor1ALTO_Click()
    EscribeMotor 1, 0
End Sub

Private Sub motor1DA_Click()
    EscribeMotor 1, 1
End Sub

Private Sub Motor1IZ_Click()
    EscribeMotor 1, 2
End Sub

Private Sub Motor2ALTO_Click()
    EscribeMotor 2, 0
End Sub

Private Sub motor2DA_Click()
    EscribeMotor 2, 1
End Sub

Private Sub Motor2IZ_Click()
    EscribeMotor 2, 2
End Sub

Private Sub Motor3ALTO_Click()
    EscribeMotor 3, 0
End Sub

Private Sub Motor3DA_Click()
    EscribeMotor 3, 1
End Sub

Private Sub Motor3IZ_Click()
    EscribeMotor 3, 2
End Sub

Private Sub Port1_Click()
    Inicializar 1
End Sub

Private Sub Port2_Click()
    Inicializar 2
End Sub

Private Sub Port3_Click()
    Inicializar 3
End Sub

Private Sub tmrSensores_Timer()
    check1 = LeeSensor(1)
    check2 = LeeSensor(2)
    check3 = LeeSensor(3)
    check4 = LeeSensor(4)
End Sub

