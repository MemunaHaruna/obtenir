require "spec_helper"

RSpec.describe Obtenir do
  it "has a version number" do
    expect(Obtenir::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(Obtenir::Obtenir.new.get_github_user).to eq(nil)
  end
end
