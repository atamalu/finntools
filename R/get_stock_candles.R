#' @title retrieve stock candles data
#'
#' @description `get_stock_candles` retrieves candlestick data for U.S. stocks dating as far back as 25 years
#'
#' @param symbol the stock symbol to retrieve data for
#' @param resolution intervals for the data
#' @param from.date the first date/time to retrieve data for
#' @param to.date the last date/time to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param format the format of data to return (csv or json)
#' @param adjusted should adjusted data be returned?
#' @param translate.input.dates was the entered data in POSIXct format (YYYY-MM-DD hh:mm:ss timezone)?
#' @param translate.date should UNIX time be converted to standard date-time format?
#' @param write.file should the table be written to the "candles" folder?
#' @return a data frame of stock candles for given inputs
#' @examples
#' \donttest{
#' ### Get stock candles for Apple from last 5 hours, in 1-minute intervals
#' to.date <- as.numeric(.POSIXct(Sys.time()))
#' from.date <- to.date - (5*3600)
#'
#' get_stock_candles(symbol = 'AAPL', api.key = api.key,
#' resolution = 1, from.date = from.date, to.date = to.date)
#' }
#' @importFrom jsonlite fromJSON
#' @importFrom utils read.csv
#' @export

get_stock_candles <- function(symbol, resolution, from.date, to.date, api.key,
                              format = 'csv', adjusted = FALSE,
                              translate.input.dates = TRUE, translate.date = TRUE,
                              write.file = FALSE){

  ### adjust?
  if(adjusted == FALSE){
    adjusted = 'false'
  }
  if(adjusted == TRUE){
    adjusted = 'true'
  }

  ### translate dates to UNIX?
  if(translate.input.dates == TRUE){
    from.date = round(as.numeric(.POSIXct(from.date)), 0)
    to.date = round(as.numeric(.POSIXct(to.date)), 0)
  }

  resolution = as.character(resolution)

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/candle?symbol=%s&resolution=%s&from=%d&to=%s&format=%s&adjusted=%s&token=%s', symbol, resolution, from.date, to.date, format, adjusted, api.key)

  if(format == 'csv'){
    df <- read.csv(pg.url)

    # if no results
    if(nrow(df) == 0){
      ret = print('No results found for specified query.')
    }
    # if translate date
    if(translate.date == TRUE){
      df$t <- .POSIXct(df$t)
    }
    # if write file
    if(write.file == TRUE){
      write_finn_df(dataframe = df, symbol = symbol, folder.name = 'candles')
    }

    ret = df

  } else {
    ret <- fromJSON(pg.url)
    print('finntools does not support json file auto-formatting for this endpoint.')
  }

  return(ret)

}
