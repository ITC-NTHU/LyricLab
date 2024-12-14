# frozen_string_literal: true

require_relative 'word'
require 'slim'

module Views
  # View for a a list of project entities
  class Vocabulary
    DIFFICULTY_LEVELS = {
      1 => 'Beginner',
      2 => 'Intermediate',
      3 => 'Advanced',
      4 => 'Expert',
      5 => 'Master'
    }.freeze

    DEFAULT_CHECKED_LEVELS = {
      1 => %w[beginner novice1 novice2],           # Beginner
      2 => %w[novice2 level1 level2],              # Intermediate
      3 => %w[level2 level3 level4],               # Advanced
      4 => %w[level3 level4 level5],               # Expert
      5 => %w[level4 level5]                       # Master
    }.freeze

    def initialize(vocabulary)
      @vocabulary = vocabulary
    end

    def sep_text
      @vocabulary.sep_text
    end

    def raw_text
      @vocabulary.raw_text
    end

    def unique_words
      @vocabulary.unique_words.map { |word| Views::Word.new(word) }
    end

    def origin_id
      @vocabulary.origin_id
    end

    def song
      @vocabulary.song
    end

    def rich_text
      Slim::Template.new('app/presentation/views_html/rich_text.slim')
        .render(self, vocabulary: self, song: @song)
    end

    def marked_text
      marked_text = raw_text
      unique_words.map(&:characters).sort_by(&:length).reverse.each do |word|
        marked_text.gsub!(word, "\\@#{word}\\$")
      end
      # puts "text: #{marked_text}"
      marked_text
    end

    def entity
      @vocabulary
    end

    def language_difficulty
      return 0 if @vocabulary.language_difficulty.nil?

      case @vocabulary.language_difficulty
      when 0..1.5 then 1    # Beginner
      when 1.5..3.5 then 2  # Intermediate
      when 3.6..5.0 then 3  # Advanced
      when 5.1..6.0 then 4  # Expert
      else 5                # Master
      end
    end

    def default_checked_levels
      DEFAULT_CHECKED_LEVELS[language_difficulty] || []
    end

    def level_checked?(level)
      default_checked_levels.include?(level.to_s)
    end
  end
end
