object DM: TDM
  Height = 283
  Width = 572
  object HomeCatConn: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=DSCG;Persist Security Info=True;U' +
      'ser ID=DSCG;Initial Catalog=DSCGSystem;Data Source=localhost;Ini' +
      'tial File Name="";Server SPN="";Authentication="";Access Token="' +
      '"'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 56
    Top = 32
  end
  object Servers: TADOQuery
    Connection = HomeCatConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select     *'
      'from       Servers'
      '')
    Left = 136
    Top = 32
  end
  object Projects: TADOQuery
    Connection = RemoteCatConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select Id as ProjectId, ProjectName, [Database], ServerId, [Back' +
        'up], Actual from Projects')
    Left = 136
    Top = 112
  end
  object dsServers: TDataSource
    DataSet = Servers
    Left = 207
    Top = 32
  end
  object dsProjects: TDataSource
    DataSet = Projects
    Left = 207
    Top = 112
  end
  object RemoteCatConn: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=DSCG;Persist Security Info=True;U' +
      'ser ID=DSCG;Initial Catalog=DSCGSystem;Data Source=localhost;Ini' +
      'tial File Name="";Server SPN="";Authentication="";Access Token="' +
      '"'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 56
    Top = 112
  end
  object Users: TADOQuery
    Connection = RemoteCatConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RoleId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from Users where RoleId <= :RoleId')
    Left = 288
    Top = 32
  end
  object dsUsers: TDataSource
    DataSet = Users
    Left = 352
    Top = 32
  end
  object Roles: TADOQuery
    Connection = RemoteCatConn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'RoleId'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 1
      end>
    SQL.Strings = (
      'select * from Roles where RoleId <= :RoleId')
    Left = 431
    Top = 112
  end
  object dsRoles: TDataSource
    DataSet = Roles
    Left = 487
    Top = 112
  end
  object HomeUsers: TADOQuery
    Connection = HomeCatConn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from Users')
    Left = 288
    Top = 112
  end
  object dsHomeUsers: TDataSource
    DataSet = HomeUsers
    Left = 352
    Top = 112
  end
  object GDBConnection: TADOConnection
    ConnectionString = 
      'Provider=MSOLEDBSQL.1;Password=DSCG;Persist Security Info=True;U' +
      'ser ID=DSCG;Initial Catalog=GDB520007;Data Source=localhost;Init' +
      'ial File Name="";Server SPN="";Authentication="";Access Token=""'
    LoginPrompt = False
    Provider = 'MSOLEDBSQL.1'
    Left = 56
    Top = 184
  end
  object Variants: TADOQuery
    Connection = GDBConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select Id, Variant2 from Condition')
    Left = 136
    Top = 184
  end
  object dsVariants: TDataSource
    DataSet = Variants
    Left = 207
    Top = 184
  end
end
