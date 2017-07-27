library(rfcvquery)
context("rfcvquery")

getConnOrSkip <- function(){
  if(file.exists("~/.my.cnf")){
    conn <- try(dbConnect(MySQL(), host="mysqlmtp.supagro.inra.fr",
                          dbname="collections_vigne"),
                silent=TRUE)
    if(class(conn) == "MySQLConnection"){
      return(conn)
    }
  }
  skip("can't connect")
}

test_that("getIntroNames", {
  conn <- getConnOrSkip()

  intro.codes <- c("23298Mtp28", "23297Mtp13")

  expected <- data.frame(intro.code=c("23297Mtp13", "23298Mtp28"),
                         intro.name=c("Mtp3297-13", "Mtp3298-28"),
                         stringsAsFactors=FALSE)

  observed <- getIntroNames(conn, intro.codes)

  expect_equal(observed, expected)

  dbDisconnect(conn)
})

test_that("getVarietyCodesNames", {
  conn <- getConnOrSkip()

  intro.codes <- c("23298Mtp28", "23297Mtp13")

  expected <- data.frame(intro.code=c("23297Mtp13", "23298Mtp28"),
                         var.code=c("23297", "23298"),
                         var.name=c("popMtp3297 (Grenache N x Syrah N)",
                                    "popMtp3298 (Syrah N x Grenache N)"),
                         stringsAsFactors=FALSE)

  observed <- getVarietyCodesNames(conn, intro.codes)

  expect_equal(observed, expected)

  dbDisconnect(conn)
})

test_that("getVarietyColors", {
  conn <- getConnOrSkip()

  variety.codes <- c("1992", "2991", "2281", "11")

  expected <- data.frame(var.code=c("11", "1992", "2281", "2991"),
                         var.name=c("Piquepoul noir", "Abouhou",
                                    "Aetonychi lefko", "Achlamiche"),
                         skin.col=c("N", "N", "B", "B"),
                         pulp.col=c("inc", "inc", "inc", "inc"),
                         stringsAsFactors=FALSE)

  observed <- getVarietyColors(conn, variety.codes)

  expect_equal(observed, expected)

  dbDisconnect(conn)
})
