import twitter

when isMainModule:
  var twitter = newTwitterAPI("Your Consumer Key",
                              "Your Consumer Secret",
                              "Your Access Token",
                              "Your Access Token Secret")

  var resp = twitterAPI.get("account/verify_credentials.json")
  echo resp.status