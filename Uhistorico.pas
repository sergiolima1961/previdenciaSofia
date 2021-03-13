unit Uhistorico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls;

type
  TFhistorico = class(TForm)
    salariogrid: TStringGrid;
    Button1: TButton;
    Stx2: TStringGrid;
    Ftd: TMemo;
    RCe: TRichEdit;
    Label2: TLabel;
    PB1: TProgressBar;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    function Existechar2(Const Texto: String): Boolean;
    procedure limpa2x;
    procedure Button2Click(Sender: TObject);
    procedure recolhesal;
    procedure recolhesal2;
    procedure recolhesal3;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fhistorico: TFhistorico;

implementation

{$R *.dfm}

procedure TFhistorico.Button1Click(Sender: TObject);
var
  i, ix: Integer;
begin
  Label2.Caption := '-';
  Stx2.ColCount := salariogrid.ColCount;
  Stx2.RowCount := salariogrid.RowCount;
  Stx2.Cols[0].CommaText := salariogrid.Cols[0].CommaText;

  for i := 1 to Stx2.ColCount - 1 do
    Stx2.Cols[i].Clear;

  Memo1.Lines.Clear;
  Memo1.PasteFromClipboard;
  RCe.Lines.Clear;
  RCe.Text := Memo1.Text;
  limpa2x;

  for i := 1 to salariogrid.RowCount - 1 do
    for ix := 1 to salariogrid.ColCount - 1 do
    begin
      if Existechar2(salariogrid.Cells[ix, i]) = true then
        salariogrid.Cells[ix, i] := '';
    end;
  Label2.Caption :=
    'A transferência terminou, verifique todos os valores se foram ' +
    'lançados corretamente, para maiores detalhes clique no botão Ajuda.';
end;

procedure TFhistorico.limpa2x;
var
  i: Integer;
  s, s1: string;
begin
  PB1.Position := 0;
  if RCe.Lines.Count > 0 then
  begin

    for i := RCe.Lines.Count - 1 downto 0 do
      if Trim(RCe.Lines[i]) = '' then
        RCe.Lines.Delete(i);

    for i := 0 to RCe.Lines.Count - 1 do
    begin
      RCe.Lines[i] := Trim(RCe.Lines[i]);
    end;

    PB1.Position := 10;

    for i := RCe.Lines.Count - 1 downto 1 do
    begin
      if (Ftd.Textoexiste(LowerCase(RCe.Lines[i - 1]),
        LowerCase('Origem do Vínculo')) = true) and
        (Ftd.Textoexiste(LowerCase(RCe.Lines[i - 1]), LowerCase('NIT')) = true)
        and (Ftd.Textoexiste(LowerCase(RCe.Lines[i - 1]), LowerCase('Seq.'))
        = true) then
      begin
        RCe.Lines.Delete(i);
      end;
    end;

    { for i := Rce.Lines.Count-1 downto 0 do begin
      s:= Rce.Lines[i];
      if length(s) > 6 then begin
      if s[3] <> '/' then
      if Ftd.Existechar(Rce.Lines.Strings[i]) = true then
      Rce.Lines.Delete(i)
      else begin
      if s[3] = '/' then
      if s[6] = '/' then
      Rce.Lines.Delete(i);
      end;
      end;
      end; }

    for i := RCe.Lines.Count - 1 downto 0 do
    begin
      s := RCe.Lines[i];
      if length(s) < 9 then
        if Ftd.Existechar(RCe.Lines.Strings[i]) = true then
          RCe.Lines.Delete(i);
    end;

    for i := RCe.Lines.Count - 1 downto 0 do
    begin
      s := RCe.Lines[i];
      if Existechar(RCe.Lines.Strings[i]) = true then
        RCe.Lines.Delete(i);
    end;

    arrumaconc;

    PB1.Position := 30;
    quebrarLinhasMemo(RCe, ' ');
    PB1.Position := 60;
    /// ///////////////////////////////////////////////coloquei agora teste
    for i := RCe.Lines.Count - 1 downto 0 do
    begin
      s := RCe.Lines[i];
      if Ftd.Existechar(RCe.Lines.Strings[i]) = true then
        RCe.Lines.Delete(i);
    end;

    for i := RCe.Lines.Count - 1 downto 0 do
    begin
      s := RCe.Lines[i];
      if length(s) > 6 then
      begin
        if s[3] = '/' then
          if s[6] = '/' then
          begin
            if i > 1 then
            begin
              s1 := RCe.Lines[i - 1];
              if length(s1) > 3 then
                if s1[3] <> '/' then
                begin
                  RCe.Lines[i] := s1;
                  RCe.Lines[i - 1] := s;
                end;
            end;
          end;
      end;
    end;
    /// ///////////////////////////////////////////////coloquei agora teste

    for i := RCe.Lines.Count - 1 downto 0 do
    begin
      s := RCe.Lines[i];
      if Ftd.Existechar(RCe.Lines.Strings[i]) = true then
        RCe.Lines.Delete(i);
    end;

    PB1.Position := 70;

    for i := RCe.Lines.Count - 1 downto 0 do
      if Trim(RCe.Lines[i]) = '' then
        RCe.Lines.Delete(i);

    PB1.Position := 80;

    limpa;
    /// coloca @

    PB1.Position := 90;
    for i := RCe.Lines.Count - 1 downto 0 do
      if Ftd.Existechara(RCe.Lines[i]) = true then
      begin
        RCe.Lines.Delete(i);
        s := RCe.Lines[i];
        if length(s) > 3 then
          if s[3] <> '/' then
            RCe.Lines.Delete(i);
      end;
    PB1.Position := 100;

    if Cnaomod.Checked = true then
      recolhesal2
    else
      recolhesal3;
    Memo1.Lines.Clear;
    Memo2.Lines.Clear;
    Rtemp.Lines.Clear;
    RCe.Lines.Clear;
    Rce2.Lines.Clear;
    PB1.Position := 0;
  end;
end;

procedure TFhistorico.Button2Click(Sender: TObject);
var
  i, ix: Integer;
begin
  Label2.Caption := '-';
  Stx2.ColCount := salariogrid.ColCount;
  Stx2.RowCount := salariogrid.RowCount;
  Stx2.Cols[0].CommaText := salariogrid.Cols[0].CommaText;

  for i := 1 to Stx2.ColCount - 1 do
    Stx2.Cols[i].Clear;

  Memo1.Lines.Clear;
  Memo1.PasteFromClipboard;
  RCe.Lines.Clear;
  RCe.Text := Memo1.Text;
  limpa2x;

  for i := 1 to salariogrid.RowCount - 1 do
  begin
    for ix := 1 to salariogrid.ColCount - 1 do
    begin
      if Existechar2(salariogrid.Cells[ix, i]) = true then
        salariogrid.Cells[ix, i] := '';
    end;
  end;
  Label2.Caption :=
    'A transferência terminou, verifique todos os valores se foram ' +
    'lançados corretamente, para maiores detalhes clique no botão Ajuda.';

end;

function TFhistorico.Existechar2(Const Texto: String): Boolean;
var
  s: string;
  i: Integer;
begin
  s := '1';
  for i := 1 To length(Texto) Do
  begin
    if CharInSet(Texto[i], ['/']) then
    begin
      s := '2';
      break;
    end;
  end;
  if s = '2' then
    result := true
  else
    result := false;
end;

procedure TFhistorico.recolhesal2;
var
  i, ix, iz, ixx: Integer;
  s: string;
begin
  if RCe.Lines.Count > 0 then
  begin
    for i := 0 to RCe.Lines.Count - 1 do
    begin
      ixx := 1;
      for ix := 1 to salariogrid.RowCount - 1 do
      begin
        if Trim(RCe.Lines.Strings[i]) = Trim(salariogrid.Cells[0, ix]) then
        begin

          iz := 1;
          repeat
            if Trim(salariogrid.Cells[iz, ix]) = '' then
            begin
              salariogrid.Cells[iz, ix] := RCe.Lines.Strings[i + 1];
              ixx := 2;
              break;
            end
            else
            begin
              if iz = salariogrid.ColCount - 2 then
              begin
                s := salariogrid.Cols[salariogrid.ColCount - 1].CommaText;
                salariogrid.Cols[salariogrid.ColCount - 1].Clear;
                salariogrid.Cells[salariogrid.ColCount - 1, 0] :=
                  'Salário concomitante';
                salariogrid.ColCount := salariogrid.ColCount + 1;
                salariogrid.Cols[salariogrid.ColCount - 1].CommaText := s;
                inc(iz);
                salariogrid.Cells[iz, ix] := RCe.Lines.Strings[i + 1];
                ixx := 2;
                break;
              end;
            end;
            inc(iz);
          until iz >= salariogrid.ColCount;
          salariogrid.Row := ix;
        end;
        if ixx = 2 then
          break;
      end;
    end;
  end;
end;

procedure TFhistorico.recolhesal3;
var
  i, ix: Integer;
begin
  if RCe.Lines.Count > 0 then
  begin
    for i := 0 to RCe.Lines.Count - 1 do
    begin
      for ix := 1 to salariogrid.RowCount - 1 do
      begin
        if Trim(RCe.Lines.Strings[i]) = Trim(salariogrid.Cells[0, ix]) then
        begin

          if Trim(salariogrid.Cells[salariogrid.Col, ix]) = '' then
          begin
            salariogrid.Cells[salariogrid.Col, ix] := RCe.Lines.Strings[i + 1];
            salariogrid.Row := ix;
            break;
          end;

        end;
      end;
    end;
  end;
end;

procedure TFhistorico.recolhesal;
var
  i, ix, ixx, iz: Integer;
begin
  if RCe.Lines.Count > 0 then
  begin
    for i := 0 to RCe.Lines.Count - 1 do
    begin
      for ix := 1 to Stx2.RowCount - 1 do
      begin
        if Trim(RCe.Lines.Strings[i]) = Trim(Stx2.Cells[0, ix]) then
        begin

          for iz := 1 to Stx2.ColCount - 1 do
          begin
            if Trim(Stx2.Cells[iz, ix]) = '' then
            begin
              Stx2.Cells[iz, ix] := RCe.Lines.Strings[i + 1];
              break;
            end;
          end;

          { if Trim(Stx2.Cells[1,ix]) = '' then
            Stx2.Cells[1,ix]:= Rce.Lines.Strings[i+1]
            else begin
            if Trim(Stx2.Cells[2,ix]) = '' then
            Stx2.Cells[2,ix]:= Rce.Lines.Strings[i+1]
            else begin
            if Trim(Stx2.Cells[3,ix]) = '' then
            Stx2.Cells[3,ix]:= Rce.Lines.Strings[i+1]
            else
            Stx2.Cells[4,ix]:= Rce.Lines.Strings[i+1];
            end;
            end; }
          // salariogrid.Row:= ix;
        end;
      end;
    end;
  end;

  ixx := 0;
  for i := 1 to salariogrid.RowCount - 1 do
  begin
    if Trim(Stx2.Cells[1, i]) <> '' then
    begin
      if Trim(salariogrid.Cells[1, i]) <> '' then
        ixx := 1;
      break;
    end;
    if Trim(Stx2.Cells[2, i]) <> '' then
    begin
      if Trim(salariogrid.Cells[2, i]) <> '' then
        ixx := 1;
      break;
    end;
    if Trim(Stx2.Cells[3, i]) <> '' then
    begin
      if Trim(salariogrid.Cells[3, i]) <> '' then
        ixx := 1;
      break;
    end;
    if Trim(Stx2.Cells[4, i]) <> '' then
    begin
      if Trim(salariogrid.Cells[4, i]) <> '' then
        ixx := 1;
      break;
    end;
  end;

  if ixx = 1 then
  begin
    if Ftd.MessageDlgDefault
      ('Os valores escolhidos vão se sobrepor, para que isso ' +
      'não aconteça marque a opção "Colocar valores concomitantes na próxima coluna". '
      + 'Para continuar escolha Sim ou escolha não para marcar a opção.',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      abort;
    end;
  end;

  for i := 1 to salariogrid.RowCount - 1 do
  begin
    if Trim(Stx2.Cells[1, i]) <> '' then
    begin
      salariogrid.Cells[1, i] := Stx2.Cells[1, i];
      salariogrid.Row := i;
    end;
    if Trim(Stx2.Cells[2, i]) <> '' then
    begin
      salariogrid.Cells[2, i] := Stx2.Cells[2, i];
      salariogrid.Row := i;
    end;
    if Trim(Stx2.Cells[3, i]) <> '' then
    begin
      salariogrid.Cells[3, i] := Stx2.Cells[3, i];
      salariogrid.Row := i;
    end;
    if Trim(Stx2.Cells[4, i]) <> '' then
    begin
      salariogrid.Cells[4, i] := Stx2.Cells[4, i];
      salariogrid.Row := i;
    end;

  end;
end;

end.
