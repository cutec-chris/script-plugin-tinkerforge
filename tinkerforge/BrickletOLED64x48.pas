{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletOLED64x48;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_OLED_64X48_DEVICE_IDENTIFIER = 264;
  BRICKLET_OLED_64X48_DEVICE_DISPLAY_NAME = 'OLED 64x48 Bricklet';

  BRICKLET_OLED_64X48_FUNCTION_WRITE = 1;
  BRICKLET_OLED_64X48_FUNCTION_NEW_WINDOW = 2;
  BRICKLET_OLED_64X48_FUNCTION_CLEAR_DISPLAY = 3;
  BRICKLET_OLED_64X48_FUNCTION_SET_DISPLAY_CONFIGURATION = 4;
  BRICKLET_OLED_64X48_FUNCTION_GET_DISPLAY_CONFIGURATION = 5;
  BRICKLET_OLED_64X48_FUNCTION_WRITE_LINE = 6;
  BRICKLET_OLED_64X48_FUNCTION_GET_IDENTITY = 255;



type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To63OfUInt8 = array [0..63] of byte;

  /// <summary>
  ///  0.66" OLED with 64x48 pixels
  /// </summary>
  TBrickletOLED64x48 = class(TDevice)
  private
  protected
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Appends 64 byte of data to the window as set by <see cref="BrickletOLED64x48.TBrickletOLED64x48.NewWindow"/>.
    ///  
    ///  Each row has a height of 8 pixels which corresponds to one byte of data.
    ///  
    ///  Example: if you call <see cref="BrickletOLED64x48.TBrickletOLED64x48.NewWindow"/> with column from 0 to 63 and row
    ///  from 0 to 5 (the whole display) each call of <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> (red arrow) will
    ///  write one row.
    ///  
    ///  .. image:: /Images/Bricklets/bricklet_oled_64x48_display.png
    ///     :scale: 100 %
    ///     :alt: Display pixel order
    ///     :align: center
    ///     :target: ../../_images/Bricklets/bricklet_oled_64x48_display.png
    ///  
    ///  The LSB (D0) of each data byte is at the top and the MSB (D7) is at the 
    ///  bottom of the row.
    ///  
    ///  The next call of <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> will write the second row and so on. To
    ///  fill the whole display you need to call <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> 6 times.
    /// </summary>
    procedure Write(const data: TArray0To63OfUInt8); virtual;

    /// <summary>
    ///  Sets the window in which you can write with <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/>. One row
    ///  has a height of 8 pixels.
    ///  
    ///  The columns have a range of 0 to 63 and the rows have a range of 0 to 5.
    /// </summary>
    procedure NewWindow(const columnFrom: byte; const columnTo: byte; const rowFrom: byte; const rowTo: byte); virtual;

    /// <summary>
    ///  Clears the current content of the display.
    /// </summary>
    procedure ClearDisplay; virtual;

    /// <summary>
    ///  Sets the configuration of the display.
    ///  
    ///  You can set a contrast value from 0 to 255 and you can invert the color
    ///  (black/white) of the display.
    ///  
    ///  The default values are contrast 143 and inverting off.
    /// </summary>
    procedure SetDisplayConfiguration(const contrast: byte; const invert: boolean); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletOLED64x48.TBrickletOLED64x48.SetDisplayConfiguration"/>.
    /// </summary>
    procedure GetDisplayConfiguration(out contrast: byte; out invert: boolean); virtual;

    /// <summary>
    ///  Writes text to a specific line (0 to 5) with a specific position 
    ///  (0 to 13). The text can have a maximum of 14 characters.
    ///  
    ///  For example: (1, 4, "Hello") will write *Hello* in the middle of the
    ///  second line of the display.
    ///  
    ///  You can draw to the display with <see cref="BrickletOLED64x48.TBrickletOLED64x48.Write"/> and then add text to it
    ///  afterwards.
    ///  
    ///  The display uses a special 5x7 pixel charset. You can view the characters 
    ///  of the charset in Brick Viewer.
    /// </summary>
    procedure WriteLine(const line: byte; const position: byte; const text: string); virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Bricklet is connected to, 
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be 'a', 'b', 'c' or 'd'.
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word); override;
  end;

implementation

constructor TBrickletOLED64x48.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_OLED_64X48_FUNCTION_WRITE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_OLED_64X48_FUNCTION_NEW_WINDOW] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_OLED_64X48_FUNCTION_CLEAR_DISPLAY] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_OLED_64X48_FUNCTION_SET_DISPLAY_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_OLED_64X48_FUNCTION_GET_DISPLAY_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_OLED_64X48_FUNCTION_WRITE_LINE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_OLED_64X48_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

end;

procedure TBrickletOLED64x48.Write(const data: TArray0To63OfUInt8);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_WRITE, 72);
  for i := 0 to Length(data) - 1 do LEConvertUInt8To(data[i], 8 + (i * 1), request);
  SendRequest(request);
end;

procedure TBrickletOLED64x48.NewWindow(const columnFrom: byte; const columnTo: byte; const rowFrom: byte; const rowTo: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_NEW_WINDOW, 12);
  LEConvertUInt8To(columnFrom, 8, request);
  LEConvertUInt8To(columnTo, 9, request);
  LEConvertUInt8To(rowFrom, 10, request);
  LEConvertUInt8To(rowTo, 11, request);
  SendRequest(request);
end;

procedure TBrickletOLED64x48.ClearDisplay;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_CLEAR_DISPLAY, 8);
  SendRequest(request);
end;

procedure TBrickletOLED64x48.SetDisplayConfiguration(const contrast: byte; const invert: boolean);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_SET_DISPLAY_CONFIGURATION, 10);
  LEConvertUInt8To(contrast, 8, request);
  LEConvertBooleanTo(invert, 9, request);
  SendRequest(request);
end;

procedure TBrickletOLED64x48.GetDisplayConfiguration(out contrast: byte; out invert: boolean);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_GET_DISPLAY_CONFIGURATION, 8);
  response := SendRequest(request);
  contrast := LEConvertUInt8From(8, response);
  invert := LEConvertBooleanFrom(9, response);
end;

procedure TBrickletOLED64x48.WriteLine(const line: byte; const position: byte; const text: string);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_WRITE_LINE, 23);
  LEConvertUInt8To(line, 8, request);
  LEConvertUInt8To(position, 9, request);
  LEConvertStringTo(text, 10, 13, request);
  SendRequest(request);
end;

procedure TBrickletOLED64x48.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_OLED_64X48_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

end.
