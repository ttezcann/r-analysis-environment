library(haven)
library(sjmisc)
gss <- read_dta("https://raw.githubusercontent.com/ttezcann/logseqpublic/main/data/GSS2022.dta")
frq(gss$compuse, out = "v")
