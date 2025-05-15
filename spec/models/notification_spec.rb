require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'asociaciones' do
    it { is_expected.to belong_to(:emisor_user).class_name('User') }
    it { is_expected.to belong_to(:receptor_user).class_name('User') }
    it { is_expected.to belong_to(:publication) }
  end

  describe 'enums' do
    it do
      is_expected.to define_enum_for(:notification_type).
        with_values(like: 0, comment: 1)
    end
  end
end
