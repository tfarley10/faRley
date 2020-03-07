#' Code MIGRATE1 IPUMS variable into a factor
#'
#' @param df a dataframe containing MIGRATE1 column
#' @param var the MIGRATE1 column name
#' @return
#'
#' @export
fac_migrate1 <- function(df, var){
  var = enquo(var)
  df %>%
    dplyr::mutate(migrate1 = factor(dplyr::case_when(
      !!var == 0 ~ 'N/A',
      !!var == 1 ~ 'Same house',
      !!var == 2 ~ 'Moved within state',
      !!var == 3 ~ 'Moved between states',
      !!var == 4 ~ 'Abroad one year ago',
      !!var == 9 ~ 'Unknown')
    )) %>% return()
}



