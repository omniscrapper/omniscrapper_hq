# frozen_string_literal: true

Fabricator(:schema) do
  definition { { type: 'object', properties: { a: { type: 'integer' } } } }
end
