VERSION 4.00
Begin VB.Form Form1 
   Caption         =   "Ejemplo de uso de la Interfaz i-723"
   ClientHeight    =   4140
   ClientLeft      =   1140
   ClientTop       =   1515
   ClientWidth     =   6900
   Height          =   4545
   Left            =   1080
   LinkTopic       =   "Form1"
   ScaleHeight     =   4140
   ScaleWidth      =   6900
   Top             =   1170
   Width           =   7020
   Begin VB.CommandButton cmdS2No 
      Caption         =   "NO"
      Height          =   495
      Left            =   5745
      TabIndex        =   27
      Top             =   915
      Width           =   780
   End
   Begin VB.CommandButton cmdS1No 
      Caption         =   "NO"
      Height          =   495
      Left            =   5745
      TabIndex        =   26
      Top             =   330
      Width           =   780
   End
   Begin VB.CommandButton cmdS2Si 
      Caption         =   "SI"
      Height          =   495
      Left            =   4965
      TabIndex        =   25
      Top             =   915
      Width           =   780
   End
   Begin VB.CommandButton cmdS1Si 
      Caption         =   "SI"
      Height          =   495
      Left            =   4965
      TabIndex        =   24
      Top             =   330
      Width           =   780
   End
   Begin VB.CheckBox chkS4 
      Caption         =   "Sensor 4"
      Enabled         =   0   'False
      Height          =   300
      Left            =   600
      TabIndex        =   18
      Top             =   3570
      Width           =   1215
   End
   Begin VB.CheckBox chkS3 
      Caption         =   "Sensor 3"
      Enabled         =   0   'False
      Height          =   300
      Left            =   600
      TabIndex        =   17
      Top             =   3240
      Width           =   1215
   End
   Begin VB.CheckBox chkS2 
      Caption         =   "Sensor 2"
      Enabled         =   0   'False
      Height          =   300
      Left            =   600
      TabIndex        =   16
      Top             =   2910
      Width           =   1215
   End
   Begin VB.CheckBox chkS1 
      Caption         =   "Sensor 1"
      Enabled         =   0   'False
      Height          =   300
      Left            =   600
      TabIndex        =   15
      Top             =   2595
      Width           =   1215
   End
   Begin VB.Timer tmrSensores 
      Interval        =   55
      Left            =   4185
      Top             =   3600
   End
   Begin VB.CommandButton cmdM3DA 
      Caption         =   "DA"
      Height          =   495
      Left            =   2715
      TabIndex        =   13
      Top             =   1365
      Width           =   780
   End
   Begin VB.CommandButton cmdM3ALTO 
      Caption         =   "ALTO"
      Height          =   495
      Left            =   1935
      TabIndex        =   12
      Top             =   1365
      Width           =   780
   End
   Begin VB.CommandButton cmdM3IZ 
      Caption         =   "IZ"
      Height          =   495
      Left            =   1155
      TabIndex        =   11
      Top             =   1365
      Width           =   780
   End
   Begin VB.CommandButton cmdM2DA 
      Caption         =   "DA"
      Height          =   495
      Left            =   2715
      TabIndex        =   10
      Top             =   825
      Width           =   780
   End
   Begin VB.CommandButton cmdM2ALTO 
      Caption         =   "ALTO"
      Height          =   495
      Left            =   1935
      TabIndex        =   9
      Top             =   825
      Width           =   780
   End
   Begin VB.CommandButton cmdM2IZ 
      Caption         =   "IZ"
      Height          =   495
      Left            =   1155
      TabIndex        =   8
      Top             =   825
      Width           =   780
   End
   Begin VB.CommandButton cmdM1DA 
      Caption         =   "DA"
      Height          =   495
      Left            =   2715
      TabIndex        =   7
      Top             =   285
      Width           =   780
   End
   Begin VB.CommandButton cmdM1ALTO 
      Caption         =   "ALTO"
      Height          =   495
      Left            =   1935
      TabIndex        =   6
      Top             =   285
      Width           =   780
   End
   Begin VB.CommandButton cmdM1IZ 
      Caption         =   "IZ"
      Height          =   495
      Left            =   1155
      TabIndex        =   5
      Top             =   285
      Width           =   780
   End
   Begin VB.OptionButton optLpt3 
      Caption         =   "Lpt 3"
      Height          =   495
      Left            =   4965
      TabIndex        =   3
      Top             =   3480
      Width           =   1215
   End
   Begin VB.OptionButton optLpt2 
      Caption         =   "Lpt 2"
      Height          =   495
      Left            =   4965
      TabIndex        =   2
      Top             =   3105
      Width           =   1215
   End
   Begin VB.OptionButton optLpt1 
      Caption         =   "Lpt 1"
      Height          =   495
      Left            =   4965
      TabIndex        =   1
      Top             =   2730
      Value           =   -1  'True
      Width           =   1215
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "Reset"
      Height          =   870
      Left            =   2415
      TabIndex        =   0
      Top             =   2850
      Width           =   1410
   End
   Begin VB.Label Label7 
      Caption         =   "Salida 2:"
      Height          =   315
      Left            =   4095
      TabIndex        =   23
      Top             =   990
      Width           =   765
   End
   Begin VB.Label Label6 
      Caption         =   "Salida 1:"
      Height          =   315
      Left            =   4095
      TabIndex        =   22
      Top             =   510
      Width           =   765
   End
   Begin VB.Label Label5 
      Caption         =   "Motor 3:"
      Height          =   315
      Left            =   210
      TabIndex        =   21
      Top             =   1500
      Width           =   765
   End
   Begin VB.Label Label4 
      Caption         =   "Motor 2:"
      Height          =   315
      Left            =   225
      TabIndex        =   20
      Top             =   960
      Width           =   765
   End
   Begin VB.Label Label3 
      Caption         =   "Motor 1:"
      Height          =   315
      Left            =   225
      TabIndex        =   19
      Top             =   390
      Width           =   765
   End
   Begin VB.Label Label2 
      Caption         =   "Sensores:"
      Height          =   360
      Left            =   705
      TabIndex        =   14
      Top             =   2310
      Width           =   1035
   End
   Begin VB.Label Label1 
      Caption         =   "Puerto de Conexión:"
      Height          =   360
      Left            =   4650
      TabIndex        =   4
      Top             =   2475
      Width           =   1740
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
'Copyritgh (c)1998 Julián da Silva Gillig
'Todos los derechos reservados
Private Sub cmdM1ALTO_Click()
    EscribeMotor 1, 0
End Sub

Private Sub cmdM1DA_Click()
    EscribeMotor 1, 1
End Sub


Private Sub cmdM1IZ_Click()
    EscribeMotor 1, 2
End Sub

Private Sub cmdM2ALTO_Click()
    EscribeMotor 2, 0
End Sub

Private Sub cmdM2DA_Click()
    EscribeMotor 2, 1
End Sub

Private Sub cmdM2IZ_Click()
    EscribeMotor 2, 2
End Sub

Private Sub cmdM3ALTO_Click()
    EscribeMotor 3, 0
End Sub

Private Sub cmdM3DA_Click()
    EscribeMotor 3, 1
End Sub

Private Sub cmdM3IZ_Click()
    EscribeMotor 3, 2
End Sub

Private Sub cmdReset_Click()
    ApagaTodo
End Sub

Private Sub Command1_Click()

End Sub


Private Sub cmdS1No_Click()
    EscribeSalida 1, 0
End Sub

Private Sub cmdS1Si_Click()
    EscribeSalida 1, 1
End Sub

Private Sub cmdS2No_Click()
    EscribeSalida 2, 0
End Sub

Private Sub cmdS2Si_Click()
    EscribeSalida 2, 1
End Sub

Private Sub Form_Load()
    Inicializar 1
End Sub


Private Sub optLpt1_Click()
    Inicializar 1
End Sub


Private Sub optLpt2_Click()
    Inicializar 2
End Sub


Private Sub optLpt3_Click()
    Inicializar 3
End Sub


Private Sub tmrSensores_Timer()
    chkS1.Value = LeeSensor(1)
    chkS2.Value = LeeSensor(2)
    chkS3.Value = LeeSensor(3)
    chkS4.Value = LeeSensor(4)
End Sub


