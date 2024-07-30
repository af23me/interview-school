# frozen_string_literal: true

describe Students::SectionForm do
  let(:service) { described_class.new(student_section) }

  describe '#save' do
    subject(:perform_subject) { service.save }

    let(:student) { create(:student) }
    let(:section) { build(:section) }
    let(:student_section) { build(:student_section, student:, section:) }

    context 'when student do not have another sections' do
      it 'save student section' do
        expect { perform_subject }.to change(StudentSection, :count)
      end
    end

    context 'when student do not have conflicts on times' do
      let(:section) do
        build(:section,
              weekdays: [0, 2, 4],
              start_at: Time.zone.parse('07:30'),
              end_at: Time.zone.parse('08:50'))
      end

      let(:another_section) do
        create(:section,
               weekdays: [0, 2, 4],
               start_at: Time.zone.parse('09:00'),
               end_at: Time.zone.parse('09:50'))
      end

      before do
        create(:student_section, student:, section: another_section)
      end

      it 'save student section' do
        expect { perform_subject }.to change(StudentSection, :count)
      end
    end

    context 'when student have one conflict on times' do
      let(:section) do
        build(:section,
              weekdays: [0, 2, 4],
              start_at: Time.zone.parse('07:30'),
              end_at: Time.zone.parse('08:50'))
      end

      let(:conflicted_section) do
        create(:section,
               weekdays: [0, 2, 4],
               start_at: Time.zone.parse('08:30'),
               end_at: Time.zone.parse('09:20'))
      end

      before do
        create(:student_section, student:, section: conflicted_section)
      end

      it 'not save student section' do
        expect { perform_subject }.not_to change(StudentSection, :count)
      end
    end
  end
end
