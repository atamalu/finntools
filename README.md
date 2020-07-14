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

``` r
library(finntools)
```

Functions
---------

### get\_company\_news

`get_company_news` retrieves news about a company for a given time range

#### Example

Let’s say we want to get the last 30 days of news for Apple

``` r
get_company_news(symbol = 'AAPL', 
                 api.key = api.key,
                 last.n.days = 30) %>%
  head() %>%
  kable()
#> [1] "Retrieving last 30 days of news for AAPL"
#> [1] "172 unique articles successfully retrieved."
```

<table>
<thead>
<tr>
<th style="text-align:left;">
</th>
<th style="text-align:left;">
date
</th>
<th style="text-align:left;">
headline
</th>
<th style="text-align:left;">
source
</th>
<th style="text-align:left;">
url
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
2020-07-14
</td>
<td style="text-align:left;">
Dow Jones Futures Rise On Moderna Coronavirus Vaccine News After Stock
Market Rally, Apple, Tesla Rise, UnitedHealth, Goldman, ASML Earnings On
Tap
</td>
<td style="text-align:left;">
Yahoo
</td>
<td style="text-align:left;">
<a href="https://finance.yahoo.com/m/1895c7b8-d2b5-32c2-9057-856442438c38/dow-jones-futures-rise-on.html" class="uri">https://finance.yahoo.com/m/1895c7b8-d2b5-32c2-9057-856442438c38/dow-jones-futures-rise-on.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
2
</td>
<td style="text-align:left;">
2020-07-14
</td>
<td style="text-align:left;">
iPhone 12 might come with braided Lightning-to-USB-C cable
</td>
<td style="text-align:left;">
<a href="https://www.cultofmac.com" class="uri">https://www.cultofmac.com</a>
</td>
<td style="text-align:left;">
<a href="https://www.cultofmac.com/717233/iphone-12-braided-lightning-to-usb-c-cable-rumor/" class="uri">https://www.cultofmac.com/717233/iphone-12-braided-lightning-to-usb-c-cable-rumor/</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
3
</td>
<td style="text-align:left;">
2020-07-14
</td>
<td style="text-align:left;">
NBC’s video service Peacock stresses ‘free,’ looks to 2021
</td>
<td style="text-align:left;">
abcnews
</td>
<td style="text-align:left;">
<a href="https://abcnews.go.com/Business/wireStory/nbcs-video-service-peacock-stresses-free-2021-71784553" class="uri">https://abcnews.go.com/Business/wireStory/nbcs-video-service-peacock-stresses-free-2021-71784553</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
5
</td>
<td style="text-align:left;">
2020-07-14
</td>
<td style="text-align:left;">
Can’t schedule Dark Mode or Night Shift on iPhone and iPad? Here’s a fix
</td>
<td style="text-align:left;">
<a href="https://www.cultofmac.com" class="uri">https://www.cultofmac.com</a>
</td>
<td style="text-align:left;">
<a href="https://www.cultofmac.com/717221/schedule-dark-mode-night-shift-iphone-ipad-fix/" class="uri">https://www.cultofmac.com/717221/schedule-dark-mode-night-shift-iphone-ipad-fix/</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
6
</td>
<td style="text-align:left;">
2020-07-14
</td>
<td style="text-align:left;">
GLOBAL MARKETS-Stocks rebound on cyclical surge, gold edges higher
</td>
<td style="text-align:left;">
Yahoo
</td>
<td style="text-align:left;">
<a href="https://finance.yahoo.com/news/global-markets-stocks-rebound-cyclical-202127650.html" class="uri">https://finance.yahoo.com/news/global-markets-stocks-rebound-cyclical-202127650.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
7
</td>
<td style="text-align:left;">
2020-07-14
</td>
<td style="text-align:left;">
Google Promises the EU It Won’t Use Fitbit Health Data to Target Ads
</td>
<td style="text-align:left;">
barrons
</td>
<td style="text-align:left;">
<a href="https://www.barrons.com/articles/google-promises-the-eu-it-wont-use-fitbit-health-data-to-target-ads-51594755518" class="uri">https://www.barrons.com/articles/google-promises-the-eu-it-wont-use-fitbit-health-data-to-target-ads-51594755518</a>
</td>
</tr>
</tbody>
</table>

Or we may want to get news for Apple from March of 2020

``` r
get_company_news(symbol = 'AAPL', 
                 api.key = api.key,
                 start.date = '2020-03-01', 
                 end.date = '2020-03-30') %>%
  head() %>%
  kable()
#> [1] "Retrieving news for AAPL between 2020-03-01 and 2020-03-30"
#> [1] "157 unique articles successfully retrieved."
```

<table>
<thead>
<tr>
<th style="text-align:left;">
date
</th>
<th style="text-align:left;">
headline
</th>
<th style="text-align:left;">
source
</th>
<th style="text-align:left;">
url
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
2020-03-30
</td>
<td style="text-align:left;">
The iPhone buying conundrum: Outlook hazy
</td>
<td style="text-align:left;">
<a href="https://www.macworld.com" class="uri">https://www.macworld.com</a>
</td>
<td style="text-align:left;">
<a href="https://www.macworld.com/article/3535170/the-iphone-buying-conundrum-outlook-hazy.html" class="uri">https://www.macworld.com/article/3535170/the-iphone-buying-conundrum-outlook-hazy.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-30
</td>
<td style="text-align:left;">
MacBook Air (2020) review: More bang for your buck
</td>
<td style="text-align:left;">
<a href="https://www.macworld.com" class="uri">https://www.macworld.com</a>
</td>
<td style="text-align:left;">
<a href="https://www.macworld.com/article/3535129/macbook-air-2020-review.html" class="uri">https://www.macworld.com/article/3535129/macbook-air-2020-review.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-30
</td>
<td style="text-align:left;">
Apple acquires Dark Sky weather app
</td>
<td style="text-align:left;">
<a href="https://www.macworld.com" class="uri">https://www.macworld.com</a>
</td>
<td style="text-align:left;">
<a href="https://www.macworld.com/article/3535217/apple-acquires-dark-sky-weather-app.html" class="uri">https://www.macworld.com/article/3535217/apple-acquires-dark-sky-weather-app.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-30
</td>
<td style="text-align:left;">
Stocks Rally On March 30, But Caution Is Still Needed
</td>
<td style="text-align:left;">
investing
</td>
<td style="text-align:left;">
<a href="https://www.investing.com/analysis/stocks-rally-on-march-30-but-caution-is-still-needed-200520034" class="uri">https://www.investing.com/analysis/stocks-rally-on-march-30-but-caution-is-still-needed-200520034</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-30
</td>
<td style="text-align:left;">
Drive innovation if you want to survive
</td>
<td style="text-align:left;">
<a href="https://www.raconteur.net" class="uri">https://www.raconteur.net</a>
</td>
<td style="text-align:left;">
<a href="https://www.raconteur.net/business-innovation/drive-innovation-optimisation" class="uri">https://www.raconteur.net/business-innovation/drive-innovation-optimisation</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-30
</td>
<td style="text-align:left;">
Sennheiser Momentum True Wireless 2 Earbuds Review \| Digital Trends
</td>
<td style="text-align:left;">
<a href="https://www.digitaltrends.com" class="uri">https://www.digitaltrends.com</a>
</td>
<td style="text-align:left;">
<a href="https://www.digitaltrends.com/headphone-reviews/sennheiser-momentum-true-wireless-2-review/" class="uri">https://www.digitaltrends.com/headphone-reviews/sennheiser-momentum-true-wireless-2-review/</a>
</td>
</tr>
</tbody>
</table>

Note: the API limits the number of results, which could be an issue for
larger companies.

### get\_sentiments

`get_sentiments` retrieves sentiment analyses of recent articles for a
given company

#### Example

If we wanted to get sentiment analyses for Apple, we would use

``` r
get_sentiments(symbol = "AAPL",
               api.key = api.key) %>%
  head() %>%
  kable()
```

<table>
<thead>
<tr>
<th style="text-align:right;">
buzz.articlesInLastWeek
</th>
<th style="text-align:right;">
buzz.buzz
</th>
<th style="text-align:right;">
buzz.weeklyAverage
</th>
<th style="text-align:right;">
companyNewsScore
</th>
<th style="text-align:right;">
sectorAverageBullishPercent
</th>
<th style="text-align:right;">
sectorAverageNewsScore
</th>
<th style="text-align:right;">
sentiment.bearishPercent
</th>
<th style="text-align:right;">
sentiment.bullishPercent
</th>
<th style="text-align:left;">
symbol
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
234
</td>
<td style="text-align:right;">
0.8327
</td>
<td style="text-align:right;">
281
</td>
<td style="text-align:right;">
0.8421
</td>
<td style="text-align:right;">
0.6646
</td>
<td style="text-align:right;">
0.5236
</td>
<td style="text-align:right;">
0.1112
</td>
<td style="text-align:right;">
0.8888
</td>
<td style="text-align:left;">
AAPL
</td>
</tr>
</tbody>
</table>

### get\_basic\_financials

`get_basic_financials` retrieves basic financial information for a given
company

#### Example

To get basic financial price data for Apple, we would enter:

``` r
get_basic_financials(symbol = "AAPL", 
                     api.key = api.key, 
                     metric.type = "price") %>%
  head() %>%
  kable()
```

<table>
<thead>
<tr>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:right;">
X10DayAverageTradingVolume
</th>
<th style="text-align:right;">
X13WeekPriceReturnDaily
</th>
<th style="text-align:right;">
X26WeekPriceReturnDaily
</th>
<th style="text-align:right;">
X3MonthAverageTradingVolume
</th>
<th style="text-align:right;">
X52WeekHigh
</th>
<th style="text-align:left;">
X52WeekHighDate
</th>
<th style="text-align:right;">
X52WeekLow
</th>
<th style="text-align:left;">
X52WeekLowDate
</th>
<th style="text-align:right;">
X52WeekPriceReturnDaily
</th>
<th style="text-align:right;">
X5DayPriceReturnDaily
</th>
<th style="text-align:right;">
beta
</th>
<th style="text-align:right;">
marketCapitalization
</th>
<th style="text-align:right;">
monthToDatePriceReturnDaily
</th>
<th style="text-align:right;">
priceRelativeToS.P50013Week
</th>
<th style="text-align:right;">
priceRelativeToS.P50026Week
</th>
<th style="text-align:right;">
priceRelativeToS.P5004Week
</th>
<th style="text-align:right;">
priceRelativeToS.P50052Week
</th>
<th style="text-align:right;">
priceRelativeToS.P500Ytd
</th>
<th style="text-align:right;">
yearToDatePriceReturnDaily
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:right;">
31.28423
</td>
<td style="text-align:right;">
39.76578
</td>
<td style="text-align:right;">
20.49154
</td>
<td style="text-align:right;">
746.5076
</td>
<td style="text-align:right;">
399.82
</td>
<td style="text-align:left;">
2020-07-13
</td>
<td style="text-align:right;">
192.58
</td>
<td style="text-align:left;">
2019-08-05
</td>
<td style="text-align:right;">
87.85539
</td>
<td style="text-align:right;">
2.15594
</td>
<td style="text-align:right;">
1.19099
</td>
<td style="text-align:right;">
1655326
</td>
<td style="text-align:right;">
4.69024
</td>
<td style="text-align:right;">
22.33105
</td>
<td style="text-align:right;">
25.56711
</td>
<td style="text-align:right;">
8.21953
</td>
<td style="text-align:right;">
79.43374
</td>
<td style="text-align:right;">
33.17073
</td>
<td style="text-align:right;">
30.05619
</td>
</tr>
</tbody>
</table>

### get\_reported\_financials

`get_reported_financials` retrieves financial data through a company’s
filings

#### Example

To get annual reported financial data for Apple, we would enter:

``` r
get_reported_financials(symbol = "AAPL", 
                     api.key = api.key, 
                     frequency = "annual") %>%
  head() %>%
  kable()
```

<table>
<thead>
<tr>
<th style="text-align:right;">
year
</th>
<th style="text-align:right;">
quarter
</th>
<th style="text-align:left;">
reportType
</th>
<th style="text-align:left;">
form
</th>
<th style="text-align:left;">
filedDate
</th>
<th style="text-align:left;">
label
</th>
<th style="text-align:left;">
value
</th>
<th style="text-align:left;">
unit
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
2019
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:left;">
bs
</td>
<td style="text-align:left;">
10-K
</td>
<td style="text-align:left;">
2019-10-31
</td>
<td style="text-align:left;">
Marketable securities
</td>
<td style="text-align:left;">
5.1713e+10
</td>
<td style="text-align:left;">
usd
</td>
</tr>
<tr>
<td style="text-align:right;">
2019
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:left;">
bs
</td>
<td style="text-align:left;">
10-K
</td>
<td style="text-align:left;">
2019-10-31
</td>
<td style="text-align:left;">
Accounts receivable, net
</td>
<td style="text-align:left;">
2.2926e+10
</td>
<td style="text-align:left;">
usd
</td>
</tr>
<tr>
<td style="text-align:right;">
2019
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:left;">
bs
</td>
<td style="text-align:left;">
10-K
</td>
<td style="text-align:left;">
2019-10-31
</td>
<td style="text-align:left;">
Inventories
</td>
<td style="text-align:left;">
4.106e+09
</td>
<td style="text-align:left;">
usd
</td>
</tr>
<tr>
<td style="text-align:right;">
2019
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:left;">
bs
</td>
<td style="text-align:left;">
10-K
</td>
<td style="text-align:left;">
2019-10-31
</td>
<td style="text-align:left;">
Vendor non-trade receivables
</td>
<td style="text-align:left;">
2.2878e+10
</td>
<td style="text-align:left;">
usd
</td>
</tr>
<tr>
<td style="text-align:right;">
2019
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:left;">
bs
</td>
<td style="text-align:left;">
10-K
</td>
<td style="text-align:left;">
2019-10-31
</td>
<td style="text-align:left;">
Other current assets
</td>
<td style="text-align:left;">
1.2352e+10
</td>
<td style="text-align:left;">
usd
</td>
</tr>
<tr>
<td style="text-align:right;">
2019
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:left;">
bs
</td>
<td style="text-align:left;">
10-K
</td>
<td style="text-align:left;">
2019-10-31
</td>
<td style="text-align:left;">
Total current assets
</td>
<td style="text-align:left;">
1.62819e+11
</td>
<td style="text-align:left;">
usd
</td>
</tr>
</tbody>
</table>

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
