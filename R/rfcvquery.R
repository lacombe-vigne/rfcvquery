##' Introduction/accession level
##'
##' Return the introduction/accession names from a set of introduction/accession codes.
##' @param conn a DBIConnection object, as produced by dbConnect
##' @param intro.codes vector of introduction codes ("CodeIntro")
##' @return vector of introduction names
##' @author Timothée Flutre
##' @export
getIntroName <- function(conn, intro.codes){
  stopifnot(is.vector(intro.codes),
            all(! duplicated(intro.codes)))

  intro.names <- sapply(intro.codes, function(intro.code){
    query <- paste0("SELECT NomIntro",
                    " FROM `NV-INTRODUCTIONS`",
                    " WHERE CodeIntro=\"",
                    intro.code, "\"")
    res <- dbSendQuery(conn, query)
    tmp <- dbFetch(res)
    tmp$NomIntro
  })

  return(intro.names)
}

##' Variety/Population level
##'
##' Return the variety/population codes and names from a set of introduction/accession codes.
##' @param conn a DBIConnection object, as produced by dbConnect
##' @param intro.codes vector of introduction codes ("CodeIntro")
##' @return data.frame of variety codes and names
##' @author Timothée Flutre
##' @export
getVarietyCodeName <- function(conn, intro.codes){
  stopifnot(is.vector(intro.codes))

  variety.codes <- sapply(intro.codes, function(intro.code){
    query <- paste0("SELECT CodeVar",
                    " FROM `NV-INTRODUCTIONS`",
                    " WHERE CodeIntro=\"",
                    intro.code, "\"")
    res <- dbSendQuery(conn, query)
    tmp <- dbFetch(res)
    tmp$CodeVar
  })

  variety.names <- sapply(variety.codes, function(variety.code){
    query <- paste0("SELECT NomVar",
                    " FROM `NV-VARIETES`",
                    " WHERE CodeVar=\"",
                    variety.code, "\"")
    res <- dbSendQuery(conn, query)
    tmp <- dbFetch(res)
    tmp$NomVar
  })

  return(data.frame(CodeVar=variety.codes,
                    NomVar=variety.names))
}
