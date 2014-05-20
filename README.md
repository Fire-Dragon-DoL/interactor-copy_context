# Interactor CopyContext

This gem allows you to easily extend [interactor](https://github.com/collectiveidea/interactor) so that in
Ruby on Rails you can eventually copy the `context` on your controller as `@instace_variables`, accessing them
easily. Here is an example:

```ruby
class MakeCake
  include Interactor
  
  def perform
    # dosomething
  end
end

class CakesController < ApplicationController
  
  def create
    MakeCake.perform_on(self, ingredients: [:egg, :milk, :something])
    
    render text: @ingredients.first.to_s # => "egg"
  end
  
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'interactor-copy_context', '~> 0.0.1'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install interactor-copy_context
```

## Usage

Usage is very simple, use the method `perform_on` which is just a wrapper for `perform` (accepts same params).
The only important thing is **first parameter is the object which you want to inject context into**. So for
example, `self` in a controller is the controller itself, very helpful because data is ready for your views in
that case. The method is available both on Interactor and organizer and on instance and class too.

```ruby
DummyInteractor.perform_on(self, dummy1: 'blah')
DummyInteractor.new(dummy1: 'blah').perform_on(self)
```

Both methods inject same context, so they are equivalent. Same for organizer methods (they behave like
interactors):

```ruby
DummyOrganizer.perform_on(self)
DummyOrganizer.new.perform_on(self)
```

## About performance
It's a copy of an entire hash (not a deep copy, only pointers). I don't think context will ever grow over 100
elements, so it should be fine.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/interactor-copy_context/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
