# frozen_string_literal: true

# Generated by hyrax:models
class Collection < ActiveFedora::Base
  include ::Hyrax::CollectionBehavior
  # You can replace these metadata if they're not suitable
  include AdventistMetadata
  self.indexer = CollectionIndexer
end
