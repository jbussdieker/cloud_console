require 'rails_helper'

describe Address do
  context "instance" do
    subject { Address.new(params) }

    {
      "standard unattached" => 
        {"public_ip"=>"1.2.3.4", "domain"=>"standard", "instance_id"=>nil, "region"=>"us-west-1"},
      "standard attached" =>
        {"public_ip"=>"184.169.172.3", "domain"=>"standard", "instance_id"=>"i-31866d69", "region"=>"us-west-1"},
      "vpc unattached" =>
        {"public_ip"=>"54.215.137.105", "allocation_id"=>"eipalloc-b98d5ad1", "domain"=>"vpc", "region"=>"us-west-1"},
      "vpc attached" =>
        {"public_ip"=>"54.215.142.175", "allocation_id"=>"eipalloc-b2fa22da", "domain"=>"vpc", "instance_id"=>"i-d12e4b8a", "association_id"=>"eipassoc-c305e6a8", "network_interface_id"=>"eni-d802e1b3", "network_interface_owner_id"=>"830277587339", "private_ip_address"=>"10.0.33.207", "region"=>"us-west-1"},
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
    subject { Address }

    before do
      subject.stub_chain(:client, :describe_addresses, :data).and_return({
        :addresses_set => [
          {"public_ip"=>"1.2.3.4", "domain"=>"standard", "instance_id"=>nil, "region"=>"us-west-1"},
          {"public_ip"=>"1.2.3.4", "domain"=>"standard", "instance_id"=>"i-31866d69", "region"=>"us-west-1"},
          {"public_ip"=>"1.2.3.4", "allocation_id"=>"eipalloc-12345678", "domain"=>"vpc", "region"=>"us-west-1"},
          {"public_ip"=>"1.2.3.4", "allocation_id"=>"eipalloc-12345678", "domain"=>"vpc", "instance_id"=>"i-12345678", "association_id"=>"eipassoc-12345678", "network_interface_id"=>"eni-12345678", "network_interface_owner_id"=>"888888888888", "private_ip_address"=>"10.0.1.2", "region"=>"us-west-1"},
        ],
      })
    end

    describe "#describe" do
      it "returns 4 items" do
        expect(subject.describe(region: "us-east-1").length).to eql(4)
      end
    end
  end
end
