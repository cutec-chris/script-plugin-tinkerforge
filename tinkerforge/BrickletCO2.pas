{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletCO2;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_CO2_DEVICE_IDENTIFIER = 262;
  BRICKLET_CO2_DEVICE_DISPLAY_NAME = 'CO2 Bricklet';

  BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION = 1;
  BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_PERIOD = 2;
  BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_PERIOD = 3;
  BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_THRESHOLD = 4;
  BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_THRESHOLD = 5;
  BRICKLET_CO2_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_CO2_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_CO2_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION = 8;
  BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION_REACHED = 9;

  BRICKLET_CO2_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_CO2_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_CO2_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_CO2_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_CO2_THRESHOLD_OPTION_GREATER = '>';

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletCO2 = class;
  TBrickletCO2NotifyCO2Concentration = procedure(sender: TBrickletCO2; const co2Concentration: word) of object;
  TBrickletCO2NotifyCO2ConcentrationReached = procedure(sender: TBrickletCO2; const co2Concentration: word) of object;

  /// <summary>
  ///  Measures CO2 concentration in ppm
  /// </summary>
  TBrickletCO2 = class(TDevice)
  private
    co2ConcentrationCallback: TBrickletCO2NotifyCO2Concentration;
    co2ConcentrationReachedCallback: TBrickletCO2NotifyCO2ConcentrationReached;
  protected
    procedure CallbackWrapperCO2Concentration(const packet: TByteArray); virtual;
    procedure CallbackWrapperCO2ConcentrationReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the measured CO2 concentration. The value is in 
    ///  `ppm (parts per million) &lt;https://en.wikipedia.org/wiki/Parts-per_notation&gt;`__
    ///  and between 0 to 10000.
    ///  
    ///  If you want to get the CO2 concentration periodically, it is recommended to use the
    ///  callback <see cref="BrickletCO2.TBrickletCO2.CO2Concentration"/> and set the period with
    ///  <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackPeriod"/>.
    /// </summary>
    function GetCO2Concentration: word; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletCO2.TBrickletCO2.CO2Concentration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletCO2.TBrickletCO2.CO2Concentration"/> is only triggered if the CO2 concentration has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetCO2ConcentrationCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackPeriod"/>.
    /// </summary>
    function GetCO2ConcentrationCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletCO2.TBrickletCO2.CO2ConcentrationReached"/> callback.
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the CO2 concentration is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the CO2 concentration is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the CO2 concentration is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the CO2 concentration is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetCO2ConcentrationCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackThreshold"/>.
    /// </summary>
    procedure GetCO2ConcentrationCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletCO2.TBrickletCO2.CO2ConcentrationReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletCO2.TBrickletCO2.SetDebouncePeriod"/>.
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
    ///  <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackPeriod"/>. The parameter is the CO2 concentration of the
    ///  sensor.
    ///  
    ///  <see cref="BrickletCO2.TBrickletCO2.CO2Concentration"/> is only triggered if the CO2 concentration has changed since the
    ///  last triggering.
    /// </summary>
    property OnCO2Concentration: TBrickletCO2NotifyCO2Concentration read co2ConcentrationCallback write co2ConcentrationCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletCO2.TBrickletCO2.SetCO2ConcentrationCallbackThreshold"/> is reached.
    ///  The parameter is the CO2 concentration.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletCO2.TBrickletCO2.SetDebouncePeriod"/>.
    /// </summary>
    property OnCO2ConcentrationReached: TBrickletCO2NotifyCO2ConcentrationReached read co2ConcentrationReachedCallback write co2ConcentrationReachedCallback;
  end;

implementation

constructor TBrickletCO2.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CO2_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_CO2_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_CO2_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION] := {$ifdef FPC}@{$endif}CallbackWrapperCO2Concentration;
  callbackWrappers[BRICKLET_CO2_CALLBACK_CO2_CONCENTRATION_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperCO2ConcentrationReached;
end;

function TBrickletCO2.GetCO2Concentration: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletCO2.SetCO2ConcentrationCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletCO2.GetCO2ConcentrationCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletCO2.SetCO2ConcentrationCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_SET_CO2_CONCENTRATION_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletCO2.GetCO2ConcentrationCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_CO2_CONCENTRATION_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletCO2.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletCO2.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletCO2.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_CO2_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletCO2.CallbackWrapperCO2Concentration(const packet: TByteArray);
var co2Concentration: word;
begin
  if (Assigned(co2ConcentrationCallback)) then begin
    co2Concentration := LEConvertUInt16From(8, packet);
    co2ConcentrationCallback(self, co2Concentration);
  end;
end;

procedure TBrickletCO2.CallbackWrapperCO2ConcentrationReached(const packet: TByteArray);
var co2Concentration: word;
begin
  if (Assigned(co2ConcentrationReachedCallback)) then begin
    co2Concentration := LEConvertUInt16From(8, packet);
    co2ConcentrationReachedCallback(self, co2Concentration);
  end;
end;

end.
