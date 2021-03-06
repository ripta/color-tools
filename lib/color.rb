#--
# Colour management with Ruby.
#
# Copyright 2005 Austin Ziegler
#   http://rubyforge.org/ruby-pdf/
#
#   Licensed under a MIT-style licence.
#
# $Id$
#++

# = Colour Management with Ruby
#
# == Copyright
# Copyright 2005 by Austin Ziegler
#
# Color::RGB and Color::CMYK were originally developed for the Ruby PDF
# project and PDF::Writer and represent wholly unique code.
#
# Color::Palette was developed based on techniques described by Andy
# "Malarkey"[http://www.stuffandnonsense.co.uk/archives/creating_colour_palettes.html]
# Clarke, implemented in JavaScript by Steve G. Chipman at
# SlayerOffice[http://slayeroffice.com/tools/color_palette/] and by Patrick
# Fitzgerald of BarelyFitz[http://www.barelyfitz.com/projects/csscolor/] in
# PHP.
#
# == LICENCE
# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software and associated documentation files (the "Software"),
# to deal in the Software without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following conditions:
#
# * The names of its contributors may not be used to endorse or promote
#   products derived from this software without specific prior written
#   permission.
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
# DEALINGS IN THE SOFTWARE.
module Color
  
  COLOR_TOOLS_VERSION = '1.3.0'
  
  autoload :CMYK, "color/cmyk"
  autoload :CSS, "color/css"
  autoload :GrayScale, "color/grayscale"
  autoload :GreyScale, "color/grayscale"
  autoload :HSL, "color/hsl"
  autoload :Palette, "color/palette"
  autoload :RGB, "color/rgb"
  autoload :YIQ, "color/yiq"

  def self.const_missing(name) #:nodoc:
    if Color::RGB.const_defined?(name)
      warn "These colour constants have been deprecated. Use Color::RGB::#{name} instead."
      Color::RGB.constants.each do |const|
        color = Color::RGB.const_get(const)
        const_set(const, color) if color.is_a?(Color::RGB)
      end
      class <<Color
        remove_method :const_missing
      end
      Color.const_get(name)
    else
      super
    end
  end

end
