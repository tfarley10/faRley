#' Write IPUMS .dat files to database in chunks
#'
#' @param ddi_path path to xml file
#' @param dat_path path to .dat file
#' @param db_con connection object for database to write to
#' @param chunk_size how many records to read in at a time
#' @param db_table_name a string for what to name your table in db
#'
#' @export
read_write_ipums <- function(ddi_path,
                             dat_path,
                             db_con,
                             chunk_size,
                             db_table_name){
  ddi <- read_ipums_ddi(ddi_path)

  read_ipums_micro_chunked(
    ddi,
    data_file = dat_path,
    readr::SideEffectChunkCallback$new(function(x, pos){
      if(pos == 1){
        dbWriteTable(db_con, db_table_name, x)
      }else{
        dbWriteTable(db_con, db_table_name, x, row.names = F, append = T)
      }
    }),
    chunk_size = chunk_size,
    verbose = F
  )

}
