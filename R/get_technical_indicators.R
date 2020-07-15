#' @title retrieve technical indicator data
#'
#' @description `get_technical_indicators` retrieves technical indicator data for a given symbol
#'
#' @param symbol the stock symbol to retrieve data for
#' @param resolution intervals for the data
#' @param from.date the first date/time to retrieve data for
#' @param to.date the last date/time to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param indicator name of technical indicator (e.g. SMA, MACD, DX)
#' @param indicator.list list of indicator field parameters found on finnhub.io's documentation (arguments column)
#' @param translate.input.dates was the entered data in POSIXct format (YYYY-MM-DD hh:mm:ss timezone)?
#' @param translate.date should UNIX time be converted to standard date-time format?
#' @param write.file should the table be written to the "technical_indicators" folder?
#' @return a data frame of technical indicators for the given company
#' @examples
#' \donttest{
#' ### Get exponential moving average data for Apple over the past 5 hours with a resolution of 1-minute
#' to.date <- Sys.time()
#' from.date <- to.date - (5*3600)
#'
#' get_technical_indicators(symbol = 'AAPL', resolution = 1,
#' from.date = from.date, to.date = to.date, api.key = api.key,
#' indicator = 'EMA')
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_technical_indicators <- function(symbol, resolution, from.date, to.date, api.key,
                                     indicator = 'SMA', indicator.list = NA,
                                     translate.input.dates = TRUE, translate.date = TRUE,
                                     write.file = FALSE){

  ### translate dates to UNIX?
  if(translate.input.dates == TRUE){
    from.date = round(as.numeric(.POSIXct(from.date)), 0)
    to.date = round(as.numeric(.POSIXct(to.date)), 0)
  }

  ### coerce resolution to character
  resolution = as.character(resolution)

  ### was indicator or indicator field list used?
  if(is.na(indicator.list)){
    indicator = tolower(indicator)

    pg.url <- sprintf('https://finnhub.io/api/v1/indicator?symbol=%s&resolution=%s&from=%d&to=%d&indicator=%s&token=%s', symbol, resolution, from.date, to.date, indicator, api.key)

  } else {
    ### paste list items together
    indicator.params <- sapply(1:length(indicator.list), function(i){
      paste(names(indicator.list)[[i]], indicator.list[[i]], sep = '=')
    })
    indicator <- paste(indicator.params, collapse = '&')

    pg.url <- sprintf('https://finnhub.io/api/v1/indicator?symbol=%s&resolution=%s&from=%d&to=%d&%s&token=%s', symbol, resolution, from.date, to.date, indicator, api.key)
  }

  df <- fromJSON(pg.url)

  ### if data is retrieved okay
  if(df[['s']] == 'ok'){
    df <- df[-which(names(df) == 's')]
    df <- t(do.call(rbind, df))
    ret <- as.data.frame(df)

    if(translate.date == TRUE){
      ret$t <- .POSIXct(ret$t)
    }

    if(write.file == TRUE){
      write_finn_df(dataframe = ret, symbol = symbol, folder.name = 'technical_indicators')
    }

  ### if something goes wrong
  } else {
    ret = 'Error occurred while returning data.'
  }

  return(ret)

}
