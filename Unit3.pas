unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, ComCtrls, ShellAPI, MMSystem;

type
  TForm3 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    Image1: TImage;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure TimerTimer(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  i,a:Integer;
implementation

{$R *.dfm}
procedure TForm3.FormCreate(Sender: TObject);
begin
i:=0;
a:=1;
image1.Picture.Bitmap.LoadFromFile('Pictures\SEGA\name.bmp');
DoubleBuffered := true;
end;

procedure TForm3.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style := (Style OR WS_POPUP) AND NOT WS_DLGFRAME;
end;

procedure TForm3.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_RIGHT:
    begin
      sndPlaySound('Files\prev.wav',SND_ASYNC);
    a:=1;
    i:=i+a;
    if i=27 then
    i:=1;
    if i=0 then
    i:=26;
    image1.Picture.Bitmap.LoadFromFile('Pictures\SEGA\name'+IntToStr(i)+'.bmp');
    end;
  VK_LEFT:
    begin
      sndPlaySound('Files\prev.wav',SND_ASYNC);
    a:=-1;
    i:=i+a;
    if i=27 then
    i:=1;
    if i<=0 then
    i:=26;
    image1.Picture.Bitmap.LoadFromFile('Pictures\SEGA\name'+IntToStr(i)+'.bmp');
    end;
  VK_RETURN:
    begin
      sndPlaySound('Files\enter.wav',SND_ASYNC);
    ShellExecute(Handle, nil, PChar('Games\SEGA\game'+IntToStr(i)+'.bin'), nil, nil, SW_SHOWNORMAL);
    end;
  VK_ESCAPE:
  close;
    end;
    Label1.Caption:=('Game '+inttostr(i)+' of 26');
end;
procedure TForm3.TimerTimer(Sender: TObject);
begin
Label2.Caption:=TimeToStr(Now);
end;
end.
