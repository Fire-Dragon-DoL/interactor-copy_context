require 'spec_helper'

describe DummyOrganizer do
  let(:dummy1) { Dummy1Interactor::DUMMYVAR }
  let(:dummy2) { Dummy2Interactor::DUMMYVAR }
  let(:dummy_object) do
    Class.new do
      attr_accessor :dummy1
      attr_accessor :dummy2
    end.new
  end

  it { expect(DummyOrganizer).to respond_to(:perform_on) }
  it { should respond_to(:perform_on) }

  it "sets @dummy1 on dummy_object" do
    DummyOrganizer.perform_on(dummy_object)
    
    expect(dummy_object.dummy1).to eq dummy1
  end

  it "sets @dummy2 on dummy_object" do
    DummyOrganizer.perform_on(dummy_object)
    
    expect(dummy_object.dummy2).to eq dummy2
  end

  context "when called on instance" do

    it "sets @dummy1 on dummy_object" do
      interactor = DummyOrganizer.new
      interactor.perform_on(dummy_object)
      
      expect(dummy_object.dummy1).to eq dummy1
    end

  end

end