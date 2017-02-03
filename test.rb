require 'minitest/autorun'
require_relative 'arabic_to_roman'

describe ArabicToRoman do
  describe 'class initializing' do
    it 'returns class instance' do
      ArabicToRoman.new.class.must_equal ArabicToRoman
    end

    it 'accepts one argument on initialization' do
      ArabicToRoman.new(10).class.must_equal ArabicToRoman
    end

    it 'does not accept non-number argument' do
      -> { ArabicToRoman.new('chunkybacon') }.must_raise ArgumentError
    end

    it 'returns empty string if no argument' do
      ArabicToRoman.new.to_roman.must_equal ''
    end

    it 'returns empty string for zero' do
      ArabicToRoman.new(0).to_roman.must_equal ''
    end
  end

  describe '#to_roman' do
    it 'has #to_roman method' do
      ArabicToRoman.new(1).to_roman.class.must_equal String
    end

    describe 'from 1 to 5' do
      it 'converts 1 to I' do
        ArabicToRoman.new(1).to_roman.must_equal 'I'
      end

      it 'converts 2 to II' do
        ArabicToRoman.new(2).to_roman.must_equal 'II'
      end

      it 'converts 3 to III' do
        ArabicToRoman.new(3).to_roman.must_equal 'III'
      end

      it 'converts 4 to IV' do
        ArabicToRoman.new(4).to_roman.must_equal 'IV'
      end

      it 'converts 5 to V' do
        ArabicToRoman.new(5).to_roman.must_equal 'V'
      end
    end

    describe 'from 6 to 10' do
      it 'converts 6 to VI' do
        ArabicToRoman.new(6).to_roman.must_equal 'VI'
      end

      it 'converts 7 to VII' do
        ArabicToRoman.new(7).to_roman.must_equal 'VII'
      end

      it 'converts 8 to VIII' do
        ArabicToRoman.new(8).to_roman.must_equal 'VIII'
      end

      it 'converts 9 to IX' do
        ArabicToRoman.new(9).to_roman.must_equal 'IX'
      end

      it 'converts 10 to X' do
        ArabicToRoman.new(10).to_roman.must_equal 'X'
      end
    end

    describe 'from 11 to 19' do
      it 'converts 12 to XII' do
        ArabicToRoman.new(12).to_roman.must_equal 'XII'
      end

      it 'converts 14 to XIV' do
        ArabicToRoman.new(14).to_roman.must_equal 'XIV'
      end

      it 'converts 15 to XV' do
        ArabicToRoman.new(15).to_roman.must_equal 'XV'
      end

      it 'converts 17 to XVII' do
        ArabicToRoman.new(17).to_roman.must_equal 'XVII'
      end

      it 'converts 19 to XIX' do
        ArabicToRoman.new(19).to_roman.must_equal 'XIX'
      end
    end

    describe 'from 20 to 90' do
      it 'converts 20 to XX' do
        ArabicToRoman.new(20).to_roman.must_equal 'XX'
      end

      it 'converts 40 to XL' do
        ArabicToRoman.new(40).to_roman.must_equal 'XL'
      end

      it 'converts 50 to L' do
        ArabicToRoman.new(50).to_roman.must_equal 'L'
      end

      it 'converts 59 to LIX' do
        ArabicToRoman.new(59).to_roman.must_equal 'LIX'
      end

      it 'converts 70 to LXX' do
        ArabicToRoman.new(70).to_roman.must_equal 'LXX'
      end

      it 'converts 90 to XC' do
        ArabicToRoman.new(90).to_roman.must_equal 'XC'
      end
    end

    describe 'from 100 to 1000' do
      it 'converts 100 to C' do
        ArabicToRoman.new(100).to_roman.must_equal 'C'
      end

      it 'converts 200 to CC' do
        ArabicToRoman.new(200).to_roman.must_equal 'CC'
      end

      it 'converts 389 to CCCLXXXIX' do
        ArabicToRoman.new(389).to_roman.must_equal 'CCCLXXXIX'
      end

      it 'converts 500 to D' do
        ArabicToRoman.new(500).to_roman.must_equal 'D'
      end

      it 'converts 800 to DCCC' do
        ArabicToRoman.new(800).to_roman.must_equal 'DCCC'
      end

      it 'converts 900 to CM' do
        ArabicToRoman.new(900).to_roman.must_equal 'CM'
      end

      it 'converts 1000 to M' do
        ArabicToRoman.new(1000).to_roman.must_equal 'M'
      end
    end

    describe 'more than 1000' do
      it 'doesnt work for such big numbers' do
        -> { ArabicToRoman.new(1001).to_roman }
          .must_raise 'Wow, dude, too much for me'
      end
    end
  end
end
