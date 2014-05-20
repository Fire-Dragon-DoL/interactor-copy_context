class DummyInteractor
  include Interactor

  def perform
    if context[:should_fail]
      context.fail!
    else
      context[:custom_var_1] = 'testme'
    end
  end
  
end