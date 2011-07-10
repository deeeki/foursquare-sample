require File.expand_path('../boot', __FILE__)

oauth = Foursquare::OAuth.new(CLIENT_ID, CLIENT_SECRET)

request_token = oauth.request_token.token
request_secret = oauth.request_token.secret

print "access following url.\n"
print oauth.request_token.authorize_url
print "\nand input access code. >> \n"
VERIFIER = STDIN.gets.gsub!(/\n/,'')

access_token, access_secret = oauth.authorize_from_request(request_token, request_secret, VERIFIER)

print "success! paste following code to config file.\n"
print "ACCESS_TOKEN = '" + access_token + "'\n"
print "ACCESS_SECRET = '" + access_secret + "'\n"
