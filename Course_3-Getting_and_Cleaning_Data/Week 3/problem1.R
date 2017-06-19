library(dplyr)
library(tidyr)

df <- read.csv("hid.csv")
df <- tbl_df(df)

res <- df$ACR == 3 & df$AGS == 6

which(res)