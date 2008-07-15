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
module Color
  module Palette

    autoload :Gimp, "color/palette/gimp"
    autoload :MonoContrast, "color/palette/monocontrast"

  end
end