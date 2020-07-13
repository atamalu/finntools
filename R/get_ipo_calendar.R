#' @title retrieve ipo calendar
#'
#' @description `get_ipo_calendar` retrieves information on ipo's for a given time period
#'
#' @param api.key your API token from finnhub.io
#' @param last.n.days the range of days to get data for when start and end dates are NA (default)
#' @param start.date the earliest date to get news for (YYYY-MM-DD)
#' @param end.date the latest date to get news for (YYYY-MM-DD)
#' @param write.file should the table be written to the "ipo_calendar" folder?
#' @return a data frame of data on ipo dates
#' @examples
#' \donttest{
#' ### Get ipo's from the last 30 days
#' get_ipo_calendar(api.key = api.key, last.n.days = 30)
#'
#' ### Get ipo's from March of 2020
#' get_ipo_calendar(api.key = api.key, start.date = '2020-03-01', end.date = '2020-03-31')
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_ipo_calendar <- function(api.key, last.n.days = 180, start.date = NA, end.date = NA, write.file = TRUE){

  if(is.na(start.date) == TRUE | is.na(end.date) == TRUE){
    end.date = Sys.Date(); start.date = end.date - last.n.days
    print(sprintf('Retrieving ipo calendar for last %d days', last.n.days))
  } else {
    start.date = gsub('/', '-', start.date) ; end.date = gsub('/', '-', end.date)
    print(sprintf('Retrieving ipo calendar for companies between %s and %s', start.date, end.date))
  }

  ### get data
  pg.url <- sprintf('https://finnhub.io/api/v1/calendar/ipo?from=%s&to=%s&token=%s', start.date, end.date, api.key)
  df <- fromJSON(pg.url)

  df <- df[[1]]

  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = 'ipo', folder.name = 'ipo_calendar')
  }

  return(df)
}