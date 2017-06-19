## This script connects to Github API and reads the JSON with repos
## for the following user: https://api.github.com/users/jtleek/repos

library(httr)
library(httpuv)
library(jsonlite)

oauth_endpoints("github")
myapp <- oauth_app("github",
        key = "7438da657b5f4a03cbf0",
        secret = "ebff2b9ebccdf281b777a792b4a538a39c4a971e" )

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)
gtoken <- config(token = github_token)
repos <- GET("https://api.github.com/users/jtleek/repos", gtoken)

json1 = content(repos)
jsonData = fromJSON(toJSON(json1))

jsonData[jsonData$name == "datasharing","created_at"]