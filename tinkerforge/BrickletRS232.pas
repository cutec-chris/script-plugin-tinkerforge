{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletRS232;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_RS232_DEVICE_IDENTIFIER = 254;
  BRICKLET_RS232_DEVICE_DISPLAY_NAME = 'RS232 Bricklet';

  BRICKLET_RS232_FUNCTION_WRITE = 1;
  BRICKLET_RS232_FUNCTION_READ = 2;
  BRICKLET_RS232_FUNCTION_ENABLE_READ_CALLBACK = 3;
  BRICKLET_RS232_FUNCTION_DISABLE_READ_CALLBACK = 4;
  BRICKLET_RS232_FUNCTION_IS_READ_CALLBACK_ENABLED = 5;
  BRICKLET_RS232_FUNCTION_SET_CONFIGURATION = 6;
  BRICKLET_RS232_FUNCTION_GET_CONFIGURATION = 7;
  BRICKLET_RS232_FUNCTION_SET_BREAK_CONDITION = 10;
  BRICKLET_RS232_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_RS232_CALLBACK_READ_CALLBACK = 8;
  BRICKLET_RS232_CALLBACK_ERROR_CALLBACK = 9;

  BRICKLET_RS232_BAUDRATE_300 = 0;
  BRICKLET_RS232_BAUDRATE_600 = 1;
  BRICKLET_RS232_BAUDRATE_1200 = 2;
  BRICKLET_RS232_BAUDRATE_2400 = 3;
  BRICKLET_RS232_BAUDRATE_4800 = 4;
  BRICKLET_RS232_BAUDRATE_9600 = 5;
  BRICKLET_RS232_BAUDRATE_14400 = 6;
  BRICKLET_RS232_BAUDRATE_19200 = 7;
  BRICKLET_RS232_BAUDRATE_28800 = 8;
  BRICKLET_RS232_BAUDRATE_38400 = 9;
  BRICKLET_RS232_BAUDRATE_57600 = 10;
  BRICKLET_RS232_BAUDRATE_115200 = 11;
  BRICKLET_RS232_BAUDRATE_230400 = 12;
  BRICKLET_RS232_PARITY_NONE = 0;
  BRICKLET_RS232_PARITY_ODD = 1;
  BRICKLET_RS232_PARITY_EVEN = 2;
  BRICKLET_RS232_PARITY_FORCED_PARITY_1 = 3;
  BRICKLET_RS232_PARITY_FORCED_PARITY_0 = 4;
  BRICKLET_RS232_STOPBITS_1 = 1;
  BRICKLET_RS232_STOPBITS_2 = 2;
  BRICKLET_RS232_WORDLENGTH_5 = 5;
  BRICKLET_RS232_WORDLENGTH_6 = 6;
  BRICKLET_RS232_WORDLENGTH_7 = 7;
  BRICKLET_RS232_WORDLENGTH_8 = 8;
  BRICKLET_RS232_HARDWARE_FLOWCONTROL_OFF = 0;
  BRICKLET_RS232_HARDWARE_FLOWCONTROL_ON = 1;
  BRICKLET_RS232_SOFTWARE_FLOWCONTROL_OFF = 0;
  BRICKLET_RS232_SOFTWARE_FLOWCONTROL_ON = 1;
  BRICKLET_RS232_ERROR_OVERRUN = 1;
  BRICKLET_RS232_ERROR_PARITY = 2;
  BRICKLET_RS232_ERROR_FRAMING = 4;

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To59OfChar = array [0..59] of char;

  TBrickletRS232 = class;
  TBrickletRS232NotifyReadCallback = procedure(sender: TBrickletRS232; const message2: TArray0To59OfChar; const length2: byte) of object;
  TBrickletRS232NotifyErrorCallback = procedure(sender: TBrickletRS232; const error: byte) of object;

  /// <summary>
  ///  Communicates with RS232 devices
  /// </summary>
  TBrickletRS232 = class(TDevice)
  private
    readCallbackCallback: TBrickletRS232NotifyReadCallback;
    errorCallbackCallback: TBrickletRS232NotifyErrorCallback;
  protected
    procedure CallbackWrapperReadCallback(const packet: TByteArray); virtual;
    procedure CallbackWrapperErrorCallback(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Writes a string of up to 60 characters to the RS232 interface. The string
    ///  can be binary data, ASCII or similar is not necessary.
    ///  
    ///  The length of the string has to be given as an additional parameter.
    ///  
    ///  The return value is the number of bytes that could be written.
    ///  
    ///  See :func:`SetConfigurations` for configuration possibilities
    ///  regarding baudrate, parity and so on.
    /// </summary>
    function Write(const message2: TArray0To59OfChar; const length2: byte): byte; virtual;

    /// <summary>
    ///  Returns the currently buffered message. The maximum length
    ///  of message is 60. If the length is given as 0, there was no
    ///  new data available.
    ///  
    ///  Instead of polling with this function, you can also use
    ///  callbacks. See <see cref="BrickletRS232.TBrickletRS232.EnableReadCallback"/> and <see cref="BrickletRS232.TBrickletRS232.ReadCallback"/>.
    /// </summary>
    procedure Read(out message2: TArray0To59OfChar; out length2: byte); virtual;

    /// <summary>
    ///  Enables the <see cref="BrickletRS232.TBrickletRS232.ReadCallback"/>.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure EnableReadCallback; virtual;

    /// <summary>
    ///  Disables the <see cref="BrickletRS232.TBrickletRS232.ReadCallback"/>.
    ///  
    ///  By default the callback is disabled.
    /// </summary>
    procedure DisableReadCallback; virtual;

    /// <summary>
    ///  Returns *true* if the <see cref="BrickletRS232.TBrickletRS232.ReadCallback"/> is enabled,
    ///  *false* otherwise.
    /// </summary>
    function IsReadCallbackEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the configuration for the RS232 communication. Available options:
    ///  
    ///  * Baudrate between 300 and 230400 baud.
    ///  * Parity of none, odd, even or forced parity.
    ///  * Stopbits can be 1 or 2.
    ///  * Word length of 5 to 8.
    ///  * Hard-/Software flow control can each be on or off.
    ///  
    ///  The default is: 115200 baud, parity none, 1 stop bit, word length 8, hard-/software flow control off.
    /// </summary>
    procedure SetConfiguration(const baudrate: byte; const parity: byte; const stopbits: byte; const wordlength: byte; const hardwareFlowcontrol: byte; const softwareFlowcontrol: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletRS232.TBrickletRS232.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out baudrate: byte; out parity: byte; out stopbits: byte; out wordlength: byte; out hardwareFlowcontrol: byte; out softwareFlowcontrol: byte); virtual;

    /// <summary>
    ///  Sets a break condition (the TX output is forced to a logic 0 state). 
    ///  The parameter sets the hold-time of the break condition (in ms). 
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    /// </summary>
    procedure SetBreakCondition(const breakTime: word); virtual;

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

    /// <summary>
    ///  This callback is called if new data is available. The message has
    ///  a maximum size of 60 characters. The actual length of the message
    ///  is given in addition.
    ///  
    ///  To enable this callback, use <see cref="BrickletRS232.TBrickletRS232.EnableReadCallback"/>.
    /// </summary>
    property OnReadCallback: TBrickletRS232NotifyReadCallback read readCallbackCallback write readCallbackCallback;

    /// <summary>
    ///  This callback is called if an error occurs. 
    ///  Possible errors are overrun, parity or framing error.
    ///  
    ///  .. versionadded:: 2.0.1$nbsp;(Plugin)
    /// </summary>
    property OnErrorCallback: TBrickletRS232NotifyErrorCallback read errorCallbackCallback write errorCallbackCallback;
  end;

implementation

constructor TBrickletRS232.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 2;

  responseExpected[BRICKLET_RS232_FUNCTION_WRITE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_RS232_FUNCTION_READ] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_RS232_FUNCTION_ENABLE_READ_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_RS232_FUNCTION_DISABLE_READ_CALLBACK] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_RS232_FUNCTION_IS_READ_CALLBACK_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_RS232_FUNCTION_SET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_RS232_FUNCTION_GET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_RS232_CALLBACK_READ_CALLBACK] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_RS232_CALLBACK_ERROR_CALLBACK] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_RS232_FUNCTION_SET_BREAK_CONDITION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_RS232_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_RS232_CALLBACK_READ_CALLBACK] := {$ifdef FPC}@{$endif}CallbackWrapperReadCallback;
  callbackWrappers[BRICKLET_RS232_CALLBACK_ERROR_CALLBACK] := {$ifdef FPC}@{$endif}CallbackWrapperErrorCallback;
end;

function TBrickletRS232.Write(const message2: TArray0To59OfChar; const length2: byte): byte;
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_WRITE, 69);
  for i := 0 to Length(message2) - 1 do LEConvertCharTo(message2[i], 8 + (i * 1), request);
  LEConvertUInt8To(length2, 68, request);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletRS232.Read(out message2: TArray0To59OfChar; out length2: byte);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_READ, 8);
  response := SendRequest(request);
  for i := 0 to 59 do message2[i] := LEConvertCharFrom(8 + (i * 1), response);
  length2 := LEConvertUInt8From(68, response);
end;

procedure TBrickletRS232.EnableReadCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_ENABLE_READ_CALLBACK, 8);
  SendRequest(request);
end;

procedure TBrickletRS232.DisableReadCallback;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_DISABLE_READ_CALLBACK, 8);
  SendRequest(request);
end;

function TBrickletRS232.IsReadCallbackEnabled: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_IS_READ_CALLBACK_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletRS232.SetConfiguration(const baudrate: byte; const parity: byte; const stopbits: byte; const wordlength: byte; const hardwareFlowcontrol: byte; const softwareFlowcontrol: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_SET_CONFIGURATION, 14);
  LEConvertUInt8To(baudrate, 8, request);
  LEConvertUInt8To(parity, 9, request);
  LEConvertUInt8To(stopbits, 10, request);
  LEConvertUInt8To(wordlength, 11, request);
  LEConvertUInt8To(hardwareFlowcontrol, 12, request);
  LEConvertUInt8To(softwareFlowcontrol, 13, request);
  SendRequest(request);
end;

procedure TBrickletRS232.GetConfiguration(out baudrate: byte; out parity: byte; out stopbits: byte; out wordlength: byte; out hardwareFlowcontrol: byte; out softwareFlowcontrol: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_GET_CONFIGURATION, 8);
  response := SendRequest(request);
  baudrate := LEConvertUInt8From(8, response);
  parity := LEConvertUInt8From(9, response);
  stopbits := LEConvertUInt8From(10, response);
  wordlength := LEConvertUInt8From(11, response);
  hardwareFlowcontrol := LEConvertUInt8From(12, response);
  softwareFlowcontrol := LEConvertUInt8From(13, response);
end;

procedure TBrickletRS232.SetBreakCondition(const breakTime: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_SET_BREAK_CONDITION, 10);
  LEConvertUInt16To(breakTime, 8, request);
  SendRequest(request);
end;

procedure TBrickletRS232.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_RS232_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletRS232.CallbackWrapperReadCallback(const packet: TByteArray);
var message2: TArray0To59OfChar; length2: byte; i: longint;
begin
  if (Assigned(readCallbackCallback)) then begin
    for i := 0 to 59 do message2[i] := LEConvertCharFrom(8 + (i * 1), packet);
    length2 := LEConvertUInt8From(68, packet);
    readCallbackCallback(self, message2, length2);
  end;
end;

procedure TBrickletRS232.CallbackWrapperErrorCallback(const packet: TByteArray);
var error: byte;
begin
  if (Assigned(errorCallbackCallback)) then begin
    error := LEConvertUInt8From(8, packet);
    errorCallbackCallback(self, error);
  end;
end;

end.
