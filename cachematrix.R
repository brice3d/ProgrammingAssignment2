## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function create a list of 4 objects
makeCacheMatrix <- function(x = matrix()) {
        m <- NULL # create m or overwrite m
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x # print x
        setinv <- function(solve) m <<- solve # function that calculate 
        # the inverse matrix and
        # save it in m
        getinv <- function() m ## function that print m
        list(set=set,get = get,
             setinv = setinv,
             getinv = getinv) ## creat the list of 4 objects
}


## Write a short comment describing this function
## This function calls and print m if it exists runs the function makeCacheMatrix
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getinv() # m becomes the function getinv() which calls m
        if(!is.null(m)) {
                message("getting cached data")
                return(m) # print m if m exists
        }
        data <- x$get() # if m=NULL inverse matrix has to be calculated
        m <- solve(data, ...)
        x$setinv(m)
        m # print m the inverse matrix of x
}
