Package "rfcvquery"
==================

This directory contains the "rfcvquery" package for the R programming language.
This package helps querying the database of the collections from the French Network of Grapevine Repositories ([RFCV](https://bioweb.supagro.inra.fr/collections_vigne/Home.php?l=EN)).
The development is funded by the Institut National de la Recherche Agronomique ([INRA](https://www.inra.fr/)).
The coordinators are Timothée Flutre and Thierry Lacombe.

The copyright is owned by the INRA.
The code is available under the GNU Public License (version 3 and later).
See the COPYING file for usage permissions.

The content of this directory is versioned using git, the central repository being hosted on [GitHub](https://github.com/lacombe-vigne/rfcvquery).
You can report issues on GitHub directly, but remember to copy-paste the output of sessionInfo().

**For users**, the easiest is to directly install the package from GitHub:
```
R> library(devtools); install_github("lacombe-vigne/rfcvquery")
```

In the case where the package is officially released as a "bundled package" (that is, as a tar.gz), you can install it directly from within R via:
```
R> install.packages("path/to/rfcvquery_<version>.tar.gz")
```

**For advanced users**, when retrieving the bundled package, you can install it from the command-line via:
```
$ R CMD INSTALL rfcvquery_<version>.tar.gz
```

Once the package is installed, start using it:
```
R> library(rfcvquery)
R> help(package=rfcvquery)
```

**For developpers**, when editing the content of this repo, increment the version of the package in DESCRIPTION and execute the following commands:
```
$ Rscript -e 'library(devtools); devtools::document()'
$ R CMD build rfcvquery
$ R CMD check rfcvquery_<version>.tar.gz
```
