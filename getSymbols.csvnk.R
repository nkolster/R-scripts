getSymbols.csvnk <- function (Symbols, env = parent.frame()) 
{
  #  auto.assign <- TRUE
   for (i in 1:length(Symbols)) {
    sym.file <- paste(Symbols[[i]], "csv", sep = ".")
     cat(sym.file)

    if (!file.exists(sym.file)) {
      cat("\nfile ", paste(Symbols[[i]], "csv", sep = "."), 
          " does not exist ", "in ", dir, "....skipping\n")
      next
    }
    
  #  fr <- read.csv(sym.file)
  try({  fr <- as.xts(read.zoo(sym.file, sep=",", header=T, format = "%Y-%m-%d %H:%M:%S", FUN=as.POSIXct))
      cat("done.\n") })
 #     colnames(fr) <- paste(toupper(gsub("\\^", "", Symbols[[i]])), c("Open", "High", "Low", "Close", "Volume", "Adjusted"), sep = ".")
   # fr <- convert.time.series(fr = fr, return.class = return.class)
 #   Symbols[[i]] <- toupper(gsub("\\^", "", Symbols[[i]]))
   # if (auto.assign) 
      assign(Symbols[[i]], fr, env)
  }
 # if (auto.assign) 
    return(Symbols)
  return(fr)
}
