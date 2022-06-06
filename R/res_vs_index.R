# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'


res_vs_index = function(model, res_type = "deviance"){
  plot(residuals.glm(model, type = res_type),
       ylab = paste("Resíduos", res_type),
       xlab = "Índice")
  abline(h = c(-2, 2), lwd = 1, lty = 3)
}
