{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletUVLight;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_UV_LIGHT_DEVICE_IDENTIFIER = 265;
  BRICKLET_UV_LIGHT_DEVICE_DISPLAY_NAME = 'UV Light Bricklet';

  BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT = 1;
  BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_PERIOD = 2;
  BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_PERIOD = 3;
  BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_THRESHOLD = 4;
  BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_THRESHOLD = 5;
  BRICKLET_UV_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_UV_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_UV_LIGHT_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT = 8;
  BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT_REACHED = 9;

  BRICKLET_UV_LIGHT_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_UV_LIGHT_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_UV_LIGHT_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_UV_LIGHT_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_UV_LIGHT_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletUVLight = class;
  TBrickletUVLightNotifyUVLight = procedure(sender: TBrickletUVLight; const uvLight: longword) of object;
  TBrickletUVLightNotifyUVLightReached = procedure(sender: TBrickletUVLight; const uvLight: longword) of object;

  /// <summary>
  ///  Measures UV Light
  /// </summary>
  TBrickletUVLight = class(TDevice)
  private
    uvLightCallback: TBrickletUVLightNotifyUVLight;
    uvLightReachedCallback: TBrickletUVLightNotifyUVLightReached;
  protected
    procedure CallbackWrapperUVLight(const packet: TByteArray); virtual;
    procedure CallbackWrapperUVLightReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the UV Light intensity of the sensor, the intensity is given 
    ///  in µW/cm².
    ///  
    ///  To get UV Index you have to divide the value by 250. For example, a UV Light
    ///  intensity of 500µW/cm² is equivalent to an UV Index of 2.
    ///  
    ///  If you want to get the intensity periodically, it is recommended to use the
    ///  callback <see cref="BrickletUVLight.TBrickletUVLight.UVLight"/> and set the period with 
    ///  <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackPeriod"/>.
    /// </summary>
    function GetUVLight: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletUVLight.TBrickletUVLight.UVLight"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletUVLight.TBrickletUVLight.UVLight"/> is only triggered if the intensity has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetUVLightCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackPeriod"/>.
    /// </summary>
    function GetUVLightCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletUVLight.TBrickletUVLight.UVLightReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the intensity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the intensity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the intensity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the intensity is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetUVLightCallbackThreshold(const option: char; const min: longword; const max: longword); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackThreshold"/>.
    /// </summary>
    procedure GetUVLightCallbackThreshold(out option: char; out min: longword; out max: longword); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletUVLight.TBrickletUVLight.UVLightReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletUVLight.TBrickletUVLight.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

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
    ///  <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackPeriod"/>. The parameter is the UV Light 
    ///  intensity of the sensor.
    ///  
    ///  <see cref="BrickletUVLight.TBrickletUVLight.UVLight"/> is only triggered if the intensity has changed since the
    ///  last triggering.
    /// </summary>
    property OnUVLight: TBrickletUVLightNotifyUVLight read uvLightCallback write uvLightCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletUVLight.TBrickletUVLight.SetUVLightCallbackThreshold"/> is reached.
    ///  The parameter is the UV Light intensity of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletUVLight.TBrickletUVLight.SetDebouncePeriod"/>.
    /// </summary>
    property OnUVLightReached: TBrickletUVLightNotifyUVLightReached read uvLightReachedCallback write uvLightReachedCallback;
  end;

implementation

constructor TBrickletUVLight.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_UV_LIGHT_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT] := {$ifdef FPC}@{$endif}CallbackWrapperUVLight;
  callbackWrappers[BRICKLET_UV_LIGHT_CALLBACK_UV_LIGHT_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperUVLightReached;
end;

function TBrickletUVLight.GetUVLight: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletUVLight.SetUVLightCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletUVLight.GetUVLightCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletUVLight.SetUVLightCallbackThreshold(const option: char; const min: longword; const max: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_SET_UV_LIGHT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt32To(min, 9, request);
  LEConvertUInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletUVLight.GetUVLightCallbackThreshold(out option: char; out min: longword; out max: longword);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_UV_LIGHT_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt32From(9, response);
  max := LEConvertUInt32From(13, response);
end;

procedure TBrickletUVLight.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletUVLight.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletUVLight.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_UV_LIGHT_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletUVLight.CallbackWrapperUVLight(const packet: TByteArray);
var uvLight: longword;
begin
  if (Assigned(uvLightCallback)) then begin
    uvLight := LEConvertUInt32From(8, packet);
    uvLightCallback(self, uvLight);
  end;
end;

procedure TBrickletUVLight.CallbackWrapperUVLightReached(const packet: TByteArray);
var uvLight: longword;
begin
  if (Assigned(uvLightReachedCallback)) then begin
    uvLight := LEConvertUInt32From(8, packet);
    uvLightReachedCallback(self, uvLight);
  end;
end;

end.
