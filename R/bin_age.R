#' Binning AGE variable by decade
#'
#' @param df dataframe containing an integer AGE variable
#' @param col name of the AGE variable
#'
#' @export


bin_age <- function(df, age_col){
  age_col <- enquo(age_col)
  df1 <-
    df %>%
      dplyr::mutate(age_bin :=
                      factor(dplyr::case_when(
                        !!age_col %in% 0:9 ~ 'Under 10',
                        !!age_col %in% 10:19  ~ '10-19',
                        !!age_col %in% 20:29  ~ '20-29',
                        !!age_col %in% 30:39  ~ '30-39',
                        !!age_col %in% 40:49  ~ '40-49',
                        !!age_col %in% 50:59  ~ '50-59',
                        !!age_col %in% 60:69  ~ '60-69',
                        !!age_col %in% 70:79  ~ '70-79',
                        !!age_col %in% 80:89  ~ '80-89',
                        !!age_col %in% 90:150 ~ '90 plus')

                  ))
  df1 %>%
    dplyr::mutate(age_bin = forcats::fct_relevel(df1$age_bin, "Under 10")) %>%
    return()

}
