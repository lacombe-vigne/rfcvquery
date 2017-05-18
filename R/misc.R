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

##' @import DBI

.onAttach <- function(libname, pkgname) {
  if(! requireNamespace("utils", quietly=TRUE))
    stop("Pkg utils needed for this function to work. Please install it.",
         call.=FALSE)
  msg <- paste0("package '", pkgname,
                "' (version ", utils::packageVersion(pkgname), ")",
                " is loaded",
                "\nCopyright 2015-2017 Institut National de la Recherche Agronomique (INRA)",
                "\nLicense GNU AGPL version 3 or later")
  packageStartupMessage(msg)
}
