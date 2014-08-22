# The purpose of these functions are to cache an inverse of a matrix, 
# instead of  computing it every time. Thus, the computational cost is 
# being cut down.

# makeCacheMatrix  creates a special "matrix" object that can cache its inverse.
# The function returns a list of setters and getters
makeCacheMatrix <- function(x = matrix()) {

	#initially, we don't have inversed matrices
    inv <- NULL
	
	# setter - the value of the original matrix
    set <- function(y) {
        x <<- y # we use <<- operator inside a function, to acccess the parent environment ( i.e. "x")
        inv <<- NULL
    }
	
	# getter - value of the original matrix
    get <- function() x
	
	# setter - value of inversed matrix
    setinverse <- function(inverse) inv <<- inverse
	
	# getter - value of inversed matrix
    getinverse <- function() inv
	
	#return value, as a last statement
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}


# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function assumes that the matrix is always invertible.
cacheSolve <- function(x, ...) {

	#first, check if we already have something cached
    inv <- x$getinverse()
	
	#If we have found cache, return it
    if(!is.null(inv)) {
        print("Get cached data.")
	    return(inv)
    }
	
	#If this is the first run, we don't use the cache
	print("No cache for the first run.")
	
	#put the original matrix into temp varibale data
    temp <- x$get()
		
	# compute the inverse matrix. solve () function returns this.
    inv <- solve(temp)
	
	#put the inversed matrix into the cache for the next call
    x$setinverse(inv)
	
	#return value, as a last statement
    inv 
}


