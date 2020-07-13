#' @title retrieve filings for a company
#'
#' @description `get_company_filings` retrieves filings for a specified company or identifier
#'
#' @param symbol the stock symbol to retrieve company news for
#' @param cik the central index key to retrieve company filings for
#' @param access.number the access number to retrieve company filings for
#' @param form filter by type of filing form
#' @param api.key your API token from finnhub.io
#' @param last.n.days the range of days to get data for when start and end dates are NA (default)
#' @param start.date the earliest date to get news for (YYYY-MM-DD)
#' @param end.date the latest date to get news for (YYYY-MM-DD)
#' @param write.file should the table be written to the "filings" folder?
#' @return a data frame of information on a company's filings
#' @examples
#' \donttest{
#' ### Get filings for Apple between the start of January 2020 and end of March 2020
#' get_company_filings(symbol = "AAPL", api.key = api.key,
#' start.date = '2020-01-01', end.date = '2020-03-31')
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_company_filings <- function(symbol = '', cik = '', access.number = '', form = '',
                             api.key,
                             last.n.days = 180,
                             start.date = NA, end.date = NA,
                             write.file = TRUE){

  if(nchar(symbol) == 0 & nchar(cik) == 0 & nchar(access.number) == 0){
    ret <- print('Please enter a symbol, cik, or access number.')
  } else {
    ### auto-adjust date params
    if(is.na(start.date) == TRUE | is.na(end.date) == TRUE){
      end.date = Sys.Date(); start.date = end.date - last.n.days
      print(sprintf('Retrieving last %d days of filings for %s', last.n.days, symbol))
    } else {
      start.date = gsub('/', '-', start.date) ; end.date = gsub('/', '-', end.date)
      print(sprintf('Retrieving news for %s between %s and %s', symbol, start.date, end.date))
    }

    ### retrieve & remove duplicates
    pg.url <- sprintf('https://finnhub.io/api/v1/stock/filings?symbol=%s&cik=%s&accessNumber=%s&form=%s&from=%s&to=%s&token=%s', symbol, cik, access.number, form, start.date, end.date, api.key)

    df <- fromJSON(pg.url)

    if(length(df) == 0){
      ret <- print('No results using the specified parameters.')
    } else {
      ret <- df

      ### customizations
      if(write.file == TRUE){
        write_finn_df(dataframe = ret, symbol = ret$symbol, folder.name = 'filings')
      }

    }
  }


  return(ret)

}