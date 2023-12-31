unit MainForm;

interface

uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   Vcl.StdCtrls,
   Vcl.ExtCtrls,
   Pedido.Classe;

type
   TfrmCaixaProenca = class(TForm)
      Panel2: TPanel;
    pnlCabec: TPanel;
      btnNovoPedido: TButton;
      pnlPedido: TPanel;
      Panel1: TPanel;
      lblTotal: TLabel;
      mmPedido: TMemo;
      pnlIncluirItem: TPanel;
    pnlManipularPedido: TPanel;
      btnFinalizarPedido: TButton;
    btnHabilitarManipulacao: TButton;
    btnHabilitarRemocao: TButton;
    GroupBox1: TGroupBox;
    btnPersistirItem: TButton;
    pnlRemoverItem: TPanel;
    GroupBox2: TGroupBox;
    bntRemoverItem: TButton;
    edtItemProduto: TLabeledEdit;
    edtItemDesc: TLabeledEdit;
    edtItemQtde: TLabeledEdit;
    edtItemValor: TLabeledEdit;
    edtRemoveProd: TLabeledEdit;
    edtRemoveQtde: TLabeledEdit;
      procedure bntRemoverItemClick(Sender: TObject);
      procedure btnHabilitarManipulacaoClick(Sender: TObject);
      procedure btnNovoPedidoClick(Sender: TObject);
      procedure btnHabilitarRemocaoClick(Sender: TObject);
      procedure btnPersistirItemClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
   private
      FUltimoPedido: Integer;
      FPedidoAtual: TPedido;
      procedure PreencherPedido;
      procedure ManipularPedido(Aberto: boolean);
   public
      procedure LimparEdit;
      procedure ManipularTela(Tipo: string);

   end;

var
   frmCaixaProenca: TfrmCaixaProenca;

implementation

{$R *.dfm}

procedure TfrmCaixaProenca.bntRemoverItemClick(Sender: TObject);
var
  obj: TProduto;
  ref: integer;
  qtde: integer;
begin
   try
      ref := strToIntDef(edtRemoveProd.Text, 0) -1;
      qtde := strToIntDef(edtRemoveQtde.Text, 0);
      if (ref <= -1) or (qtde = 0)  then
         raise Exception.Create('Valores para remo��o n�o informados');

      FPedidoAtual.Produtos[ref].Qtde := FPedidoAtual.Produtos[ref].Qtde + qtde;
      PreencherPedido;
      ManipularTela('');

   except
      on E: Exception do
         ShowMessage(E.Message);

   end;
end;

procedure TfrmCaixaProenca.btnHabilitarManipulacaoClick(Sender: TObject);
begin
   try
      ManipularTela('M');
   except
      on E: Exception do
         ShowMessage(E.Message);
   end;
end;

procedure TfrmCaixaProenca.btnNovoPedidoClick(Sender: TObject);
begin
   try
      if Assigned(FPedidoAtual) then
         FreeAndNil(FPedidoAtual);

      FPedidoAtual := TPedido.Create;
      FPedidoAtual.Codigo := FUltimoPedido + 1;
      FUltimoPedido := FPedidoAtual.Codigo;
      PreencherPedido;
      ManipularPedido(true);
   except
      on E: Exception do
         ShowMessage(E.Message);
   end;
end;

procedure TfrmCaixaProenca.btnHabilitarRemocaoClick(Sender: TObject);
begin
   try
      ManipularTela('R');
   except
      on E: Exception do
         ShowMessage(E.Message);
   end;
end;

procedure TfrmCaixaProenca.btnPersistirItemClick(Sender: TObject);
var
  obj: TProduto;
  Manipulado: boolean;
  NovoProduto: TProduto;
begin
   Manipulado := false;
   try
      for obj in FPedidoAtual.Produtos do
      begin
         if (((Obj.Codigo= String(edtItemProduto.Text).ToInteger) or (obj.Nome = String(edtItemDesc.Text).Trim.ToUpper)) and (obj.Preco = string(edtItemValor.Text).ToDouble)) then
         begin
            obj.Qtde := obj.Qtde + string(edtItemQtde.Text).ToInteger;
            Manipulado := true;
         end;
      end;
      if not Manipulado then
      begin
         NovoProduto := TProduto.Create;
         NovoProduto.Codigo := String(edtItemProduto.Text).ToInteger;
         NovoProduto.Nome := String(edtItemDesc.Text).Trim.ToUpper;
         NovoProduto.Preco := string(edtItemValor.Text).ToDouble;
         NovoProduto.Qtde := string(edtItemQtde.Text).ToInteger;
         FPedidoAtual.Produtos.Add(NovoProduto);
      end;
      PreencherPedido;
      ManipularTela('');
   except
      on E: Exception do
         ShowMessage(E.Message);
   end;
end;

procedure TfrmCaixaProenca.FormCreate(Sender: TObject);
begin
   FUltimoPedido := 0;
end;

procedure TfrmCaixaProenca.LimparEdit;
begin
   edtItemProduto.Clear;
   edtItemDesc.Clear;
   edtItemQtde.Clear;
   edtItemValor.Clear;
   edtRemoveProd.Clear;
   edtRemoveQtde.Clear;
end;

procedure TfrmCaixaProenca.ManipularTela(Tipo: string);
begin
   try
      if Tipo = 'M' then
      begin
         pnlIncluirItem.Visible := true;
         pnlRemoverItem.Visible := false;
         pnlManipularPedido.Visible := false;
      end;
      if Tipo = 'R' then
      begin
         pnlIncluirItem.Visible := false;
         pnlRemoverItem.Visible := true;
         pnlManipularPedido.Visible := false;
      end;
      if Tipo = '' then
      begin
         pnlIncluirItem.Visible := false;
         pnlRemoverItem.Visible := false;
         pnlManipularPedido.Visible := true;
      end;
   except
      raise;
   end;
end;

procedure TfrmCaixaProenca.ManipularPedido(Aberto: boolean);
begin
   try
      pnlPedido.Visible := aberto;
      pnlCabec.Visible := not aberto;
   except
      raise;
   end;
end;

procedure TfrmCaixaProenca.PreencherPedido;
var
   obj: TProduto;
   TotalPedido: double;
  I: Integer;
begin
   TotalPedido := 0;
   mmPedido.Clear;
   try
      if not Assigned(FPedidoAtual) then
         exit;

      mmPedido.Lines.Add(Format('Pedido: %s', [FPedidoAtual.Codigo.ToString]));
      for I := 0 to FPedidoAtual.Produtos.Count - 1 do
      begin
         TotalPedido := TotalPedido + (FPedidoAtual.Produtos[I].Qtde * FPedidoAtual.Produtos[I].Preco);
         mmPedido.Lines.Add(Format('Identificador: %s | Produto: %s | Desc.:%s | Qtde.: %s | Vlr. Unitario: %s | Vlr. Total: %s', [(I + 1).ToString, FPedidoAtual.Produtos[I].Codigo.ToString, FPedidoAtual.Produtos[I].Nome, FPedidoAtual.Produtos[I].Qtde.ToString, FPedidoAtual.Produtos[I].Preco.ToString,(FPedidoAtual.Produtos[I].Qtde * FPedidoAtual.Produtos[I].Preco).ToString]));
      end;
      lblTotal.Caption := format('Total: %s',[TotalPedido.ToString]);

   except
      raise;
   end;
end;

end.
