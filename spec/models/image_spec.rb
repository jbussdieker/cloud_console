require 'rails_helper'

describe Image do
  context "instance" do
    subject { Image.new(params) }

    {
      "standard" => 
        {
          "product_codes"=>[],
          "block_device_mapping"=>[
            {"device_name"=>"sdb", "virtual_name"=>"ephemeral0"},
            {"device_name"=>"sdc", "virtual_name"=>"ephemeral1"}
          ],
          "tag_set"=>[],
          "image_id"=>"ami-b2f929da",
          "image_location"=>"amis-for-830277587339-in-us-east-1-5jyz2sjn/ami-b2f929da-ubuntu-precise-64bit-2014-08-0/ubuntu-precise-64bit-2014-08-09-0137.manifest.xml",
          "image_state"=>"available",
          "image_owner_id"=>"830277587339",
          "is_public"=>false,
          "architecture"=>"x86_64",
          "image_type"=>"machine",
          "kernel_id"=>"aki-919dcaf8",
          "name"=>"ubuntu-precise-64bit-2014-08-09-0137",
          "description"=>"ubuntu-precise-64bit-2014-08-09-0137",
          "root_device_type"=>"instance-store",
          "root_device_name"=>"/dev/sda1",
          "virtualization_type"=>"paravirtual",
          "hypervisor"=>"xen",
          "region"=>"us-east-1"
        },
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
    subject { Image }

    before do
      subject.stub_chain(:client, :describe_images, :data).and_return({
        :images_set => [
          {
            "product_codes"=>[],
            "block_device_mapping"=>[
              {"device_name"=>"sdb", "virtual_name"=>"ephemeral0"},
              {"device_name"=>"sdc", "virtual_name"=>"ephemeral1"}
            ],
            "tag_set"=>[],
            "image_id"=>"ami-b2f929da",
            "image_location"=>"amis-for-830277587339-in-us-east-1-5jyz2sjn/ami-b2f929da-ubuntu-precise-64bit-2014-08-0/ubuntu-precise-64bit-2014-08-09-0137.manifest.xml",
            "image_state"=>"available",
            "image_owner_id"=>"830277587339",
            "is_public"=>false,
            "architecture"=>"x86_64",
            "image_type"=>"machine",
            "kernel_id"=>"aki-919dcaf8",
            "name"=>"ubuntu-precise-64bit-2014-08-09-0137",
            "description"=>"ubuntu-precise-64bit-2014-08-09-0137",
            "root_device_type"=>"instance-store",
            "root_device_name"=>"/dev/sda1",
            "virtualization_type"=>"paravirtual",
            "hypervisor"=>"xen",
            "region"=>"us-east-1"
          },
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
