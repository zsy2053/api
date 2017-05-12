class ApplicationController < ActionController::API
  include Knock::Authenticable

  # Override Knock's very aggressive rescue
  # module Knock::Authenticable
  #  def define_current_entity_getter entity_class, getter_name
  #    binding.pry
  #    unless self.respond_to?(getter_name)
  #      memoization_var_name = "@_#{getter_name}"
  #      self.class.send(:define_method, getter_name) do
  #        unless instance_variable_defined?(memoization_var_name)
  #          current =
  #            begin
  #              Knock::AuthToken.new(token: token).entity_for(entity_class)
  #            rescue => e
  #              puts "====="
  #              puts "error"
  #              puts "====="
  #              throw e
  #              #nil
  #            end
  #          instance_variable_set(memoization_var_name, current)
  #        end
  #        instance_variable_get(memoization_var_name)
  #      end
  #    end
  #  end
  #
  #  def authenticate
  #     unless entity.present? && entity.authenticate(auth_params[:password])
  #       raise Knock.not_found_exception_class
  #     end
  #   end
  # end
  #
  # def entity
  #   @entity ||=
  #     if entity_class.respond_to? :from_token_request
  #       entity_class.from_token_request request
  #     else
  #       entity_class.find_by email: auth_params[:email]
  #     end
  # end
end
