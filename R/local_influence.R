# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


local_influence = function(model, identify = NULL){
  package = "glmtoolbox"
  if(!require(package, character.only = T)){
    install.packages(package, dependencies = T)
  }
  glmtoolbox::localInfluence(model, plot.it = T, identity = identify)
}
