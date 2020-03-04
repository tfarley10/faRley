#' get local postgres connection
#' @export
get_swamp <- function(){
  DBI::dbConnect(RPostgres::Postgres(),
            host = "localhost",
            dbname = "swamp",
            password = "T832132i",
            user = "tfarley",
            port = 5432
  )
}
