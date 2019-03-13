# Cabot

> **Version**: 0.1.3

[FactoryBot](https://github.com/thoughtbot/factory_bot) alternative for [Trailblazer](https://github.com/trailblazer/trailblazer)

# Getting started

Add following to Gemfile:

```sh
$ gem 'cabot'
```

and run:

```sh
$ bundle install
```

# Configuration

Create a new directory to store all defined cabot parameters in `spec/cabot`

```sh
spec
  └── cabot
      ├── index.rb
      ├── show.rb
      ├── create.rb
      └── update.rb
```

And then load newly created files

```rb
# rails_helper.rb

Dir[Rails.root.join('spec/cabot/**/*.rb')].each { |f| require f }
```

# Usage

Cabot is trailblazer alternative for [factory_bot](https://github.com/thoughtbot/factory_bot_rails)
It's being used to create operation result in the spec

```rb
  let(:current_user) { Cabot::Create.(:user).model }
  let(:result) { Cabot::Create.(:comment, current_user: current_user)
  
  before do
    let(:seriailizer) { result.serializer }
  end 
```

Calling `Cabot::Create.(:user)` will automatically call `User::Create.(params: Cabot::Parameters::Create.send(:account)) with predefined parameters

```rb
# spec/cabot/create.rb

class Cabot
  module Parameters
    module Create
      def self.comment
        {
          body: '',
        }
      
      def self.user
        {
          name: 'John Doe'
          email: 'john_doe@mail.com'
        }
      end
    end
  end
end
```
         

# License

This project is licensed under the MIT License.




