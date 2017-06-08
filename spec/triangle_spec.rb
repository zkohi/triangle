require File.expand_path(File.dirname(__FILE__) + '/../triangle')

describe Triangle do
  describe '#check' do

    shared_examples 'not valid' do |sides|
      specify { expect(described_class.check(sides)).to eq '3辺の長さを正の整数で3つ指定してください' }
    end

    shared_examples 'a scalene triangle' do |sides|
      specify { expect(described_class.check(sides)).to eq '不等辺三角形ですね！' }
    end

    shared_examples 'an isosceles triangle' do |sides|
      specify { expect(described_class.check(sides)).to eq '二等辺三角形ですね！' }
    end

    shared_examples 'an equilateral triangle' do |sides|
      specify { expect(described_class.check(sides)).to eq '正三角形ですね！' }
    end

    shared_examples 'not a triangle' do |sides|
      specify { expect(described_class.check(sides)).to eq '三角形じゃないです＞＜' }
    end

    context 'when ARGV is 2,3,4' do
      it_should_behave_like 'a scalene triangle', ['2','3','4']
    end

    context 'when ARGV is 2,2,1' do
      it_should_behave_like 'an isosceles triangle', ['2','2','1']
    end

    context 'when ARGV is 1,1,1' do
      it_should_behave_like 'an equilateral triangle', ['1','1','1']
    end

    context 'when ARGV is 1,2,3' do
      it_should_behave_like 'not a triangle', ['1','2','3']
    end

    context 'when ARGV is 3,1,2' do
      it_should_behave_like 'not a triangle', ['3','1','2']
    end

    context 'when ARGV is 2,3,1' do
      it_should_behave_like 'not a triangle', ['2','3','1']
    end

    context 'when ARGV is 1,2,4' do
      it_should_behave_like 'not a triangle', ['1','2','4']
    end

    context 'when ARGV is -2,3,4' do
      it_should_behave_like 'not valid', ['-2','3','4']
    end

    context 'when ARGV is 0,0,0' do
      it_should_behave_like 'not valid', ['0','0','0']
    end

    context 'when ARGV is 1,2,0' do
      it_should_behave_like 'not valid', ['1','2','0']
    end

    context 'when ARGV is 0,1,2' do
      it_should_behave_like 'not valid', ['0','1','2']
    end

    context 'when ARGV is 1,0,2' do
      it_should_behave_like 'not valid', ['1','0','2']
    end

    context 'when ARGV is 1,2,a' do
      it_should_behave_like 'not valid', ['1','2','a']
    end

    context 'when ARGV is a,1,2' do
      it_should_behave_like 'not valid', ['a','1','2']
    end

    context 'when ARGV is 1,a,2' do
      it_should_behave_like 'not valid', ['1','a','2']
    end

    context 'when ARGV is 1,2' do
      it_should_behave_like 'not valid', ['1','2']
    end

    context 'when ARGV is 2,3,4,5' do
      it_should_behave_like 'not valid', ['2','3','4','5']
    end

    context 'when ARGV is 1,1,1.1' do
      it_should_behave_like 'not valid', ['1','1','1.1']
    end

    context 'when ARGV is 1,1,1' do
      it_should_behave_like 'an equilateral triangle', ['1','1','1']
    end

    context 'when ARGV is 100,100,100' do
      it_should_behave_like 'an equilateral triangle', ['100','100','100']
    end

    context 'when ARGV is 2,1,2' do
      it_should_behave_like 'an isosceles triangle', ['2','1','2']
    end

    context 'when ARGV is 1,2,2' do
      it_should_behave_like 'an isosceles triangle', ['1','2','2']
    end

  end
end
