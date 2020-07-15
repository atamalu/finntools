#' @title retrieve aggregate indicator data
#'
#' @description `get_aggregate_indicators` retrieves aggregate signal of multiple technical indicators (e.g. MACD, RSI, MA)
#'
#' @param symbol the stock symbol to retrieve data for
#' @param resolution intervals for the data
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "aggregate_indicators" folder?
#' @return a data frame of aggregate indicators and trends
#' @examples
#' \donttest{
#' ### Get support and resistance levels with resolution of 1 minute
#' get_aggregate_indicators(symbol = 'AAPL', resolution = 1,
#' api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_aggregate_indicators <- function(symbol, resolution, api.key,
                                     write.file = FALSE){

  resolution = as.character(resolution)

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/scan/technical-indicator?symbol=%s&resolution=%s&token=%s', symbol, resolution, api.key)

  df <- fromJSON(pg.url)
  df <- unlist(df)
  df <- as.data.frame(t(df))

  name.cols <- gsub('technicalAnalysis\\.', '', colnames(df))
  colnames(df) <- name.cols

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'aggregate_indicators')
  }

  return(df)

}

