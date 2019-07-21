module SchemaPredicate
  include Hanami::Validations::Predicates

  predicate :schema? do |criterion|
    meta = JSON::Validator.validator_for_name("draft4").metaschema
    JSON::Validator.validate(meta, criterion)
  end
end
