{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletThermocouple;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_THERMOCOUPLE_DEVICE_IDENTIFIER = 266;
  BRICKLET_THERMOCOUPLE_DEVICE_DISPLAY_NAME = 'Thermocouple Bricklet';

  BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE = 1;
  BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD = 2;
  BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD = 3;
  BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD = 4;
  BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD = 5;
  BRICKLET_THERMOCOUPLE_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_THERMOCOUPLE_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_THERMOCOUPLE_FUNCTION_SET_CONFIGURATION = 10;
  BRICKLET_THERMOCOUPLE_FUNCTION_GET_CONFIGURATION = 11;
  BRICKLET_THERMOCOUPLE_FUNCTION_GET_ERROR_STATE = 12;
  BRICKLET_THERMOCOUPLE_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE = 8;
  BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE_REACHED = 9;
  BRICKLET_THERMOCOUPLE_CALLBACK_ERROR_STATE = 13;

  BRICKLET_THERMOCOUPLE_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_THERMOCOUPLE_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_THERMOCOUPLE_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_THERMOCOUPLE_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_THERMOCOUPLE_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_THERMOCOUPLE_AVERAGING_1 = 1;
  BRICKLET_THERMOCOUPLE_AVERAGING_2 = 2;
  BRICKLET_THERMOCOUPLE_AVERAGING_4 = 4;
  BRICKLET_THERMOCOUPLE_AVERAGING_8 = 8;
  BRICKLET_THERMOCOUPLE_AVERAGING_16 = 16;
  BRICKLET_THERMOCOUPLE_TYPE_B = 0;
  BRICKLET_THERMOCOUPLE_TYPE_E = 1;
  BRICKLET_THERMOCOUPLE_TYPE_J = 2;
  BRICKLET_THERMOCOUPLE_TYPE_K = 3;
  BRICKLET_THERMOCOUPLE_TYPE_N = 4;
  BRICKLET_THERMOCOUPLE_TYPE_R = 5;
  BRICKLET_THERMOCOUPLE_TYPE_S = 6;
  BRICKLET_THERMOCOUPLE_TYPE_T = 7;
  BRICKLET_THERMOCOUPLE_TYPE_G8 = 8;
  BRICKLET_THERMOCOUPLE_TYPE_G32 = 9;
  BRICKLET_THERMOCOUPLE_FILTER_OPTION_50HZ = 0;
  BRICKLET_THERMOCOUPLE_FILTER_OPTION_60HZ = 1;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletThermocouple = class;
  TBrickletThermocoupleNotifyTemperature = procedure(sender: TBrickletThermocouple; const temperature: longint) of object;
  TBrickletThermocoupleNotifyTemperatureReached = procedure(sender: TBrickletThermocouple; const temperature: longint) of object;
  TBrickletThermocoupleNotifyErrorState = procedure(sender: TBrickletThermocouple; const overUnder: boolean; const openCircuit: boolean) of object;

  /// <summary>
  ///  Measures temperature with thermocouples
  /// </summary>
  TBrickletThermocouple = class(TDevice)
  private
    temperatureCallback: TBrickletThermocoupleNotifyTemperature;
    temperatureReachedCallback: TBrickletThermocoupleNotifyTemperatureReached;
    errorStateCallback: TBrickletThermocoupleNotifyErrorState;
  protected
    procedure CallbackWrapperTemperature(const packet: TByteArray); virtual;
    procedure CallbackWrapperTemperatureReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperErrorState(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the temperature of the thermocouple. The value is given in °C/100,
    ///  e.g. a value of 4223 means that a temperature of 42.23 °C is measured.
    ///  
    ///  If you want to get the temperature periodically, it is recommended 
    ///  to use the callback <see cref="BrickletThermocouple.TBrickletThermocouple.Temperature"/> and set the period with 
    ///  <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperature: longint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletThermocouple.TBrickletThermocouple.Temperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletThermocouple.TBrickletThermocouple.Temperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetTemperatureCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackPeriod"/>.
    /// </summary>
    function GetTemperatureCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletThermocouple.TBrickletThermocouple.TemperatureReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the temperature is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the temperature is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the temperature is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the temperature is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetTemperatureCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackThreshold"/>.
    /// </summary>
    procedure GetTemperatureCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletThermocouple.TBrickletThermocouple.TemperatureReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  You can configure averaging size, thermocouple type and frequency
    ///  filtering.
    ///  
    ///  Available averaging sizes are 1, 2, 4, 8 and 16 samples.
    ///  
    ///  As thermocouple type you can use B, E, J, K, N, R, S and T. If you have a
    ///  different thermocouple or a custom thermocouple you can also use
    ///  G8 and G32. With these types the returned value will not be in °C/100,
    ///  it will be calculated by the following formulas:
    ///  
    ///  * G8: ``value = 8 * 1.6 * 2^17 * Vin``
    ///  * G32: ``value = 32 * 1.6 * 2^17 * Vin``
    ///  
    ///  where Vin is the thermocouple input voltage.
    ///  
    ///  The frequency filter can be either configured to 50Hz or to 60Hz. You should
    ///  configure it according to your utility frequency.
    ///  
    ///  The conversion time depends on the averaging and filter configuration, it can
    ///  be calculated as follows:
    ///  
    ///  * 60Hz: ``time = 82 + (samples - 1) * 16.67``
    ///  * 50Hz: ``time = 98 + (samples - 1) * 20``
    ///  
    ///  The default configuration is 16 samples, K type and 50Hz.
    /// </summary>
    procedure SetConfiguration(const averaging: byte; const thermocoupleType: byte; const filter: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out averaging: byte; out thermocoupleType: byte; out filter: byte); virtual;

    /// <summary>
    ///  Returns the current error state. There are two possible errors:
    ///  
    ///  * Over/Under Voltage and
    ///  * Open Circuit.
    ///  
    ///  Over/Under Voltage happens for voltages below 0V or above 3.3V. In this case
    ///  it is very likely that your thermocouple is defective. An Open Circuit error
    ///  indicates that there is no thermocouple connected.
    ///  
    ///  You can use the func:`ErrorState` callback to automatically get triggered
    ///  when the error state changes.
    /// </summary>
    procedure GetErrorState(out overUnder: boolean; out openCircuit: boolean); virtual;

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
    ///  :func:`SetThermocoupleCallbackPeriod`. The parameter is the temperature
    ///  of the thermocouple.
    ///  
    ///  <see cref="BrickletThermocouple.TBrickletThermocouple.Temperature"/> is only triggered if the temperature has changed since the
    ///  last triggering.
    /// </summary>
    property OnTemperature: TBrickletThermocoupleNotifyTemperature read temperatureCallback write temperatureCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletThermocouple.TBrickletThermocouple.SetTemperatureCallbackThreshold"/> is reached.
    ///  The parameter is the temperature of the thermocouple.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletThermocouple.TBrickletThermocouple.SetDebouncePeriod"/>.
    /// </summary>
    property OnTemperatureReached: TBrickletThermocoupleNotifyTemperatureReached read temperatureReachedCallback write temperatureReachedCallback;

    /// <summary>
    ///  This Callback is triggered every time the error state changes 
    ///  (see func:`GetErrorStatus`).
    /// </summary>
    property OnErrorState: TBrickletThermocoupleNotifyErrorState read errorStateCallback write errorStateCallback;
  end;

implementation

constructor TBrickletThermocouple.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_SET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_ERROR_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_THERMOCOUPLE_CALLBACK_ERROR_STATE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_THERMOCOUPLE_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE] := {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  callbackWrappers[BRICKLET_THERMOCOUPLE_CALLBACK_TEMPERATURE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperTemperatureReached;
  callbackWrappers[BRICKLET_THERMOCOUPLE_CALLBACK_ERROR_STATE] := {$ifdef FPC}@{$endif}CallbackWrapperErrorState;
end;

function TBrickletThermocouple.GetTemperature: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletThermocouple.SetTemperatureCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletThermocouple.GetTemperatureCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletThermocouple.SetTemperatureCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_TEMPERATURE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletThermocouple.GetTemperatureCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_TEMPERATURE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletThermocouple.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletThermocouple.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletThermocouple.SetConfiguration(const averaging: byte; const thermocoupleType: byte; const filter: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(averaging, 8, request);
  LEConvertUInt8To(thermocoupleType, 9, request);
  LEConvertUInt8To(filter, 10, request);
  SendRequest(request);
end;

procedure TBrickletThermocouple.GetConfiguration(out averaging: byte; out thermocoupleType: byte; out filter: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_CONFIGURATION, 8);
  response := SendRequest(request);
  averaging := LEConvertUInt8From(8, response);
  thermocoupleType := LEConvertUInt8From(9, response);
  filter := LEConvertUInt8From(10, response);
end;

procedure TBrickletThermocouple.GetErrorState(out overUnder: boolean; out openCircuit: boolean);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_ERROR_STATE, 8);
  response := SendRequest(request);
  overUnder := LEConvertBooleanFrom(8, response);
  openCircuit := LEConvertBooleanFrom(9, response);
end;

procedure TBrickletThermocouple.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_THERMOCOUPLE_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletThermocouple.CallbackWrapperTemperature(const packet: TByteArray);
var temperature: longint;
begin
  if (Assigned(temperatureCallback)) then begin
    temperature := LEConvertInt32From(8, packet);
    temperatureCallback(self, temperature);
  end;
end;

procedure TBrickletThermocouple.CallbackWrapperTemperatureReached(const packet: TByteArray);
var temperature: longint;
begin
  if (Assigned(temperatureReachedCallback)) then begin
    temperature := LEConvertInt32From(8, packet);
    temperatureReachedCallback(self, temperature);
  end;
end;

procedure TBrickletThermocouple.CallbackWrapperErrorState(const packet: TByteArray);
var overUnder: boolean; openCircuit: boolean;
begin
  if (Assigned(errorStateCallback)) then begin
    overUnder := LEConvertBooleanFrom(8, packet);
    openCircuit := LEConvertBooleanFrom(9, packet);
    errorStateCallback(self, overUnder, openCircuit);
  end;
end;

end.
