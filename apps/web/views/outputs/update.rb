module Web
  module Views
    module Outputs
      class Update
        include Web::View
        include Base
        template 'outputs/edit'
      end
    end
  end
end
