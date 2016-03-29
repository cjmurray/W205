import tweepy

consumer_key = "hvubp2OSLWJCic6KxeYiZupHx";
#eg: consumer_key = "YisfFjiodKtojtUvW4MSEcPm";


consumer_secret = "fE6sI3NYz2FNaRGv19awYbuWaCYyEXZKI96CU2z1KIkRl4lX9f";
#eg: consumer_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token = "2570811681-XIG1AOTxoboCVNWjNqmbMMoqUycvdChbmIqJxO3";
#eg: access_token = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";

access_token_secret = "Tz9s9IxobQjfiyRc2f395MUO0cCfHcpNvzKU4yVSr35Lx";
#eg: access_token_secret = "YisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPmYisfFjiodKtojtUvW4MSEcPm";


auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



