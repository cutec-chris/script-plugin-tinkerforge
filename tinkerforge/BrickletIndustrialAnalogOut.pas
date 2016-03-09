{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletIndustrialAnalogOut;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_INDUSTRIAL_ANALOG_OUT_DEVICE_IDENTIFIER = 258;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_DEVICE_DISPLAY_NAME = 'Industrial Analog Out Bricklet';

  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_ENABLE = 1;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_DISABLE = 2;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_IS_ENABLED = 3;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_VOLTAGE = 4;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_VOLTAGE = 5;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CURRENT = 6;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CURRENT = 7;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CONFIGURATION = 8;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CONFIGURATION = 9;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_IDENTITY = 255;


  BRICKLET_INDUSTRIAL_ANALOG_OUT_VOLTAGE_RANGE_0_TO_5V = 0;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_VOLTAGE_RANGE_0_TO_10V = 1;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_CURRENT_RANGE_4_TO_20MA = 0;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_CURRENT_RANGE_0_TO_20MA = 1;
  BRICKLET_INDUSTRIAL_ANALOG_OUT_CURRENT_RANGE_0_TO_24MA = 2;

type
  TArray0To2OfUInt8 = array [0..2] of byte;

  /// <summary>
  ///  Generates configurable DC voltage and current, 0V to 10V and 4mA to 20mA
  /// </summary>
  TBrickletIndustrialAnalogOut = class(TDevice)
  private
  protected
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Enables the output of voltage and current.
    ///  
    ///  The default is disabled.
    /// </summary>
    procedure Enable; virtual;

    /// <summary>
    ///  Disables the output of voltage and current.
    ///  
    ///  The default is disabled.
    /// </summary>
    procedure Disable; virtual;

    /// <summary>
    ///  Returns *true* if output of voltage and current is enabled, *false* otherwise.
    /// </summary>
    function IsEnabled: boolean; virtual;

    /// <summary>
    ///  Sets the output voltage in mV.
    ///  
    ///  The output voltage and output current are linked. Changing the output voltage
    ///  also changes the output current.
    /// </summary>
    procedure SetVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the voltage as set by <see cref="BrickletIndustrialAnalogOut.TBrickletIndustrialAnalogOut.SetVoltage"/>.
    /// </summary>
    function GetVoltage: word; virtual;

    /// <summary>
    ///  Sets the output current in µA.
    ///  
    ///  The output current and output voltage are linked. Changing the output current
    ///  also changes the output voltage.
    /// </summary>
    procedure SetCurrent(const current: word); virtual;

    /// <summary>
    ///  Returns the current as set by <see cref="BrickletIndustrialAnalogOut.TBrickletIndustrialAnalogOut.SetCurrent"/>.
    /// </summary>
    function GetCurrent: word; virtual;

    /// <summary>
    ///  Configures the voltage and current range.
    ///  
    ///  Possible voltage ranges are:
    ///  
    ///  * 0V to 5V
    ///  * 0V to 10V (default)
    ///  
    ///  Possible current ranges are:
    ///  
    ///  * 4mA to 20mA (default)
    ///  * 0mA to 20mA
    ///  * 0mA to 24mA
    ///  
    ///  The resolution will always be 12 bit. This means, that the
    ///  precision is higher with a smaller range.
    /// </summary>
    procedure SetConfiguration(const voltageRange: byte; const currentRange: byte); virtual;

    /// <summary>
    ///  Returns the configuration as set by <see cref="BrickletIndustrialAnalogOut.TBrickletIndustrialAnalogOut.SetConfiguration"/>.
    /// </summary>
    procedure GetConfiguration(out voltageRange: byte; out currentRange: byte); virtual;

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
  end;

implementation

constructor TBrickletIndustrialAnalogOut.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_ENABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_DISABLE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_IS_ENABLED] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CURRENT] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CURRENT] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CONFIGURATION] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

end;

procedure TBrickletIndustrialAnalogOut.Enable;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_ENABLE, 8);
  SendRequest(request);
end;

procedure TBrickletIndustrialAnalogOut.Disable;
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_DISABLE, 8);
  SendRequest(request);
end;

function TBrickletIndustrialAnalogOut.IsEnabled: boolean;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_IS_ENABLED, 8);
  response := SendRequest(request);
  result := LEConvertBooleanFrom(8, response);
end;

procedure TBrickletIndustrialAnalogOut.SetVoltage(const voltage: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialAnalogOut.GetVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletIndustrialAnalogOut.SetCurrent(const current: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CURRENT, 10);
  LEConvertUInt16To(current, 8, request);
  SendRequest(request);
end;

function TBrickletIndustrialAnalogOut.GetCurrent: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CURRENT, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletIndustrialAnalogOut.SetConfiguration(const voltageRange: byte; const currentRange: byte);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_SET_CONFIGURATION, 10);
  LEConvertUInt8To(voltageRange, 8, request);
  LEConvertUInt8To(currentRange, 9, request);
  SendRequest(request);
end;

procedure TBrickletIndustrialAnalogOut.GetConfiguration(out voltageRange: byte; out currentRange: byte);
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_CONFIGURATION, 8);
  response := SendRequest(request);
  voltageRange := LEConvertUInt8From(8, response);
  currentRange := LEConvertUInt8From(9, response);
end;

procedure TBrickletIndustrialAnalogOut.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_INDUSTRIAL_ANALOG_OUT_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

end.
