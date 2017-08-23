class Document < ApplicationRecord
  include PgSearch

  pg_search_scope(
    :search,
    against: %i(
      description
      title
    ),
    using: {
      tsearch: {
        dictionary: 'russian',
        tsvector_column: 'tsv',
        prefix: true
      }
    }
  )
end
