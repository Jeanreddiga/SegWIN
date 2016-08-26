unit util;

interface

function WinVersion: string;
function MD5(const Texto: string): string;

implementation

uses
  Winapi.Windows, IdHashMessageDigest;

{ ============================================================================== }
function WinVersion: string;
var
  VersionInfo: TOSVersionInfo;
begin
  Result := '';
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);
  GetVersionEx(VersionInfo);
  case VersionInfo.dwPlatformId of
    1:
      case VersionInfo.dwMinorVersion of
        0:
          Result := 'Windows 95';
        10:
          Result := 'Windows 98';
        90:
          Result := 'Windows Me';
      end;
    2:
      case VersionInfo.dwMajorVersion of
        3:
          Result := 'Windows NT 3.51';
        4:
          Result := 'Windows NT 4.0';
        5:
          case VersionInfo.dwMinorVersion of
            0:
              Result := 'Windows 2000';
            1:
              Result := 'Windows XP';
            2:
              Result := 'Windows XP'; // x64
          end;
        6:
          case VersionInfo.dwMinorVersion of
            0:
              Result := 'Windows Vista';
            1:
              Result := 'Windows 7';
            2:
              Result := 'Windows 8';
          end;
      end;
  end;
end;

{ ============================================================================== }
function MD5(const Texto: string): string;
var
  idmd5: TIdHashMessageDigest5;
begin
  idmd5 := TIdHashMessageDigest5.Create;
  try
    Result := idmd5.HashStringAsHex(Texto);
  finally
    idmd5.Free;
  end;
end;

end.
