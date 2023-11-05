# Report

## Computational Mathematics

* Library
* User sets an acceptable error and a definite integral as a function in Haskell
* Implement 3 methods of calculating the definite integral
* Error handling
* Unit tests
* A console (or another user) interface where the user can set a definite integral and get an answer, without coding in Haskell
* Property-based testing

## How it Works

The library provides two functions: a function that returns the obtained value based on the number of steps, and a function that returns the value based on the acceptable error. Three methods of integration are implemented: linear approximation, the method of average rectangles, and parabolic approximation.

A console application is implemented, in which the user specifies the function, boundaries, method, and error, and receives the value of the integral.

## Testing

Several unit tests and property-based testing (Hedgehog library) have been implemented.
