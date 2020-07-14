#' @title run pattern recognition on a symbol
#'
#' @description `get_pattern_recognition` runs a pattern recognition algorithm on a given stock
#'
#' @param symbol the stock symbol to retrieve data for
#' @param resolution intervals for the data
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "patterns" folder?
#' @return a data frame of results from the pattern recognition algorithm
#' @examples
#' \donttest{
#' ### Run pattern recognition algorithm with resolution of 1 day for Apple
#' get_pattern_recognition(symbol = 'AAPL', resolution = 'D', api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_pattern_recognition <- function(symbol, resolution, api.key, write.file = TRUE){

  resolution = as.character(resolution)

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/scan/pattern?symbol=%s&resolution=%s&token=%s', symbol, resolution, api.key)

  df <- fromJSON(pg.url)
  df <- df[[1]]

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'patterns')
  }

  return(df)

}