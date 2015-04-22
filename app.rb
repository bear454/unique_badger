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

require 'sinatra/base'

class UniqueBadger < Sinatra::Base
  set :root, File.dirname(__FILE__)
  enable :inline_templates
  
  ENV['RACK_ENV'] ||= 'development'
  require 'bundler'
  Bundler.require :default, ENV['RACK_ENV'].to_sym

  DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

  get '/' do
    slim :index
  end

  post '/' do
    @scan = Scan.first(badge: params[:badge]) || Scan.create(badge: params[:badge], scanned_at: Time.now)
    slim :scan
  end

  get '/*' do
    status 404
  end
end

class Scan
  include DataMapper::Resource
  property :id, Serial
  property :badge, String
  property :scanned_at, DateTime
end

DataMapper.finalize
Scan.auto_upgrade!

__END__

@@layout
doctype html
html
  head
    meta charset="utf-8"
    title UniqueBadger
  body
    == yield

@@index
form action="/" method="POST"
  input type="text" name="badge"
  input.button type="submit" value="Submit Scan"

@@scan
p Badge scanned #{@scan.scanned_at.strftime("at %l:%M%P on %A, %B %-d, %Y")}
pre =@scan.badge
