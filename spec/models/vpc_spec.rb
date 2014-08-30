require 'rails_helper'

describe Vpc do
  context "instance" do
    subject { Vpc.new(params) }

    {
      "standard" => 
        {"tag_set"=>[{"key"=>"Name", "value"=>"container13"}], "vpc_id"=>"vpc-fe953496", "state"=>"available", "cidr_block"=>"10.0.0.0/16", "dhcp_options_id"=>"dopt-9e9db5f7", "instance_tenancy"=>"default", "is_default"=>false, "region"=>"us-west-1"}
    }.each do |description, sample|
      context description do
        let(:params) { sample }

        sample.each do |key, value|
          its(key) { should == value }
        end
      end
    end
  end

  context "class" do
    subject { Vpc }

    before do
      subject.stub_chain(:client, :describe_vpcs, :data).and_return({
        :vpc_set => [
          {"tag_set"=>[{"key"=>"Name", "value"=>"container13"}], "vpc_id"=>"vpc-fe953496", "state"=>"available", "cidr_block"=>"10.0.0.0/16", "dhcp_options_id"=>"dopt-9e9db5f7", "instance_tenancy"=>"default", "is_default"=>false, "region"=>"us-west-1"}
        ],
      })
    end

    describe "#describe" do
      it "returns 1 items" do
        expect(subject.describe(region: "us-east-1").length).to eql(1)
      end
    end
  end
end
