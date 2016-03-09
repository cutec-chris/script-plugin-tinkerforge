{
  This file was automatically generated on 2016-01-06.

  Delphi/Lazarus Bindings Version 2.1.9

  If you have a bugfix for this file and want to commit it,
  please fix the bug in the generator. You can find a link
  to the generator git on tinkerforge.com
}

unit BrickletAnalogOutV2;

{$ifdef FPC}{$mode OBJFPC}{$H+}{$endif}

interface

uses
  Device, IPConnection, LEConverter;

const
  BRICKLET_ANALOG_OUT_V2_DEVICE_IDENTIFIER = 256;
  BRICKLET_ANALOG_OUT_V2_DEVICE_DISPLAY_NAME = 'Analog Out Bricklet 2.0';

  BRICKLET_ANALOG_OUT_V2_FUNCTION_SET_OUTPUT_VOLTAGE = 1;
  BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_OUTPUT_VOLTAGE = 2;
  BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_INPUT_VOLTAGE = 3;
  BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_IDENTITY = 255;



type
  TArray0To2OfUInt8 = array [0..2] of byte;

  /// <summary>
  ///  Generates configurable DC voltage between 0V and 12V
  /// </summary>
  TBrickletAnalogOutV2 = class(TDevice)
  private
  protected
  public
    /// <summary>
    ///  Creates an object with the unique device ID <c>uid</c>. This object can
    ///  then be added to the IP connection.
    /// </summary>
    constructor Create(const uid__: string; ipcon_: TIPConnection);

    /// <summary>
    ///  Sets the voltage in mV. The possible range is 0V to 12V (0-12000).
    /// </summary>
    procedure SetOutputVoltage(const voltage: word); virtual;

    /// <summary>
    ///  Returns the voltage as set by <see cref="BrickletAnalogOutV2.TBrickletAnalogOutV2.SetOutputVoltage"/>.
    /// </summary>
    function GetOutputVoltage: word; virtual;

    /// <summary>
    ///  Returns the input voltage in mV.
    /// </summary>
    function GetInputVoltage: word; virtual;

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

constructor TBrickletAnalogOutV2.Create(const uid__: string; ipcon_: TIPConnection);
begin
  inherited Create(uid__, ipcon_);
  apiVersion[0] := 2;
  apiVersion[1] := 0;
  apiVersion[2] := 0;

  responseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_SET_OUTPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_FALSE;
  responseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_OUTPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_INPUT_VOLTAGE] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;
  responseExpected[BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_IDENTITY] := DEVICE_RESPONSE_EXPECTED_ALWAYS_TRUE;

end;

procedure TBrickletAnalogOutV2.SetOutputVoltage(const voltage: word);
var request: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_SET_OUTPUT_VOLTAGE, 10);
  LEConvertUInt16To(voltage, 8, request);
  SendRequest(request);
end;

function TBrickletAnalogOutV2.GetOutputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_OUTPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

function TBrickletAnalogOutV2.GetInputVoltage: word;
var request, response: TByteArray;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_INPUT_VOLTAGE, 8);
  response := SendRequest(request);
  result := LEConvertUInt16From(8, response);
end;

procedure TBrickletAnalogOutV2.GetIdentity(out uid: string; out connectedUid: string; out position: char; out hardwareVersion: TVersionNumber; out firmwareVersion: TVersionNumber; out deviceIdentifier: word);
var request, response: TByteArray; i: longint;
begin
  request := (ipcon as TIPConnection).CreateRequestPacket(self, BRICKLET_ANALOG_OUT_V2_FUNCTION_GET_IDENTITY, 8);
  response := SendRequest(request);
  uid := LEConvertStringFrom(8, 8, response);
  connectedUid := LEConvertStringFrom(16, 8, response);
  position := LEConvertCharFrom(24, response);
  for i := 0 to 2 do hardwareVersion[i] := LEConvertUInt8From(25 + (i * 1), response);
  for i := 0 to 2 do firmwareVersion[i] := LEConvertUInt8From(28 + (i * 1), response);
  deviceIdentifier := LEConvertUInt16From(31, response);
end;

end.
