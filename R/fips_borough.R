#' Takes a fips county code and turns it into a borough name
#'
#' @param df dataframe containing fips column
#' @param col fips column
#' @export




boro_mutate <- function(df, fips_col){

  col = enquo(fips_col)

  return(
    df %>%
      dplyr::mutate(borough = dplyr::case_when(
             !!col == '5' ~ 'Bronx',
             !!col == '47' ~ 'Brooklyn',
             !!col == '81' ~ 'Queens',
             !!col == '61' ~ 'Manhattan'
      )

      ))
}

