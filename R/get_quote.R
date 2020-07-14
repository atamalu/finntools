#' @title retrieve real-time stock data
#'
#' @description `get_quote` retrieves real-time data for a given stock
#'
#' @param symbol the stock symbol to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param translate.date should UNIX time be converted to standard date-time format?
#' @param write.file should the table be written to the "quotes" folder?
#' @return a data frame of prices for current, open, close, high, and low, along with UNIX timestamp
#' @examples
#' \donttest{
#' ### Get real-time quote for Apple
#' get_quote(symbol = 'AAPL', api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_quote <- function(symbol, api.key, translate.date = TRUE, write.file = FALSE){

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/quote?symbol=%s&token=%s', symbol, api.key)

  df <- fromJSON(pg.url)
  df <- unlist(df)
  df <- as.data.frame(t(df))

  if(translate.date == TRUE){
    df$datetime <- .POSIXct(df$datetime)
  }
  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'quotes')
  }

  return(df)

}
