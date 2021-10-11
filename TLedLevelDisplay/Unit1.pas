unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    ColorBox1: TColorBox;
    ColorBox2: TColorBox;
    Label2: TLabel;
    Label3: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Redraw;
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure SpinEdit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ColorTo, ColorFrom : TColor;
  Max, Curr : Integer;
implementation

{$R *.dfm}

procedure DrawGradient(ACanvas: TCanvas; Rect: TRect;
Horicontal: Boolean; Colors: array of TColor);
type
RGBArray = array[0..2] of Byte;
var
x, y, z, stelle, mx, bis, faColorsh, mass: Integer;
Faktor: double;
A: RGBArray;
B: array of RGBArray;
merkw: integer;
merks: TPenStyle;
merkp: TColor;
begin
mx := High(Colors);
if mx > 0 then
begin
if Horicontal then
mass := Rect.Right - Rect.Left
else
mass := Rect.Bottom - Rect.Top;
SetLength(b, mx + 1);
for x := 0 to mx do
begin
Colors[x] := ColorToRGB(Colors[x]);
b[x][0] := GetRValue(Colors[x]);
b[x][1] := GetGValue(Colors[x]);
b[x][2] := GetBValue(Colors[x]);
end;
merkw := ACanvas.Pen.Width;
merks := ACanvas.Pen.Style;
merkp := ACanvas.Pen.Color;
ACanvas.Pen.Width := 1;
ACanvas.Pen.Style := psSolid;
faColorsh := Round(mass / mx);
for y := 0 to mx - 1 do
begin
if y = mx - 1 then
bis := mass - y * faColorsh - 1
else
bis := faColorsh;
for x := 0 to bis do
begin
Stelle := x + y * faColorsh;
faktor := x / bis;
for z := 0 to 3 do
a[z] := Trunc(b[y][z] + ((b[y + 1][z] - b[y][z]) * Faktor));
ACanvas.Pen.Color := RGB(a[0], a[1], a[2]);
if Horicontal then
begin
ACanvas.MoveTo(Rect.Left + Stelle, Rect.Top);
ACanvas.LineTo(Rect.Left + Stelle, Rect.Bottom);
end
else
begin
ACanvas.MoveTo(Rect.Left, Rect.Top + Stelle);
ACanvas.LineTo(Rect.Right, Rect.Top + Stelle);
end;
end;
end;
b := nil;
ACanvas.Pen.Width := merkw;
ACanvas.Pen.Style := merks;
ACanvas.Pen.Color := merkp;
end
else
// Please specify at least two colors
raise EMathError.Create('В списке менее двух цветов');
end;

procedure TForm1.Redraw;
var w,h,i, Range : Integer;
begin
  Range := Curr;
  Image1.Canvas.Brush.Color := clBtnFace;
  Image1.Canvas.FillRect(Rect(0, 0, Image1.Width, Image1.Height));
  if Max = 0 then exit;
  w := Image1.Width div Max;
  h := Image1.Height div Max;

  if curr = 0 then exit;

  for i := 1 to Range do begin
    Image1.Canvas.Brush.Color := clBlack;
    DrawGradient(Image1.Canvas, Rect(w*(i-1), 0, w*i, Image1.Height), false, [ColorTo, ColorFrom]);
    Image1.Canvas.FrameRect(Rect(w*(i-1), Image1.Height - h*i, w*(i), Image1.Height));
    Image1.Canvas.Brush.Color := clBtnFace;
    Image1.Canvas.FillRect(Rect(w*(i-1), 0, w*i, Image1.Height - h*i));
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ColorTo := clBlue;
  ColorFrom := clNavy;
  Max := 10;
  Curr := 3;
  redraw;
end;

procedure TForm1.ColorBox1Change(Sender: TObject);
begin
  ColorFrom := ColorBox1.Selected;
  Redraw;
end;

procedure TForm1.ColorBox2Change(Sender: TObject);
begin
  ColorTo := ColorBox2.Selected;
  Redraw;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  Max := SpinEdit1.Value;
  If SpinEdit2.Value > Max then SpinEdit2.Value := Max;
  Curr := SpinEdit2.Value;
  SpinEdit2.MaxValue := Max;
  Redraw;
end;

procedure TForm1.SpinEdit2Change(Sender: TObject);
begin
  Curr := SpinEdit2.Value;
  Redraw;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 Redraw;
end;

end.
