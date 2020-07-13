#' @title retrieve latest market news
#'
#' @description `get_market_news` gets the latest market news for a given category
#'
#' @param category the category of news to retrieve
#' @param api.key your API token from finnhub.io
#' @param minid only get news after a specific id
#' @param translate.date should UNIX time be converted to standard date-time format?
#' @param write.file should the table be written to the "news" folder?
#' @return a data frame of recent news articles for the user-specified category
#' @examples
#' \donttest{
#' ### Get recent market news data
#' get_market_news(category = c("all", "general", "forex", "crypto", "merger"),
#' api.key = api.key)
#' }
#' @importFrom jsonlite fromJSON
#' @export

get_market_news <- function(category, api.key, minid = 0, translate.date = TRUE, write.file = TRUE){
  category <- tolower(category)
  supported.categories <- c('general', 'forex', 'crypto', 'merger')

  if(category %in% supported.categories){
    ### get category data
    pg.url <- sprintf('https://finnhub.io/api/v1/news?category=%s&token=%s&minid=%d', category, api.key, minid)
    df <- fromJSON(pg.url)
    ### if user wants all categories
  } else {
    tmp.list <- lapply(supported.categories, function(x){
      pg.url <- sprintf('https://finnhub.io/api/v1/news?category=%s&token=%s&minid=%d', x, api.key, minid)
      Sys.sleep(0.5)
      fromJSON(pg.url)
    })
    df <- do.call(rbind, tmp.list)
  }

  ### format list to dataframe
  df <- df[c('category', 'datetime', 'headline', 'id', 'source', 'summary', 'url')]

  if(translate.date == TRUE){
    df$datetime <- .POSIXct(df$datetime)
  }
  if(write.file == TRUE){
    write_finn_df(dataframe = df, symbol = paste0(gsub('-', '_', Sys.Date()), '_', 'market'), folder.name = 'news')
  }

  return(df)
}
