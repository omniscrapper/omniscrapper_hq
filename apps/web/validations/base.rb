module Web::Validations
  class Base < Hanami::Action::Params
    predicate(:json?, message: 'this is not valid JSON') do |criterion|
      begin
        JSON.parse(criterion)
        true
      rescue JSON::ParserError
        false
      end
    end
  end
end

