{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletIndustrialDualAnalogIn;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_DEVICE_IDENTIFIER = 249;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_DEVICE_DISPLAY_NAME = 'Industrial Dual Analog In Bricklet';

  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE = 1;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD = 2;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD = 3;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD = 4;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD = 5;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_SAMPLE_RATE = 8;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_SAMPLE_RATE = 9;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_CALIBRATION = 10;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_CALIBRATION = 11;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_ADC_VALUES = 12;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE = 13;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE_REACHED = 14;

  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_976_SPS = 0;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_488_SPS = 1;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_244_SPS = 2;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_122_SPS = 3;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_61_SPS = 4;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_4_SPS = 5;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_2_SPS = 6;
  BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_SAMPLE_RATE_1_SPS = 7;

type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To1OfInt32 = array [0..1] of longint;

  TBrickletIndustrialDualAnalogIn = class;
  TBrickletIndustrialDualAnalogInNotifyVoltage = procedure(sender: TBrickletIndustrialDualAnalogIn; const channel: byte; const voltage: longint) of object;
  TBrickletIndustrialDualAnalogInNotifyVoltageReached = procedure(sender: TBrickletIndustrialDualAnalogIn; const channel: byte; const voltage: longint) of object;

  /// <summary>
  ///  Measures two DC voltages between -35V and +35V with 24bit resolution each
  /// </summary>
  TBrickletIndustrialDualAnalogIn = class(TDevice)
  private
    voltageCallback: TBrickletIndustrialDualAnalogInNotifyVoltage;
    voltageReachedCallback: TBrickletIndustrialDualAnalogInNotifyVoltageReached;
  protected
    procedure CallbackWrapperVoltage(const packet: TByteArray); virtual;
    procedure CallbackWrapperVoltageReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the voltage for the given channel in mV.
    ///  
    ///  If you want to get the voltage periodically, it is recommended to use the
    ///  callback <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.Voltage"/> and set the period with 
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltage(const channel: byte): longint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.Voltage"/> callback is triggered
    ///  periodically for the given channel. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetVoltageCallbackPeriod(const channel: byte; const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod"/>.
    /// </summary>
    function GetVoltageCallbackPeriod(const channel: byte): longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.VoltageReached"/> callback for the given
    ///  channel.
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
    procedure SetVoltageCallbackThreshold(const channel: byte; const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold"/>.
    /// </summary>
    procedure GetVoltageCallbackThreshold(const channel: byte; out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.VoltageReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the sample rate. The sample rate can be between 1 sample per second
    ///  and 976 samples per second. Decreasing the sample rate will also decrease the
    ///  noise on the data.
    ///  
    ///  The default value is 6 (2 samples per second).
    /// </summary>
    procedure SetSampleRate(const rate: byte); virtual;

    /// <summary>
    ///  Returns the sample rate as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetSampleRate"/>.
    /// </summary>
    function GetSampleRate: byte; virtual;

    /// <summary>
    ///  Sets offset and gain of MCP3911 internal calibration registers.
    ///  
    ///  See MCP3911 datasheet 7.7 and 7.8. The Industrial Dual Analog In Bricklet
    ///  is already factory calibrated by Tinkerforge. It should not be necessary
    ///  for you to use this function
    /// </summary>
    procedure SetCalibration(const offset: TArray0To1OfInt32; const gain: TArray0To1OfInt32); virtual;

    /// <summary>
    ///  Returns the calibration as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetCalibration"/>.
    /// </summary>
    procedure GetCalibration(out offset: TArray0To1OfInt32; out gain: TArray0To1OfInt32); virtual;

    /// <summary>
    ///  Returns the ADC values as given by the MCP3911 IC. This function
    ///  is needed for proper calibration, see <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetCalibration"/>.
    /// </summary>
    function GetADCValues: TArray0To1OfInt32; virtual;

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
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod"/>. The parameter is the voltage of the
    ///  channel.
    ///  
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.Voltage"/> is only triggered if the voltage has changed since the
    ///  last triggering.
    /// </summary>
    property OnVoltage: TBrickletIndustrialDualAnalogInNotifyVoltage read voltageCallback write voltageCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold"/> is reached.
    ///  The parameter is the voltage of the channel.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletIndustrialDualAnalogIn.TBrickletIndustrialDualAnalogIn.SetDebouncePeriod"/>.
    /// </summary>
    property OnVoltageReached: TBrickletIndustrialDualAnalogInNotifyVoltageReached read voltageReachedCallback write voltageReachedCallback;
  end;

implementation

constructor TBrickletIndustrialDualAnalogIn.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_SAMPLE_RATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_SAMPLE_RATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_CALIBRATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_CALIBRATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_ADC_VALUES] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE] := {$ifdef FPC}@{$endif}CallbackWrapperVoltage;
  callbackWrappers[BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_CALLBACK_VOLTAGE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperVoltageReached;
end;

function TBrickletIndustrialDualAnalogIn.GetVoltage(const channel: byte): longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE, 9);
  LEConvertUInt8To(channel, 8, request);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetVoltageCallbackPeriod(const channel: byte; const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_PERIOD, 13);
  LEConvertUInt8To(channel, 8, request);
  LEConvertUInt32To(period, 9, request);
  SendRequest(request);
end;

function TBrickletIndustrialDualAnalogIn.GetVoltageCallbackPeriod(const channel: byte): longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_PERIOD, 9);
  LEConvertUInt8To(channel, 8, request);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetVoltageCallbackThreshold(const channel: byte; const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_VOLTAGE_CALLBACK_THRESHOLD, 18);
  LEConvertUInt8To(channel, 8, request);
  LEConvertCharTo(option, 9, request);
  LEConvertInt32To(min, 10, request);
  LEConvertInt32To(max, 14, request);
  SendRequest(request);
end;

procedure TBrickletIndustrialDualAnalogIn.GetVoltageCallbackThreshold(const channel: byte; out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_VOLTAGE_CALLBACK_THRESHOLD, 9);
  LEConvertUInt8To(channel, 8, request);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialDualAnalogIn.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetSampleRate(const rate: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_SAMPLE_RATE, 9);
  LEConvertUInt8To(rate, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialDualAnalogIn.GetSampleRate: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_SAMPLE_RATE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletIndustrialDualAnalogIn.SetCalibration(const offset: TArray0To1OfInt32; const gain: TArray0To1OfInt32);
var request: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_SET_CALIBRATION, 24);
  for i := 0 to Length(offset) - 1 do LEConvertInt32To(offset[i], 8 + (i * 4), request);
  for i := 0 to Length(gain) - 1 do LEConvertInt32To(gain[i], 16 + (i * 4), request);
  SendRequest(request);
end;

procedure TBrickletIndustrialDualAnalogIn.GetCalibration(out offset: TArray0To1OfInt32; out gain: TArray0To1OfInt32);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_CALIBRATION, 8);
  response := SendRequest(request);
  for i := 0 to 1 do offset[i] := LEConvertInt32From(8 + (i * 4), response);
  for i := 0 to 1 do gain[i] := LEConvertInt32From(16 + (i * 4), response);
end;

function TBrickletIndustrialDualAnalogIn.GetADCValues: TArray0To1OfInt32;
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_ADC_VALUES, 8);
  response := SendRequest(request);
  for i := 0 to 1 do result[i] := LEConvertInt32From(8 + (i * 4), response);
end;

procedure TBrickletIndustrialDualAnalogIn.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_DUAL_ANALOG_IN_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletIndustrialDualAnalogIn.CallbackWrapperVoltage(const packet: TByteArray);
var channel: byte; voltage: longint;
begin
  if (Assigned(voltageCallback)) then begin
    channel := LEConvertUInt8From(8, packet);
    voltage := LEConvertInt32From(9, packet);
    voltageCallback(self, channel, voltage);
  end;
end;

procedure TBrickletIndustrialDualAnalogIn.CallbackWrapperVoltageReached(const packet: TByteArray);
var channel: byte; voltage: longint;
begin
  if (Assigned(voltageReachedCallback)) then begin
    channel := LEConvertUInt8From(8, packet);
    voltage := LEConvertInt32From(9, packet);
    voltageReachedCallback(self, channel, voltage);
  end;
end;

end.
