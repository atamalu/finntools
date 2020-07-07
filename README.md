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

#### Parameters

##### required

`symbol` the stock symbol to retrieve company news for `api.key` your
API token from finnhub.io `start.date`the earliest date to get news for
(YYYY-MM-DD) `end.date` the latest date to get news for (YYYY-MM-DD)
`last.n.days` the range of days to get data for \* ignore if using
start.date and end.date

##### optional

`translate.date` declares whether UNIX time should be convered to
YYYY-MM-DD date format `write.file` declares whether data should be
written to .csv file

#### Example

Let’s say we want to get the last 30 days of news for Apple.

``` r
get_company_news(symbol = 'AAPL', 
                 api.key = api.key,
                 last.n.days = 30)
```

Or we may want to get the last 30 days of news for Apple. Note: the API
limits the number of results, which could be an issue for larger
companies.

``` r
get_company_news(symbol = 'AAPL', 
                 api.key = api.key,
                 start.date = '2020-03-01', 
                 end.date = '2020-03-30')
```