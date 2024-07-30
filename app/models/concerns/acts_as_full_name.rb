# frozen_string_literal: true

module ActsAsFullName
  extend ActiveSupport::Concern

  included do
    def full_name
      [first_name, last_name].compact.compact_blank.join(' ')
    end
  end
end
