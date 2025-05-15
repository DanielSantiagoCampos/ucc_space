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
      is_expected.to define_enum_for(:tag_type).
        with_values(work_opportunity: 0, funny: 1, student_help: 3)
    end

    it do
      is_expected.to define_enum_for(:status).
        with_values(active: 0, inactive: 1)
    end
  end

  describe '#file_url' do
    # let(:publication) { build(:publication) }

    context 'cuando file es una URL' do
      xit 'devuelve el valor de file' do
        publication.file = "http://example.com/image.png"
        expect(publication.file_url).to eq("http://example.com/image.png")
      end
    end

    context 'cuando file_upload está adjunto' do
      xit 'devuelve la ruta del blob adjunto' do
        publication.file = nil
        publication.file_upload.attach(
          io: File.open(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png')),
          filename: 'test_image.png',
          content_type: 'image/png'
        )
        url = Rails.application.routes.url_helpers.rails_blob_path(publication.file_upload, only_path: true)
        expect(publication.file_url).to eq(url)
      end
    end

    context 'cuando no hay file ni file_upload' do
      xit 'devuelve nil' do
        publication.file = nil
        expect(publication.file_url).to be_nil
      end
    end
  end

  describe '#tag_name' do
    xit 'devuelve el nombre correcto para cada tag_type' do
      publication = build(:publication, tag_type: 'work_opportunity')
      expect(publication.tag_name).to eq('Oportunidad de trabajo')

      publication.tag_type = 'funny'
      expect(publication.tag_name).to eq('Diversión')

      publication.tag_type = 'student_help'
      expect(publication.tag_name).to eq('Ayuda estudiantil')
    end

    xit 'devuelve "Desconocido" para un tag_type desconocido' do
      publication = build(:publication)
      allow(publication).to receive(:tag_type).and_return('unknown_tag')
      expect(publication.tag_name).to eq('Desconocido')
    end
  end
end

