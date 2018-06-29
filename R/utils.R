collapse_list <- function(df, col = "technologies") {

  valid_cols = c("technologies", "social_links")
  if (!col %in% valid_cols)
    stop(paste("please specify a valid col"))

  # special handle for social_links
  if (col == "social_links") {
    ls <- names(unlist(df[col]))
    ls <- gsub(pattern = "social_links.", replacement = "", x = ls)

    return(paste(ls, collapse = ", "))
  } else {

    # this is applied for technlogies (default), social links and tags
    ls <- unlist(df[col], use.names = FALSE)
    ls <- gsub(pattern = " ", replacement = "_", x = ls)

    return(paste(ls, collapse = ", "))
  }

}
