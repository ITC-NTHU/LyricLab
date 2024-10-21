# frozen_string_literal: true

module LyricLab
  module Repository
    # Repository for Lyrics
    class Lyrics
      def self.find_id(id)
        rebuild_entity Database::LyricsOrm.first(id:)
      end

      def self.find_username(username)
        rebuild_entity Database::LyricsOrm.first(username:)
      end

      def self.rebuild_entity(db_record)
        return nil unless db_record

        Entity::Lyrics.new(
          id: db_record.id,
          origin_id: db_record.origin_id,
          username: db_record.username,
          email: db_record.email
        )
      end

      def self.rebuild_many(db_records)
        db_records.map do |db_lyrics|
          Lyrics.rebuild_entity(db_lyrics)
        end
      end

      def self.db_find_or_create(entity)
        Database::LyricsOrm.find_or_create(entity.to_attr_hash)
      end
    end
  end
end