program SegWIN;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  uLogin in 'Views\uLogin.pas' {frmLogin},
  util in 'Model\util.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.Run;
end.
