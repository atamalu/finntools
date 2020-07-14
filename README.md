finntools
=========

Finnhub.io offers a wide range of financial data at a price that the
average investor can afford. However, much of this information is more
useful to users in table format, rather than json. `finntools` helps
shorten the gap between data retrieval and usage in a way that provides
instant results for beginners and flexibility for more advanced users.
Functions will be updated over time. Current ones retrieve:

-   `get_company_news` news about a company within a given time period

-   `get_sentiments` sentimental analyses of recent articles about a
    company

-   `get_basic_financials` basic financial information about a company

-   `get_reported_financials` financial information reported by a
    company through filings

-   `get_company_filings` filings by a company

-   `get_recommendation_trends` recommendation trends for a given
    company

-   `get_company_peers` stocks with the same country and GICS
    sub-industry as the specified company

-   `get_target_price` the latest price target consensus for a given
    company

-   `get_earnings_surprise` company historical quarterly earnings
    surprise dating back to 2000

-   `get_stock_candles` candlestick data for U.S. stocks dating as far
    back as 25 years

-   `get_pattern_recognition` results of a pattern recognition algorithm
    on a given stock

-   `get_quote` real-time data for a given stock

-   `get_stock_splits` stock splits for a given symbol

-   `get_market_news` latest articles for overall market

-   `get_ipo_calendar` ipo calendar for overall market

Installation
------------

``` r
### Install from Github
require(devtools)
devtools::install_github('atamalu/finntools')
```

Functions
---------

### get\_company\_news

`get_company_news` retrieves news about a company for a given time range

#### Example

Let’s say we want to get the last 30 days of news for Apple.

``` r
get_company_news(symbol = 'AAPL', 
                 api.key = api.key,
                 last.n.days = 30)
```

Or we may want to get the last 30 days of news for Apple.

``` r
get_company_news(symbol = 'AAPL', 
                 api.key = api.key,
                 start.date = '2020-03-01', 
                 end.date = '2020-03-30')
```

Note: the API limits the number of results, which could be an issue for
larger companies.

### get\_sentiments

`get_sentiments` retrieves sentiment analyses of recent articles for a
given company

#### Example

If we wanted to get sentiment analyses for Apple, we would use

``` r
get_sentiments(symbol = "AAPL",
               api.key = api.key)
```

### get\_basic\_financials

`get_basic_financials` retrieves basic financial information for a given
company

#### Example

To get basic financial price data for Apple, we would enter:

``` r
get_basic_financials(symbol = "AAPL", 
                     api.key = api.key, 
                     metric.type = "price")
```

### get\_reported\_financials

`get_reported_financials` retrieves financial data through a company’s
filings

#### Example

To get annual reported financial data for Apple, we would enter:

``` r
get_reported_financials(symbol = "AAPL", 
                     api.key = api.key, 
                     frequency = "annual")
```

### get\_company\_filings

`get_company_filings` retrieves filings for a specified company or
identifier

#### Example

If we wanted filings for Apple between the beginning of January 2020 and
the end of March 2020, we’d do

``` r
get_company_filings(symbol = "AAPL", 
                    api.key = api.key,
                    start.date = '2020-01-01', 
                    end.date = '2020-03-31')
```

### get\_recommendation\_trends

`get_recommendation_trends` retrieves recommendation trends for a given
company

#### Example

If we wanted recommendation trends for Apple, we’d type

``` r
get_recommendation_trends(symbol = "AAPL", 
                          api.key = api.key)
```

### get\_company\_peers

`get_company_peers` retrieves a data frame of stocks with the same
country and GICS sub-industry as the specified symbol

#### Example

If we wanted to find companies that are similar to Apple, we’d use

``` r
get_company_peers(symbol = "AAPL", 
                  api.key = api.key)
```

### get\_target\_price

`get_target_price` retrieves the latest price target consensus for a
given stock symbol

#### Example

Let’s say that we want to get target prices for Apple

``` r
get_target_price(symbol = 'AAPL',
                 api.key = api.key)
```

### get\_earnings\_surprise

`get_earnings_surprise` retrieves company historical quarterly earnings
surprise dating back to 2000

#### Example

Let’s say that we want to get earnings surprises for Apple from the 4
most recent periods

``` r
get_earnings_surprise(symbol = 'AAPL', 
                      num.periods = 4, 
                      api.key = api.key)
```

### get\_market\_news

`get_market_news` retrieves latest news for a market in a given category

#### Example

To get the latest market news on mergers, we’d enter

``` r
get_market_news(category = "merger",
                api.key = api.key)
```

### get\_ipo\_calendar

`get_ipo_calendar` retrieves information on ipo’s for a given time
period

#### Example

Let’s say we want to get ipo’s from the last 30 days

``` r
get_ipo_calendar(api.key = api.key, last.n.days = 30)
```

Or we may want to get information on ipo’s from March of 2020

``` r
get_ipo_calendar(api.key = api.key, start.date = '2020-03-01', end.date = '2020-03-31')
```

### get\_stock\_candles

`get_stock_candles` retrieves candlestick data for U.S. stocks dating as
far back as 25 years

#### Example

If we wanted stock candles for Apple from the last hour in 1-minute
intervals, we’d enter

``` r
to.date <- as.numeric(.POSIXct(Sys.time()))
from.date <- to.date - 3600

get_stock_candles(symbol = 'AAPL', 
                  api.key = api.key,
                  from.date = from.date, 
                  to.date = to.date)
```

### get\_pattern\_recognition

`get_pattern_recognition` runs a pattern recognition algorithm on a
given stock

#### Example

To run a pattern recognition algorithm for Apple with resolution of 1
day

``` r
get_pattern_recognition(symbol = 'AAPL', 
                        resolution = 'D', 
                        api.key = api.key)
```

### get\_quote

`get_quote` retrieves real-time data for a given stock

#### Example

If we wanted a real-time quote for Apple, we’d enter

``` r
get_quote(symbol = 'AAPL', 
          api.key = api.key)
```

### get\_stock\_splits

`get_stock_splits` retrieves stock splits for a given symbol

#### Example

Let’s say we want to get stock splits for Apple for a 30-day time period

``` r
from.date = Sys.Date() - 20
to.date = Sys.Date() 

get_stock_splits(symbol = 'AAPL', 
                 from.date = from.date,
                 to.date = to.date,
                 api.key = api.key)
```
