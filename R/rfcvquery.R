##' Return introduction names.
##'
##' http://bioweb.ensam.inra.fr/collections_vigne/Intro.php
##' @param conn a DBIConnection object, as produced by dbConnect
##' @param intro.codes vector of introduction codes ("CodeIntro")
##' @return vector of introduction names
##' @author Timothée Flutre
##' @export
get.intro.name <- function(conn, intro.codes){
  stopifnot(is.vector(intro.codes))
  intro.names <- sapply(intro.codes, function(intro.code){
    query <- paste0("SELECT NomIntro FROM `NV-INTRODUCTIONS` WHERE CodeIntro=\"",
                    intro.code, "\"")
    res <- DBI::dbSendQuery(conn, query)
    tmp <- DBI::dbFetch(res)
    tmp$NomIntro
  })
  return(intro.names)
}

##' Return variety codes and names.
##'
##' http://bioweb.ensam.inra.fr/collections_vigne/Variete.php
##' @param conn a DBIConnection object, as produced by dbConnect
##' @param intro.codes vector of introduction codes ("CodeIntro")
##' @return vector of variety names
##' @author Timothée Flutre
##' @export
get.variety.code.name <- function(conn, intro.codes){
  stopifnot(is.vector(intro.codes))
  variety.codes <- sapply(intro.codes, function(intro.code){
    query <- paste0("SELECT CodeVar FROM `NV-INTRODUCTIONS` WHERE CodeIntro=\"",
                    intro.code, "\"")
    res <- DBI::dbSendQuery(conn, query)
    tmp <- DBI::dbFetch(res)
    tmp$CodeVar
  })
  variety.names <- sapply(variety.codes, function(variety.code){
    query <- paste0("SELECT NomVar FROM `NV-VARIETES` WHERE CodeVar=\"",
                    variety.code, "\"")
    res <- DBI::dbSendQuery(conn, query)
    tmp <- DBI::dbFetch(res)
    tmp$NomVar
  })
  return(data.frame(CodeVar=variety.codes,
                    NomVar=variety.names))
}
