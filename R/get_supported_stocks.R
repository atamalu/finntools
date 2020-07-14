#' @title retrieve stock tickers supported by Finnhub
#'
#' @description `get_supported_stocks` retrieves a list of stocks that are usable with Finnhub's API
#'
#' @param exchange the exchange to get list of symbols from
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the current working directory?
#' @return a data frame of symbols, full company names, and descriptions
#' @examples
#' \donttest{
#' ### Get list of supported stock symbols
#' get_stock_list(exchange = 'US', api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_supported_stocks <- function(exchange, api.key, write.file = FALSE){

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/symbol?exchange=%s&token=%s', exchange, api.key)

  df <- fromJSON(pg.url)
  df <- df[!duplicated(df$headline),]

  if(write.file == TRUE){
    write.csv(df, './supported_stocks.csv')
  }

  return(df)

}