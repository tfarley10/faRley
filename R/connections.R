#' get local postgres connection
#'
#' @param user username for my local db
#' @param pw password for my local db
#' @export
get_swamp <- function(user, pw){
  DBI::dbConnect(RPostgres::Postgres(),
            host = "localhost",
            dbname = "swamp",
            password = pw,
            user = user,
            port = 5432
  )
}
