timer <- function(timed)
{
  ltime <- system.time(timed)[3]
  
  mintime <- allreduce(ltime, op='min')
  maxtime <- allreduce(ltime, op='max')
  
  meantime <- allreduce(ltime, op='sum') / comm.size()
  
  return( c(min=mintime, mean=meantime, max=maxtime) )
}
