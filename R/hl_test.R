# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


hl_test = function(model){
  package = "glmtoolbox"
  if(!require(package, character.only = T)){
    install.packages(package, dependencies = T)
  }
  glmtoolbox::hltest(model)
}
