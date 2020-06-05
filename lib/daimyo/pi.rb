require "daimyo/pi/version"
require "bigdecimal"

module Daimyo
  class Pi
    def initialize(precision: 10)
      @precision = precision
    end
    attr_reader :precision

    def leibniz(iter: 10)
      ans = BigDecimal("0")
      (0...iter).each do |n|
        ans += (BigDecimal("-1") ** n) / (2 * n + 1)
      end

      return (ans * 4).truncate(precision)
    end

    def gauss_l(iter: 3)
      a = BigDecimal("1")
      b = BigDecimal("1") / BigDecimal("2").sqrt(precision)
      t = BigDecimal("0.25")
      p_ = BigDecimal("1")

      iter.times do
        an = (a + b) / 2
        b = (a * b).sqrt(precision)
        t -= p_ * (an - a) * (an - a)
        p_ *= 2
        a = an
      end

      ((a + b) * (a + b) / (4 * t)).truncate(precision)
    end
  end
end
