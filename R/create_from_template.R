#' Create a Quarto file based on defined template
#'
#' This function creates a Quarto file based on defined template
#'  by copying the necessary template files
#' into the `_extensions` directory and generating
#' a new Quarto Markdown (`.qmd`) file.
#'
#' @param file_name A character string specifying the name of the new
#'     Quarto Markdown file.
#'   If `NULL`, the function use `"index`" as the default file name.
#' @param template A character string specifying the name of the extension.
#' Default is `"article"`, but can use also `"prez"` 
#'
#' @return This function does not return a value. It performs file operations to set up
#'   the Quarto IOM story template in the current working directory.
#'
#' @details
#' The function performs the following steps:
#' \itemize{
#'   \item Checks if `file_name` is provided. If not, it will be index per default.
#'   \item Verifies what `template` is selected.
#'   \item Creates the `_extensions` directory if it does not exist.
#'   \item Creates a subdirectory within `_extensions` for the specified extension.
#'   \item Copies the extension files from the package's internal `extdata`
#'          directory to `_extensions`.
#'   \item Checks if the extension files were successfully copied.
#'   \item Creates a new Quarto Markdown file based on the template.
#'   \item Opens the new file in the editor.
#' }
#'
#' @examples
#' \dontrun{
#' create_from_template(template = "prez")
#' create_from_template(template = "article")
#' }
#' @importFrom utils file.edit
#' @importFrom here here
#' @export
create_from_template <- function(file_name = NULL,
                              template = "article") {

  if (is.null(file_name)) {
    file_name <- "index"
  }
  ext_name <- paste0("quarto_iom_",template )
  # check for available extensions
  stopifnot("Extension not in package" = ext_name %in%
              c("quarto_iom_article",
                "quarto_iom_prez"))

  # check for existing _extensions directory
  if(!file.exists("_extensions")) dir.create("_extensions")
  message("Created '_extensions' folder")

  # create folder
  if(!file.exists(paste0("_extensions/", ext_name)))
    dir.create(paste0("_extensions/", ext_name))

  # copy from internals
  file.copy(
    from = system.file(paste0("extdata/_extensions/", ext_name),
                       package = "iomquarto"),
    to = paste0("_extensions/"),
    overwrite = TRUE,
    recursive = TRUE,
    copy.mode = TRUE
  )

  # logic check to make sure extension files were moved
  n_files <- length(dir(paste0("_extensions/", ext_name)))

  if(n_files >= 2){
    message(paste(ext_name, "was installed to _extensions folder in
                  current working directory."))
  } else {
    message("Extension appears not to have been created")
  }

  # create new qmd report based on skeleton
  file.copy(
    system.file(paste0("extdata/_extensions/quarto_iom_",
                   template, "/iom_",
                   template, "_template.qmd",
                   collapse = ""),
                package = "iomquarto"),

            to = here::here(paste0(file_name, ".qmd",
                        collapse = "")),
            overwrite = TRUE,
            recursive = FALSE,
            copy.mode = TRUE)

  # open the new file in the editor
  # file.edit(here::here(paste0(file_name, ".qmd",
  #                             collapse = "")))

}
