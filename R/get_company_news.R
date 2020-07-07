#' @title retrieve news about a company
#'
#' @description `get_company_news` retrieves news about a company for a given time range
#'
#' @param symbol the stock symbol to retrieve company news for
#' @param api.key your API token from finnhub.io
#' @param start.date the earliest date to get news for (YYYY-MM-DD)
#' @param end.date the latest date to get news for (YYYY-MM-DD)
#' @param last.n.days the range of days to get data for when startand end dates are NA (default)
#' @param translate.date should UNIX time be converted to standard date format?
#' @param write.file should a table of dates, headlines, sources, and urls be written to the "news" folder?
#' @return a data frame of dates, headlines, sources, and urls
#' @examples
#' \donttest{
#' ### Get news for Apple from the last 30 days
#' get_company_news(symbol = "AAPL", api.key = api.key, last.n.days = 30)
#'
#' ### Get news for Apple from March
#' get_company_news(symbol = "AAPL", api.key = api.key,
#' start.date = '2020-03-01', end.date = '2020-03-30')
#' }
#' @importFrom jsonlite fromJSON
#' @importFrom stringr str_split
#' @export

finn_get_company_news <- function(symbol, api.key,
                                  start.date = NA, end.date = NA,
                                  last.n.days = 180, translate.date = TRUE,
                                  write.file = TRUE){

  ### auto-adjust date params
  if(is.na(start.date) == TRUE | is.na(end.date) == TRUE){
    end.date = Sys.Date(); start.date = end.date - last.n.days
    print(sprintf('Retrieving last %d days of news for %s', last.n.days, symbol))
  } else {
    start.date = gsub('/', '-', start.date) ; end.date = gsub('/', '-', end.date)
    print(sprintf('Retrieving news for %s between %s and %s', symbol, start.date, end.date))
  }

  ### retrieve & remove duplicates
  pg.url <- sprintf('https://finnhub.io/api/v1/company-news?symbol=%s&from=%s&to=%s&token=%s', symbol, start.date, end.date, api.key)

  df <- fromJSON(pg.url)
  df <- df[!duplicated(df$headline),]

  df <- df[c('datetime', 'headline', 'source', 'url')]
  colnames(df)[1] <- 'date'

  print(sprintf('%d unique articles successfully retrieved.', nrow(df)))

  ### customizations
  if(translate.date == TRUE){
    df$date <- str_split(.POSIXct(df$date), ' ', n = 2, simplify = TRUE)[,1]
  }
  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = symbol, folder.name = 'news')
  }

  return(df)

}
