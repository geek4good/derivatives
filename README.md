# Derivatives – a web service for mathematical differentiation of polynomials

## Overview

The web service has a single  route `/differentiate` that takes an arbitrary number of path segments (all integers) that represent the coefficients in a polynomial. The expoents are determined by the length of the polynomial and range from length of the polymonial minus 1 to 0. Please see the following example for illustration:

`GET /differentiate/4/3/2/1` would represent  4x^3^+3x^2^+2x+1

The return value of `/differenciate` is the derivative of the polymonial represented by the path. So, e.g., `GET /differentiate/4/3/2/1` would return 12x^2^+6x+2.

For more background and examples please see https://gist.github.com/afhammad/1e01deac73f25c665fd67ae6eb0c101e.



# Usage

To set up the project run `bundle install` in the root folder. Please note that you need at least Ruby version 2.2 to run the project.

The command `rackup` starts the web service, which will then listen on port 9292 by default. To test if everything's working as expected, point your web browser at `http://localhost:9292/differentiate/4/3/2/1`. You should see `12x^2+6x+2` as the return value.