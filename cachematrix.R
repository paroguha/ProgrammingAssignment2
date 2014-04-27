## This is the R script for Assignment2. 
## This script writes a pair of functions that caches the inverse of a matrix.


## The first function "makeCacheMatrix" creates a special "matrix" object that can cache its inverse.
## INPUT: A matrix
## OUTPUT: A "matrix" object that stores the original matrix and allows 
##         us to "get" this matrix as well as "set" and "get" the inverse.


## Create a "matrix" object which is able to cache inverse
makeCacheMatrix <- function(x = matrix()) {
m <- NULL
    
  # set the value of the matrix 
set <- function(y) {
x <<- y
m <<- NULL

}

  # get the value of the matrix
get <- function() x

  # set the value of the inverse matrix
setinv <- function(inv) m <<- inv
  
  # get the value of the inverse matrix
getinv <- function() m
  
  # Return the inverse of the above matrix
list(set = set, 
       get = get,
       setinv = setinv,
       getinv = getinv)
}



## This function calculates the inverse matrix of the object created with makeCacheMatrix
## INPUT: A "cache" matrix object created by makeCacheMatrix
## OUTPUT: Computes the inverse of the matrix and stores the result 
##         ( if it does not already exist)


## Calculate the inverse matrix of makeCacheMatrix
cacheSolve <- function(x, ...) {
  
   # get the cached inverse matrix and stores in x
m <- x$getinv()
    
   # if the cached inverse matrix is not null, return the cached value
if(!is.null(m)) {
message("Getting cached data")
return(m)

}
  
   # otherwise, get the matrix
data <- x$get()
  
   # and compute the inverse matirx 
m <- solve(data, ...)
  
   # store the inverse matrix in the cache
x$setinv(m)
  
   # return the inverse matrix
m
}
