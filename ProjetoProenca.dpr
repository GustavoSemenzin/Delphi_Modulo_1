program ProjetoProenca;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {frmCaixaProenca},
  Pedido.Classe in 'Pedido.Classe.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmCaixaProenca, frmCaixaProenca);
  Application.Run;
end.
