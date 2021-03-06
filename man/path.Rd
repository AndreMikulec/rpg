% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sql.R
\name{set_path}
\alias{append_path}
\alias{get_path}
\alias{path_contains}
\alias{prepend_path}
\alias{set_path}
\title{PostgreSQL path variable}
\usage{
set_path(..., default = FALSE)

get_path(default = FALSE)

append_path(..., default = FALSE, no_dup = TRUE)

prepend_path(..., default = FALSE, no_dup = TRUE)

path_contains(..., default = FALSE)
}
\arguments{
\item{...}{path names}

\item{default}{if true, manipulate database default}

\item{no_dup}{do not add if path exists}
}
\description{
Manipulate the PostgreSQL path variable
}

