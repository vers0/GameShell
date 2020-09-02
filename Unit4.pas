unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, ComCtrls, ShellAPI, MMSystem;

type
  TForm4 = class(TForm)
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
  Form4: TForm4;
  i,a:Integer;
implementation

{$R *.dfm}
procedure TForm4.FormCreate(Sender: TObject);
begin
i:=0;
a:=1;
image1.Picture.Bitmap.LoadFromFile('Pictures\PC\name.bmp');
DoubleBuffered := true;
end;

procedure TForm4.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style := (Style OR WS_POPUP) AND NOT WS_DLGFRAME;
end;

procedure TForm4.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
  VK_RIGHT:
    begin
      sndPlaySound('Files\prev.wav',SND_ASYNC);
    a:=1;
    i:=i+a;
    if i=5 then
    i:=1;
    if i=0 then
    i:=4;
    image1.Picture.Bitmap.LoadFromFile('Pictures\PC\name'+IntToStr(i)+'.bmp');
    end;
  VK_LEFT:
    begin
      sndPlaySound('Files\prev.wav',SND_ASYNC);
    a:=-1;
    i:=i+a;
    if i=5 then
    i:=1;
    if i<=0 then
    i:=4;
    image1.Picture.Bitmap.LoadFromFile('Pictures\PC\name'+IntToStr(i)+'.bmp');
    end;
  VK_RETURN:
    begin
      sndPlaySound('Files\enter.wav',SND_ASYNC);
    ShellExecute(Handle, nil, PChar('Games\PC\game'+IntToStr(i)+'.lnk'), nil, nil, SW_SHOWNORMAL);
    end;
  VK_ESCAPE:
  close;
    end;
    Label1.Caption:=('Game '+inttostr(i)+' of 4');
end;
procedure TForm4.TimerTimer(Sender: TObject);
begin
Label2.Caption:=TimeToStr(Now);
end;
end.
