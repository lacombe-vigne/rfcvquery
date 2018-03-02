## Copyright 2015-2018 Institut National de la Recherche Agronomique (INRA)
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

##' @import DBI
##' @import RMySQL

.onAttach <- function(libname, pkgname) {
  if(! requireNamespace("utils", quietly=TRUE))
    stop("Pkg utils needed for this function to work. Please install it.",
         call.=FALSE)
  msg <- paste0("package '", pkgname,
                "' (version ", utils::packageVersion(pkgname), ")",
                " is loaded",
                "\nCopyright 2015-2018 Institut National de la Recherche Agronomique (INRA)",
                "\nLicense GNU AGPL version 3 or later")
  packageStartupMessage(msg)
}

##' rfcvquery: A package to query the RFCV database.
##'
##' To use this package, a "read" access to the MySQL database is required.
##'
##' @section Encoding:
##' Note that the content of the database is in the \href{https://en.wikipedia.org/wiki/ISO/IEC_8859}{ISO-8859-1} standard of character encoding.
##' As such, once the result of a query is available, it may be useful to use the following function: \code{res.new <- iconv(res, from="ISO-8859-1", to="UTF-8")}.
##'
##' @docType package
##' @name rfcvquery
NULL
