#' Sample user data for feedback dashboard.
#'
#' A dataset containing dummy attributes for 100 users, used for personalized insights/feedback for each user.
#'
#' @format A data frame with 100 rows and 63 variables:
#' \describe{
#'   \item{ID}{unique ID for each user}
#'   \item{TeamID}{team the user belongs to}
#'   \item{cat1}{sample attribute}
#'   \item{cat1_blau}{sample attribute}
#'   \item{cat2}{sample attribute}
#'   \item{cat2_blau}{sample attribute}
#'   \item{cat3}{sample attribute}
#'   \item{cat3_blau}{sample attribute}
#'   \item{cat4}{sample attribute}
#'   \item{cat4_blau}{sample attribute}
#'   \item{cont1}{sample attribute}
#'   \item{cont1_comp}{sample attribute}
#'   \item{cont1_mean}{sample attribute}
#'   \item{cont2}{sample attribute}
#'   \item{cont2_comp}{sample attribute}
#'   \item{cont2_mean}{sample attribute}
#'   \item{cont3}{sample attribute}
#'   \item{cont3_comp}{sample attribute}
#'   \item{cont3_mean}{sample attribute}
#'   \item{cont4}{sample attribute}
#'   \item{cont4_comp}{sample attribute}
#'   \item{cont4_mean}{sample attribute}
#'   \item{fb360_dim1_compmean}{sample attribute}
#'   \item{fb360_dim1_other1}{sample attribute}
#'   \item{fb360_dim1_other2}{sample attribute}
#'   \item{fb360_dim1_other3}{sample attribute}
#'   \item{fb360_dim1_other_mean}{sample attribute}
#'   \item{fb360_dim1_self}{sample attribute}
#'   \item{fb360_dim2_compmean}{sample attribute}
#'   \item{fb360_dim2_other1}{sample attribute}
#'   \item{fb360_dim2_other2}{sample attribute}
#'   \item{fb360_dim2_other3}{sample attribute}
#'   \item{fb360_dim2_other_mean}{sample attribute}
#'   \item{fb360_dim2_self}{sample attribute}
#'   \item{fb360_dim3_compmean}{sample attribute}
#'   \item{fb360_dim3_other1}{sample attribute}
#'   \item{fb360_dim3_other2}{sample attribute}
#'   \item{fb360_dim3_other3}{sample attribute}
#'   \item{fb360_dim3_other_mean}{sample attribute}
#'   \item{fb360_dim3_self}{sample attribute}
#'   \item{par1}{sample attribute}
#'   \item{par2}{sample attribute}
#'   \item{par3}{sample attribute}
#'   \item{ts_var1_V1_1}{sample attribute}
#'   \item{ts_var1_V1_2}{sample attribute}
#'   \item{ts_var1_V1_3}{sample attribute}
#'   \item{ts_var1_V1_4}{sample attribute}
#'   \item{ts_var1_V1_5}{sample attribute}
#'   \item{ts_var1_V2_1}{sample attribute}
#'   \item{ts_var1_V2_2}{sample attribute}
#'   \item{ts_var1_V2_3}{sample attribute}
#'   \item{ts_var1_V2_4}{sample attribute}
#'   \item{ts_var1_V2_5}{sample attribute}
#'   \item{ts_var2_V1_1}{sample attribute}
#'   \item{ts_var2_V1_2}{sample attribute}
#'   \item{ts_var2_V1_3}{sample attribute}
#'   \item{ts_var2_V1_4}{sample attribute}
#'   \item{ts_var2_V1_5}{sample attribute}
#'   \item{ts_var2_V2_1}{sample attribute}
#'   \item{ts_var2_V2_2}{sample attribute}
#'   \item{ts_var2_V2_3}{sample attribute}
#'   \item{ts_var2_V2_4}{sample attribute}
#'   \item{ts_var2_V2_5}{sample attribute}
#' }
#' @source TO-DO
"toydata"

#' Sample network for users' relations.
#'
#' A network in the form of a symmetric matrix, 1 represent a connection, 0 represent no connection.
#'
#' @format A symmetric 100 x 100 array.
#' \describe{
#'   \item{dim1}{IDs of all users.}
#'   \item{dim2}{IDs of all users.}
#'   ...
#' }
#' @source TO-DO
"toynetwork"

#' Sample ego networks for each user.
#'
#' A named list of adjacency matrices, where names show user names and value is an adjacency matrix of ego network. 1 represent a connection, 0 represent no connection.
#'
#' @format A list of 100 named elements where each element is a 2-D array.
#' \describe{
#'   \item{1}{Type = double[7x7], Value = 0,1,1,...}
#'   \item{2}{Type = double[4x4], Value = 0,1,1,...}
#'   ...
#' }
#' @source TO-DO
"egonets"

#' Sample attributes for each user ego entwork.
#'
#' A named list of data-frames, where names show user names and values are data frames of atrributes of users in a particular ego network.
#'
#' @format A list of 100 named elements where each element is [n x 10] data frame.
#' \describe{
#'   for each data-frame
#'   \item{ID}{}
#'   \item{ID2}{}
#'   \item{cont1}{sample attribute}
#'   \item{cont2}{sample attribute}
#'   \item{cont3}{sample attribute}
#'   \item{cont4}{sample attribute}
#'   \item{cat1}{sample attribute}
#'   \item{cat2}{sample attribute}
#'   \item{cat3}{sample attribute}
#'   \item{cat4}{sample attribute}
#' }
"egonets_attrs"

