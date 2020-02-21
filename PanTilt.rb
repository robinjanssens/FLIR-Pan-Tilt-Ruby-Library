# require 'rubygems'
require 'serialport'

# Library for controlling the FLIR PTU-E46
class PanTilt

  DEVICE_PATH = "/dev/tty.usbserial"

  # Pan to the given angle
  def self.pan(angle)
    if angle >= -159 and angle <= 159         # check if the given angle is in pan range
      steps = angle_to_steps(angle)           # convert angle into steps
      message = "PP" + steps.to_s + "\n"  # compose message
      send_serial(message)                    # Send message
    else
      puts('ERROR: ' + angle.to_s + 'deg is not a valid pan angle!')  # show error if not in range
    end
  end

  # Tilt to the given angle
  def self.tilt(angle)
    if angle >= -47 and angle <= 31           # check if the given angle is in tilt range
      steps = angle_to_steps(angle)           # convert angle into steps
      message = "TP" + steps.to_s + "\n"  # compose message
      send_serial(message)                    # Send message
    else
      puts('ERROR: ' + angle.to_s + 'deg is not a valid tilt angle!')  # show error if not in range
    end
  end

private

    # Convert the given angle to the approximate amount of steps and returns this
    def self.angle_to_steps(angle)
      steps = angle/0.0514285     # get the approximate amount of steps from the center
      steps = steps.round         # round to the nearest integer amount of steps
      return steps                # return amount of steps
    end

    # Send the given message to the device connected to DEVICE_PATH
    def self.send_serial(message)
      puts('Sending message: ' + message.to_s)
      ser = SerialPort.new(DEVICE_PATH, 9600, 8, 1, SerialPort::NONE)  # open serial port on DEVICE_PATH
      ser.write(message)     # write message to serial port
    end

end
