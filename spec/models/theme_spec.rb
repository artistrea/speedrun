require 'rails_helper'

RSpec.describe Theme, type: :model do
  describe "testing factory" do
    it { expect(build(:theme)).to be_valid }
  end
  
  describe "validation tests" do
    context "property is nil" do
      it { expect(build(:theme, name: "")).to be_invalid  }
    end
  end
end
