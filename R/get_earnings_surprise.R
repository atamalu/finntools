#' @title retrieve historical quarterly earnings surprise
#'
#' @description `get_earnings_surprise` retrieves company historical quarterly earnings surprise dating back to 2000
#'
#' @param symbol the stock symbol to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param num.periods the number of periods to get data for; leave blank to get full history
#' @param write.file should the table be written to the "earnings_surprise" folder?
#' @return a data frame of actual earnings and estimates for the given company and time period
#' @examples
#' \donttest{
#' ### Get earnings surprises for the 4 most recent periods
#' get_earnings_surprise(symbol = 'AAPL', num.periods = 4, api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_earnings_surprise <- function(symbol, api.key, num.periods = 4, write.file = TRUE){

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/earnings?symbol=%s&limit=%d&token=%s', symbol, num.periods, api.key)

  df <- fromJSON(pg.url)
  df <- df[c('symbol', 'period', 'actual', 'estimate')] # reorder

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'earnings_surprise')
  }

  return(df)

}
