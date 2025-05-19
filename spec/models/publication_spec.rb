# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publication, type: :model do
  describe 'validaciones' do
    it { is_expected.to validate_presence_of(:description) }
  end

  describe 'asociaciones' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
    it { is_expected.to have_many(:likes) }
    it { is_expected.to have_many(:notifications) }
    it { is_expected.to have_one_attached(:file_upload) }
  end

  describe 'enums' do
    it do
      is_expected.to define_enum_for(:tag_type)
        .with_values(work_opportunity: 0, funny: 1, student_help: 3)
    end

    it do
      is_expected.to define_enum_for(:status)
        .with_values(active: 0, inactive: 1)
    end
  end
end
