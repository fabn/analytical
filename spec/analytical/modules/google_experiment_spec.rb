require 'spec_helper'

describe Analytical::Modules::GoogleExperiment do

  let(:parent) { mock('api', :options=>{}) }

  subject { Analytical::Modules::GoogleExperiment.new :parent=> parent }

  describe '#initialize' do
    it 'should set the command_location' do
      subject.tracking_command_location.should == :head_prepend
    end

    it 'should set the options' do
      subject.options.should == { :parent => parent }
    end

  end

  describe '#configure_experiment' do

    it 'should set the experiment code in the head' do
      subject.configure_experiment('12345678-0').should =~ /k='12345678-0'/
    end

  end

end