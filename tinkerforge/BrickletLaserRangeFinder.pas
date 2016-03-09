{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletLaserRangeFinder;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_LASER_RANGE_FINDER_DEVICE_IDENTIFIER = 255;
  BRICKLET_LASER_RANGE_FINDER_DEVICE_DISPLAY_NAME = 'Laser Range Finder Bricklet';

  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE = 1;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY = 2;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD = 3;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD = 4;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_PERIOD = 5;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_PERIOD = 6;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD = 7;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD = 8;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD = 9;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD = 10;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DEBOUNCE_PERIOD = 11;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DEBOUNCE_PERIOD = 12;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MOVING_AVERAGE = 13;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MOVING_AVERAGE = 14;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MODE = 15;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MODE = 16;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_ENABLE_LASER = 17;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_DISABLE_LASER = 18;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_IS_LASER_ENABLED = 19;
  BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_IDENTITY = 255;

  BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE = 20;
  BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY = 21;
  BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE_REACHED = 22;
  BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY_REACHED = 23;

  BRICKLET_LASER_RANGE_FINDER_THRESHOLD_OPTION_OFF = 'x';
  BRICKLET_LASER_RANGE_FINDER_THRESHOLD_OPTION_OUTSIDE = 'o';
  BRICKLET_LASER_RANGE_FINDER_THRESHOLD_OPTION_INSIDE = 'i';
  BRICKLET_LASER_RANGE_FINDER_THRESHOLD_OPTION_SMALLER = '<';
  BRICKLET_LASER_RANGE_FINDER_THRESHOLD_OPTION_GREATER = '>';
  BRICKLET_LASER_RANGE_FINDER_MODE_DISTANCE = 0;
  BRICKLET_LASER_RANGE_FINDER_MODE_VELOCITY_MAX_13MS = 1;
  BRICKLET_LASER_RANGE_FINDER_MODE_VELOCITY_MAX_32MS = 2;
  BRICKLET_LASER_RANGE_FINDER_MODE_VELOCITY_MAX_64MS = 3;
  BRICKLET_LASER_RANGE_FINDER_MODE_VELOCITY_MAX_127MS = 4;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  TBrickletLaserRangeFinder = class;
  TBrickletLaserRangeFinderNotifyDistance = procedure(sender: TBrickletLaserRangeFinder; const distance: word) of object;
  TBrickletLaserRangeFinderNotifyVelocity = procedure(sender: TBrickletLaserRangeFinder; const velocity: smallint) of object;
  TBrickletLaserRangeFinderNotifyDistanceReached = procedure(sender: TBrickletLaserRangeFinder; const distance: word) of object;
  TBrickletLaserRangeFinderNotifyVelocityReached = procedure(sender: TBrickletLaserRangeFinder; const velocity: smallint) of object;

  /// <summary>
  ///  Measures distance up to 40m with laser light
  /// </summary>
  TBrickletLaserRangeFinder = class(TDevice)
  private
    distanceCallback: TBrickletLaserRangeFinderNotifyDistance;
    velocityCallback: TBrickletLaserRangeFinderNotifyVelocity;
    distanceReachedCallback: TBrickletLaserRangeFinderNotifyDistanceReached;
    velocityReachedCallback: TBrickletLaserRangeFinderNotifyVelocityReached;
  protected
    procedure CallbackWrapperDistance(const packet: TByteArray); virtual;
    procedure CallbackWrapperVelocity(const packet: TByteArray); virtual;
    procedure CallbackWrapperDistanceReached(const packet: TByteArray); virtual;
    procedure CallbackWrapperVelocityReached(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the measured distance. The value has a range of 0 to 4000
    ///  and is given in cm.
    ///  
    ///  The Laser Range Finder Bricklet knows different modes. Distances
    ///  are only measured in the distance measurement mode,
    ///  see <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMode"/>. Also the laser has to be enabled, see
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.EnableLaser"/>.
    ///  
    ///  If you want to get the distance periodically, it is recommended to
    ///  use the callback <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Distance"/> and set the period with 
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistance: word; virtual;

    /// <summary>
    ///  Returns the measured velocity. The value has a range of 0 to 12700
    ///  and is given in 1/100 m/s.
    ///  
    ///  The Laser Range Finder Bricklet knows different modes. Velocity 
    ///  is only measured in the velocity measurement modes, 
    ///  see <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMode"/>. Also the laser has to be enabled, see
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.EnableLaser"/>.
    ///  
    ///  If you want to get the velocity periodically, it is recommended to
    ///  use the callback <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Velocity"/> and set the period with 
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackPeriod"/>.
    /// </summary>
    function GetVelocity: smallint; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Distance"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Distance"/> is only triggered if the distance value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetDistanceCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackPeriod"/>.
    /// </summary>
    function GetDistanceCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Velocity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Velocity"/> is only triggered if the velocity value has changed since the
    ///  last triggering.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetVelocityCallbackPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackPeriod"/>.
    /// </summary>
    function GetVelocityCallbackPeriod: longword; virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.DistanceReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the distance value is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the distance value is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the distance value is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the distance value is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetDistanceCallbackThreshold(const option: char; const min: word; const max: word); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackThreshold"/>.
    /// </summary>
    procedure GetDistanceCallbackThreshold(out option: char; out min: word; out max: word); virtual;

    /// <summary>
    ///  Sets the thresholds for the <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.VelocityReached"/> callback. 
    ///  
    ///  The following options are possible:
    ///  
    ///  <code>
    ///   "Option", "Description"
    ///  
    ///   "'x'",    "Callback is turned off"
    ///   "'o'",    "Callback is triggered when the velocity is *outside* the min and max values"
    ///   "'i'",    "Callback is triggered when the velocity is *inside* the min and max values"
    ///   "'&lt;'",    "Callback is triggered when the velocity is smaller than the min value (max is ignored)"
    ///   "'&gt;'",    "Callback is triggered when the velocity is greater than the min value (max is ignored)"
    ///  </code>
    ///  
    ///  The default value is ('x', 0, 0).
    /// </summary>
    procedure SetVelocityCallbackThreshold(const option: char; const min: smallint; const max: smallint); virtual;

    /// <summary>
    ///  Returns the threshold as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackThreshold"/>.
    /// </summary>
    procedure GetVelocityCallbackThreshold(out option: char; out min: smallint; out max: smallint); virtual;

    /// <summary>
    ///  Sets the period in ms with which the threshold callbacks
    ///  
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.DistanceReached"/>,
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.VelocityReached"/>,
    ///  
    ///  are triggered, if the thresholds
    ///  
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackThreshold"/>,
    ///  * <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackThreshold"/>,
    ///  
    ///  keep being reached.
    ///  
    ///  The default value is 100.
    /// </summary>
    procedure SetDebouncePeriod(const debounce: longword); virtual;

    /// <summary>
    ///  Returns the debounce period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDebouncePeriod"/>.
    /// </summary>
    function GetDebouncePeriod: longword; virtual;

    /// <summary>
    ///  Sets the length of a `moving averaging &lt;https://en.wikipedia.org/wiki/Moving_average&gt;`__
    ///  for the distance and velocity.
    ///  
    ///  Setting the length to 0 will turn the averaging completely off. With less
    ///  averaging, there is more noise on the data.
    ///  
    ///  The range for the averaging is 0-30.
    ///  
    ///  The default value is 10.
    /// </summary>
    procedure SetMovingAverage(const distanceAverageLength: byte; const velocityAverageLength: byte); virtual;

    /// <summary>
    ///  Returns the length moving average as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMovingAverage"/>.
    /// </summary>
    procedure GetMovingAverage(out distanceAverageLength: byte; out velocityAverageLength: byte); virtual;

    /// <summary>
    ///  The LIDAR has five different modes. One mode is for distance
    ///  measurements and four modes are for velocity measurements with
    ///  different ranges.
    ///  
    ///  The following modes are available:
    ///  
    ///  * 0: Distance is measured with resolution 1.0 cm and range 0-400 cm
    ///  * 1: Velocity is measured with resolution 0.1 m/s and range is 0-12.7 m/s
    ///  * 2: Velocity is measured with resolution 0.25 m/s and range is 0-31.75 m/s
    ///  * 3: Velocity is measured with resolution 0.5 m/s and range is 0-63.5 m/s
    ///  * 4: Velocity is measured with resolution 1.0 m/s and range is 0-127 m/s
    ///  
    ///  The default mode is 0 (distance is measured).
    /// </summary>
    procedure SetMode(const mode: byte); virtual;

    /// <summary>
    ///  Returns the mode as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetMode"/>.
    /// </summary>
    function GetMode: byte; virtual;

    /// <summary>
    ///  Activates the laser of the LIDAR.
    ///  
    ///  We recommend that you wait 250ms after enabling the laser before
    ///  the first call of <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.GetDistance"/> to ensure stable measurements.
    /// </summary>
    procedure EnableLaser; virtual;

    /// <summary>
    ///  Deactivates the laser of the LIDAR.
    /// </summary>
    procedure DisableLaser; virtual;

    /// <summary>
    ///  Returns *true* if the laser is enabled, *false* otherwise.
    /// </summary>
    function IsLaserEnabled: boolean; virtual;

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
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackPeriod"/>. The parameter is the distance value
    ///  of the sensor.
    ///  
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Distance"/> is only triggered if the distance value has changed since the
    ///  last triggering.
    /// </summary>
    property OnDistance: TBrickletLaserRangeFinderNotifyDistance read distanceCallback write distanceCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackPeriod"/>. The parameter is the velocity value
    ///  of the sensor.
    ///  
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.Velocity"/> is only triggered if the velocity has changed since the
    ///  last triggering.
    /// </summary>
    property OnVelocity: TBrickletLaserRangeFinderNotifyVelocity read velocityCallback write velocityCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDistanceCallbackThreshold"/> is reached.
    ///  The parameter is the distance value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDebouncePeriod"/>.
    /// </summary>
    property OnDistanceReached: TBrickletLaserRangeFinderNotifyDistanceReached read distanceReachedCallback write distanceReachedCallback;

    /// <summary>
    ///  This callback is triggered when the threshold as set by
    ///  <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetVelocityCallbackThreshold"/> is reached.
    ///  The parameter is the velocity value of the sensor.
    ///  
    ///  If the threshold keeps being reached, the callback is triggered periodically
    ///  with the period as set by <see cref="BrickletLaserRangeFinder.TBrickletLaserRangeFinder.SetDebouncePeriod"/>.
    /// </summary>
    property OnVelocityReached: TBrickletLaserRangeFinderNotifyVelocityReached read velocityReachedCallback write velocityReachedCallback;
  end;

implementation

constructor TBrickletLaserRangeFinder.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DEBOUNCE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MOVING_AVERAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MODE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MODE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_ENABLE_LASER] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_DISABLE_LASER] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_IS_LASER_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY_REACHED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE] := {$ifdef FPC}@{$endif}CallbackWrapperDistance;
  callbackWrappers[BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY] := {$ifdef FPC}@{$endif}CallbackWrapperVelocity;
  callbackWrappers[BRICKLET_LASER_RANGE_FINDER_CALLBACK_DISTANCE_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperDistanceReached;
  callbackWrappers[BRICKLET_LASER_RANGE_FINDER_CALLBACK_VELOCITY_REACHED] := {$ifdef FPC}@{$endif}CallbackWrapperVelocityReached;
end;

function TBrickletLaserRangeFinder.GetDistance: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletLaserRangeFinder.GetVelocity: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickletLaserRangeFinder.SetDistanceCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletLaserRangeFinder.GetDistanceCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLaserRangeFinder.SetVelocityCallbackPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickletLaserRangeFinder.GetVelocityCallbackPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLaserRangeFinder.SetDistanceCallbackThreshold(const option: char; const min: word; const max: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DISTANCE_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertUInt16To(min, 9, request);
  LEConvertUInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletLaserRangeFinder.GetDistanceCallbackThreshold(out option: char; out min: word; out max: word);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DISTANCE_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertUInt16From(9, response);
  max := LEConvertUInt16From(11, response);
end;

procedure TBrickletLaserRangeFinder.SetVelocityCallbackThreshold(const option: char; const min: smallint; const max: smallint);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_VELOCITY_CALLBACK_THRESHOLD, 13);
  LEConvertCharTo(option, 8, request);
  LEConvertInt16To(min, 9, request);
  LEConvertInt16To(max, 11, request);
  SendRequest(request);
end;

procedure TBrickletLaserRangeFinder.GetVelocityCallbackThreshold(out option: char; out min: smallint; out max: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_VELOCITY_CALLBACK_THRESHOLD, 8);
  response := SendRequest(request);
  option := LEConvertCharFrom(8, response);
  min := LEConvertInt16From(9, response);
  max := LEConvertInt16From(11, response);
end;

procedure TBrickletLaserRangeFinder.SetDebouncePeriod(const debounce: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_DEBOUNCE_PERIOD, 12);
  LEConvertUInt32To(debounce, 8, request);
  SendRequest(request);
end;

function TBrickletLaserRangeFinder.GetDebouncePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_DEBOUNCE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickletLaserRangeFinder.SetMovingAverage(const distanceAverageLength: byte; const velocityAverageLength: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MOVING_AVERAGE, 10);
  LEConvertUInt8To(distanceAverageLength, 8, request);
  LEConvertUInt8To(velocityAverageLength, 9, request);
  SendRequest(request);
end;

procedure TBrickletLaserRangeFinder.GetMovingAverage(out distanceAverageLength: byte; out velocityAverageLength: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MOVING_AVERAGE, 8);
  response := SendRequest(request);
  distanceAverageLength := LEConvertUInt8From(8, response);
  velocityAverageLength := LEConvertUInt8From(9, response);
end;

procedure TBrickletLaserRangeFinder.SetMode(const mode: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_SET_MODE, 9);
  LEConvertUInt8To(mode, 8, request);
  SendRequest(request);
end;

function TBrickletLaserRangeFinder.GetMode: byte;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_MODE, 8);
  response := SendRequest(request);
  result := LEConvertUInt8From(8, response);
end;

procedure TBrickletLaserRangeFinder.EnableLaser;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_ENABLE_LASER, 8);
  SendRequest(request);
end;

procedure TBrickletLaserRangeFinder.DisableLaser;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_DISABLE_LASER, 8);
  SendRequest(request);
end;

function TBrickletLaserRangeFinder.IsLaserEnabled: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_IS_LASER_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletLaserRangeFinder.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_LASER_RANGE_FINDER_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperDistance(const packet: TByteArray);
var distance: word;
begin
  if (Assigned(distanceCallback)) then begin
    distance := LEConvertUInt16From(8, packet);
    distanceCallback(self, distance);
  end;
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperVelocity(const packet: TByteArray);
var velocity: smallint;
begin
  if (Assigned(velocityCallback)) then begin
    velocity := LEConvertInt16From(8, packet);
    velocityCallback(self, velocity);
  end;
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperDistanceReached(const packet: TByteArray);
var distance: word;
begin
  if (Assigned(distanceReachedCallback)) then begin
    distance := LEConvertUInt16From(8, packet);
    distanceReachedCallback(self, distance);
  end;
end;

procedure TBrickletLaserRangeFinder.CallbackWrapperVelocityReached(const packet: TByteArray);
var velocity: smallint;
begin
  if (Assigned(velocityReachedCallback)) then begin
    velocity := LEConvertInt16From(8, packet);
    velocityReachedCallback(self, velocity);
  end;
end;

end.
