class Dummy1Interactor
  include Interactor

  DUMMYVAR = 'testmedummy1'

  def perform
    if context[:should_fail]
      context.fail!
    else
      context[:dummy1] = DUMMYVAR
    end
  end

end

class Dummy2Interactor
  include Interactor

  DUMMYVAR = 'testmedummy2'

  def perform
    if context[:should_fail]
      context.fail!
    else
      context[:dummy2] = DUMMYVAR
    end
  end

end

class DummyOrganizer
  include Interactor::Organizer

  organize Dummy1Interactor, Dummy2Interactor  
end