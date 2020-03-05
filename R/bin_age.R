#' Binning AGE variable for IPUMS Microdata
#'
#' @param df dataframe containing an integer AGE variable
#' @param col name of the AGE variable
#'
#' @export


bin_age <- function(df, col){
  col <- enquo(col)
  df1 <-
    df %>%
      dplyr::mutate(age_bin :=
                      factor(dplyr::case_when(
                        !!col <  10 ~ 'Under 10',
                        !!col >= 10 & !!col < 20  ~  '10-19',
                        !!col >= 20 & !!col < 30	~  '20-29',
                        !!col >= 30 & !!col < 40	~  '30-39',
                        !!col >= 40 & !!col < 50	~  '40-49',
                        !!col >= 50 & !!col < 60	~  '50-59',
                        !!col >= 60 & !!col < 70	~  '60-69',
                        !!col >= 70 & !!col < 80	~  '70-79',
                        !!col >=  80 ~ 'Over 80')
                  ))
  df1 %>%
    dplyr::mutate(age_bin = forcats::fct_relevel(df1$age_bin, "Under 10")) %>%
    return()

}
