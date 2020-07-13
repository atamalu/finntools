#' @title retrieve latest price target consensus
#'
#' @description `get_target_price` retrieves the latest price target consensus for a given stock symbol
#'
#' @param symbol the stock symbol to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "target_price" folder?
#' @return a data frame of target prices based on the latest consensus
#' @examples
#' \donttest{
#' ### Get target prices for Apple
#' get_target_price(symbol = 'AAPL', api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @importFrom dplyr select
#' @export

get_target_price <- function(symbol, api.key, write.file = TRUE){

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/price-target?symbol=%s&token=%s', symbol, api.key)

  df <- fromJSON(pg.url)
  df <- as.data.frame(t(unlist(df)))
  df <- select(df, -symbol)

  df <- cbind(symbol = symbol, df, stringsAsFactors = FALSE)

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'target_price')
  }

  return(df)

}
