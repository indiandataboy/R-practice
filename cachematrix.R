## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#returns a list of functions (set, get, setinverse, getinverse for caching)
makeCacheMatrix <- function(x = matrix()) 
{
    inverse<-NULL
    set<-function(y)
    {
        x<<-y
        inverse<<-NULL
    }
    get<-function() x
    setinverse<-function(inverse) inverse<<-inverse
    getinverse<-function() inverse
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)
}

## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) 
{
        
  inverse=x$getinverse()
  if(!is.null(inverse))
  {
    print("Retrieving inverse from cache")
    return(inverse)
  }
  inverse=solve(x$get(), ...)
  x$setinverse(inverse)
  inverse
}

