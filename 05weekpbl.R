install.packages("RCurl")
install.packages("XML")
install.packages("wordcloud")
install.packages("RmecabKo")

library(RCurl)
library(XML)
library(wordcloud)
library(RmecabKo)

searchUrl <- 'https://openapi.naver.com/v1/search/news.xml'
Client_ID <- 'nqwA9gM8SQdvOBr4p5si'
Client_Secret <- 'LSZ6_28atW'

query <-URLencode(iconv("경영통계","euc-kr", "UTF-8"))
url <- paste(searchUrl,"?query=", query, "&display=20",sep="")

doc <- getURL(url, httpheader =c('Content-Type' ="apllication/xml", 'X-Naver-CLient-Id' = Client_ID, 'X-Naver-CLient-Secret' =Client_Secret))

doc

xmlFile <- xmlParse(doc)