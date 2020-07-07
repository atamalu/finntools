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
<BR> <BR>
<details>
<summary>Parameters (expand)</summary> `symbol` the stock symbol to
retrieve company news for <BR> `api.key` your API token from finnhub.io
<BR> `start.date`the earliest date to get news for (YYYY-MM-DD) <BR>
`end.date` the latest date to get news for (YYYY-MM-DD) <BR>
`last.n.days` the range of days to get data for <BR> \* ignore if using
start.date and end.date <BR> `translate.date` declares whether UNIX time
should be convered to YYYY-MM-DD date format <BR> `write.file` declares
whether data should be written to .csv file
</details>

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
given company <BR> <BR>
<details>
<summary>Parameters (expand)</summary> `symbol` the stock symbol to
retrieve company news for <BR> `api.key` your API token from finnhub.io
<BR> `write.file` declares whether data should be written to .csv file
</details>

#### Example

If we wanted to get sentiment analyses for Apple, we would use

``` r
get_sentiments(symbol = "AAPL",
               api.key = api.key)
```

### get\_basic\_financials

`get_basic_financials` retrieves basic financial information for a given
company <BR> <BR>
<details>
<summary>Parameters (expand)</summary> `symbol` the stock symbol to
retrieve company news for <BR> `api.key` your API token from finnhub.io
<BR> `metric.type` the type of metric to retrieve data for <BR> \*
options include: “all”, “price”, “valuation”, “margin” <BR> `write.file`
declares whether data should be written to .csv file
</details>

#### Example

To get basic financial price data for Apple, we would enter:

``` r
get_basic_financials(symbol = "AAPL", 
                     api.key = api.key, 
                     metric.type = "price")
```

### get\_reported\_financials

`get_reported_financials` retrieves financial data through a company’s
filings <BR> <BR>
<details>
<summary>Parameters (expand)</summary> `symbol` the stock symbol to
retrieve company news for <BR> `api.key` your API token from finnhub.io
<BR> `frequency` the time period encompassed by the report(s) <BR> \*
options include: “annual”, “quarterly” <BR> `write.file` declares
whether data should be written to .csv file
</details>

#### Example

To get annual reported financial data for Apple, we would enter:

``` r
get_reported_financials(symbol = "AAPL", 
                     api.key = api.key, 
                     frequency = "annual")
```
