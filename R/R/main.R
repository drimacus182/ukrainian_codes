library(dplyr)
library(purrr)
library(stringr)

check.edrpou <- function(str.v) {
  weights.outer.1 <- c(1,2,3,4,5,6,7)
  weights.inner.1 <- c(7,1,2,3,4,5,6)
  weights.outer.2 <- c(3,4,5,6,7,8,9)
  weights.inner.2 <- c(9,3,4,5,6,7,8)
  
  na <- is.na(str.v)
  regx.test.v <- ifelse(na, FALSE, str_detect(str.v, '^\\d{8}$'))
  
  res <- map2_lgl(str.v, regx.test.v, function(str, regx.test){
    if (!regx.test) return(FALSE)
    
    code = (str %>% str_split(''))[[1]] %>% as.integer()
    code7 = code[1:7]
    last = code[8]
    
    if (str < "30000000" | str > "60000000") {
      weights = weights.outer.1
    } else if (str > "30000000" & str < "60000000") {
      weights = weights.inner.1
    } else message("Error: This aint gonna happen")
    
    summ <- sum(code7 * weights)
    remainder = summ %% 11
    
    if (remainder < 10) return(remainder == last)
    
    #
    
    if (str < "30000000" | str > "60000000") {
      weights = weights.outer.2
    } else if (str > "30000000" & str < "60000000") {
      weights = weights.inner.2
    } else message("Error: This aint gonna happen")
    
    summ = sum(code7 * weights)
    remainder = (summ %% 11) %% 10
                 
    return(remainder == last)
  })
  
  return(res)
}

check.ipn <- function(str) {
  
  
  
  
  
  
  
  print('Not implemented')
  return(FALSE)
}