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

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new :specs do |task|
  task.pattern = Dir['spec/**/*_spec.rb']
end

task :default => ['specs']

