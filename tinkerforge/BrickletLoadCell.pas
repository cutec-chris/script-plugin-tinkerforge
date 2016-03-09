{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletLoadCell;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_LOAD_CELL_DEVICE_IDENTIFIER = 253;
  BRICKLET_LOAD_CELL_DEVICE_DISPLAY_NAME = 'Load Cell Bricklet';

  BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT = 1;
  BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_PERIOD = 2;
  BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_PERIOD = 3;
  BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD = 4;
  BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD = 5;
  BRICKLET_LOAD_CELL_FUNCTION_SET_DEBOUNCE_PERIOD = 6;
  BRICKLET_LOAD_CELL_FUNCTION_GET_DEBOUNCE_PERIOD = 7;
  BRICKLET_LOAD_CELL_FUNCTION_SET_MOVING_AVERAGE = 8;
  BRICKLET_LOAD_CELL_FUNCTION_GET_MOVING_AVERAGE = 9;
  BRICKLET_LOAD_CELL_FUNCTION_LED_ON = 10;
  BRICKLET_LOAD_CELL_FUNCTION_LED_OFF = 11;
  BRICKLET_LOAD_CELL_FUNCTION_IS_LED_ON = 12;
  BRICKLET_LOAD_CELL_FUNCTION_CALIBRATE = 13;
  BRICKLET_LOAD_CELL_FUNCTION_TARE = 14;
  BRICKLET_LOAD_CELL_FUNCTION_SET_CONFIGURATION = 15;
  BRICKLET_LOAD_CELL_FUNCTION_GET_CONFIGURATION = 16;
  BRICKLET_LOAD_CELL_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_LOAD_CELL_CALLBACK_WEIGHT = 17;
  BRICKLET_LOAD_CELL_CALLBACK_WEIGHT_REACHED = 18;

  BRICKLET_LOAD_CELL_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_LOAD_CELL_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_LOAD_CELL_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_LOAD_CELL_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_LOAD_CELL_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_LOAD_CELL_RATE_10HZ = 0;
  BRICKLET_LOAD_CELL_RATE_80HZ = 1;
  BRICKLET_LOAD_CELL_GAIN_128X = 0;
  BRICKLET_LOAD_CELL_GAIN_64X = 1;
  BRICKLET_LOAD_CELL_GAIN_32X = 2;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLoadCell = class;
  TBrickletLoadCellNotifyWeight = procedure(sender: TBrickletLoadCell; const weight: longint) of object;
  TBrickletLoadCellNotifyWeightReached = procedure(sender: TBrickletLoadCell; const weight: longint) of object;

  /// <summary>
  ///  Measures weight with a load cell
  /// </summary>
  TBrickletLoadCell = class(TDevice)
  private
    weightCallback: TBrickletLoadCellNotifyWeight;
    weightReachedCallback: TBrickletLoadCellNotifyWeightReached;
  protected
    procedure CallbackWrapperWeight(const packet: TByteArray); virtual;
    procedure CallbackWrapperWeightReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the currently measured weight in grams.
    ///  
    ///  If you want to get the weight periodically, it is recommended 
    ///  to use the callback <see cref="BrickletLoadCell.TBrickletLoadCell.Weight"/> and set the period with 
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackPeriod"/>.
    /// </summary>
    function GetWeight: longint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletLoadCell.TBrickletLoadCell.Weight"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.Weight"/> is only triggered if the weight has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetWeightCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackPeriod"/>.
    /// </summary>
    function GetWeightCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLoadCell.TBrickletLoadCell.WeightReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the weight is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the weight is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the weight is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the weight is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetWeightCallbackThreshold(const option: char; const min: longint; const max: longint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackThreshold"/>.
    /// </summary>
    procedure GetWeightCallbackThreshold(out option: char; out min: longint; out max: longint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callback
    ///  
    ///  * <see cref="BrickletLoadCell.TBrickletLoadCell.WeightReached"/>
    ///  
    ///  is triggered, if the threshold
    ///  
    ///  * <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackThreshold"/>
    ///  
    ///  keeps being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the weight value.
    ///  
    ///  Setting the length to 1 will turn the averaging off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  The range for the averaging is 1-40.
    ///  
    ///  The default value is 4.
    /// </summary>
    procedure SetMovingAverage(const average: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetMovingAverage"/>.
    /// </summary>
    function GetMovingAverage: byte; virtual;

    /// <summary>
    ///  Turns the LED on.
    /// </summary>
    procedure LEDOn; virtual;

    /// <summary>
    ///  Turns the LED off.
    /// </summary>
    procedure LEDOff; virtual;

    /// <summary>
    ///  Returns *true* if the led is on, *false* otherwise.
    /// </summary>
    function IsLEDOn: boolean; virtual;

    /// <summary>
    ///  To calibrate your Load Cell Bricklet you have to
    ///  
    ///  * empty the scale and call this function with 0 and
    ///  * add a known weight to the scale and call this function with the weight in 
    ///    grams.
    ///  
    ///  The calibration is saved in the EEPROM of the Bricklet and only
    ///  needs to be done once.
    ///  
    ///  We recommend to use the Brick Viewer for calibration, you don't need
    ///  to call this function in your source code.
    /// </summary>
    procedure Calibrate(const weight: longword); virtual;

    /// <summary>
    ///  Sets the currently measured weight as tare weight.
    /// </summary>
    procedure Tare; virtual;

    /// <summary>
    ///  The measurement rate and gain are configurable.
    ///  
    ///  The rate can be either 10Hz or 80Hz. A faster rate will produce more noise.
    ///  It is additionally possible to add a moving average
    ///  (see <see cref="BrickletLoadCell.TBrickletLoadCell.SetMovingAverage"/>) to the measurements.
    ///  
    ///  The gain can be 128x, 64x or 32x. It represents a measurement range of
    ///  ±20mV, ±40mV and ±80mV respectively. The Load Cell Bricklet uses an
    ///  excitation voltage of 5V and most load cells use an output of 2mV/V. That
    ///  means the voltage range is ±15mV for most load cells (i.e. gain of 128x
    ///  is best). If you don't know what all of this means you should keep it at 
    ///  128x, it will most likely be correct.
    ///  
    ///  The configuration is saved in the EEPROM of the Bricklet and only
    ///  needs to be done once.
    ///  
    ///  We recommend to use the Brick Viewer for configuration, you don't need
    ///  to call this function in your source code.
    ///  
    ///  The default rate is 10Hz and the default gain is 128x.
    /// </summary>
    procedure SetConfiguration(const rate: byte; const gain: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out rate: byte; out gain: byte); virtual;

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
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackPeriod"/>. The parameter is the weight
    ///  as measured by the load cell.
    ///  
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.Weight"/> is only triggered if the weight has changed since the
    ///  last triggering.
    /// </summary>
    property OnWeight: TBrickletLoadCellNotifyWeight read weightCallback write weightCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLoadCell.TBrickletLoadCell.SetWeightCallbackThreshold"/> is reached.
    ///  The parameter is the weight as measured by the load cell.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLoadCell.TBrickletLoadCell.SetDebouncePeriod"/>.
    /// </summary>
    property OnWeightReached: TBrickletLoadCellNotifyWeightReached read weightReachedCallback write weightReachedCallback;
  end;

implementation

constructor TBrickletLoadCell.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_LED_ON] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_LED_OFF] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_IS_LED_ON] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_CALIBRATE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_TARE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_SET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LOAD_CELL_CALLBACK_WEIGHT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_CALLBACK_WEIGHT_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LOAD_CELL_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_LOAD_CELL_CALLBACK_WEIGHT] := {$ifdef FPC}@{$endif}CallbackWrapperWeight;
  callbackWrappers[BRICKLET_LOAD_CELL_CALLBACK_WEIGHT_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperWeightReached;
end;

function TBrickletLoadCell.GetWeight: longint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT, 8);
  response := SendRequest(request);
  result := LEConvertInt32From(8, response);
end;

procedure TBrickletLoadCell.SetWeightCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletLoadCell.GetWeightCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLoadCell.SetWeightCallbackThreshold(const option: char; const min: longint; const max: longint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_WEIGHT_CALLBACK_THRESHOLD, 17);
  LEConvertCharTo(option, 8, request);
  LEConvertInt32To(min, 9, request);
  LEConvertInt32To(max, 13, request);
  SendRequest(request);
end;

procedure TBrickletLoadCell.GetWeightCallbackThreshold(out option: char; out min: longint; out max: longint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_WEIGHT_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt32From(9, response);
  max := LEConvertInt32From(13, response);
end;

procedure TBrickletLoadCell.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletLoadCell.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLoadCell.SetMovingAverage(const average: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_MOVING_AVERAGE, 9);
  LEConvertUInt8To(average, 8, request);
  SendRequest(request);
end;

function TBrickletLoadCell.GetMovingAverage: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_MOVING_AVERAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletLoadCell.LEDOn;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_LED_ON, 8);
  SendRequest(request);
end;

procedure TBrickletLoadCell.LEDOff;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_LED_OFF, 8);
  SendRequest(request);
end;

function TBrickletLoadCell.IsLEDOn: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_IS_LED_ON, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletLoadCell.Calibrate(const weight: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_CALIBRATE, 12);
  LEConvertUInt32To(weight, 8, request);
  SendRequest(request);
end;

procedure TBrickletLoadCell.Tare;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_TARE, 8);
  SendRequest(request);
end;

procedure TBrickletLoadCell.SetConfiguration(const rate: byte; const gain: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(rate, 8, request);
  LEConvertUInt8To(gain, 9, request);
  SendRequest(request);
end;

procedure TBrickletLoadCell.GetConfiguration(out rate: byte; out gain: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_CONFIGURATION, 8);
  response := SendRequest(request);
  rate := LEConvertUInt8From(8, response);
  gain := LEConvertUInt8From(9, response);
end;

procedure TBrickletLoadCell.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LOAD_CELL_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletLoadCell.CallbackWrapperWeight(const packet: TByteArray);
var weight: longint;
begin
  if (Assigned(weightCallback)) then begin
    weight := LEConvertInt32From(8, packet);
    weightCallback(self, weight);
  end;
end;

procedure TBrickletLoadCell.CallbackWrapperWeightReached(const packet: TByteArray);
var weight: longint;
begin
  if (Assigned(weightReachedCallback)) then begin
    weight := LEConvertInt32From(8, packet);
    weightReachedCallback(self, weight);
  end;
end;

end.
