start_dir = getwd()
if (file.exists("src/libpq.a") &&
    file.exists("src/libpq-fe.h") &&
    file.exists("src/postgres_ext.h") &&
    file.exists("src/pg_config_ext.h"))
{
  cat("Using installed libpq\n")
}else{
  temp_dir = tempdir()
  setwd(temp_dir)
  version = "9.5.2"
  base_name = paste0("postgresql-", version)
  file_name = paste0(base_name, ".tar.gz")
  the_url = paste0("http://ftp.postgresql.org/pub/source/v", version, "/", file_name)
  if (!file.exists(file_name)) download.file(the_url, file_name)
  if (!dir.exists(base_name)) untar(file_name)
  setwd(base_name)
  Sys.setenv(CC = system("R CMD config CC", TRUE),
             CFLAGS = system("R CMD config CFLAGS", TRUE),
             CPP = system("R CMD config CPP", TRUE),
             CPPFLAGS = system("R CMD config CPPFLAGS", TRUE),
             LDFLAGS = system("R CMD config LDFLAGS", TRUE))
  if (!file.exists("GNUmakefile")) system("./configure")
  setwd("src/interfaces/libpq")
  if (!file.exists("libpq.a")) system("make -j 2")
  pkg_src = file.path(start_dir, "src")
  file.copy(c("libpq.a", "libpq-fe.h"), pkg_src)
  setwd("../../include")
  file.copy(c("postgres_ext.h", "pg_config_ext.h"), pkg_src)
  setwd(start_dir)
  unlink(file.path(temp_dir, base_name), TRUE)
}




        

