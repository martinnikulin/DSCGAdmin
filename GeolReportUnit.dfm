object GeolReportForm: TGeolReportForm
  Left = 0
  Top = 0
  Caption = 'GeolReportForm'
  ClientHeight = 158
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 16
    Top = 72
    Width = 99
    Height = 15
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1086#1077#1082#1090#1072
  end
  object Label2: TLabel
    Left = 16
    Top = 27
    Width = 45
    Height = 15
    Caption = #1042#1072#1088#1080#1072#1085#1090
  end
  object NameEdit: TEdit
    Left = 128
    Top = 69
    Width = 345
    Height = 23
    TabOrder = 0
  end
  object Button1: TButton
    Left = 168
    Top = 120
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 256
    Top = 120
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 2
    OnClick = Button2Click
  end
  object ConditionBox: TDBLookupComboBox
    Left = 128
    Top = 27
    Width = 203
    Height = 23
    KeyField = 'Id'
    ListField = 'Variant2'
    ListSource = DM.dsVariants
    TabOrder = 3
  end
end
