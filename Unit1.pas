unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, ComCtrls, ShellAPI, MMSystem;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ImgTrue(Sender: TObject);
    procedure CreateParams(var Params: TCreateParams); override;

private
    { Private declarations }
public
    { Public declarations }
end;

var
  Form1: TForm1;
  i:Integer;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
  var j:integer;
  begin
    ShowCursor(False);
    i:=1;
    //Загрузка изображения в компоненты.
    for j:=1 to 3 do TImage(FindComponent('Image'+IntToStr(j))).Picture.LoadFromFile('Pictures\console'+IntToStr(j)+'.bmp');
  DoubleBuffered:=true;
  end;

procedure TForm1.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
    Style := (Style OR WS_POPUP) AND NOT WS_DLGFRAME;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  begin
    case key of
    VK_LEFT:
      begin
        sndPlaySound('Files\prev.wav',SND_ASYNC);
      Dec(i);
      if i<1 then i:=3;
      ImgTrue(Sender);
      end;
    VK_RIGHT:
      begin
        sndPlaySound('Files\prev.wav',SND_ASYNC);
      Inc(i);
      If i>3 then i:=1;
      ImgTrue(Sender);
      //Image1.Picture.Bitmap.LoadFromFile('name'+IntToStr(i)+'.bmp');
      end;
    VK_RETURN:
      begin
        sndPlaySound('Files\enter.wav',SND_ASYNC);
      if i=1 then
        begin
            if (not Assigned(Form2)) then
            Form2:=TForm2.Create(Self);
            Form2.showmodal;
        end;
      if i=2 then
        begin
            if (not Assigned(Form3)) then
            Form3:=TForm3.Create(Self);
            Form3.showmodal;
        end;
      if i=3 then
        begin
            if (not Assigned(Form4)) then
            Form4:=TForm4.Create(Self);
            Form4.showmodal;
        end;
      end;
    VK_ESCAPE:
    close;
    end;
    end;

procedure TForm1.ImgTrue(Sender: TObject);
  var j:integer;
  begin
  for j:=1 to 3 do
  TPanel(FindComponent('Panel'+IntToStr(j))).BevelWidth:=1;
  TPanel(FindComponent('Panel'+IntToStr(i))).Bevelwidth:=2;
  end;

end.
