#' @title retrieve basic financial data
#'
#' @description `get_basic_financials` retrieves basic financial information for a given company
#'
#' @param symbol the stock symbol to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param metric.type the type of metric to retrieve data for
#' @param write.file should the table be written to the "basic_financials" folder?
#' @return a data frame of basic financial information for the specified company
#' @examples
#' \donttest{
#' ### Get basic financial price data for Apple
#' ### options: 'all', 'price', 'valuation', 'margin'
#' get_basic_financials(symbol = "AAPL", api.key = api.key,
#' metric.type = c("all", "price", "valuation", "margin"))
#' }
#' @importFrom jsonlite fromJSON
#' @importFrom rlist list.clean
#' @export

get_basic_financials <- function(symbol, api.key, metric.type = 'all', write.file = TRUE){
  ### get data
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/metric?symbol=%s&metric=%s&token=%s', symbol, metric.type, api.key)
  df <- fromJSON(pg.url)

  ### format list to dataframe
  df <- list.clean(df[['metric']])
  df <- as.data.frame(df)

  df <- cbind(symbol = symbol, df) # add symbol column as 1st col

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'basic_financials')
  }

  return(df)
}
