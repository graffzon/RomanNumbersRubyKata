# Class to transform Arabic numbers to Roman. Works for range from 1 to 1000.
class ArabicToRoman
  A_TO_R = {
    0 => '',
    1 => 'I',
    5 => 'V',
    10 => 'X',
    50 => 'L',
    100 => 'C',
    500 => 'D',
    1000 => 'M'
  }.freeze

  attr_reader :arabic

  def initialize(arabic = 0)
    raise ArgumentError unless arabic.is_a?(Numeric)
    raise 'Wow, dude, too much for me' if arabic > 1000
    @arabic = arabic
  end

  def to_roman
    ones = arabic.divmod(10).last
    tens = arabic.divmod(10).first.divmod(10).last
    hundreds = arabic.divmod(100).first

    result = ''
    result = roman_logic(ones) if ones > 0
    result = roman_logic(tens, 10) + result if tens > 0
    result = roman_logic(hundreds, 100) + result if hundreds > 0
    result
  end

  private

  def roman_logic(number, multiplier = 1)
    return A_TO_R[number * multiplier] if A_TO_R[number * multiplier]

    case number
    when (1..3) then A_TO_R[multiplier] * number
    when 4 then A_TO_R[multiplier] + A_TO_R[5 * multiplier]
    when (6..8) then A_TO_R[5 * multiplier] + A_TO_R[multiplier] * (number - 5)
    when 9 then A_TO_R[multiplier] + A_TO_R[10 * multiplier]
    end
  end
end
