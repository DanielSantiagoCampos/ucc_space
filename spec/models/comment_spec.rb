# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validaciones' do
    it { should validate_presence_of(:comment) }
  end

  describe 'asociaciones' do
    it { should belong_to(:publication) }
    it { should belong_to(:emisor_user).class_name('User') }
  end
end
