# twitter.nim [![Circle CI](https://circleci.com/gh/kubo39/twitter.nim.svg?style=svg)](https://circleci.com/gh/kubo39/twitter.nim)

Low-level twitter API wrapper library for nim.

## Installation

from github:

```
$ git clone git://github.com/kubo39/twitter.nim
$ cd twitter.nim && nimble install
```

## Example

```nimrod
import twitter, json, strtabs

when isMainModule:
  var parsed = parseFile("credential.json")

  var consumerToken = newConsumerToken(parsed["ConsumerKey"].str,
                                       parsed["ConsumerSecret"].str)
  var twitterAPI = newTwitterAPI(consumerToken,
                                 parsed["AccessToken"].str,
                                 parsed["AccessTokenSecret"].str)

  # Simply get.
  var resp = twitterAPI.get("account/verify_credentials.json")
  echo resp.status

  # Using proc corresponding twitter REST APIs.
  resp = twitterAPI.userTimeline()
  echo parseJson(resp.body)

  # Using `callAPI` template.
  var testStatus = {"status": "test"}.newStringTable
  resp = twitterAPI.callAPI(statusesUpdate, testStatus)
  echo parseJson(resp.body)
```
