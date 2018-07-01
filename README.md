# SimilarwebR

**A minimalistic R client for the similarweb API**

<br><br>


## Functions Overview:

<br>

  **Retrieval functions:**
  
  + `get_visits()` - retrieves traffic info about the domain [link](https://www.similarweb.com/corp/developer/estimated_visits_api)
  + `get_category_rank()` - retrieves the category rank of the domain [link](https://www.similarweb.com/corp/developer/category_rank_api)  
  + `get_similar_websites()` - retrieves 40 most similar websites [link](https://www.similarweb.com/corp/developer/similar_websites_api)

<br>

  **Formatting functions:**
  
  + `format_visits()` - formatting for the `get_visits()` response  
  + `format_category_rank()` - formatting for the `get_category_rank()` response  
  + `format_similar_websites()` - formatting for the `get_similar_websites()` response  
  
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


### `get_similar_websites`

Similar Websites API input for "google.com"

```
get_similar_websites(api_key = "my_api_key", domain = "google.com", start_month = "2016-11", end_month = "2016-12")
```

JSON output should be similar to this:

```
{
 "similar_sites":[
  {
  "url":"googleblog.blogspot.com",
  "score":0.99995037171524026
  },
  {
  "url":"yahoo.com",
  "score":0.999742882067614
  },
  {
  "url":"technorati.com",
  "score":0.97864855460955635
  },
...
...
...
 
}
```


<br><br>

Read more about `Similarweb` [here](https://www.similarweb.com/)
