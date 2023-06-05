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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

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
ZQuery1.SQL.Add(' delete from kustomer where idkustomer=4');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;
bersih;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('Update kustomer set nmkustomer= "'+edt1.Text+'" where idkustomer=1');
ZQuery1. ExecSQL;

ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;

bersih;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 tampilanawal;
end;

procedure TForm1.tampilanawal;
begin
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

end.
