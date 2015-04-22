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

require_relative '../spec_helper'

describe 'Root Path' do
  describe 'GET /' do
    before { get '/' }

    it 'is successful' do
      expect(last_response.status).to eq 200
    end
  end
end

describe 'Scanning a badge' do
  describe 'POST /' do
    before { post '/', badge: 'testdata' }
    
    it 'should store the badge value' do
      expect(Scan.count(badge: 'testdata')).to eq 1
    end
    
    describe 'twice' do
      before { post '/', badge: 'testdata' }
      
      it 'should only store the badge once' do
        expect(Scan.count(badge: 'testdata')).to eq 1
      end
    end
  end
end
