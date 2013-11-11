require 'bundler/setup'

Bundler.require(:default, ENV['RACK_ENV'])

use Rack::Static,
  :urls => ["/images", "/js", "/css"],
  :root => "public"

if ENV['RACK_ENV'] == 'production'
  use Rack::Auth::Basic, "Please sign in" do |username, password|
    [username,password] == [ENV['USERNAME'],ENV['PASSWORD']]
  end
end

run Rack::Directory.new('public')
