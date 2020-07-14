finntools
=========

Finnhub.io offers a wide range of financial data at a price that the
average investor can afford. However, much of this information is more
useful to users in table format, rather than json. `finntools` helps
shorten the gap between data retrieval and usage in a way that provides
instant results for beginners and flexibility for more advanced users.
Functions will be updated over time. Current ones retrieve:

#### company-based functions

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

#### market-based functions

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
                 last.n.days = 30)
```

    #> [1] "Retrieving last 30 days of news for AAPL"
    #> [1] "171 unique articles successfully retrieved."

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
The Morning Show season 2 release date, cast, trailer, plot: When is it
out on Apple?
</td>
<td style="text-align:left;">
<a href="https://www.express.co.uk" class="uri">https://www.express.co.uk</a>
</td>
<td style="text-align:left;">
<a href="https://www.express.co.uk/showbiz/tv-radio/1309585/The-Morning-Show-season-2-release-date-cast-trailer-plot-when-out-Apple-TV-Plus" class="uri">https://www.express.co.uk/showbiz/tv-radio/1309585/The-Morning-Show-season-2-release-date-cast-trailer-plot-when-out-Apple-TV-Plus</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
4
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
6
</td>
<td style="text-align:left;">
2020-07-14
</td>
<td style="text-align:left;">
Report: Apple TV+ beats its viewership records following release of
‘Greyhound’ - 9to5Mac
</td>
<td style="text-align:left;">
<a href="https://9to5mac.com" class="uri">https://9to5mac.com</a>
</td>
<td style="text-align:left;">
<a href="https://9to5mac.com/2020/07/14/greyhound-viewership-apple-tv-plus/" class="uri">https://9to5mac.com/2020/07/14/greyhound-viewership-apple-tv-plus/</a>
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
Can’t schedule Dark Mode or Night Shift on iPhone and iPad? Here’s a fix
</td>
<td style="text-align:left;">
<a href="https://www.cultofmac.com" class="uri">https://www.cultofmac.com</a>
</td>
<td style="text-align:left;">
<a href="https://www.cultofmac.com/717221/schedule-dark-mode-night-shift-iphone-ipad-fix/" class="uri">https://www.cultofmac.com/717221/schedule-dark-mode-night-shift-iphone-ipad-fix/</a>
</td>
</tr>
</tbody>
</table>

Or we may want to get news for Apple from March of 2020

``` r
get_company_news(symbol = 'AAPL', 
                 api.key = api.key,
                 start.date = '2020-03-01', 
                 end.date = '2020-03-30')
```

    #> [1] "Retrieving news for AAPL between 2020-03-01 and 2020-03-30"
    #> [1] "157 unique articles successfully retrieved."

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
               api.key = api.key)
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
                     metric.type = "price")
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
                     frequency = "annual")
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
51713000000
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
22926000000
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
4106000000
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
22878000000
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
12352000000
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
162819000000
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

    #> [1] "Retrieving news for AAPL between 2020-01-01 and 2020-03-31"

<table>
<thead>
<tr>
<th style="text-align:left;">
accessNumber
</th>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:left;">
cik
</th>
<th style="text-align:left;">
form
</th>
<th style="text-align:left;">
filedDate
</th>
<th style="text-align:left;">
acceptedDate
</th>
<th style="text-align:left;">
reportUrl
</th>
<th style="text-align:left;">
filingUrl
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
0000320193-20-000035
</td>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
320193
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
2020-02-28 00:00:00
</td>
<td style="text-align:left;">
2020-02-28 18:37:09
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/320193/000032019320000035/xslF345X03/wf-form4_158293300685250.xml" class="uri">https://www.sec.gov/Archives/edgar/data/320193/000032019320000035/xslF345X03/wf-form4_158293300685250.xml</a>
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/1059235/000032019320000035/0000320193-20-000035-index.html" class="uri">https://www.sec.gov/Archives/edgar/data/1059235/000032019320000035/0000320193-20-000035-index.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
0000320193-20-000034
</td>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
320193
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
2020-02-28 00:00:00
</td>
<td style="text-align:left;">
2020-02-28 18:35:51
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/320193/000032019320000034/xslF345X03/wf-form4_158293293482087.xml" class="uri">https://www.sec.gov/Archives/edgar/data/320193/000032019320000034/xslF345X03/wf-form4_158293293482087.xml</a>
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/1216519/000032019320000034/0000320193-20-000034-index.html" class="uri">https://www.sec.gov/Archives/edgar/data/1216519/000032019320000034/0000320193-20-000034-index.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
0000320193-20-000033
</td>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
320193
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
2020-02-28 00:00:00
</td>
<td style="text-align:left;">
2020-02-28 18:34:43
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/320193/000032019320000033/xslF345X03/wf-form4_158293286599770.xml" class="uri">https://www.sec.gov/Archives/edgar/data/320193/000032019320000033/xslF345X03/wf-form4_158293286599770.xml</a>
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/1214128/000032019320000033/0000320193-20-000033-index.html" class="uri">https://www.sec.gov/Archives/edgar/data/1214128/000032019320000033/0000320193-20-000033-index.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
0000320193-20-000032
</td>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
320193
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
2020-02-28 00:00:00
</td>
<td style="text-align:left;">
2020-02-28 18:33:24
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/320193/000032019320000032/xslF345X03/wf-form4_158293278709070.xml" class="uri">https://www.sec.gov/Archives/edgar/data/320193/000032019320000032/xslF345X03/wf-form4_158293278709070.xml</a>
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/1051401/000032019320000032/0000320193-20-000032-index.html" class="uri">https://www.sec.gov/Archives/edgar/data/1051401/000032019320000032/0000320193-20-000032-index.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
0000320193-20-000031
</td>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
320193
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
2020-02-28 00:00:00
</td>
<td style="text-align:left;">
2020-02-28 18:32:24
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/320193/000032019320000031/xslF345X03/wf-form4_158293272634137.xml" class="uri">https://www.sec.gov/Archives/edgar/data/320193/000032019320000031/xslF345X03/wf-form4_158293272634137.xml</a>
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/1224944/000032019320000031/0000320193-20-000031-index.html" class="uri">https://www.sec.gov/Archives/edgar/data/1224944/000032019320000031/0000320193-20-000031-index.html</a>
</td>
</tr>
<tr>
<td style="text-align:left;">
0000320193-20-000030
</td>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
320193
</td>
<td style="text-align:left;">
4
</td>
<td style="text-align:left;">
2020-02-28 00:00:00
</td>
<td style="text-align:left;">
2020-02-28 18:31:19
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/320193/000032019320000030/xslF345X03/wf-form4_158293266204383.xml" class="uri">https://www.sec.gov/Archives/edgar/data/320193/000032019320000030/xslF345X03/wf-form4_158293266204383.xml</a>
</td>
<td style="text-align:left;">
<a href="https://www.sec.gov/Archives/edgar/data/1182047/000032019320000030/0000320193-20-000030-index.html" class="uri">https://www.sec.gov/Archives/edgar/data/1182047/000032019320000030/0000320193-20-000030-index.html</a>
</td>
</tr>
</tbody>
</table>

### get\_recommendation\_trends

`get_recommendation_trends` retrieves recommendation trends for a given
company

#### Example

If we wanted recommendation trends for Apple, we’d type

``` r
get_recommendation_trends(symbol = "AAPL", 
                          api.key = api.key)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:right;">
buy
</th>
<th style="text-align:right;">
hold
</th>
<th style="text-align:left;">
period
</th>
<th style="text-align:right;">
sell
</th>
<th style="text-align:right;">
strongBuy
</th>
<th style="text-align:right;">
strongSell
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:right;">
24
</td>
<td style="text-align:right;">
7
</td>
<td style="text-align:left;">
2020-07-01
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
13
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:right;">
19
</td>
<td style="text-align:right;">
10
</td>
<td style="text-align:left;">
2020-06-01
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
15
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:right;">
18
</td>
<td style="text-align:right;">
13
</td>
<td style="text-align:left;">
2020-05-01
</td>
<td style="text-align:right;">
2
</td>
<td style="text-align:right;">
14
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:right;">
13
</td>
<td style="text-align:right;">
19
</td>
<td style="text-align:left;">
2020-04-01
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
15
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:right;">
13
</td>
<td style="text-align:right;">
19
</td>
<td style="text-align:left;">
2020-03-01
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
15
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:right;">
13
</td>
<td style="text-align:right;">
19
</td>
<td style="text-align:left;">
2020-02-01
</td>
<td style="text-align:right;">
3
</td>
<td style="text-align:right;">
15
</td>
<td style="text-align:right;">
0
</td>
</tr>
</tbody>
</table>

### get\_company\_peers

`get_company_peers` retrieves a data frame of stocks with the same
country and GICS sub-industry as the specified symbol

#### Example

If we wanted to find companies that are similar to Apple, we’d use

``` r
get_company_peers(symbol = "AAPL", 
                  api.key = api.key)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:left;">
related\_symbol
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
DELL
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
HPQ
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
1337.HK
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
WDC
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
HPE
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
NTAP
</td>
</tr>
</tbody>
</table>

### get\_target\_price

`get_target_price` retrieves the latest price target consensus for a
given stock symbol

#### Example

Let’s say that we want to get target prices for Apple

``` r
get_target_price(symbol = 'AAPL',
                 api.key = api.key)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:left;">
lastUpdated
</th>
<th style="text-align:left;">
targetHigh
</th>
<th style="text-align:left;">
targetLow
</th>
<th style="text-align:left;">
targetMean
</th>
<th style="text-align:left;">
targetMedian
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
2020-07-14 00:00:00
</td>
<td style="text-align:left;">
370.8
</td>
<td style="text-align:left;">
207.77
</td>
<td style="text-align:left;">
308.91
</td>
<td style="text-align:left;">
315
</td>
</tr>
</tbody>
</table>

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

<table>
<thead>
<tr>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:left;">
period
</th>
<th style="text-align:right;">
actual
</th>
<th style="text-align:right;">
estimate
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
2020-03-31
</td>
<td style="text-align:right;">
2.55
</td>
<td style="text-align:right;">
2.3052
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
2019-12-31
</td>
<td style="text-align:right;">
4.99
</td>
<td style="text-align:right;">
4.6410
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
2019-09-30
</td>
<td style="text-align:right;">
3.03
</td>
<td style="text-align:right;">
2.8968
</td>
</tr>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
2019-06-30
</td>
<td style="text-align:right;">
2.18
</td>
<td style="text-align:right;">
2.1420
</td>
</tr>
</tbody>
</table>

### get\_market\_news

`get_market_news` retrieves latest news for a market in a given category

#### Example

To get the latest market news on mergers, we’d enter

``` r
get_market_news(category = "merger",
                api.key = api.key)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
category
</th>
<th style="text-align:left;">
datetime
</th>
<th style="text-align:left;">
headline
</th>
<th style="text-align:right;">
id
</th>
<th style="text-align:left;">
source
</th>
<th style="text-align:left;">
summary
</th>
<th style="text-align:left;">
url
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
merger
</td>
<td style="text-align:left;">
2020-07-14 15:39:22
</td>
<td style="text-align:left;">
Altice closes deal for New Jersey’s Service Electric Cable
</td>
<td style="text-align:right;">
4977064
</td>
<td style="text-align:left;">
SeekingAlpha
</td>
<td style="text-align:left;">
</td>
<td style="text-align:left;">
<a href="https://seekingalpha.com/news/3591234-altice-closes-deal-for-new-jerseys-service-electric-cable?utm_source=feed_news_m_a&amp;utm_medium=referral" class="uri">https://seekingalpha.com/news/3591234-altice-closes-deal-for-new-jerseys-service-electric-cable?utm_source=feed_news_m_a&amp;utm_medium=referral</a>
</td>
</tr>
</tbody>
</table>

### get\_ipo\_calendar

`get_ipo_calendar` retrieves information on ipo’s for a given time
period

#### Example

Let’s say we want to get ipo’s from the last 30 days

``` r
get_ipo_calendar(api.key = api.key, 
                 last.n.days = 30)
```

    #> [1] "Retrieving ipo calendar for last 30 days"

<table>
<thead>
<tr>
<th style="text-align:left;">
date
</th>
<th style="text-align:left;">
exchange
</th>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
numberOfShares
</th>
<th style="text-align:left;">
price
</th>
<th style="text-align:left;">
status
</th>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:right;">
totalSharesValue
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
2020-07-10
</td>
<td style="text-align:left;">
NASDAQ Global Select
</td>
<td style="text-align:left;">
Nkarta, Inc. 
</td>
<td style="text-align:right;">
13000000
</td>
<td style="text-align:left;">
16.00-17.00
</td>
<td style="text-align:left;">
expected
</td>
<td style="text-align:left;">
NKTX
</td>
<td style="text-align:right;">
254150000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-10
</td>
<td style="text-align:left;">
NASDAQ Global
</td>
<td style="text-align:left;">
Inventiva S.A.
</td>
<td style="text-align:right;">
7478261
</td>
<td style="text-align:left;">
13.40-15.40
</td>
<td style="text-align:left;">
expected
</td>
<td style="text-align:left;">
IVA
</td>
<td style="text-align:right;">
132440000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-10
</td>
<td style="text-align:left;">
NASDAQ Global Select
</td>
<td style="text-align:left;">
Poseida Therapeutics, Inc. 
</td>
<td style="text-align:right;">
14000000
</td>
<td style="text-align:left;">
16.00
</td>
<td style="text-align:left;">
expected
</td>
<td style="text-align:left;">
PSTX
</td>
<td style="text-align:right;">
257600000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-10
</td>
<td style="text-align:left;">
NASDAQ Global
</td>
<td style="text-align:left;">
QUHUO Ltd
</td>
<td style="text-align:right;">
2700000
</td>
<td style="text-align:left;">
9.00-11.00
</td>
<td style="text-align:left;">
expected
</td>
<td style="text-align:left;">
QH
</td>
<td style="text-align:right;">
34155000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-08
</td>
<td style="text-align:left;">
NASDAQ Global
</td>
<td style="text-align:left;">
BlueCity Holdings Ltd
</td>
<td style="text-align:right;">
5300000
</td>
<td style="text-align:left;">
16.00
</td>
<td style="text-align:left;">
priced
</td>
<td style="text-align:left;">
BLCT
</td>
<td style="text-align:right;">
84800000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-08
</td>
<td style="text-align:left;">
NASDAQ Capital
</td>
<td style="text-align:left;">
Therapeutics Acquisition Corp. 
</td>
<td style="text-align:right;">
11800000
</td>
<td style="text-align:left;">
10.00
</td>
<td style="text-align:left;">
priced
</td>
<td style="text-align:left;">
TXAC
</td>
<td style="text-align:right;">
118000000
</td>
</tr>
</tbody>
</table>

Or we may want to get information on ipo’s from March of 2020

``` r
get_ipo_calendar(api.key = api.key, 
                 start.date = '2020-03-01', 
                 end.date = '2020-03-31')
```

    #> [1] "Retrieving ipo calendar for companies between 2020-03-01 and 2020-03-31"

<table>
<thead>
<tr>
<th style="text-align:left;">
date
</th>
<th style="text-align:left;">
exchange
</th>
<th style="text-align:left;">
name
</th>
<th style="text-align:right;">
numberOfShares
</th>
<th style="text-align:left;">
price
</th>
<th style="text-align:left;">
status
</th>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:right;">
totalSharesValue
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
2020-03-31
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
Harbor Custom Development, Inc. 
</td>
<td style="text-align:right;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
filed
</td>
<td style="text-align:left;">
HCD
</td>
<td style="text-align:right;">
17250000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-18
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
UTime Ltd
</td>
<td style="text-align:right;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
filed
</td>
<td style="text-align:left;">
UTME
</td>
<td style="text-align:right;">
21562500
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-13
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
Leaping Group Co., Ltd. 
</td>
<td style="text-align:right;">
NA
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:left;">
withdrawn
</td>
<td style="text-align:left;">
NA
</td>
<td style="text-align:right;">
NA
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-12
</td>
<td style="text-align:left;">
NASDAQ Global Select
</td>
<td style="text-align:left;">
IMARA Inc. 
</td>
<td style="text-align:right;">
4700000
</td>
<td style="text-align:left;">
16.00
</td>
<td style="text-align:left;">
priced
</td>
<td style="text-align:left;">
IMRA
</td>
<td style="text-align:right;">
75200000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-11
</td>
<td style="text-align:left;">
NASDAQ Capital
</td>
<td style="text-align:left;">
DFP HEALTHCARE ACQUISITIONS CORP.
</td>
<td style="text-align:right;">
20000000
</td>
<td style="text-align:left;">
10.00
</td>
<td style="text-align:left;">
priced
</td>
<td style="text-align:left;">
DFPHU
</td>
<td style="text-align:right;">
200000000
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-03-06
</td>
<td style="text-align:left;">
NASDAQ Capital
</td>
<td style="text-align:left;">
LifeSci Acquisition Corp. 
</td>
<td style="text-align:right;">
6000000
</td>
<td style="text-align:left;">
10.00
</td>
<td style="text-align:left;">
priced
</td>
<td style="text-align:left;">
LSACU
</td>
<td style="text-align:right;">
60000000
</td>
</tr>
</tbody>
</table>

### get\_stock\_candles

`get_stock_candles` retrieves candlestick data for U.S. stocks dating as
far back as 25 years

#### Example

If we wanted stock candles for Apple from the 5 hours in 1-minute
intervals, we’d enter

``` r
to.date <- as.numeric(.POSIXct(Sys.time()))
from.date <- to.date - (5*3600)

get_stock_candles(symbol = 'AAPL', 
                  api.key = api.key,
                  resolution = 1,
                  from.date = from.date, 
                  to.date = to.date)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
t
</th>
<th style="text-align:right;">
o
</th>
<th style="text-align:right;">
h
</th>
<th style="text-align:right;">
l
</th>
<th style="text-align:right;">
c
</th>
<th style="text-align:right;">
v
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
2020-07-14 11:52:00
</td>
<td style="text-align:right;">
383.2799
</td>
<td style="text-align:right;">
383.5000
</td>
<td style="text-align:right;">
383.22
</td>
<td style="text-align:right;">
383.4228
</td>
<td style="text-align:right;">
0
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-14 11:53:00
</td>
<td style="text-align:right;">
383.4200
</td>
<td style="text-align:right;">
384.2200
</td>
<td style="text-align:right;">
383.42
</td>
<td style="text-align:right;">
384.2200
</td>
<td style="text-align:right;">
99864
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-14 11:54:00
</td>
<td style="text-align:right;">
384.1600
</td>
<td style="text-align:right;">
384.5800
</td>
<td style="text-align:right;">
384.12
</td>
<td style="text-align:right;">
384.3800
</td>
<td style="text-align:right;">
101125
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-14 11:55:00
</td>
<td style="text-align:right;">
384.3635
</td>
<td style="text-align:right;">
384.6000
</td>
<td style="text-align:right;">
383.98
</td>
<td style="text-align:right;">
384.5000
</td>
<td style="text-align:right;">
95125
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-14 11:56:00
</td>
<td style="text-align:right;">
384.5300
</td>
<td style="text-align:right;">
384.7990
</td>
<td style="text-align:right;">
384.47
</td>
<td style="text-align:right;">
384.4700
</td>
<td style="text-align:right;">
63792
</td>
</tr>
<tr>
<td style="text-align:left;">
2020-07-14 11:57:00
</td>
<td style="text-align:right;">
384.5096
</td>
<td style="text-align:right;">
384.5623
</td>
<td style="text-align:right;">
384.07
</td>
<td style="text-align:right;">
384.3301
</td>
<td style="text-align:right;">
47816
</td>
</tr>
</tbody>
</table>

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

<table>
<thead>
<tr>
<th style="text-align:right;">
aprice
</th>
<th style="text-align:right;">
atime
</th>
<th style="text-align:right;">
bprice
</th>
<th style="text-align:right;">
btime
</th>
<th style="text-align:right;">
cprice
</th>
<th style="text-align:right;">
ctime
</th>
<th style="text-align:right;">
dprice
</th>
<th style="text-align:right;">
dtime
</th>
<th style="text-align:right;">
entry
</th>
<th style="text-align:right;">
entry\_date
</th>
<th style="text-align:right;">
eprice
</th>
<th style="text-align:right;">
etime
</th>
<th style="text-align:right;">
mature
</th>
<th style="text-align:left;">
patternname
</th>
<th style="text-align:left;">
patterntype
</th>
<th style="text-align:right;">
profit1
</th>
<th style="text-align:right;">
profit2
</th>
<th style="text-align:right;">
sortTime
</th>
<th style="text-align:left;">
status
</th>
<th style="text-align:right;">
stoploss
</th>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:right;">
terminal
</th>
<th style="text-align:right;">
end\_price
</th>
<th style="text-align:right;">
end\_time
</th>
<th style="text-align:right;">
start\_price
</th>
<th style="text-align:right;">
start\_time
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
234.30
</td>
<td style="text-align:right;">
1585056600
</td>
<td style="text-align:right;">
252.0745
</td>
<td style="text-align:right;">
1585056600
</td>
<td style="text-align:right;">
247.5111
</td>
<td style="text-align:right;">
1585575000
</td>
<td style="text-align:right;">
265.2855
</td>
<td style="text-align:right;">
1585575000
</td>
<td style="text-align:right;">
247.51
</td>
<td style="text-align:right;">
1585747800
</td>
<td style="text-align:right;">
319.75
</td>
<td style="text-align:right;">
1582036200
</td>
<td style="text-align:right;">
1
</td>
<td style="text-align:left;">
Flag
</td>
<td style="text-align:left;">
bearish
</td>
<td style="text-align:right;">
229.74
</td>
<td style="text-align:right;">
162.06
</td>
<td style="text-align:right;">
1585575000
</td>
<td style="text-align:left;">
failed
</td>
<td style="text-align:right;">
265.290
</td>
<td style="text-align:left;">
AAPL.US
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
NA
</td>
<td style="text-align:right;">
NA
</td>
<td style="text-align:right;">
NA
</td>
<td style="text-align:right;">
NA
</td>
</tr>
<tr>
<td style="text-align:right;">
327.85
</td>
<td style="text-align:right;">
1580308200
</td>
<td style="text-align:right;">
302.2200
</td>
<td style="text-align:right;">
1580740200
</td>
<td style="text-align:right;">
327.2200
</td>
<td style="text-align:right;">
1581517800
</td>
<td style="text-align:right;">
0.0000
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
302.22
</td>
<td style="text-align:right;">
NA
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:left;">
Double Top
</td>
<td style="text-align:left;">
bearish
</td>
<td style="text-align:right;">
276.59
</td>
<td style="text-align:right;">
0.00
</td>
<td style="text-align:right;">
1582554600
</td>
<td style="text-align:left;">
successful
</td>
<td style="text-align:right;">
330.413
</td>
<td style="text-align:left;">
AAPL.US
</td>
<td style="text-align:right;">
0
</td>
<td style="text-align:right;">
302.22
</td>
<td style="text-align:right;">
1582554600
</td>
<td style="text-align:right;">
302.22
</td>
<td style="text-align:right;">
1578493800
</td>
</tr>
</tbody>
</table>

### get\_quote

`get_quote` retrieves real-time data for a given stock

#### Example

If we wanted a real-time quote for Apple, we’d enter

``` r
get_quote(symbol = 'AAPL', 
          api.key = api.key)
```

<table>
<thead>
<tr>
<th style="text-align:right;">
c
</th>
<th style="text-align:right;">
h
</th>
<th style="text-align:right;">
l
</th>
<th style="text-align:right;">
o
</th>
<th style="text-align:right;">
pc
</th>
<th style="text-align:left;">
t
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:right;">
388.23
</td>
<td style="text-align:right;">
389.02
</td>
<td style="text-align:right;">
375.51
</td>
<td style="text-align:right;">
379.36
</td>
<td style="text-align:right;">
381.91
</td>
<td style="text-align:left;">
2020-07-14 16:51:16
</td>
</tr>
</tbody>
</table>

### get\_stock\_splits

`get_stock_splits` retrieves stock splits for a given symbol

#### Example

Let’s say we want to get stock splits for Apple for a 30-day time period

``` r
from.date = '2010-01-01'
to.date = '2020-01-01'

get_stock_splits(symbol = 'AAPL', 
                 from.date = from.date,
                 to.date = to.date,
                 api.key = api.key)
```

<table>
<thead>
<tr>
<th style="text-align:left;">
symbol
</th>
<th style="text-align:left;">
date
</th>
<th style="text-align:left;">
fromFactor
</th>
<th style="text-align:left;">
toFactor
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
AAPL
</td>
<td style="text-align:left;">
2014-06-09
</td>
<td style="text-align:left;">
1
</td>
<td style="text-align:left;">
7
</td>
</tr>
</tbody>
</table>

Note: as-of 2020-07-14, this is not a very useful endpoint
