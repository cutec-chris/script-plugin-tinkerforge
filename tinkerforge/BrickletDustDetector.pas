{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletDustDetector;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_DUST_DETECTOR_DEVICE_IDENTIFIER = 260;
  BRICKLET_DUST_DETECTOR_DEVICE_DISPLAY_NAME = 'Dust Detector Bricklet';

  BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY = 1;
  BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_PERIOD = 2;
  BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_PERIOD = 3;
  BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_THRESHOLD = 4;
  BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_THRESHOLD = 5;
  BRICKLET_DUST_DETECTOR_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_DUST_DETECTOR_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_DUST_DETECTOR_FUNCTION_SET_MOVING_AVERAGE = 10;
  BRICKLET_DUST_DETECTOR_FUNCTION_GET_MOVING_AVERAGE = 11;
  BRICKLET_DUST_DETECTOR_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY = 8;
  BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY_REACHED = 9;

  BRICKLET_DUST_DETECTOR_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_DUST_DETECTOR_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_DUST_DETECTOR_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_DUST_DETECTOR_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_DUST_DETECTOR_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletDustDetector = class;
  TBrickletDustDetectorNotifyDustDensity = procedure(sender: TBrickletDustDetector; const dustDensity: word) of object;
  TBrickletDustDetectorNotifyDustDensityReached = procedure(sender: TBrickletDustDetector; const dustDensity: word) of object;

  /// <summary>
  ///  Measures dust density
  /// </summary>
  TBrickletDustDetector = class(TDevice)
  private
    dustDensityCallback: TBrickletDustDetectorNotifyDustDensity;
    dustDensityReachedCallback: TBrickletDustDetectorNotifyDustDensityReached;
  protected
    procedure CallbackWrapperDustDensity(const packet: TByteArray); virtual;
    procedure CallbackWrapperDustDensityReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the dust density in µg/m³.
    ///  
    ///  If you want to get the dust density periodically, it is recommended 
    ///  to use the callback <see cref="BrickletDustDetector.TBrickletDustDetector.DustDensity"/> and set the period with 
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackPeriod"/>.
    /// </summary>
    function GetDustDensity: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletDustDetector.TBrickletDustDetector.DustDensity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.DustDensity"/> is only triggered if the dust density has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetDustDensityCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackPeriod"/>.
    /// </summary>
    function GetDustDensityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletDustDetector.TBrickletDustDetector.DustDensityReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the dust density value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the dust density value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the dust density value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the dust density value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetDustDensityCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackThreshold"/>.
    /// </summary>
    procedure GetDustDensityCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletDustDetector.TBrickletDustDetector.DustDensityReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the dust_density.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  The range for the averaging is 0-100.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetMovingAverage(const average: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetMovingAverage"/>.
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
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackPeriod"/>. The parameter is the 
    ///  dust density of the sensor.
    ///  
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.DustDensity"/> is only triggered if the dust density value has changed since the
    ///  last triggering.
    /// </summary>
    property OnDustDensity: TBrickletDustDetectorNotifyDustDensity read dustDensityCallback write dustDensityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletDustDetector.TBrickletDustDetector.SetDustDensityCallbackThreshold"/> is reached.
    ///  The parameter is the dust density of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletDustDetector.TBrickletDustDetector.SetDebouncePeriod"/>.
    /// </summary>
    property OnDustDensityReached: TBrickletDustDetectorNotifyDustDensityReached read dustDensityReachedCallback write dustDensityReachedCallback;
  end;

implementation

constructor TBrickletDustDetector.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_SET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_DUST_DETECTOR_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY] := {$ifdef FPC}@{$endif}CallbackWrapperDustDensity;
  callbackWrappers[BRICKLET_DUST_DETECTOR_CALLBACK_DUST_DENSITY_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperDustDensityReached;
end;

function TBrickletDustDetector.GetDustDensity: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletDustDetector.SetDustDensityCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletDustDetector.GetDustDensityCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletDustDetector.SetDustDensityCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_DUST_DENSITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletDustDetector.GetDustDensityCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DUST_DENSITY_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletDustDetector.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletDustDetector.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletDustDetector.SetMovingAverage(const average: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(average, 8, request);
  SendRequest(request);
end;

function TBrickletDustDetector.GetMovingAverage: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_MOVING_AVERAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletDustDetector.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_DUST_DETECTOR_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletDustDetector.CallbackWrapperDustDensity(const packet: TByteArray);
var dustDensity: word;
begin
  if (Assigned(dustDensityCallback)) then begin
    dustDensity := LEConvertUInt16From(8, packet);
    dustDensityCallback(self, dustDensity);
  end;
end;

procedure TBrickletDustDetector.CallbackWrapperDustDensityReached(const packet: TByteArray);
var dustDensity: word;
begin
  if (Assigned(dustDensityReachedCallback)) then begin
    dustDensity := LEConvertUInt16From(8, packet);
    dustDensityReachedCallback(self, dustDensity);
  end;
end;

end.
