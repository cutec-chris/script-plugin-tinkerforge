{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletAmbientLightV2;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_AMBIENT_LIGHT_V2_DEVICE_IDENTIFIER = 259;
  BRICKLET_AMBIENT_LIGHT_V2_DEVICE_DISPLAY_NAME = 'Ambient Light Bricklet 2.0';

  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE = 1;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD = 2;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD = 3;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD = 4;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD = 5;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_CONFIGURATION = 8;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_CONFIGURATION = 9;
  BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE = 10;
  BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE_REACHED = 11;

  BRICKLET_AMBIENT_LIGHT_V2_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_AMBIENT_LIGHT_V2_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_AMBIENT_LIGHT_V2_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_AMBIENT_LIGHT_V2_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_AMBIENT_LIGHT_V2_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_AMBIENT_LIGHT_V2_ILLUMINANCE_RANGE_UNLIMITED = 6;
  BRICKLET_AMBIENT_LIGHT_V2_ILLUMINANCE_RANGE_64000LUX = 0;
  BRICKLET_AMBIENT_LIGHT_V2_ILLUMINANCE_RANGE_32000LUX = 1;
  BRICKLET_AMBIENT_LIGHT_V2_ILLUMINANCE_RANGE_16000LUX = 2;
  BRICKLET_AMBIENT_LIGHT_V2_ILLUMINANCE_RANGE_8000LUX = 3;
  BRICKLET_AMBIENT_LIGHT_V2_ILLUMINANCE_RANGE_1300LUX = 4;
  BRICKLET_AMBIENT_LIGHT_V2_ILLUMINANCE_RANGE_600LUX = 5;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_50MS = 0;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_100MS = 1;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_150MS = 2;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_200MS = 3;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_250MS = 4;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_300MS = 5;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_350MS = 6;
  BRICKLET_AMBIENT_LIGHT_V2_INTEGRATION_TIME_400MS = 7;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletAmbientLightV2 = class;
  TBrickletAmbientLightV2NotifyIlluminance = procedure(sender: TBrickletAmbientLightV2; const illuminance: longword) of object;
  TBrickletAmbientLightV2NotifyIlluminanceReached = procedure(sender: TBrickletAmbientLightV2; const illuminance: longword) of object;

  /// <summary>
  ///  Measures ambient light up to 64000lux
  /// </summary>
  TBrickletAmbientLightV2 = class(TDevice)
  private
    illuminanceCallback: TBrickletAmbientLightV2NotifyIlluminance;
    illuminanceReachedCallback: TBrickletAmbientLightV2NotifyIlluminanceReached;
  protected
    procedure CallbackWrapperIlluminance(const packet: TByteArray); virtual;
    procedure CallbackWrapperIlluminanceReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the illuminance of the ambient light sensor. The measurement range goes
    ///  up to about 100000lux, but above 64000lux the precision starts to drop.
    ///  The illuminance is given in lux/100, i.e. a value of 450000 means that an
    ///  illuminance of 4500lux is measured.
    ///  
    ///  .. versionchanged:: 2.0.2$nbsp;(Plugin)
    ///    An illuminance of 0lux indicates that the sensor is saturated and the
    ///    configuration should be modified, see <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetConfiguration"/>.
    ///  
    ///  If you want to get the illuminance periodically, it is recommended to use the
    ///  callback <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.Illuminance"/> and set the period with 
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminance: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.Illuminance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.Illuminance"/> is only triggered if the illuminance has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetIlluminanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod"/>.
    /// </summary>
    function GetIlluminanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.IlluminanceReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the illuminance is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the illuminance is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the illuminance is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the illuminance is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetIlluminanceCallbackThreshold(const option: char; const min: longword; const max: longword); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold"/>.
    /// </summary>
    procedure GetIlluminanceCallbackThreshold(out option: char; out min: longword; out max: longword); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.IlluminanceReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the configuration. It is possible to configure an illuminance range
    ///  between 0-600lux and 0-64000lux and an integration time between 50ms and 400ms.
    ///  
    ///  .. versionadded:: 2.0.2$nbsp;(Plugin)
    ///    The unlimited illuminance range allows to measure up to about 100000lux, but
    ///    above 64000lux the precision starts to drop.
    ///  
    ///  A smaller illuminance range increases the resolution of the data. A longer
    ///  integration time will result in less noise on the data.
    ///  
    ///  .. versionchanged:: 2.0.2$nbsp;(Plugin)
    ///    If the actual measure illuminance is out-of-range then the current illuminance
    ///    range maximum +0.01lux is reported by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.GetIlluminance"/> and the
    ///    <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.Illuminance"/> callback. For example, 800001 for the 0-8000lux range.
    ///  
    ///  .. versionchanged:: 2.0.2$nbsp;(Plugin)
    ///    With a long integration time the sensor might be saturated before the measured
    ///    value reaches the maximum of the selected illuminance range. In this case 0lux
    ///    is reported by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.GetIlluminance"/> and the <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.Illuminance"/> callback.
    ///  
    ///  If the measurement is out-of-range or the sensor is saturated then you should
    ///  configure the next higher illuminance range. If the highest range is already
    ///  in use, then start to reduce the integration time.
    ///  
    ///  The default values are 0-8000lux illuminance range and 200ms integration time.
    /// </summary>
    procedure SetConfiguration(const illuminanceRange: byte; const integrationTime: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out illuminanceRange: byte; out integrationTime: byte); virtual;

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
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod"/>. The parameter is the illuminance of the
    ///  ambient light sensor.
    ///  
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.Illuminance"/> is only triggered if the illuminance has changed since the
    ///  last triggering.
    /// </summary>
    property OnIlluminance: TBrickletAmbientLightV2NotifyIlluminance read illuminanceCallback write illuminanceCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold"/> is reached.
    ///  The parameter is the illuminance of the ambient light sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletAmbientLightV2.TBrickletAmbientLightV2.SetDebouncePeriod"/>.
    /// </summary>
    property OnIlluminanceReached: TBrickletAmbientLightV2NotifyIlluminanceReached read illuminanceReachedCallback write illuminanceReachedCallback;
  end;

implementation

constructor TBrickletAmbientLightV2.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 1;

  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE] := {$ifdef FPC}@{$endif}CallbackWrapperIlluminance;
  callbackWrappers[BRICKLET_AMBIENT_LIGHT_V2_CALLBACK_ILLUMINANCE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperIlluminanceReached;
end;

function TBrickletAmbientLightV2.GetIlluminance: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAmbientLightV2.SetIlluminanceCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletAmbientLightV2.GetIlluminanceCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAmbientLightV2.SetIlluminanceCallbackThreshold(const option: char; const min: longword; const max: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_ILLUMINANCE_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt32To(min, 9, request);
  LEConvertUInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletAmbientLightV2.GetIlluminanceCallbackThreshold(out option: char; out min: longword; out max: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_ILLUMINANCE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt32From(9, response);
  max := LEConvertUInt32From(13, response);
end;

procedure TBrickletAmbientLightV2.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletAmbientLightV2.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletAmbientLightV2.SetConfiguration(const illuminanceRange: byte; const integrationTime: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(illuminanceRange, 8, request);
  LEConvertUInt8To(integrationTime, 9, request);
  SendRequest(request);
end;

procedure TBrickletAmbientLightV2.GetConfiguration(out illuminanceRange: byte; out integrationTime: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_CONFIGURATION, 8);
  response := SendRequest(request);
  illuminanceRange := LEConvertUInt8From(8, response);
  integrationTime := LEConvertUInt8From(9, response);
end;

procedure TBrickletAmbientLightV2.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_AMBIENT_LIGHT_V2_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletAmbientLightV2.CallbackWrapperIlluminance(const packet: TByteArray);
var illuminance: longword;
begin
  if (Assigned(illuminanceCallback)) then begin
    illuminance := LEConvertUInt32From(8, packet);
    illuminanceCallback(self, illuminance);
  end;
end;

procedure TBrickletAmbientLightV2.CallbackWrapperIlluminanceReached(const packet: TByteArray);
var illuminance: longword;
begin
  if (Assigned(illuminanceReachedCallback)) then begin
    illuminance := LEConvertUInt32From(8, packet);
    illuminanceReachedCallback(self, illuminance);
  end;
end;

end.
