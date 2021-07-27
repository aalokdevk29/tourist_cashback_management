require 'rails_helper'

RSpec.describe Tourist, type: :model do
  it { Tourist.reflect_on_association(:purchases).macro.should eq(:has_many) }
end
