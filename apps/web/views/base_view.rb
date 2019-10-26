module Web
  module Views
    class BaseView 
      include Web::View

      def edit_button(path)
        link_to '', path, class: 'btn btn-primary fas fa-edit'
      end

      def remove_button(path)
        form_for(:object, path, method: :delete) do
          submit '', class: 'btn btn-danger fas fa-trash'
        end
      end
    end
  end
end
