# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Install Package:           'Ctrl + Shift + B'
#   Check Package:             'Ctrl + Shift + E'
#   Test Package:              'Ctrl + Shift + T'

res_vs_fitted = function(model, res_type = "deviance"){
  plot(y = residuals.glm(model, type = res_type), x = model$fitted.values,
       ylab = paste("Resíduos", res_type), xlab = "Valores Ajustados")
  abline(h = 2, lwd = 1, lty = 2)
  abline(h = -2, lwd = 1, lty = 2)
}




