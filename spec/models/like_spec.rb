# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'asociaciones' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:publication) }
  end
end
