require 'rails_helper'

RSpec.describe Ticket, type: :model do
it "ticket exists" do
 ticket = Ticket.new()
end

it {should belong_to(:region)}
end
