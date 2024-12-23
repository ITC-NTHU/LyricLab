# frozen_string_literal: true

require 'dry-validation'

module LyricLab
  module Forms
    # Form validation for search query
    class NewSearch < Dry::Validation::Contract
      # check for non empty search string
      SEARCH_REGEX = /^(?!\s*$).+/
      MSG_INVALID_SEARCH = 'invalid search query'

      params do
        required(:search_query).filled(:string)
      end

      rule(:search_query) do
        key.failure(MSG_INVALID_SEARCH) unless SEARCH_REGEX.match?(value)
      end
    end
  end
end
