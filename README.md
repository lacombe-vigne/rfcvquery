# Package "rfcvquery"

This directory contains the `rfcvquery` package for the [R](https://en.wikipedia.org/wiki/R_(programming_language)) software environment.
This package helps querying the database of the collections from the French Network of Grapevine Repositories ([RFCV](https://bioweb.supagro.inra.fr/collections_vigne/Home.php?l=EN)).

The `rfcvquery` package is available under a free software license, the [GNU Affero General Public License](https://www.gnu.org/licenses/agpl.html) (version 3 or later).
See the COPYING file for details.
The copyright is owned by the [INRA](http://www.inra.fr/).
The coordinators are Timothée Flutre and Thierry Lacombe.

The content of this directory is versioned using [git](https://en.wikipedia.org/wiki/Git_(software)), the central repository being hosted on [GitHub](https://github.com/lacombe-vigne/rfcvquery).


## Installation

To install the `rfcvquery` package, the easiest is to install it directly from GitHub.
Open an R session and run the following commands:

```
library(devtools)
install_github("lacombe-vigne/rfcvquery")
```

Once this is done, the `rfcvquery` package should be available on your computer.


## Usage

Once the `rfcvquery` package is installed on your computer, it can be loaded into a R session:

```
library(rfcvquery)
help(package="rfcvquery")
```


## Issues

When encountering a problem with the package, you can report issues on GitHub directly ([here](https://github.com/lacombe-vigne/rfcvquery/issues)).
Remember to copy-paste the output of `sessionInfo()` to help efficiently diagnose the problem and find a solution.


## Contributing

You can contribute in various ways:


* report an issue (online, see above section);

* suggest improvements (in the same way as issues);

* propose a [pull request](https://github.com/lacombe-vigne/rfcvquery/pulls) (after creating a new [branch](https://www.git-scm.com/book/en/v2/Git-Branching-Branches-in-a-Nutshell)).
