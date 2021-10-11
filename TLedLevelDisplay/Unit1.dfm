object Form1: TForm1
  Left = 236
  Top = 131
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'TLedLevelDisplay'
  ClientHeight = 418
  ClientWidth = 674
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Image1: TImage
    Left = 8
    Top = 4
    Width = 657
    Height = 301
  end
  object Label1: TLabel
    Left = 7
    Top = 329
    Width = 92
    Height = 48
    Caption = #1053#1080#1078#1085#1080#1081' '#1094#1074#1077#1090':'#13#13#1042#1077#1088#1093#1085#1080#1081' '#1094#1074#1077#1090':'
  end
  object Label2: TLabel
    Left = 408
    Top = 336
    Width = 170
    Height = 16
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1089#1074#1077#1090#1086#1076#1080#1086#1076#1086#1074':'
  end
  object Label3: TLabel
    Left = 408
    Top = 360
    Width = 165
    Height = 16
    Caption = #1050#1086#1083'-'#1074#1086' '#1074#1082#1083'. '#1089#1074#1077#1090#1086#1076#1080#1086#1076#1086#1074':'
  end
  object ColorBox1: TColorBox
    Left = 112
    Top = 320
    Width = 177
    Height = 22
    Selected = clNavy
    Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 0
    OnChange = ColorBox1Change
  end
  object ColorBox2: TColorBox
    Left = 112
    Top = 355
    Width = 177
    Height = 22
    Selected = clBlue
    Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 1
    OnChange = ColorBox2Change
  end
  object SpinEdit1: TSpinEdit
    Left = 594
    Top = 320
    Width = 71
    Height = 26
    MaxValue = 30
    MinValue = 0
    TabOrder = 2
    Value = 10
    OnChange = SpinEdit1Change
  end
  object SpinEdit2: TSpinEdit
    Left = 594
    Top = 352
    Width = 71
    Height = 26
    MaxValue = 10
    MinValue = -1
    TabOrder = 3
    Value = 3
    OnChange = SpinEdit2Change
  end
  object Button1: TButton
    Left = 8
    Top = 384
    Width = 657
    Height = 25
    Caption = #1055#1077#1088#1077#1088#1080#1089#1086#1074#1072#1090#1100'!'
    TabOrder = 4
    OnClick = Button1Click
  end
end
