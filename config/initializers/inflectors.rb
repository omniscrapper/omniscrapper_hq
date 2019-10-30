# frozen_string_literal: true

require 'hanami/utils/inflector'

Hanami::Utils::Inflector.inflections do
  exception 'schema', 'schemas'
end
