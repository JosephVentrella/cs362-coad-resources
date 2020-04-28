require 'rails_helper'

RSpec.describe Ticket, type: :model do
let (:ticket){Ticket.new}

    describe 'relationships' do
        it { should belong_to(:region) }
        it { should belong_to(:organization).options(true) }
    end
end

#optional: true