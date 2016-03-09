{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletAnalogInV2;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_ANALOG_IN_V2_DEVICE_IDENTIFIER = 251;
  BRICKLET_ANALOG_IN_V2_DEVICE_DISPLAY_NAME = 'Analog In Bricklet 2.0';

  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE = 1;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE = 2;
  BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD = 3;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD = 4;
  BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD = 5;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD = 6;
  BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD = 7;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD = 8;
  BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD = 9;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD = 10;
  BRICKLET_ANALOG_IN_V2_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_ANALOG_IN_V2_FUNCTION_SET_MOVING_AVERAGE = 13;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_MOVING_AVERAGE = 14;
  BRICKLET_ANALOG_IN_V2_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE = 15;
  BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE = 16;
  BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE_REACHED = 17;
  BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE_REACHED = 18;

  BRICKLET_ANALOG_IN_V2_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_ANALOG_IN_V2_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_ANALOG_IN_V2_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_ANALOG_IN_V2_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_ANALOG_IN_V2_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAnalogInV2 = class;
  TBrickletAnalogInV2NotifyVoltage = procedure(sender: TBrickletAnalogInV2; const voltage: word) of object;
  TBrickletAnalogInV2NotifyAnalogValue = procedure(sender: TBrickletAnalogInV2; const value: word) of object;
  TBrickletAnalogInV2NotifyVoltageReached = procedure(sender: TBrickletAnalogInV2; const voltage: word) of object;
  TBrickletAnalogInV2NotifyAnalogValueReached = procedure(sender: TBrickletAnalogInV2; const value: word) of object;

  /// <summary>
  ///  Measures DC voltage between 0V and 42V
  /// </summary>
  TBrickletAnalogInV2 = class(TDevice)
  private
    voltageCallback: TBrickletAnalogInV2NotifyVoltage;
    analogValueCallback: TBrickletAnalogInV2NotifyAnalogValue;
    voltageReachedCallback: TBrickletAnalogInV2NotifyVoltageReached;
    analogValueReachedCallback: TBrickletAnalogInV2NotifyAnalogValueReached;
  protected
    procedure CallbackWrapperVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValue(const packet: TByteArray); virtual;
    procedure CallbackWrapperVoltageReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperAnalogValueReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the measured voltage. The value is in mV and
    ///  between 0V and 42V. The resolution is approximately 10mV.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  callback <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.Voltage"/> and set the period with
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Returns the value as read by a 12-bit analog-to-digital converter.
    ///  The value is between 0 and 4095.
    ///  
    ///  If you want the analog value periodically, it is recommended to use the
    ///  callback <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.AnalogValue"/> and set the period with
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValue: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.Voltage"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.AnalogValue"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.AnalogValue"/> is only triggered if the analog value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAnalogValueCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackPeriod"/>.
    /// </summary>
    function GetAnalogValueCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.VoltageReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the voltage is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the voltage is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the voltage is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the voltage is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetVoltageCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.AnalogValueReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the analog value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the analog value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the analog value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the analog value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackThreshold"/>.
    /// </summary>
    procedure GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.VoltageReached"/>,
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.AnalogValueReached"/>
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackThreshold"/>,
    ///  * <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackThreshold"/>
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the voltage.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  The range for the averaging is 1-50.
    ///  
    ///  The default value is 50.
    /// </summary>
    procedure SetMovingAverage(const average: byte); virtual;

    /// <summary>
    ///  Returns the length of the moving average as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetMovingAverage"/>.
    /// </summary>
    function GetMovingAverage: byte; virtual;

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
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    property OnVoltage: TBrickletAnalogInV2NotifyVoltage read voltageCallback write voltageCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackPeriod"/>. The parameter is the analog value of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.AnalogValue"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    property OnAnalogValue: TBrickletAnalogInV2NotifyAnalogValue read analogValueCallback write analogValueCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletAnalogInV2NotifyVoltageReached read voltageReachedCallback write voltageReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetAnalogValueCallbackThreshold"/> is reached.
    ///  The parameter is the analog value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAnalogInV2.TBrickletAnalogInV2.SetDebouncePeriod"/>.
    /// </summary>
    property OnAnalogValueReached: TBrickletAnalogInV2NotifyAnalogValueReached read analogValueReachedCallback write analogValueReachedCallback;
  end;

implementation

constructor TBrickletAnalogInV2.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 1;

  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_SET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ANALOG_IN_V2_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  callbackWrappers[BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValue;
  callbackWrappers[BRICKLET_ANALOG_IN_V2_CALLBACK_VOLTAGE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
  callbackWrappers[BRICKLET_ANALOG_IN_V2_CALLBACK_ANALOG_VALUE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAnalogValueReached;
end;

function TBrickletAnalogInV2.GetVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletAnalogInV2.GetAnalogValue: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletAnalogInV2.SetVoltageCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletAnalogInV2.GetVoltageCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAnalogInV2.SetAnalogValueCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletAnalogInV2.GetAnalogValueCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAnalogInV2.SetVoltageCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletAnalogInV2.GetVoltageCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletAnalogInV2.SetAnalogValueCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_ANALOG_VALUE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletAnalogInV2.GetAnalogValueCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_ANALOG_VALUE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletAnalogInV2.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletAnalogInV2.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAnalogInV2.SetMovingAverage(const average: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(average, 8, request);
  SendRequest(request);
end;

function TBrickletAnalogInV2.GetMovingAverage: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_MOVING_AVERAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletAnalogInV2.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_IN_V2_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletAnalogInV2.CallbackWrapperVoltage(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(voltageCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    voltageCallback(self, voltage);
  end;
end;

procedure TBrickletAnalogInV2.CallbackWrapperAnalogValue(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueCallback(self, value);
  end;
end;

procedure TBrickletAnalogInV2.CallbackWrapperVoltageReached(const packet: TByteArray);
var voltage: word;
begin
  if (Assigned(voltageReachedCallback)) then begin
    voltage := LEConvertUInt16From(8, packet);
    voltageReachedCallback(self, voltage);
  end;
end;

procedure TBrickletAnalogInV2.CallbackWrapperAnalogValueReached(const packet: TByteArray);
var value: word;
begin
  if (Assigned(analogValueReachedCallback)) then begin
    value := LEConvertUInt16From(8, packet);
    analogValueReachedCallback(self, value);
  end;
end;

end.
