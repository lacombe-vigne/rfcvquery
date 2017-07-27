## Copyright 2015-2017 Institut National de la Recherche Agronomique (INRA)
##
## This file is part of rfcvquery.
##
## rfcvquery is free software: you can redistribute it and/or modify
## it under the terms of the GNU Affero General Public License as
## published by the Free Software Foundation, either version 3 of the
## License, or (at your option) any later version.
##
## rfcvquery is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Affero General Public License for more details.
##
## You should have received a copy of the GNU Affero General Public
## License along with rfcvquery.  If not, see
## <http://www.gnu.org/licenses/>.

##' Introduction/accession level
##'
##' Return the introduction/accession names from a set of introduction/accession codes.
##' @param conn a DBIConnection object, as produced by dbConnect
##' @param intro.codes vector of introduction codes ("CodeIntro")
##' @return vector of introduction names
##' @author Timothée Flutre
##' @examples
##' \dontrun{## obviously, you must have read access to the database
##' library(RMySQL)
##' library(getPass)
##' conn <- dbConnect(drv=MySQL(), host="...", dbname="...",
##'                   user="...", password=getPass())
##' getIntroName(conn, c("23297Mtp13", "23298Mtp28"))
##' on.exit(dbDisconnect(con))
##' }
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
##' @examples
##' \dontrun{## obviously, you must have read access to the database
##' library(RMySQL)
##' library(getPass)
##' conn <- dbConnect(drv=MySQL(), host="...", dbname="...",
##'                   user="...", password=getPass())
##' getVarietyCodeName(conn, c("23297Mtp13", "23298Mtp28"))
##' on.exit(dbDisconnect(con))
##' }
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

##' Variety/Population level
##'
##' Return a template of what to provide to insert a new variety.
##' @param conn a DBIConnection object, as produced by dbConnect
##' @return data.frame
##' @author Timothee Flutre
##' @export
getTemplateInsertVariety <- function(conn){
  ## dbListFields(conn, "`NV-VARIETES`")
  query <- paste0("SELECT *",
                  " FROM `NV-VARIETES`",
                  " WHERE CodeVar IN (\"322\"", # Cabernet-Sauvignon
                  ", \"2960\"", # Marselan
                  ", \"23297\"", # Grenache x Syrah
                  ", \"23298\")") # Syrah x Grenache
  res <- dbSendQuery(conn, query)
  out <- dbFetch(res)
  return(out)
}

##' Skin and pulp colors
##'
##' Return the skin and pul colors from a set of variety codes.
##' @param conn a DBIConnection object, as produced by dbConnect
##' @param variety.codes vector of variety codes ("CodeVar")
##' @return data.frame of variety codes, names and colors
##' @author Timothee Flutre
##' @examples
##' \dontrun{## obviously, you must have read access to the database
##' library(RMySQL)
##' library(getPass)
##' conn <- dbConnect(drv=MySQL(), host="...", dbname="...",
##'                   user="...", password=getPass())
##' variety.codes <- c("18", "300", "195")
##' getVarietyColor(conn, variety.codes)
##' on.exit(dbDisconnect(con))
##' }
##' @export
getVarietyColors <- function(conn, variety.codes){
  stopifnot(is.vector(variety.codes))

  out <- data.frame(CodeVar=variety.codes,
                    stringsAsFactors=FALSE)

  query <- paste0("SELECT NomVar,CouleurPel,CouleurPulp",
                  " FROM `NV-VARIETES`",
                  " WHERE CodeVar IN (",
                  paste(paste0("\"", variety.codes, "\""), collapse=","),
                  ")")
  res <- dbSendQuery(conn, query)
  tmp <- dbFetch(res)

  out$NameVar <- tmp[,1]
  out$SkinCol <- tmp[,2]
  out$PulpCol <- tmp[,3]

  return(out)
}
