require 'dry/monads/result'
require 'dry/monads/try'
require 'dry/monads/do'
require 'dry/monads/do/all'

module Operations
  class Base
    include Dry::Monads::Try::Mixin
    include Dry::Monads::Result::Mixin
    include Dry::Monads::Do::All

    def call(_params)
      raise NotImplementedError, 'implement #call in child class'
    end
  end
end
