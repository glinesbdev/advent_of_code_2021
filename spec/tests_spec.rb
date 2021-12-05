# This file will include all of the tests from all of the days of AOC 2021

require 'spec_helper'

RSpec.describe 'Advent of Code 2021' do
  describe 'Day 1' do
    context 'Part 1' do
      it 'should return 1154' do
        expect(Day1Part1.new.run).to eq(1154)
      end
    end

    context 'Part 2' do
      it 'should return 1127' do
        expect(Day1Part2.new.run).to eq(1127)
      end
    end
  end

  describe 'Day 2' do
    context 'Part 1' do
      it 'should return 2102357' do
        expect(Day2Part1.new.run).to eq(2102357)
      end
    end

    context 'Part 2' do
      it 'should return 2101031224' do
        expect(Day2Part2.new.run).to eq(2101031224)
      end
    end
  end

  describe 'Day 3' do
    context 'Part 1' do
      it 'should return 2640986' do
        expect(Day3Part1.new.run).to eq(2640986)
      end
    end

    context 'Part 2' do
      it 'should return 6822109' do
        expect(Day3Part2.new.run).to eq(6822109)
      end
    end
  end

  describe 'Day 4' do
    context 'Part 1' do
      it 'should return 2745' do
        expect(Day4Part1.new.run).to eq(2745)
      end
    end

    context 'Part 2' do
      it 'should return 6594' do
        expect(Day4Part2.new.run).to eq(6594)
      end
    end
  end
end
