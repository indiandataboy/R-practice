## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
#returns a list of functions (set, get, setinverse, getinverse for caching)
makeCacheMatrix <- function(x = matrix()) 
{
    inverse<-NULL#initially, the matrix inverse hasn't been calculated
    set<-function(y)
    {
        x<<-y#set the matrix
        inverse<<-NULL
    }
    get<-function() x #return matrix
    setinverse<-function(inverse) inverse<<-inverse #set the inverse
    getinverse<-function() inverse#return inverse
    list(set=set, get=get, setinverse=setinverse, getinverse=getinverse)#create a list of functions
    #functions are set, get matrices, and set and get inverses
}

## Write a short comment describing this function
## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) 
{
        
  inverse=x$getinverse()#get inverse
  if(!is.null(inverse))#if inverse has been calculated
  {
    print("Retrieving inverse from cache")
    return(inverse)#return it from cache
  }
  inverse<-solve(x$get(), ...)#otherwise, calculate inverse
  x$setinverse(inverse)#set inverse in cache
  inverse#return inverse
}

