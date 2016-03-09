{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletAccelerometer;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_ACCELEROMETER_DEVICE_IDENTIFIER = 250;
  BRICKLET_ACCELEROMETER_DEVICE_DISPLAY_NAME = 'Accelerometer Bricklet';

  BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION = 1;
  BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD = 2;
  BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD = 3;
  BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD = 4;
  BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD = 5;
  BRICKLET_ACCELEROMETER_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_ACCELEROMETER_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_ACCELEROMETER_FUNCTION_GET_TEMPERATURE = 8;
  BRICKLET_ACCELEROMETER_FUNCTION_SET_CONFIGURATION = 9;
  BRICKLET_ACCELEROMETER_FUNCTION_GET_CONFIGURATION = 10;
  BRICKLET_ACCELEROMETER_FUNCTION_LED_ON = 11;
  BRICKLET_ACCELEROMETER_FUNCTION_LED_OFF = 12;
  BRICKLET_ACCELEROMETER_FUNCTION_IS_LED_ON = 13;
  BRICKLET_ACCELEROMETER_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION = 14;
  BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION_REACHED = 15;

  BRICKLET_ACCELEROMETER_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_ACCELEROMETER_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_ACCELEROMETER_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_ACCELEROMETER_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_ACCELEROMETER_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_ACCELEROMETER_DATA_RATE_OFF = 0;
  BRICKLET_ACCELEROMETER_DATA_RATE_3HZ = 1;
  BRICKLET_ACCELEROMETER_DATA_RATE_6HZ = 2;
  BRICKLET_ACCELEROMETER_DATA_RATE_12HZ = 3;
  BRICKLET_ACCELEROMETER_DATA_RATE_25HZ = 4;
  BRICKLET_ACCELEROMETER_DATA_RATE_50HZ = 5;
  BRICKLET_ACCELEROMETER_DATA_RATE_100HZ = 6;
  BRICKLET_ACCELEROMETER_DATA_RATE_400HZ = 7;
  BRICKLET_ACCELEROMETER_DATA_RATE_800HZ = 8;
  BRICKLET_ACCELEROMETER_DATA_RATE_1600HZ = 9;
  BRICKLET_ACCELEROMETER_FULL_SCALE_2G = 0;
  BRICKLET_ACCELEROMETER_FULL_SCALE_4G = 1;
  BRICKLET_ACCELEROMETER_FULL_SCALE_6G = 2;
  BRICKLET_ACCELEROMETER_FULL_SCALE_8G = 3;
  BRICKLET_ACCELEROMETER_FULL_SCALE_16G = 4;
  BRICKLET_ACCELEROMETER_FILTER_BANDWIDTH_800HZ = 0;
  BRICKLET_ACCELEROMETER_FILTER_BANDWIDTH_400HZ = 1;
  BRICKLET_ACCELEROMETER_FILTER_BANDWIDTH_200HZ = 2;
  BRICKLET_ACCELEROMETER_FILTER_BANDWIDTH_50HZ = 3;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAccelerometer = class;
  TBrickletAccelerometerNotifyAcceleration = procedure(sender: TBrickletAccelerometer; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickletAccelerometerNotifyAccelerationReached = procedure(sender: TBrickletAccelerometer; const x: smallint; const y: smallint; const z: smallint) of object;

  /// <summary>
  ///  Measures acceleration in three axis
  /// </summary>
  TBrickletAccelerometer = class(TDevice)
  private
    accelerationCallback: TBrickletAccelerometerNotifyAcceleration;
    accelerationReachedCallback: TBrickletAccelerometerNotifyAccelerationReached;
  protected
    procedure CallbackWrapperAcceleration(const packet: TByteArray); virtual;
    procedure CallbackWrapperAccelerationReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the acceleration in x, y and z direction. The values
    ///  are given in g/1000 (1g = 9.80665m/s²), not to be confused with grams.
    ///  
    ///  If you want to get the acceleration periodically, it is recommended 
    ///  to use the callback <see cref="BrickletAccelerometer.TBrickletAccelerometer.Acceleration"/> and set the period with 
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackPeriod"/>.
    /// </summary>
    procedure GetAcceleration(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletAccelerometer.TBrickletAccelerometer.Acceleration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.Acceleration"/> is only triggered if the acceleration has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAccelerationCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackPeriod"/>.
    /// </summary>
    function GetAccelerationCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAccelerometer.TBrickletAccelerometer.AccelerationReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the acceleration is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the acceleration is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the acceleration is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the acceleration is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0, 0, 0, 0, 0).
    /// </summary>
    procedure SetAccelerationCallbackThreshold(const option: char; const minX: smallint; const maxX: smallint; const minY: smallint; const maxY: smallint; const minZ: smallint; const maxZ: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackThreshold"/>.
    /// </summary>
    procedure GetAccelerationCallbackThreshold(out option: char; out minX: smallint; out maxX: smallint; out minY: smallint; out maxY: smallint; out minZ: smallint; out maxZ: smallint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletAccelerometer.TBrickletAccelerometer.AccelerationReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Returns the temperature of the accelerometer in °C.
    /// </summary>
    function GetTemperature: smallint; virtual;

    /// <summary>
    ///  Configures the data rate, full scale range and filter bandwidth.
    ///  Possible values are:
    ///  
    ///  * Data rate of 0Hz to 1600Hz.
    ///  * Full scale range of -2G to +2G up to -16G to +16G.
    ///  * Filter bandwidth between 50Hz and 800Hz.
    ///  
    ///  Decreasing data rate or full scale range will also decrease the noise on 
    ///  the data.
    ///  
    ///  The default values are 100Hz data rate, -4G to +4G range and 200Hz
    ///  filter bandwidth.
    /// </summary>
    procedure SetConfiguration(const dataRate: byte; const fullScale: byte; const filterBandwidth: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out dataRate: byte; out fullScale: byte; out filterBandwidth: byte); virtual;

    /// <summary>
    ///  Enables the LED on the Bricklet.
    /// </summary>
    procedure LEDOn; virtual;

    /// <summary>
    ///  Disables the LED on the Bricklet.
    /// </summary>
    procedure LEDOff; virtual;

    /// <summary>
    ///  Returns *true* if the LED is enabled, *false* otherwise.
    /// </summary>
    function IsLEDOn: boolean; virtual;

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
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackPeriod"/>. The parameters are the
    ///  X, Y and Z acceleration.
    ///  
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.Acceleration"/> is only triggered if the acceleration has changed since the
    ///  last triggering.
    /// </summary>
    property OnAcceleration: TBrickletAccelerometerNotifyAcceleration read accelerationCallback write accelerationCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetAccelerationCallbackThreshold"/> is reached.
    ///  The parameters are the X, Y and Z acceleration.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAccelerometer.TBrickletAccelerometer.SetDebouncePeriod"/>.
    /// </summary>
    property OnAccelerationReached: TBrickletAccelerometerNotifyAccelerationReached read accelerationReachedCallback write accelerationReachedCallback;
  end;

implementation

constructor TBrickletAccelerometer.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 1;

  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_SET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_LED_ON] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_LED_OFF] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_IS_LED_ON] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_ACCELEROMETER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION] := {$ifdef FPC}@{$endif}CallbackWrapperAcceleration;
  callbackWrappers[BRICKLET_ACCELEROMETER_CALLBACK_ACCELERATION_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperAccelerationReached;
end;

procedure TBrickletAccelerometer.GetAcceleration(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickletAccelerometer.SetAccelerationCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletAccelerometer.GetAccelerationCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAccelerometer.SetAccelerationCallbackThreshold(const option: char; const minX: smallint; const maxX: smallint; const minY: smallint; const maxY: smallint; const minZ: smallint; const maxZ: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_ACCELERATION_CALLBACK_THRESHOLD, 21);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(minX, 9, request);
  LEConvertInt16To(maxX, 11, request);
  LEConvertInt16To(minY, 13, request);
  LEConvertInt16To(maxY, 15, request);
  LEConvertInt16To(minZ, 17, request);
  LEConvertInt16To(maxZ, 19, request);
  SendRequest(request);
end;

procedure TBrickletAccelerometer.GetAccelerationCallbackThreshold(out option: char; out minX: smallint; out maxX: smallint; out minY: smallint; out maxY: smallint; out minZ: smallint; out maxZ: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_ACCELERATION_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  minX := LEConvertInt16From(9, response);
  maxX := LEConvertInt16From(11, response);
  minY := LEConvertInt16From(13, response);
  maxY := LEConvertInt16From(15, response);
  minZ := LEConvertInt16From(17, response);
  maxZ := LEConvertInt16From(19, response);
end;

procedure TBrickletAccelerometer.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletAccelerometer.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

function TBrickletAccelerometer.GetTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickletAccelerometer.SetConfiguration(const dataRate: byte; const fullScale: byte; const filterBandwidth: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_SET_CONFIGURATION, 11);
  LEConvertUInt8To(dataRate, 8, request);
  LEConvertUInt8To(fullScale, 9, request);
  LEConvertUInt8To(filterBandwidth, 10, request);
  SendRequest(request);
end;

procedure TBrickletAccelerometer.GetConfiguration(out dataRate: byte; out fullScale: byte; out filterBandwidth: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_CONFIGURATION, 8);
  response := SendRequest(request);
  dataRate := LEConvertUInt8From(8, response);
  fullScale := LEConvertUInt8From(9, response);
  filterBandwidth := LEConvertUInt8From(10, response);
end;

procedure TBrickletAccelerometer.LEDOn;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_LED_ON, 8);
  SendRequest(request);
end;

procedure TBrickletAccelerometer.LEDOff;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_LED_OFF, 8);
  SendRequest(request);
end;

function TBrickletAccelerometer.IsLEDOn: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_IS_LED_ON, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletAccelerometer.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ACCELEROMETER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletAccelerometer.CallbackWrapperAcceleration(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(accelerationCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    accelerationCallback(self, x, y, z);
  end;
end;

procedure TBrickletAccelerometer.CallbackWrapperAccelerationReached(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(accelerationReachedCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    accelerationReachedCallback(self, x, y, z);
  end;
end;

end.
