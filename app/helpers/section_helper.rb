# frozen_string_literal: true

module SectionHelper
  def weekdays_string(weekdays)
    weekdays.map { |weekday| I18n.t("section.weekday_#{weekday}") }.join(', ')
  end

  def grouped_sections(sections)
    sections.group_by do |section|
      section.start_at.strftime('%H')
    end
  end
end
