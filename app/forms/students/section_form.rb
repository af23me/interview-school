# frozen_string_literal: true

module Students
  class SectionForm < ::ProxyForm
    model_attributes :section_id

    validate do
      errors.add(:base, 'Intersection with others sections found') unless intersection_sections_count.zero?
    end

    private

    def intersection_sections_count
      Section
        .joins(:student_sections)
        .where(student_sections: { student_id: model.student.id })
        .where(
          'sections.start_at < ? AND sections.end_at > ? AND sections.weekdays && ARRAY[?]::integer[]',
          model.section.end_at,
          model.section.start_at,
          model.section.weekdays
        ).count
    end
  end
end
