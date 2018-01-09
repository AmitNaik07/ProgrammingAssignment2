## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## makeCacheMatrix creates a matrix object that can cache its inverse
makeCacheMatrix <- function(x = matrix()) {
  m <-NULL
  set <-function(y){
    x <<-y
    m <<-NULL
  }
  get <-function(){
    x
  }
  setInverse <-function(inverse){
    i <<-inverse
  }
  getInverse <-function() {
    m
  }
  list(set = set, get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function
## This computes the inverse of the matrix returned by makeCacheMatrix.
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <-x$getInverse()
  if(!is.null(m)){
    message("Getting cached data")
    return(m)
  }
  data <-x$get()
  m <-inverse(data,...)
  x$setInverse(m)
  m
}
