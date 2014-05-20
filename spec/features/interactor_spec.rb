require 'spec_helper'

describe DummyInteractor, :focus do
  let(:dummy1) { 'testmedummy' }
  let(:dummy_object) do
    Class.new do
      attr_accessor :dummy1
    end.new
  end

  it { expect(DummyInteractor).to respond_to(:perform_on) }
  it { should respond_to(:perform_on) }

  it "sets @dummy1 on dummy_object" do
    DummyInteractor.perform_on(dummy_object, dummy1: dummy1)
    
    expect(dummy_object.dummy1).to eq dummy_object.dummy1
  end

  context "when called on instance" do

    it "sets @dummy1 on dummy_object" do
      interactor = DummyInteractor.new(dummy1: dummy1)
      interactor.perform_on(dummy_object)
      
      expect(dummy_object.dummy1).to eq dummy_object.dummy1
    end

  end

end