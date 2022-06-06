# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


influence = function(model, identify = NULL){
  package = "boot"
  if(!require(package, character.only = T)){
    install.packages(package, dependencies = T)
  }
  glmdiag = function (glmfit, glmdiag = boot::glm.diag(glmfit), subset = NULL,
                      identify = NULL, labels = NULL, ret = FALSE){
    if (is.null(glmdiag))
      glmdiag <- boot::glm.diag(glmfit)
    if (is.null(subset))
      subset <- seq_along(glmdiag$h)
    else if (is.logical(subset))
      subset <- seq_along(subset)[subset]
    else if (is.numeric(subset) && all(subset < 0))
      subset <- (1L:(length(subset) + length(glmdiag$h)))[subset]
    else if (is.character(subset)) {
      if (is.null(labels))
        labels <- subset
      subset <- seq_along(subset)
    }
    hh <- glmdiag$h/(1 - glmdiag$h)
    rx <- range(hh)
    ry <- range(glmdiag$cook)
    rank.fit <- glmfit$rank
    nobs <- rank.fit + glmfit$df.residual
    cooky <- 8/(nobs - 2 * rank.fit)
    hy <- (2 * rank.fit)/(nobs - 2 * rank.fit)
    plot(x = hh, y = glmdiag$cook, xlab = "h/(1-h)",
         ylab = "Estatística de Cook")
    if ((hy >= rx[1L]) && (hy <= rx[2L]))
      abline(h = hy, lty = 2)
    if ((cooky >= ry[1L]) && (cooky <= ry[2L]))
      abline(v = cooky, lty = 2)
    if(!is.null(identify))
      identify(x = hh, y = glmdiag$cook, n = identify)
  }
  glmdiag(model, identify = identify)
}
