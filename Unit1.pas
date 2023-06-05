unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TForm1 = class(TForm)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tampilanawal;
    procedure btn5Click(Sender: TObject);
    procedure bersih;
    procedure dbgrd1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id : string;

implementation

{$R *.dfm}

procedure TForm1.btn2Click(Sender: TObject);
begin
if edt1.Text = '' then
begin
 ShowMessage('NAMA KUSTOMER WAJIB DIISI!');
end else
if edt2.Text = '' then
begin
 ShowMessage('NO TELEPON WAJIB DIISI!');
end else
if edt4.Text = '' then
begin
 ShowMessage('KOTA WAJIB DIISI!');
end else
if edt3.Text = '' then
begin
 ShowMessage('ALAMAT WAJIB DIISI!');
end else
if edt5.Text = '' then
begin
 ShowMessage('KODEPOS WAJIB DIISI!');
end else
if ZQuery1.Locate('nmkustomer',edt1.Text,[]) and ZQuery1.Locate('telp',edt2.Text,[]) then
begin
 ShowMessage('NAMA TERSEBUT SUDAH DIGUNAKAN!');
end else
begin
ZQuery1.SQL.Clear; //Kode simpan
ZQuery1.SQL.Add('insert into kustomer values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'")');
ZQuery1.ExecSQL ;

ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;
bersih;
end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
btn1.Enabled:= False;
btn2.Enabled:= True;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= True;
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from kustomer where idkustomer="'+id+'"');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DI HAPUS!');
bersih;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
if (edt1.Text = '')or(edt2.Text='') then
begin
 ShowMessage('DATA TIDAK BOLEH KOSONG!');
end else
if (edt1.Text = ZQuery1.Fields[1].AsString)and (edt2.Text = ZQuery1.Fields[2].AsString)then
begin
ShowMessage('DATA TIDAK ADA PERUBAHAN');
tampilanawal;
end else
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('Update kustomer set nmkustomer= "'+edt1.Text+'",telp = "'+edt2.Text+'" where idkustomer="'+id+'"');
ZQuery1. ExecSQL;

ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;
ShowMessage('DATA BERHASIL DIRUBAH');
bersih;
end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 tampilanawal;
end;

procedure TForm1.tampilanawal;
begin
btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
edt1.Enabled:= False;
edt2.Enabled:= False;
edt3.Enabled:= False;
edt4.Enabled:= False;
edt5.Enabled:= False;
bersih;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
tampilanawal;
end;

procedure TForm1.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
 id:= ZQuery1.Fields[0].AsString;
btn1.Enabled:= False;
btn2.Enabled:= False;
btn3.Enabled:= True;
btn4.Enabled:= True;
btn5.Enabled:= True;
edt1.Enabled:= True;
edt2.Enabled:= True;
edt3.Enabled:= True;
edt4.Enabled:= True;
edt5.Enabled:= True;

edt1.Text := ZQuery1.Fields[1].AsString;
edt2.Text := ZQuery1.Fields[2].AsString;
edt3.Text := ZQuery1.Fields[3].AsString;
edt4.Text := ZQuery1.Fields[4].AsString;
edt5.Text := ZQuery1.Fields[5].AsString;
end;

end.
