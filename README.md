# Kpax3 - Bayesian bi-clustering of categorical data
[![Build Status](https://travis-ci.org/albertopessia/Kpax3.jl.svg?branch=master)](https://travis-ci.org/albertopessia/Kpax3.jl) [![Coverage](https://codecov.io/gh/albertopessia/Kpax3.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/albertopessia/Kpax3.jl)

## About
Kpax3 is a [Julia](http://julialang.org/) package for inferring the group structure of genetic sequences. In general, any multivariate categorical dataset (such as presence/absence data) can be analyzed by Kpax3. Output consists of a clustering of both the rows (statistical units) and columns (statistical variables) of the provided data matrix. It is an improved version of [K-Pax2](https://github.com/albertopessia/kpax2/), providing an MCMC algorithm for a proper Bayesian approach and a genetic algorithm for MAP estimation.

## Reference
To know more about the underlying statistical model, refer to the following publications (the first is the primary citation if you use the package):

Pessia, A. and Corander, J. (2017). Kpax3: Bayesian bi-clustering of large sequence datasets. _Submitted_

Pessia, A., Grad, Y., Cobey, S., Puranen, J. S., and Corander, J. (2015) K-Pax2: Bayesian identification of cluster-defining amino acid positions in large sequence datasets. _Microbial Genomics_ **1**(1). doi: [10.1099/mgen.0.000025](http://doi.org/10.1099/mgen.0.000025)

## Installation
Kpax3 can be installed from within julia by typing

```julia
Pkg.add("Kpax3")
```

## Usage
The best way to learn how to use Kpax3 is by following the instructions in the [fasta tutorial](tutorial/Kpax3_fasta_tutorial.jl) (for genetic sequences) or in the [csv tutorial](tutorial/Kpax3_csv_tutorial.jl) (for general categorical data). Full documentation of Kpax3 functions will be available in the near future.

## License
See [LICENSE.md](LICENSE.md)
