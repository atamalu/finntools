#' @title retrieve support and resistance data
#'
#' @description `get_support_resistance` retrieves support and resistance levels for a given company
#'
#' @param symbol the stock symbol to retrieve data for
#' @param resolution intervals for the data
#' @param api.key your API token from finnhub.io
#' @param write.file should the table be written to the "support_resistance" folder?
#' @return an array of support and resistance levels
#' @examples
#' \donttest{
#' ### Get support and resistance levels with resolution of 1 minute
#' get_support_resistance(symbol = 'AAPL', resolution = 1,
#' api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_support_resistance <- function(symbol, resolution, api.key,
                              write.file = FALSE){

  resolution = as.character(resolution)

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/scan/support-resistance?symbol=%s&resolution=%s&token=%s', symbol, resolution, api.key)

  df <- fromJSON(pg.url)
  df <- unlist(df)

  df <- as.data.frame(t(df))

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'support_resistance')
  }

  return(df)

}