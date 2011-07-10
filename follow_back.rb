require File.expand_path('../boot', __FILE__)

oauth = Foursquare::OAuth.new(CLIENT_ID, CLIENT_SECRET)
oauth.authorize_from_access(ACCESS_TOKEN, ACCESS_SECRET)
foursquare = Foursquare::Base.new(oauth)

foursquare.friend_requests.each do |u|
	p u.firstname
	if u.photo =~ /foursquare.com\/img\/blank/
		foursquare.friend_deny :uid => u.id
	else
		foursquare.friend_approve :uid => u.id
	end
end
