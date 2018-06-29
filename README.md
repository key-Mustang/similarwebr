# SimilarwebR

**A minimalistic R client for the similarweb API**

<br><br>


## Functions Overview:

<br>

  **Retrieval functions:**
  
  + `get_visits()` - retrieves traffic info about the domain [link](https://www.similarweb.com/corp/developer/estimated_visits_api)
  + `get_category_rank()` - retrieves the category rank of the domain [link]()  
  + `get_rank_and_reach()` - retrieves the domain rank and reach [link](https://www.similarweb.com/corp/developer/rank_reach)

<br>

  **Formatting functions:**
  
  + `format_visits()` - formats the `get_visits()` response into a data.frame
  + `format_category_rank()` - formatting for the `get_category_rank()` response
  
<br><br>


### `get_visits`


Total Traffic API input for "cnn.com"

```
get_visits(api_key = "my_api_key", domain = "cnn.com", start = "2016-01", end = "2016-03", gr = "monthly")
```

JSON output should be similar to this:

```
{  
   "meta":{  
      "request":{  
         "granularity":"Monthly",
         "main_domain_only":false,
         "domain":"cnn.com",
         "start_date":"2016-01-01",
         "end_date":"2016-03-01",
         "country":"world"
      },
      "status":"Success",
      "last_updated":"2016-05-01"
   },
   "visits":[  
      {  
         "date":"2016-01-01",
         "visits":419183781.12128651
      },
      {  
         "date":"2016-02-01",
         "visits":430178882.01417673
      },
      {  
         "date":"2016-03-01",
         "visits":490074660.2565304
      }
   ]
}
```


<br><br>


### `get_category_rank`

*Note:* One request to this API is worth 3 hits

Category rank API for "facebook.com"

```
get_category_rank(api_key = "my_api_key", domain = "facebook.com")
```

JSON output should be similar to this:

```
{
 "category":"Internet_and_Telecom/Social_Network",
 "rank":1
}
```

<br><br>


### `get_rank_and_reach`

Google.com Rank & Reach API input

```
get_rank_and_reach(api_key = "my_api_key", domain = "google.com")
```

JSON output should be similar to this:

```
{ 
 GlobalRank: 2,   
 
 //CountryCode is the domain's most popular country and 
 //CountryRank is its rank in that country
 CountryCode: 840,
 CountryRank: 2,

 //TopCountryShares shows the top countries that bring
 //the most traffic to the domain and their share of
 //traffic in percent
  {
   CountryCode: 840,
   TrafficShare: 0.527661729864217
  },
  {
   CountryCode: 356,
   TrafficShare: 0.0530084518715688
  },
...
...
...

//TrafficReach displays 26 dates over the last
//6 months and the estimated percentage of
//internet users who visited the domain on
//that date (DD/MM/YYYY)
  {
   Date: "01/09/2012",
   Value: 0.227856776500789
  },
  {
   CountryCode: 356,
   TrafficShare: 0.0530084518715688
  },
  ...
  ...
  ...
//TrafficShares displays the source distribution
//of traffic for the most recent month.
  {
   "SourceType": "Search",
   "SourceValue": 0.1352821703509324
  },
  {
   "SourceType": "Social",
   "SourceValue": 0.0493687569141767
  },
  {
   "SourceType": "Mail",
   "SourceValue": 0.0014070432674325017
  ...
  ...
  ... 
}
```

<br><br>

Read more about `Similarweb` [here](https://www.similarweb.com/)
