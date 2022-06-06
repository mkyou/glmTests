\name{influence}
\alias{influence}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
influence(model, identify = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{model}{
%%     ~~Describe \code{model} here~~
}
  \item{identify}{
%%     ~~Describe \code{identify} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (model, identify = NULL) 
{
    package = "boot"
    if (!require(package, character.only = T)) {
        install.packages(package, dependencies = T)
    }
    glmdiag = function(glmfit, glmdiag = boot::glm.diag(glmfit), 
        subset = NULL, identify = NULL, labels = NULL, ret = FALSE) {
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
        plot(x = hh, y = glmdiag$cook, xlab = "h/(1-h)", ylab = "Estatística de Cook")
        if ((hy >= rx[1L]) && (hy <= rx[2L])) 
            abline(h = hy, lty = 2)
        if ((cooky >= ry[1L]) && (cooky <= ry[2L])) 
            abline(v = cooky, lty = 2)
        if (!is.null(identify)) 
            identify(x = hh, y = glmdiag$cook, n = identify)
    }
    glmdiag(model, identify = identify)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
