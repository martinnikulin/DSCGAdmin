object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = #1040#1076#1084#1080#1085#1080#1089#1090#1088#1080#1088#1086#1074#1072#1085#1080#1077' DSCG'
  ClientHeight = 462
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 786
    Height = 60
    ApplicationButton.Menu = BackStageView
    BarManager = dxBarManager1
    CapitalizeTabCaptions = bDefault
    Style = rs2016Tablet
    ColorSchemeAccent = rcsaBlue
    ColorSchemeName = 'Colorful'
    SupportNonClientDrawing = True
    Contexts = <>
    TabOrder = 0
    TabStop = False
    OnTabChanged = dxRibbon1TabChanged
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = #1057#1045#1056#1042#1045#1056#1067
      Groups = <>
      Index = 0
    end
    object dxRibbon1Tab2: TdxRibbonTab
      Caption = #1055#1056#1054#1045#1050#1058#1067
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar1'
        end>
      Index = 1
    end
    object dxRibbon1Tab3: TdxRibbonTab
      Caption = #1055#1054#1051#1068#1047#1054#1042#1040#1058#1045#1051#1048
      Groups = <
        item
          ToolbarName = 'dxBarManager1Bar2'
        end>
      Index = 2
    end
  end
  object BackStageView: TdxRibbonBackstageView
    Left = 24
    Top = 134
    Width = 960
    Height = 480
    Buttons = <>
    Ribbon = dxRibbon1
    OnPopup = BackStageViewPopup
    object dxRibbonBackstageViewTabSheet1: TdxRibbonBackstageViewTabSheet
      Left = 132
      Top = 0
      Active = True
      Caption = #1054#1090#1082#1088#1099#1090#1100
      object Label1: TLabel
        Left = 12
        Top = 18
        Width = 34
        Height = 15
        Caption = #1051#1086#1075#1080#1085
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 12
        Top = 53
        Width = 42
        Height = 15
        Caption = #1055#1072#1088#1086#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Button1: TButton
        Left = 84
        Top = 104
        Width = 75
        Height = 25
        Caption = 'OK'
        TabOrder = 0
        OnClick = Button1Click
      end
      object UserCombo: TcxLookupComboBox
        Left = 84
        Top = 18
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        ParentFont = False
        Properties.AutoSelect = False
        Properties.KeyFieldNames = 'UserId'
        Properties.ListColumns = <
          item
            FieldName = 'UserId'
          end>
        Properties.ListOptions.ShowHeader = False
        Properties.ListOptions.SyncMode = True
        Properties.ListSource = DM.dsHomeUsers
        Properties.ReadOnly = False
        Style.Color = clWindow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -10
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = []
        Style.LookAndFeel.Kind = lfUltraFlat
        Style.LookAndFeel.NativeStyle = True
        Style.Shadow = False
        Style.IsFontAssigned = True
        StyleDisabled.LookAndFeel.Kind = lfUltraFlat
        StyleDisabled.LookAndFeel.NativeStyle = True
        StyleFocused.LookAndFeel.Kind = lfUltraFlat
        StyleFocused.LookAndFeel.NativeStyle = True
        StyleHot.LookAndFeel.Kind = lfUltraFlat
        StyleHot.LookAndFeel.NativeStyle = True
        TabOrder = 1
        Width = 193
      end
      object PasswordEdit: TcxTextEdit
        Left = 84
        Top = 50
        Style.BorderStyle = ebsUltraFlat
        Style.Color = clWindow
        Style.Edges = [bLeft, bTop, bRight, bBottom]
        Style.Shadow = False
        TabOrder = 2
        Text = '111'
        Width = 193
      end
    end
  end
  object PageControl: TcxPageControl
    Left = 0
    Top = 60
    Width = 786
    Height = 382
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    TabOrder = 1
    Properties.ActivePage = cxTabSheet2
    Properties.CustomButtons.Buttons = <>
    ExplicitWidth = 782
    ExplicitHeight = 381
    ClientRectBottom = 380
    ClientRectLeft = 2
    ClientRectRight = 784
    ClientRectTop = 25
    object cxTabSheet1: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #1057#1077#1088#1074#1077#1088#1099
      ImageIndex = 0
      object ServersGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 782
        Height = 355
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object ServersGridView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DM.dsServers
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 25
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 19
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 16
          object ServersGridViewId: TcxGridDBColumn
            DataBinding.FieldName = 'Id'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 33
          end
          object ServersGridViewServerName: TcxGridDBColumn
            Caption = #1057#1077#1088#1074#1077#1088
            DataBinding.FieldName = 'ServerName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 142
          end
          object ServersGridViewRemoteServer: TcxGridDBColumn
            Caption = #1042#1085#1077#1096#1085#1080#1081' '#1072#1076#1088#1077#1089
            DataBinding.FieldName = 'RemoteServer'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 142
          end
          object ServersGridViewLocalServer: TcxGridDBColumn
            Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1081' '#1072#1076#1088#1077#1089
            DataBinding.FieldName = 'LocalServer'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 128
          end
          object ServersGridViewActual: TcxGridDBColumn
            DataBinding.FieldName = 'Actual'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 30
            IsCaptionAssigned = True
          end
        end
        object ServersGridLevel: TcxGridLevel
          GridView = ServersGridView
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #1055#1088#1086#1077#1082#1090#1099
      ImageIndex = 1
      ExplicitWidth = 778
      ExplicitHeight = 354
      object ProjectsGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 782
        Height = 355
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        ExplicitWidth = 778
        ExplicitHeight = 354
        object ProjectsGridView: TcxGridDBTableView
          PopupMenu = ProjectsPopup
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DM.dsProjects
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 25
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 19
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 16
          object cxGridDBColumn1: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'ProjectId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 42
          end
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = #1055#1088#1086#1077#1082#1090
            DataBinding.FieldName = 'ProjectName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 210
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = #1041#1072#1079#1072' '#1076#1072#1085#1085#1099#1093
            DataBinding.FieldName = 'Database'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 193
          end
          object ProjectsGridViewBackup: TcxGridDBColumn
            DataBinding.FieldName = 'Backup'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            Width = 50
          end
          object cxGridDBColumn4: TcxGridDBColumn
            DataBinding.FieldName = 'Actual'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 50
          end
        end
        object ProjectsGridLevel: TcxGridLevel
          GridView = ProjectsGridView
        end
      end
    end
    object cxTabSheet3: TcxTabSheet
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1080
      ImageIndex = 2
      object UsersGrid: TcxGrid
        Left = 0
        Top = 0
        Width = 782
        Height = 355
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        TabOrder = 0
        LookAndFeel.Kind = lfFlat
        LookAndFeel.NativeStyle = False
        LookAndFeel.ScrollbarMode = sbmClassic
        object UsersGridView: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.PriorPage.Visible = False
          Navigator.Buttons.Prior.Visible = False
          Navigator.Buttons.Next.Visible = False
          Navigator.Buttons.NextPage.Visible = False
          Navigator.Buttons.Edit.Visible = False
          Navigator.Buttons.Cancel.Visible = False
          Navigator.Buttons.Refresh.Visible = False
          Navigator.Buttons.SaveBookmark.Visible = False
          Navigator.Buttons.GotoBookmark.Visible = False
          Navigator.Buttons.Filter.Visible = False
          Navigator.InfoPanel.Visible = True
          Navigator.Visible = True
          ScrollbarAnnotations.CustomAnnotations = <>
          DataController.DataSource = DM.dsUsers
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ImmediateEditor = False
          OptionsCustomize.ColumnFiltering = False
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsData.Appending = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.DataRowHeight = 25
          OptionsView.GroupByBox = False
          OptionsView.HeaderHeight = 19
          OptionsView.Indicator = True
          OptionsView.IndicatorWidth = 16
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Id'
            DataBinding.FieldName = 'UserId'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 52
          end
          object cxGridDBColumn6: TcxGridDBColumn
            Caption = #1055#1086#1083#1100#1079#1086#1074#1072#1090#1077#1083#1100
            DataBinding.FieldName = 'UserName'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 102
          end
          object cxGridDBColumn7: TcxGridDBColumn
            Caption = #1055#1072#1088#1086#1083#1100
            DataBinding.FieldName = 'Password'
            DataBinding.IsNullValueType = True
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 29
          end
          object RolesColumn: TcxGridDBColumn
            Caption = #1056#1086#1083#1100
            DataBinding.FieldName = 'RoleId'
            DataBinding.IsNullValueType = True
            PropertiesClassName = 'TcxLookupComboBoxProperties'
            Properties.KeyFieldNames = 'RoleId'
            Properties.ListColumns = <
              item
                FieldName = 'RoleName'
              end>
            Properties.ListOptions.GridLines = glNone
            Properties.ListOptions.ShowHeader = False
            Properties.ListSource = DM.dsRoles
            HeaderAlignmentHorz = taCenter
            MinWidth = 16
            Width = 70
          end
        end
        object UsersGridLevel: TcxGridLevel
          GridView = UsersGridView
        end
      end
    end
  end
  object dxStatusBar1: TdxStatusBar
    Left = 0
    Top = 442
    Width = 786
    Height = 20
    Panels = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    ExplicitTop = 441
    ExplicitWidth = 782
  end
  object dxBarManager1: TdxBarManager
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Categories.Strings = (
      'Default')
    Categories.ItemsVisibles = (
      2)
    Categories.Visibles = (
      True)
    PopupMenuLinks = <>
    UseSystemFont = True
    Left = 568
    Top = 8
    PixelsPerInch = 96
    object dxBarManager1Bar1: TdxBar
      Caption = 'Custom 1'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1007
      FloatTop = 3
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic1'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 180
          Visible = True
          ItemName = 'ServerCombo1'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object dxBarManager1Bar2: TdxBar
      Caption = 'Custom 2'
      CaptionButtons = <>
      DockedLeft = 0
      DockedTop = 0
      FloatLeft = 1007
      FloatTop = 3
      FloatClientWidth = 0
      FloatClientHeight = 0
      ItemLinks = <
        item
          Visible = True
          ItemName = 'dxBarStatic2'
        end
        item
          UserDefine = [udWidth]
          UserWidth = 180
          Visible = True
          ItemName = 'ServerCombo2'
        end>
      OneOnRow = True
      Row = 0
      UseOwnFont = False
      Visible = True
      WholeRow = False
    end
    object cxBarEditItem1: TcxBarEditItem
      Caption = 'Text Edit Item'
      Category = 0
      Visible = ivAlways
      PropertiesClassName = 'TcxTextEditProperties'
    end
    object ServerCombo1: TdxBarLookupCombo
      Caption = #1057#1077#1088#1074#1077#1088
      Category = 0
      Hint = #1057#1077#1088#1074#1077#1088
      MergeKind = mkNone
      Visible = ivAlways
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFF0000FF8080
        80FF808080FFFF0000FF000000FFFF0000FF808080FF808080FF808080FF8080
        80FF808080FF808080FFFF0000FF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FF808080FF808080FF808080FF808080FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      Width = 80
      ShowEditor = False
      OnCloseUp = ServerCombo1CloseUp
      KeyField = 'Id'
      ListField = 'ServerName'
      ListSource = DM.dsServers
      RowCount = 7
    end
    object dxBarStatic1: TdxBarStatic
      Caption = #1057#1077#1088#1074#1077#1088
      Category = 0
      Hint = #1057#1077#1088#1074#1077#1088
      Visible = ivAlways
    end
    object dxBarStatic2: TdxBarStatic
      Caption = #1057#1077#1088#1074#1077#1088
      Category = 0
      Hint = #1057#1077#1088#1074#1077#1088
      Visible = ivAlways
    end
    object ServerCombo2: TdxBarLookupCombo
      Caption = #1057#1077#1088#1074#1077#1088
      Category = 0
      Hint = #1057#1077#1088#1074#1077#1088
      Visible = ivAlways
      Glyph.SourceDPI = 96
      Glyph.Data = {
        424D360400000000000036000000280000001000000010000000010020000000
        000000000000C40E0000C40E00000000000000000000FF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00
        FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFF0000FF8080
        80FF808080FFFF0000FF000000FFFF0000FF808080FF808080FF808080FF8080
        80FF808080FF808080FFFF0000FF000000FFFF00FFFF000000FFFF0000FFFF00
        00FFFF0000FFFF0000FF000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00
        00FFFF0000FFFF0000FFFF0000FF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FFFFFFFFFF000000FFFFFFFFFF808080FF808080FF808080FF8080
        80FF808080FF808080FFFFFFFFFF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFF8080
        80FF808080FF808080FF808080FF808080FF808080FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFF0000FFFF0000FFFF0000FFFF0000FFFFFFFFFFFFFFFFFFFFFF
        FFFF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF000000FF000000FF0000
        00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
        00FF000000FFFF00FFFFFF00FFFFFF00FFFFFF00FFFF}
      Width = 0
      ShowEditor = False
      OnCloseUp = ServerCombo2CloseUp
      KeyField = 'Id'
      ListField = 'ServerName'
      ListSource = DM.dsServers
      RowCount = 7
    end
  end
  object dxSkinController1: TdxSkinController
    NativeStyle = False
    SkinName = 'Office2019Colorful'
    Left = 536
    Top = 8
  end
  object cxRolesEditRepository: TcxEditRepository
    Left = 746
    Top = 194
    PixelsPerInch = 96
    object cxEditRepository1ComboBoxItem1: TcxEditRepositoryComboBoxItem
    end
  end
  object ProjectsPopup: TPopupMenu
    Left = 272
    Top = 176
    object N1: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1057#1086#1079#1076#1072#1090#1100' '#1073#1072#1079#1091' '#1076#1072#1085#1085#1099#1093' '#1076#1083#1103' '#1075#1077#1086#1083#1086#1075#1080#1095#1077#1089#1082#1086#1075#1086' '#1086#1090#1095#1077#1090#1072
      OnClick = N3Click
    end
  end
end
