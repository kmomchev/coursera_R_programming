
x <- rbind(c(1, 2), c(3, 4))
m <- makeCacheMatrix(x)

#Output the original matrix
m$get()

cacheSolve(m)
## [1] "No cache for the first run."
##     [,1] [,2]
## [1,] -2.0  1.0
## [2,]  1.5 -0.5

cacheSolve(m)
## [1] "Get cached data."
##     [,1] [,2]
## [1,] -2.0  1.0
## [2,]  1.5 -0.5