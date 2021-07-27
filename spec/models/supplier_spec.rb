require 'rails_helper'

RSpec.describe Supplier, type: :model do
  it { Supplier.reflect_on_association(:tickets).macro.should eq(:has_many) }
end
