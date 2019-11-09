module Web
  module Views
    module Tasks
      class Create
        include Web::View
        include Base

        template 'tasks/new'
      end
    end
  end
end
