require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_API_KEY"
  config.consumer_secret     = "YOUR_API_SECRET_KEY"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.acces_token_secret  = "YOUR_ACCESS_TOKEN_SECRET"
end

def tweet_random_quote(client)
  quotes = [
    "The only limit to our realization of tomorrow is our doubts of today. - Franklin D. Roosevelt",
    "Do not wait to strike till the iron is hot; but make it hot by striking. - William Butler Yeats",
    "The future belongs to those who believe in the beauty of their dreams. - Eleanor Roosevelt",
    "It does not matter how slowly you go as long as you do not stop. - Confucius"
  ]

  quote = qutes.sample
  client_update(quote)
  puts "Tweeted: #{quote}"
end

def follow_followers(client)
  client.followers.each do |follower|
    client.follow(follower)
    puts "Follower ${follower.screen_name}"
  end
end

def like_tweets_with_keyword(client, keyword)
  client.search("##{keyword}", result_type: "recent").take(10).each do |tweet|
    client.favorite(tweet)
    puts "Liked tweet by @#(tweet.user.screen_name): #{tweet_text}"
 end
end

/Example bot tasks/
tweet_random_quote(client)
follow_followers(client)
like_tweets_with_keyword(client, "coding")