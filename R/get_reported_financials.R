#' @title retrieve reported financial data
#'
#' @description `get_reported_financials` retrieves financial data through a company's filings
#'
#' @param symbol the stock symbol to retrieve data for
#' @param api.key your API token from finnhub.io
#' @param frequency the time period encompassed by the report(s)
#' @param write.file should the table be written to the "reported_financials" folder?
#' @return a data frame of reported financial information for the specified company
#' @examples
#' \donttest{
#' ### Get financial report data for Apple
#' get_reported_financials(symbol = "AAPL", api.key = api.key, frequency = c("annual", "quarterly"))
#' }
#' @importFrom jsonlite fromJSON
#' @importFrom data.table rbindlist
#' @export

get_reported_financials <- function(symbol, api.key, frequency = 'annual', write.file = FALSE){
  pg.url <- sprintf('https://finnhub.io/api/v1/stock/financials-reported?symbol=%s&freq=%s&token=%s', symbol, frequency, api.key)

  df <- fromJSON(pg.url, flatten = TRUE)
  df <- df[['data']]

  #############################################################
  ############### Function to apply across rows ###############
  ############### ----------------------------- ###############
  .format_reported_financial_row <- function(overall.df, row.num){

    ##### Check if variables exist
    ### does report.bs exist?
    if('report.bs' %in% names(overall.df)){
      report.bs <- rbindlist(overall.df[row.num,][['report.bs']], fill = TRUE)
      report.bs$reportType <- 'bs'
    } else {
      report.bs <- NA
    }
    ### does report.cf exist?
    if('report.cf' %in% names(overall.df)){
      report.cf <- rbindlist(overall.df[row.num,][['report.cf']], fill = TRUE)
      report.cf$reportType <- 'cf'
    } else {
      report.cf <- NA
    }
    ### does report.ic exist?
    if('report.ic' %in% names(overall.df)){
      report.ic <- rbindlist(overall.df[row.num,][['report.ic']], fill = TRUE)
      report.ic$reportType <- 'ic'
    } else {
      report.ic <- NA
    }

    df <- rbindlist(list(report.bs, report.cf, report.ic), fill = TRUE)
    return(df)
  }
  ############### ----------------------------- ###############
  #############################################################

  if(length(df) == 0){
    ret = print('No results for the given selection.')
    write.file = FALSE
  } else{
    big.list <- lapply(1:nrow(df), function(i){
      row.df <- .format_reported_financial_row(overall.df = df, row.num = i)
      row.df$year <- df$year[i]
      row.df$quarter <- df$quarter[i]
      row.df$form <- df$form[i]
      row.df$filedDate <- str_split(df$filedDate[i], ' ', n = 2, simplify = TRUE)[1]

      row.df <- row.df[,c('year', 'quarter', 'reportType', 'form', 'filedDate', 'label', 'value', 'unit')]
      return(row.df)
    })

    ret = rbindlist(big.list)

  }

  if(write.file == TRUE){
    write_finn_df(dataframe = ret, symbol = symbol, folder.name = 'reported_financials')
  }

  return(ret)

}
