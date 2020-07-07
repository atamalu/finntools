#' @title writes finnhub dataframe to csv
#'
#' @description `write_finn_df` writes dataframe retrieved via finntools package to csv; mostly for internal use, as this is done by default
#'
#' @param dataframe a dataframe of data to write to file
#' @param symbol the stock symbol to write company news for
#' @param folder.name the name of the folder to write dataframe to
#' @return success or failure to write file message
#' @examples
#' \donttest{
#' ### Use get_company_news to retrieve dataframe
#' AAPL.news <- get_company_news(symbol = 'AAPL', api.key = api.key)
#'
#' ### Write data to .csv file
#' write_finn_df(dataframe = AAPL.news, symbol = "AAPL", folder.name = 'news')
#' }
#' @importFrom utils write.csv
#' @export

write_finn_df <- function(dataframe, symbol, folder.name){

  slash.folder.name <- paste0('/', folder.name)

  ### create new directory if one doesn't exist
  if(dir.exists(paste0(getwd(), slash.folder.name)) == FALSE){
    dir.create(folder.name)
  }

  file.name <- sprintf('./%s/%s_%s.csv', folder.name, symbol, folder.name)
  write.csv(dataframe, file.name)

  print.txt <- sprintf('Successfully wrote file at %s.', file.name)
  print(print.txt)

}
