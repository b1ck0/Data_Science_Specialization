######################################################################
## Vasil Yordanov (b1ck0) 04.05.2017
######################################################################

## Function which defines the sub-functions ('methods') and attributes of the matrix 'object'

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL #initializing inverse matrix container
    
    set <- function(y){
        x <<- y
        m <<- NULL
    }
    
    get <- function() {
        x
    }
    
    setinv <- function(value){
        inv <<- value 
    } 
    
    getinv <- function(){
        inv
    }
    
    list(set=set,get=get,setinv=setinv,getinv=getinv)
    
}


## This is the main function which returns the inverse matrix. Either retrieves the already cached or calculates it again.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    inv <- x$getinv()
    
    if(!is.null(inv)){
        message("Inverse Already Calculated, Retrieving the Cached Data")
        return(inv)
    }
    
    data <- x$get()
    inv <- solve(data) 
    x$setinv(inv)
    inv
}