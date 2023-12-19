unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btn1: TButton;
    mmo1: TMemo;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  inputValue: Double;
  inputText: string;
begin

  inputText := Trim(Edit1.Text);

  mmo1.Lines.Add('Виведено: ' + inputText);

  inputText := StringReplace(inputText, '.', DecimalSeparator, [rfReplaceAll]);
  inputText := StringReplace(inputText, ',', DecimalSeparator, [rfReplaceAll]);

  if TryStrToFloat(inputText, inputValue) then
  begin

    mmo1.Lines.Add('Конвертовано в число:  ' + FloatToStr(inputValue));

    mmo1.Lines.Add('Результати:');

    if (inputValue >= 0) and (inputValue < 0.5) then
      mmo1.Lines.Add('Неполярний: так')
    else
      mmo1.Lines.Add('Неполярний: ні');

    if (inputValue >= 0.5) and (inputValue <= 1.9) then
      mmo1.Lines.Add('Полярний: так')
    else
      mmo1.Lines.Add('Полярний: ні');

    if (inputValue > 1.9) then
      mmo1.Lines.Add('Іонний: так')
    else
      mmo1.Lines.Add('Іонний: ні');
  end
  else
    mmo1.Lines.Add('Помилка: Невірний формат числа');
end;

end.

