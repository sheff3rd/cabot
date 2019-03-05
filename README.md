# Cabot

> **Version**: 0.1.0

[FactoryBot](https://github.com/thoughtbot/factory_bot) alternative for [Trailblazer](https://github.com/trailblazer/trailblazer)

# Installation

**Add this line to the top of your application's Gemfile:**

```sh
$ gem 'cabot'
```

**And then run:**

```sh
$ bundle install
```

**In the tests directory, create a new one called ```'cabot'```:**

```sh
'app/spec/cabot'
```

**Add ```'cabot'``` directory to your ```'rails_helper.rb'``` file. For example:**

```sh
Dir[Rails.root.join('spec/cabot/**/*.rb')].each { |f| require f }
```

**In this directory, create files called the same as your actions. It should be something like:**

```sh
app
└── spec
    └── cabot
        ├── index.rb
        ├── show.rb
        ├── create.rb
        └── update.rb
```

**In these files we will set the parameters we need to create the entities.**

Let's say you have 2 models: ```User``` that ```has_many: posts```, and ```Post``` that ```belongs_to: user```.

To create the ```User``` model you need ```name``` and ```email``` fields.

And for ```Post``` you need only ```title``` field.

You should have something like:

```sh
# frozen_string_literal: true

require 'rails_helper'

class Cabot
  module Parameters
    module Create
      class << self
        def user
          {
            name: Faker::Name.name,
            email: Faker::Internet.email
          }
        end

        def post
          { title: Faker::Lorem.word }
        end
      end
    end
  end
end
```
As you might have noticed, we can use [Faker](https://github.com/stympy/faker/) gem.

# Usage

**In the ```*_spec.rb``` file***

```sh
...
RSpec.describe User::Create do
  describe '#create' do
    let(:user) { Cabot::Create.(:user).model }
...
```

```Cabot``` will use your [Trailblazer](https://github.com/trailblazer/trailblazer) operation
and on its basis will create an entity that you need for the test.

For creating ```Post``` entity you need to specify the ```current_user```. 

In ```Cabot``` this is the second parameter:

```sh
...
RSpec.describe Post::Create do
  describe '#create' do
    let(:user) { Cabot::Create.(:user).model }
    let(:post) { Cabot::Create.(:post, user).model }
...
```

**You can also indicate what ```Cabot``` should return**

After brakes you can specify ```.model``` or ```.serializer```. 

This is an alternative [Trailblazer](https://github.com/trailblazer/trailblazer) ```result[:model]``` or ```result[:serializer]```.

# License

This project is licensed under the MIT License.




