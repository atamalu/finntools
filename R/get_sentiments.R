#' @title retrieve sentiment analyses for a company
#'
#' @description `get_sentiments` retrieves sentiment analyses of recent articles for a given company
#'
#' @param symbol the stock symbol to retrieve sentiment analyses for
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "sentiments" folder?
#' @return a data frame of sentiment analysis information
#' @examples
#' \donttest{
#' ### Get recent sentiment analyses for Apple
#' get_sentiments(symbol = "AAPL", api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @importFrom rlist list.flatten
#' @export

get_sentiments <- function(symbol, api.key, write.file = TRUE){
  pg.url <- sprintf('https://finnhub.io/api/v1/news-sentiment?symbol=%s&token=%s', symbol, api.key)

  df <- fromJSON(pg.url)
  df <- list.flatten(df)

  df <- as.data.frame(df)

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'sentiments')
  }

  return(df)
}

