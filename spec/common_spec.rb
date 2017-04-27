require 'spec_helper'

describe Datatrans::Common do
  context "sign" do
    before do
      @request = Datatrans::XML::Transaction::Request.new(@datatrans, {})
    end

    it "generates the correct md5 sign" do
      amount = 1000
      currency = 'CHF'
      reference_number = 'ABCEDF'

      @request.sign('md5', @datatrans.merchant_id, amount, currency, reference_number).should == '4e7d4d5bbde548c586f3b7f109635ffc'
    end

    it "generates the correct sha256 sign" do
      amount = 1000
      currency = 'CHF'
      reference_number = 'ABCEDF'

      @request.sign('sha256', @datatrans.merchant_id, amount, currency, reference_number).should == 'c04ebcdbb5150d72526104e9975dfb34153660aaa80729667ffb963368d4b7d5'
    end
  end
end
