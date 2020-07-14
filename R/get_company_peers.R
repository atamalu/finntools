#' @title retrieve stock tickers supported by Finnhub
#'
#' @description `get_company_peers` retrieves a list of stocks with the same country and GICS sub-industry as the specified symbol
#'
#' @param symbol the stock symbol to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "company_peers" folder?
#' @return a data frame of symbols for related companies
#' @examples
#' \donttest{
#' ### Get list of companies similar to Apple
#' get_company_peers(symbol = 'AAPL', api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_company_peers <- function(symbol, api.key, write.file = FALSE){

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/peers?symbol=%s&token=%s', symbol, api.key)

  df <- fromJSON(pg.url)
  df <- data.frame(symbol = rep(symbol, length(df) - 1),
                   related_symbol = df[2:length(df)])

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'company_peers')
  }

  return(df)

}