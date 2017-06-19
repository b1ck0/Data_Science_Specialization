con = url("http://biostat.jhsph.edu/~jleek/contact.html")
htmlCode = readLines(con,n = 100)
numVector <- nchar(htmlCode)

numVector[10]
numVector[20]
numVector[30]
numVector[100]
