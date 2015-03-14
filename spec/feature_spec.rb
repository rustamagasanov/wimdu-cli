require "spec_helper"

describe "Wimdu CLI" do
  let(:exe) { File.expand_path('../../bin/wimdu', __FILE__) }

  describe "list" do
    let(:cmd) { "#{exe} list" }

    context "when there are no properties" do
      it "should prompt 'No properties found.'" do
        run_interactive(cmd)
        expect(output_from(cmd)).to eql("No properties found.")
      end
    end
  end

  describe "new" do
    let(:cmd) { "#{exe} new" }

    it "allows for entering data" do
      run_interactive(cmd)
      expect(output_from(cmd)).to include("Starting with new property")
      expect(output_from(cmd)).to include("Title: ")
      type "My Title"
      expect(output_from(cmd)).to include("Address: ")
    end
  end
end
