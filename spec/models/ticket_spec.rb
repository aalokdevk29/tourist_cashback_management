require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { Ticket.reflect_on_association(:supplier).macro.should eq(:belongs_to) }
  it { Ticket.reflect_on_association(:purchase_items).macro.should eq(:has_many) }
end
