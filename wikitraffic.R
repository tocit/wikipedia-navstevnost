install.packages("RJSONIO")
require(RJSONIO)
require(xlsx)


jmena  <- c("Andrej Babiš",
            "Pavel Bělobrádek",
            "Jiří Dienstbier mladší",
            "Milan Chovanec", 
            "Jan Mládek",
            "Bohuslav Sobotka",
            "Martin Stropnický",
            "Marcel Chládek",
            "Lubomír Zaorálek")


results  <- data.frame(row.names=row.names(babis)[order(row.names(babis))])

for (i in jmena) {
  print(i)
  data  <- as.data.frame(
                    fromJSON(
                      paste("http://stats.grok.se/json/cs/latest90/", URLencode(i), sep=""))$daily_views)
  results  <- cbind(results, data[order(rownames(data)),])
}

names(results)  <- jmena
      
head(results)
