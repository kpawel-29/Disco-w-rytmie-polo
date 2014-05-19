require 'spec_helper'
OmniAuth.config.test_mode = true
omniauth_hash = { 'provider' => 'github',
                  'uid' => '12345',
                  'info' => {
                      'name' => 'natasha',
                      'email' => 'hi@natashatherobot.com',
                      'nickname' => 'NatashaTheRobot'
                  },
                  'extra' => {'raw_info' =>
                                  { 'location' => 'San Francisco',
                                    'gravatar_id' => '123456789'
                                  }
                  }
}
OmniAuth.config.add_mock(:github, omniauth_hash)