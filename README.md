# FLIR-Pan-Tilt-Ruby-Library
Ruby Library for controlling the FLIR PTU-E46

## Install Dependencies

Install bundler `gem install bundler`

Run Bundler `bundle install`

## Range
Pan angle can be between `-159` and `159`

Tilt angle can be between `-47` and `31`

## Use From Terminal
Replace `<angle>` by the desired angle.

Pan unit to given angle: `ruby -r "./PanTilt.rb" -e "PanTilt.pan <angle>"`

Tilt unit to given angle: `ruby -r "./PanTilt.rb" -e "PanTilt.tilt <angle>"`

## References
http://www.flir.com.au/mcs/view/?id=53771
