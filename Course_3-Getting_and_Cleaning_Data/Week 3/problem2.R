library(jpeg)

source <- "jeff.jpg"

pic <- readJPEG(source, native = TRUE)

quantile(pic, probs = c(0.3,0.8))