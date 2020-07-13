#' @title retrieve recommendation trends
#'
#' @description `get_recommendation_trends` retrieves recommendation trends for a given company
#'
#' @param symbol the stock symbol to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "recommendation_trends" folder?
#' @return a data frame of recommendation trends for the specified company
#' @examples
#' \donttest{
#' ### Get recommendation trends for Apple
#' get_recommendation_trends(symbol = "AAPL", api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_recommendation_trends <- function(symbol, api.key, write.file = TRUE){
  ### get data
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/recommendation?symbol=%s&token=%s', symbol, api.key)
  df <- fromJSON(pg.url)

  df <- cbind(symbol = df$symbol, df[1:length(df) - 1])

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'recommendation_trends')
  }

  return(df)
}
