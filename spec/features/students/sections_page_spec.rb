# frozen_string_literal: true

describe 'Students Sections', type: :feature do
  context 'when visit list of available sections' do
    subject(:visit_page) { visit(new_students_section_path) }

    let!(:section) { create(:section) }

    before { create(:student) }

    it 'has section title' do
      visit_page
      expect(page).to have_content(section.title)
    end
  end
end
