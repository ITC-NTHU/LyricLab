# frozen_string_literal: true

require 'dry/transaction'

module LyricLab
  module Service
    # Transaction to store project from Github API to database
    class FindSongsFromSearch
      include Dry::Transaction

      step :parse_search_string
      step :request_songs
      step :reify_songs

      MSG_NO_SONGS = 'Can\'t find songs right now; please try again later.'
      MSG_REIFY_FAILED = 'Error in the FindSongsFromSearch.'

      private

      def parse_search_string(input)
        if input.success?
          search_string = input[:search_query]
          Success(search_string:)
        else
          Failure(input.errors.messages.first)
        end
      end

      def request_songs(input)
        result = Gateway::Api.new(LyricLab::App.config)
          .load_search_results(input[:search_string])

        result.success? ? Success(result.payload) : Failure(result.message)
      rescue StandardError => e
        App.logger.error e.inspect
        App.logger.error e.backtrace.join("\n")
        Failure(MSG_NO_SONGS)
      end

      def reify_songs(songs_json)
        Representer::SearchResults.new(OpenStruct.new)
          .from_json(songs_json)
          .then { |songs| Success(songs) }
      rescue StandardError
        Failure(MSG_REIFY_FAILED)
      end
    end
  end
end
