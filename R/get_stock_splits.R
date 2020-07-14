#' @title retrieve stock splits
#'
#' @description `get_stock_splits` retrieves stock splits for a given symbol
#'
#' @param symbol the stock symbol to retrieve data for
#' @param from.date the first date to retrieve data for (YYYY-MM-DD)
#' @param to.date the last date to retrieve data for (YYYY-MM-DD)
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "splits" folder?
#' @return a data frame of stock splits
#' @examples
#' \donttest{
#' ### Get last 10 years of stock splits for Apple
#' from.date = '2010-01-01'
#' to.date = '2020-01-01'
#'
#' get_stock_splits(symbol = 'AAPL', from.date = from.date,
#' to.date = to.date, api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_stock_splits <- function(symbol, from.date, to.date, api.key, write.file = FALSE){

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/split?symbol=%s&from=%s&to=%s&token=%s', symbol, from.date, to.date, api.key)

  df <- fromJSON(pg.url)
  df <- unlist(df)

  if(length(df) == 0){
    ret = print('No results for specified parameters.')
  } else{
    df <- as.data.frame(t(df))

    if(write.file == TRUE){
      write_finn_df(dataframe = df, symbol = symbol, folder.name = 'splits')
    }
    ret = df
  }

  return(ret)

}
