# Copyright © 2015 SUSE LLC, James Mason <jmason@suse.com>.
#
# This file is part of UniqueBadger.
#
# UniqueBadger is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# UniqueBadger is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with UniqueBadger. If not, see <http://www.gnu.org/licenses/>.


ENV['RACK_ENV'] = 'test'
ENV['DATABASE_URL'] = 'sqlite::memory:'

require_relative File.join('..', 'app.rb')
require 'rspec'
require 'rack/test'

RSpec.configure do |config|
  include Rack::Test::Methods

  def app
    UniqueBadger
  end
end
