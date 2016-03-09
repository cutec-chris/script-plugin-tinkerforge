{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickIMUV2;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICK_IMU_V2_DEVICE_IDENTIFIER = 18;
  BRICK_IMU_V2_DEVICE_DISPLAY_NAME = 'IMU Brick 2.0';

  BRICK_IMU_V2_FUNCTION_GET_ACCELERATION = 1;
  BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD = 2;
  BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY = 3;
  BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE = 4;
  BRICK_IMU_V2_FUNCTION_GET_ORIENTATION = 5;
  BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION = 6;
  BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR = 7;
  BRICK_IMU_V2_FUNCTION_GET_QUATERNION = 8;
  BRICK_IMU_V2_FUNCTION_GET_ALL_DATA = 9;
  BRICK_IMU_V2_FUNCTION_LEDS_ON = 10;
  BRICK_IMU_V2_FUNCTION_LEDS_OFF = 11;
  BRICK_IMU_V2_FUNCTION_ARE_LEDS_ON = 12;
  BRICK_IMU_V2_FUNCTION_SAVE_CALIBRATION = 13;
  BRICK_IMU_V2_FUNCTION_SET_ACCELERATION_PERIOD = 14;
  BRICK_IMU_V2_FUNCTION_GET_ACCELERATION_PERIOD = 15;
  BRICK_IMU_V2_FUNCTION_SET_MAGNETIC_FIELD_PERIOD = 16;
  BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD_PERIOD = 17;
  BRICK_IMU_V2_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD = 18;
  BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD = 19;
  BRICK_IMU_V2_FUNCTION_SET_TEMPERATURE_PERIOD = 20;
  BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE_PERIOD = 21;
  BRICK_IMU_V2_FUNCTION_SET_ORIENTATION_PERIOD = 22;
  BRICK_IMU_V2_FUNCTION_GET_ORIENTATION_PERIOD = 23;
  BRICK_IMU_V2_FUNCTION_SET_LINEAR_ACCELERATION_PERIOD = 24;
  BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION_PERIOD = 25;
  BRICK_IMU_V2_FUNCTION_SET_GRAVITY_VECTOR_PERIOD = 26;
  BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR_PERIOD = 27;
  BRICK_IMU_V2_FUNCTION_SET_QUATERNION_PERIOD = 28;
  BRICK_IMU_V2_FUNCTION_GET_QUATERNION_PERIOD = 29;
  BRICK_IMU_V2_FUNCTION_SET_ALL_DATA_PERIOD = 30;
  BRICK_IMU_V2_FUNCTION_GET_ALL_DATA_PERIOD = 31;
  BRICK_IMU_V2_FUNCTION_ENABLE_STATUS_LED = 238;
  BRICK_IMU_V2_FUNCTION_DISABLE_STATUS_LED = 239;
  BRICK_IMU_V2_FUNCTION_IS_STATUS_LED_ENABLED = 240;
  BRICK_IMU_V2_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME = 241;
  BRICK_IMU_V2_FUNCTION_GET_CHIP_TEMPERATURE = 242;
  BRICK_IMU_V2_FUNCTION_RESET = 243;
  BRICK_IMU_V2_FUNCTION_GET_IDENTITY = 255;

  BRICK_IMU_V2_CALLBACK_ACCELERATION = 32;
  BRICK_IMU_V2_CALLBACK_MAGNETIC_FIELD = 33;
  BRICK_IMU_V2_CALLBACK_ANGULAR_VELOCITY = 34;
  BRICK_IMU_V2_CALLBACK_TEMPERATURE = 35;
  BRICK_IMU_V2_CALLBACK_LINEAR_ACCELERATION = 36;
  BRICK_IMU_V2_CALLBACK_GRAVITY_VECTOR = 37;
  BRICK_IMU_V2_CALLBACK_ORIENTATION = 38;
  BRICK_IMU_V2_CALLBACK_QUATERNION = 39;
  BRICK_IMU_V2_CALLBACK_ALL_DATA = 40;


type
  TArray0To2OfUInt8 = array [0..2] of byte;
  TArray0To3OfInt16 = array [0..3] of smallint;
  TArray0To2OfInt16 = array [0..2] of smallint;

  TBrickIMUV2 = class;
  TBrickIMUV2NotifyAcceleration = procedure(sender: TBrickIMUV2; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUV2NotifyMagneticField = procedure(sender: TBrickIMUV2; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUV2NotifyAngularVelocity = procedure(sender: TBrickIMUV2; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUV2NotifyTemperature = procedure(sender: TBrickIMUV2; const temperature: shortint) of object;
  TBrickIMUV2NotifyLinearAcceleration = procedure(sender: TBrickIMUV2; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUV2NotifyGravityVector = procedure(sender: TBrickIMUV2; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUV2NotifyOrientation = procedure(sender: TBrickIMUV2; const heading: smallint; const roll: smallint; const pitch: smallint) of object;
  TBrickIMUV2NotifyQuaternion = procedure(sender: TBrickIMUV2; const w: smallint; const x: smallint; const y: smallint; const z: smallint) of object;
  TBrickIMUV2NotifyAllData = procedure(sender: TBrickIMUV2; const acceleration: TArray0To2OfInt16; const magneticField: TArray0To2OfInt16; const angularVelocity: TArray0To2OfInt16; const eulerAngle: TArray0To2OfInt16; const quaternion: TArray0To3OfInt16; const linearAcceleration: TArray0To2OfInt16; const gravityVector: TArray0To2OfInt16; const temperature: shortint; const calibrationStatus: byte) of object;

  /// <summary>
  ///  Full fledged AHRS with 9 degrees of freedom
  /// </summary>
  TBrickIMUV2 = class(TDevice)
  private
    accelerationCallback: TBrickIMUV2NotifyAcceleration;
    magneticFieldCallback: TBrickIMUV2NotifyMagneticField;
    angularVelocityCallback: TBrickIMUV2NotifyAngularVelocity;
    temperatureCallback: TBrickIMUV2NotifyTemperature;
    linearAccelerationCallback: TBrickIMUV2NotifyLinearAcceleration;
    gravityVectorCallback: TBrickIMUV2NotifyGravityVector;
    orientationCallback: TBrickIMUV2NotifyOrientation;
    quaternionCallback: TBrickIMUV2NotifyQuaternion;
    allDataCallback: TBrickIMUV2NotifyAllData;
  protected
    procedure CallbackWrapperAcceleration(const packet: TByteArray); virtual;
    procedure CallbackWrapperMagneticField(const packet: TByteArray); virtual;
    procedure CallbackWrapperAngularVelocity(const packet: TByteArray); virtual;
    procedure CallbackWrapperTemperature(const packet: TByteArray); virtual;
    procedure CallbackWrapperLinearAcceleration(const packet: TByteArray); virtual;
    procedure CallbackWrapperGravityVector(const packet: TByteArray); virtual;
    procedure CallbackWrapperOrientation(const packet: TByteArray); virtual;
    procedure CallbackWrapperQuaternion(const packet: TByteArray); virtual;
    procedure CallbackWrapperAllData(const packet: TByteArray); virtual;
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Returns the calibrated acceleration from the accelerometer for the 
    ///  x, y and z axis in 1/100 m/s².
    ///  
    ///  If you want to get the acceleration periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.Acceleration"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAccelerationPeriod"/>.
    /// </summary>
    procedure GetAcceleration(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated magnetic field from the magnetometer for the 
    ///  x, y and z axis in 1/16 µT (Microtesla).
    ///  
    ///  If you want to get the magnetic field periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.MagneticField"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetMagneticFieldPeriod"/>.
    /// </summary>
    procedure GetMagneticField(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the calibrated angular velocity from the gyroscope for the 
    ///  x, y and z axis in 1/16 °/s.
    ///  
    ///  If you want to get the angular velocity periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.AngularVelocity"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAngularVelocityPeriod"/>.
    /// </summary>
    procedure GetAngularVelocity(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the temperature of the IMU Brick. The temperature is given in 
    ///  °C. The temperature is measured in the core of the BNO055 IC, it is not the
    ///  ambient temperature
    /// </summary>
    function GetTemperature: shortint; virtual;

    /// <summary>
    ///  Returns the current orientation (heading, roll, pitch) of the IMU Brick as
    ///  independent Euler angles in 1/16 degree. Note that Euler angles always
    ///  experience a `gimbal lock &lt;https://en.wikipedia.org/wiki/Gimbal_lock&gt;`__. We
    ///  recommend that you use quaternions instead, if you need the absolute orientation.
    ///  
    ///  The rotation angle has the following ranges:
    ///  
    ///  * heading: 0° to 360°
    ///  * roll: -90° to +90°
    ///  * pitch: -180° to +180°
    ///  
    ///  If you want to get the orientation periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.Orientation"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetOrientationPeriod"/>.
    /// </summary>
    procedure GetOrientation(out heading: smallint; out roll: smallint; out pitch: smallint); virtual;

    /// <summary>
    ///  Returns the linear acceleration of the IMU Brick for the
    ///  x, y and z axis in 1/100 m/s².
    ///  
    ///  The linear acceleration is the acceleration in each of the three
    ///  axis of the IMU Brick with the influences of gravity removed.
    ///  
    ///  It is also possible to get the gravity vector with the influence of linear
    ///  acceleration removed, see <see cref="BrickIMUV2.TBrickIMUV2.GetGravityVector"/>.
    ///  
    ///  If you want to get the linear acceleration periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.LinearAcceleration"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetLinearAccelerationPeriod"/>.
    /// </summary>
    procedure GetLinearAcceleration(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the current gravity vector of the IMU Brick for the
    ///  x, y and z axis in 1/100 m/s².
    ///  
    ///  The gravity vector is the acceleration that occurs due to gravity.
    ///  Influences of additional linear acceleration are removed.
    ///  
    ///  It is also possible to get the linear acceleration with the influence 
    ///  of gravity removed, see <see cref="BrickIMUV2.TBrickIMUV2.GetLinearAcceleration"/>.
    ///  
    ///  If you want to get the gravity vector periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.GravityVector"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetGravityVectorPeriod"/>.
    /// </summary>
    procedure GetGravityVector(out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Returns the current orientation (w, x, y, z) of the IMU Brick as
    ///  `quaternions &lt;https://en.wikipedia.org/wiki/Quaternions_and_spatial_rotation&gt;`__.
    ///  
    ///  You have to divide the returns values by 16383 (14 bit) to get
    ///  the usual range of -1.0 to +1.0 for quaternions.
    ///  
    ///  If you want to get the quaternions periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.Quaternion"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetQuaternionPeriod"/>.
    /// </summary>
    procedure GetQuaternion(out w: smallint; out x: smallint; out y: smallint; out z: smallint); virtual;

    /// <summary>
    ///  Return all of the available data of the IMU Brick.
    ///  
    ///  * acceleration in 1/100 m/s² (see <see cref="BrickIMUV2.TBrickIMUV2.GetAcceleration"/>)
    ///  * magnetic field in 1/16 µT (see <see cref="BrickIMUV2.TBrickIMUV2.GetMagneticField"/>)
    ///  * angular velocity in 1/16 °/s (see <see cref="BrickIMUV2.TBrickIMUV2.GetAngularVelocity"/>)
    ///  * Euler angles in 1/16 ° (see <see cref="BrickIMUV2.TBrickIMUV2.GetOrientation"/>)
    ///  * quaternion 1/16383 (see <see cref="BrickIMUV2.TBrickIMUV2.GetQuaternion"/>)
    ///  * linear acceleration 1/100 m/s² (see <see cref="BrickIMUV2.TBrickIMUV2.GetLinearAcceleration"/>)
    ///  * gravity vector 1/100 m/s² (see <see cref="BrickIMUV2.TBrickIMUV2.GetGravityVector"/>)
    ///  * temperature in 1 °C (see <see cref="BrickIMUV2.TBrickIMUV2.GetTemperature"/>)
    ///  * calibration status (see below)
    ///  
    ///  The calibration status consists of four pairs of two bits. Each pair
    ///  of bits represents the status of the current calibration.
    ///  
    ///  * bit 0-1: Magnetometer
    ///  * bit 2-3: Accelerometer
    ///  * bit 4-5: Gyroscope
    ///  * bit 6-7: System
    ///  
    ///  A value of 0 means for "not calibrated" and a value of 3 means
    ///  "fully calibrated". In your program you should always be able to
    ///  ignore the calibration status, it is used by the calibration
    ///  window of the Brick Viewer and it can be ignored after the first
    ///  calibration. See the documentation in the calibration window for
    ///  more information regarding the calibration of the IMU Brick.
    ///  
    ///  If you want to get the data periodically, it is recommended 
    ///  to use the callback <see cref="BrickIMUV2.TBrickIMUV2.AllData"/> and set the period with 
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAllDataPeriod"/>.
    /// </summary>
    procedure GetAllData(out acceleration: TArray0To2OfInt16; out magneticField: TArray0To2OfInt16; out angularVelocity: TArray0To2OfInt16; out eulerAngle: TArray0To2OfInt16; out quaternion: TArray0To3OfInt16; out linearAcceleration: TArray0To2OfInt16; out gravityVector: TArray0To2OfInt16; out temperature: shortint; out calibrationStatus: byte); virtual;

    /// <summary>
    ///  Turns the orientation and direction LEDs of the IMU Brick on.
    /// </summary>
    procedure LedsOn; virtual;

    /// <summary>
    ///  Turns the orientation and direction LEDs of the IMU Brick off.
    /// </summary>
    procedure LedsOff; virtual;

    /// <summary>
    ///  Returns *true* if the orientation and direction LEDs of the IMU Brick
    ///  are on, *false* otherwise.
    /// </summary>
    function AreLedsOn: boolean; virtual;

    /// <summary>
    ///  A call of this function saves the current calibration to be used
    ///  as a starting point for the next restart of continuous calibration
    ///  of the IMU Brick.
    ///  
    ///  A return value of *true* means that the calibration could be used and
    ///  *false* means that it could not be used (this happens if the calibration 
    ///  status is not "fully calibrated").
    ///  
    ///  This function is used by the calibration window of the Brick Viewer, you
    ///  should not need to call it in your program.
    /// </summary>
    function SaveCalibration: boolean; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.Acceleration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    ///  
    ///  The default value is 0.
    /// </summary>
    procedure SetAccelerationPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetAccelerationPeriod"/>.
    /// </summary>
    function GetAccelerationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.MagneticField"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetMagneticFieldPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetMagneticFieldPeriod"/>.
    /// </summary>
    function GetMagneticFieldPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.AngularVelocity"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAngularVelocityPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetAngularVelocityPeriod"/>.
    /// </summary>
    function GetAngularVelocityPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.Temperature"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetTemperaturePeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetTemperaturePeriod"/>.
    /// </summary>
    function GetTemperaturePeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.Orientation"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetOrientationPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetOrientationPeriod"/>.
    /// </summary>
    function GetOrientationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.LinearAcceleration"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetLinearAccelerationPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetLinearAccelerationPeriod"/>.
    /// </summary>
    function GetLinearAccelerationPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.GravityVector"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetGravityVectorPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetGravityVectorPeriod"/>.
    /// </summary>
    function GetGravityVectorPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.Quaternion"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetQuaternionPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetQuaternionPeriod"/>.
    /// </summary>
    function GetQuaternionPeriod: longword; virtual;

    /// <summary>
    ///  Sets the period in ms with which the <see cref="BrickIMUV2.TBrickIMUV2.AllData"/> callback is triggered
    ///  periodically. A value of 0 turns the callback off.
    /// </summary>
    procedure SetAllDataPeriod(const period: longword); virtual;

    /// <summary>
    ///  Returns the period as set by <see cref="BrickIMUV2.TBrickIMUV2.SetAllDataPeriod"/>.
    /// </summary>
    function GetAllDataPeriod: longword; virtual;

    /// <summary>
    ///  Enables the status LED.
    ///  
    ///  The status LED is the blue LED next to the USB connector. If enabled is is
    ///  on and it flickers if data is transfered. If disabled it is always off.
    ///  
    ///  The default state is enabled.
    /// </summary>
    procedure EnableStatusLED; virtual;

    /// <summary>
    ///  Disables the status LED.
    ///  
    ///  The status LED is the blue LED next to the USB connector. If enabled is is
    ///  on and it flickers if data is transfered. If disabled it is always off.
    ///  
    ///  The default state is enabled.
    /// </summary>
    procedure DisableStatusLED; virtual;

    /// <summary>
    ///  Returns *true* if the status LED is enabled, *false* otherwise.
    /// </summary>
    function IsStatusLEDEnabled: boolean; virtual;

    /// <summary>
    ///  Returns the firmware and protocol version and the name of the Bricklet for a
    ///  given port.
    ///  
    ///  This functions sole purpose is to allow automatic flashing of v1.x.y Bricklet
    ///  plugins.
    /// </summary>
    procedure GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string); virtual;

    /// <summary>
    ///  Returns the temperature in °C/10 as measured inside the microcontroller. The
    ///  value returned is not the ambient temperature!
    ///  
    ///  The temperature is only proportional to the real temperature and it has an
    ///  accuracy of +-15%. Practically it is only useful as an indicator for
    ///  temperature changes.
    /// </summary>
    function GetChipTemperature: smallint; virtual;

    /// <summary>
    ///  Calling this function will reset the Brick. Calling this function
    ///  on a Brick inside of a stack will reset the whole stack.
    ///  
    ///  After a reset you have to create new device objects,
    ///  calling functions on the existing ones will result in
    ///  undefined behavior!
    /// </summary>
    procedure Reset; virtual;

    /// <summary>
    ///  Returns the UID, the UID where the Brick is connected to, 
    ///  the position, the hardware and firmware version as well as the
    ///  device identifier.
    ///  
    ///  The position can be '0'-'8' (stack position).
    ///  
    ///  The device identifier numbers can be found :ref:`here &lt;device_identifier&gt;`.
    ///  |device_identifier_constant|
    /// </summary>
    procedure GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word); override;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAccelerationPeriod"/>. The parameters are the acceleration
    ///  for the x, y and z axis.
    /// </summary>
    property OnAcceleration: TBrickIMUV2NotifyAcceleration read accelerationCallback write accelerationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetMagneticFieldPeriod"/>. The parameters are the magnetic field
    ///  for the x, y and z axis.
    /// </summary>
    property OnMagneticField: TBrickIMUV2NotifyMagneticField read magneticFieldCallback write magneticFieldCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAngularVelocityPeriod"/>. The parameters are the angular velocity
    ///  for the x, y and z axis.
    /// </summary>
    property OnAngularVelocity: TBrickIMUV2NotifyAngularVelocity read angularVelocityCallback write angularVelocityCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetTemperaturePeriod"/>. The parameter is the temperature.
    /// </summary>
    property OnTemperature: TBrickIMUV2NotifyTemperature read temperatureCallback write temperatureCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetLinearAccelerationPeriod"/>. The parameters are the 
    ///  linear acceleration for the x, y and z axis.
    /// </summary>
    property OnLinearAcceleration: TBrickIMUV2NotifyLinearAcceleration read linearAccelerationCallback write linearAccelerationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetGravityVectorPeriod"/>. The parameters gravity vector
    ///  for the x, y and z axis.
    /// </summary>
    property OnGravityVector: TBrickIMUV2NotifyGravityVector read gravityVectorCallback write gravityVectorCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetOrientationPeriod"/>. The parameters are the orientation
    ///  (heading (yaw), roll, pitch) of the IMU Brick in Euler angles. See
    ///  <see cref="BrickIMUV2.TBrickIMUV2.GetOrientation"/> for details.
    /// </summary>
    property OnOrientation: TBrickIMUV2NotifyOrientation read orientationCallback write orientationCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetQuaternionPeriod"/>. The parameters are the orientation
    ///  (x, y, z, w) of the IMU Brick in quaternions. See <see cref="BrickIMUV2.TBrickIMUV2.GetQuaternion"/>
    ///  for details.
    /// </summary>
    property OnQuaternion: TBrickIMUV2NotifyQuaternion read quaternionCallback write quaternionCallback;

    /// <summary>
    ///  This callback is triggered periodically with the period that is set by
    ///  <see cref="BrickIMUV2.TBrickIMUV2.SetAllDataPeriod"/>. The parameters are as for <see cref="BrickIMUV2.TBrickIMUV2.GetAllData"/>.
    /// </summary>
    property OnAllData: TBrickIMUV2NotifyAllData read allDataCallback write allDataCallback;
  end;

implementation

constructor TBrickIMUV2.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ORIENTATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_QUATERNION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ALL_DATA] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_LEDS_ON] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_V2_FUNCTION_LEDS_OFF] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_V2_FUNCTION_ARE_LEDS_ON] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SAVE_CALIBRATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_ACCELERATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ACCELERATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_MAGNETIC_FIELD_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_TEMPERATURE_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_ORIENTATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ORIENTATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_LINEAR_ACCELERATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_GRAVITY_VECTOR_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_QUATERNION_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_QUATERNION_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_SET_ALL_DATA_PERIOD] := DEVICE_RESPONSE_EXPECTED_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_ALL_DATA_PERIOD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_CALLBACK_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_MAGNETIC_FIELD] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_ANGULAR_VELOCITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_LINEAR_ACCELERATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_GRAVITY_VECTOR] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_ORIENTATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_QUATERNION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_CALLBACK_ALL_DATA] := DEVICE_RESPONSE_EXPECTED_ALWAYS_FALSE;
  responseExpected[BRICK_IMU_V2_FUNCTION_ENABLE_STATUS_LED] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_V2_FUNCTION_DISABLE_STATUS_LED] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_V2_FUNCTION_IS_STATUS_LED_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_CHIP_TEMPERATURE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICK_IMU_V2_FUNCTION_RESET] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICK_IMU_V2_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

  callbackWrappers[BRICK_IMU_V2_CALLBACK_ACCELERATION] := {$ifdef FPC}@{$endif}CallbackWrapperAcceleration;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_MAGNETIC_FIELD] := {$ifdef FPC}@{$endif}CallbackWrapperMagneticField;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_ANGULAR_VELOCITY] := {$ifdef FPC}@{$endif}CallbackWrapperAngularVelocity;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_TEMPERATURE] := {$ifdef FPC}@{$endif}CallbackWrapperTemperature;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_LINEAR_ACCELERATION] := {$ifdef FPC}@{$endif}CallbackWrapperLinearAcceleration;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_GRAVITY_VECTOR] := {$ifdef FPC}@{$endif}CallbackWrapperGravityVector;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_ORIENTATION] := {$ifdef FPC}@{$endif}CallbackWrapperOrientation;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_QUATERNION] := {$ifdef FPC}@{$endif}CallbackWrapperQuaternion;
  callbackWrappers[BRICK_IMU_V2_CALLBACK_ALL_DATA] := {$ifdef FPC}@{$endif}CallbackWrapperAllData;
end;

procedure TBrickIMUV2.GetAcceleration(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ACCELERATION, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickIMUV2.GetMagneticField(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickIMUV2.GetAngularVelocity(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

function TBrickIMUV2.GetTemperature: shortint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt8From(8, response);
end;

procedure TBrickIMUV2.GetOrientation(out heading: smallint; out roll: smallint; out pitch: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ORIENTATION, 8);
  response := SendRequest(request);
  heading := LEConvertInt16From(8, response);
  roll := LEConvertInt16From(10, response);
  pitch := LEConvertInt16From(12, response);
end;

procedure TBrickIMUV2.GetLinearAcceleration(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickIMUV2.GetGravityVector(out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR, 8);
  response := SendRequest(request);
  x := LEConvertInt16From(8, response);
  y := LEConvertInt16From(10, response);
  z := LEConvertInt16From(12, response);
end;

procedure TBrickIMUV2.GetQuaternion(out w: smallint; out x: smallint; out y: smallint; out z: smallint);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_QUATERNION, 8);
  response := SendRequest(request);
  w := LEConvertInt16From(8, response);
  x := LEConvertInt16From(10, response);
  y := LEConvertInt16From(12, response);
  z := LEConvertInt16From(14, response);
end;

procedure TBrickIMUV2.GetAllData(out acceleration: TArray0To2OfInt16; out magneticField: TArray0To2OfInt16; out angularVelocity: TArray0To2OfInt16; out eulerAngle: TArray0To2OfInt16; out quaternion: TArray0To3OfInt16; out linearAcceleration: TArray0To2OfInt16; out gravityVector: TArray0To2OfInt16; out temperature: shortint; out calibrationStatus: byte);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ALL_DATA, 8);
  response := SendRequest(request);
  for i := 0 to 2 do acceleration[i] := LEConvertInt16From(8 + (i * 2), response);
  for i := 0 to 2 do magneticField[i] := LEConvertInt16From(14 + (i * 2), response);
  for i := 0 to 2 do angularVelocity[i] := LEConvertInt16From(20 + (i * 2), response);
  for i := 0 to 2 do eulerAngle[i] := LEConvertInt16From(26 + (i * 2), response);
  for i := 0 to 3 do quaternion[i] := LEConvertInt16From(32 + (i * 2), response);
  for i := 0 to 2 do linearAcceleration[i] := LEConvertInt16From(40 + (i * 2), response);
  for i := 0 to 2 do gravityVector[i] := LEConvertInt16From(46 + (i * 2), response);
  temperature := LEConvertInt8From(52, response);
  calibrationStatus := LEConvertUInt8From(53, response);
end;

procedure TBrickIMUV2.LedsOn;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_LEDS_ON, 8);
  SendRequest(request);
end;

procedure TBrickIMUV2.LedsOff;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_LEDS_OFF, 8);
  SendRequest(request);
end;

function TBrickIMUV2.AreLedsOn: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_ARE_LEDS_ON, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

function TBrickIMUV2.SaveCalibration: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SAVE_CALIBRATION, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickIMUV2.SetAccelerationPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ACCELERATION_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetAccelerationPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ACCELERATION_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetMagneticFieldPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_MAGNETIC_FIELD_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetMagneticFieldPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_MAGNETIC_FIELD_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetAngularVelocityPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ANGULAR_VELOCITY_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetAngularVelocityPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ANGULAR_VELOCITY_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetTemperaturePeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_TEMPERATURE_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetTemperaturePeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_TEMPERATURE_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetOrientationPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ORIENTATION_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetOrientationPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ORIENTATION_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetLinearAccelerationPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_LINEAR_ACCELERATION_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetLinearAccelerationPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_LINEAR_ACCELERATION_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetGravityVectorPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_GRAVITY_VECTOR_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetGravityVectorPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_GRAVITY_VECTOR_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetQuaternionPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_QUATERNION_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetQuaternionPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_QUATERNION_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.SetAllDataPeriod(const period: longword);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_SET_ALL_DATA_PERIOD, 12);
  LEConvertUInt32To(period, 8, request);
  SendRequest(request);
end;

function TBrickIMUV2.GetAllDataPeriod: longword;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_ALL_DATA_PERIOD, 8);
  response := SendRequest(request);
  result := LEConvertUInt32From(8, response);
end;

procedure TBrickIMUV2.EnableStatusLED;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_ENABLE_STATUS_LED, 8);
  SendRequest(request);
end;

procedure TBrickIMUV2.DisableStatusLED;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_DISABLE_STATUS_LED, 8);
  SendRequest(request);
end;

function TBrickIMUV2.IsStatusLEDEnabled: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_IS_STATUS_LED_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickIMUV2.GetProtocol1BrickletName(const port: char; out protocolVersion: byte; out firmwareVersion: TArray0To2OfUInt8; out name: string);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_PROTOCOL1_BRICKLET_NAME, 9);
  LEConvertCharTo(port, 8, request);
  response := SendRequest(request);
  protocolVersion := LEConvertUInt8From(8, response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(9 + (i * 1), response);
  name := LEConvertStringFrom(12, 40, response);
end;

function TBrickIMUV2.GetChipTemperature: smallint;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_CHIP_TEMPERATURE, 8);
  response := SendRequest(request);
  result := LEConvertInt16From(8, response);
end;

procedure TBrickIMUV2.Reset;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_RESET, 8);
  SendRequest(request);
end;

procedure TBrickIMUV2.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICK_IMU_V2_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

procedure TBrickIMUV2.CallbackWrapperAcceleration(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(accelerationCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    accelerationCallback(self, x, y, z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperMagneticField(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(magneticFieldCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    magneticFieldCallback(self, x, y, z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperAngularVelocity(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(angularVelocityCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    angularVelocityCallback(self, x, y, z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperTemperature(const packet: TByteArray);
var temperature: shortint;
begin
  if (Assigned(temperatureCallback)) then begin
    temperature := LEConvertInt8From(8, packet);
    temperatureCallback(self, temperature);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperLinearAcceleration(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(linearAccelerationCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    linearAccelerationCallback(self, x, y, z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperGravityVector(const packet: TByteArray);
var x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(gravityVectorCallback)) then begin
    x := LEConvertInt16From(8, packet);
    y := LEConvertInt16From(10, packet);
    z := LEConvertInt16From(12, packet);
    gravityVectorCallback(self, x, y, z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperOrientation(const packet: TByteArray);
var heading: smallint; roll: smallint; pitch: smallint;
begin
  if (Assigned(orientationCallback)) then begin
    heading := LEConvertInt16From(8, packet);
    roll := LEConvertInt16From(10, packet);
    pitch := LEConvertInt16From(12, packet);
    orientationCallback(self, heading, roll, pitch);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperQuaternion(const packet: TByteArray);
var w: smallint; x: smallint; y: smallint; z: smallint;
begin
  if (Assigned(quaternionCallback)) then begin
    w := LEConvertInt16From(8, packet);
    x := LEConvertInt16From(10, packet);
    y := LEConvertInt16From(12, packet);
    z := LEConvertInt16From(14, packet);
    quaternionCallback(self, w, x, y, z);
  end;
end;

procedure TBrickIMUV2.CallbackWrapperAllData(const packet: TByteArray);
var acceleration: TArray0To2OfInt16; magneticField: TArray0To2OfInt16; angularVelocity: TArray0To2OfInt16; eulerAngle: TArray0To2OfInt16; quaternion: TArray0To3OfInt16; linearAcceleration: TArray0To2OfInt16; gravityVector: TArray0To2OfInt16; temperature: shortint; calibrationStatus: byte; i: longint;
begin
  if (Assigned(allDataCallback)) then begin
    for i := 0 to 2 do acceleration[i] := LEConvertInt16From(8 + (i * 2), packet);
    for i := 0 to 2 do magneticField[i] := LEConvertInt16From(14 + (i * 2), packet);
    for i := 0 to 2 do angularVelocity[i] := LEConvertInt16From(20 + (i * 2), packet);
    for i := 0 to 2 do eulerAngle[i] := LEConvertInt16From(26 + (i * 2), packet);
    for i := 0 to 3 do quaternion[i] := LEConvertInt16From(32 + (i * 2), packet);
    for i := 0 to 2 do linearAcceleration[i] := LEConvertInt16From(40 + (i * 2), packet);
    for i := 0 to 2 do gravityVector[i] := LEConvertInt16From(46 + (i * 2), packet);
    temperature := LEConvertInt8From(52, packet);
    calibrationStatus := LEConvertUInt8From(53, packet);
    allDataCallback(self, acceleration, magneticField, angularVelocity, eulerAngle, quaternion, linearAcceleration, gravityVector, temperature, calibrationStatus);
  end;
end;

end.
