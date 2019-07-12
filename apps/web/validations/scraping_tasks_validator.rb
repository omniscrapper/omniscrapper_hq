class ScrapingTasksValidator
  include Hanami::Validations

  predicate :schema?, message: 'this is not valid schema' do |criterion|
    meta = JSON::Validator.validator_for_name("draft4").metaschema
    JSON::Validator.validate(meta, criterion)
  end

  validations do
    required(:scraping_task).schema do
      required(:name).filled(:str?)

      required(:scraping_schedule).schema do
        required(:time).filled(:time?)
        required(:interval).filled(:int?)
      end

      required(:schema).schema do
        required(:metadata).filled(:schema?)
      end
    end
  end
end