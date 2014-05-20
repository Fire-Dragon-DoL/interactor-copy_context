module Interactor

  module ClassMethods

    def perform_on(obj, *arguments)
      perform(*arguments).tap do |instance|
        instance.context.each do |key, value|
          obj.send(:instance_variable_set, :"@#{ key }", value)
        end
      end
    end

  end

  # InstanceMethods

  def perform_on(obj)
    perform
    context.each do |key, value|
      obj.send(:instance_variable_set, :"@#{ key }", value)
    end
  end

end