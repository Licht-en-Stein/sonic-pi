# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
begin
  require 'atomic_reference'
rescue LoadError
  require 'rbconfig'
  ruby_api = RbConfig::CONFIG['ruby_version']
  os = case RUBY_PLATFORM
       when /.*arm.*-linux.*/
         :raspberry
       when /.*linux.*/
         :linux
       when /.*darwin.*/
         :osx
       when /.*mingw.*/
         :windows
       else
         RUBY_PLATFORM
       end
  require_relative "../../../../rb-native/#{os}/#{ruby_api}/atomic_reference"

end

require 'atomic/direct_update'
require 'atomic/numeric_cas_wrapper'
