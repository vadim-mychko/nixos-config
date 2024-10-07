{ pkgs, ... }:

let
  rPackages = with pkgs.rPackages; [
    languageserver
    lintr
    IRkernel
    BiocManager
    devtools
    Matrix
    factoextra
    DescTools
    ggplot2
    extraDistr
    dplyr
    MASS
    ISLR
    glmnet
    cvTools
    gtools
    caret
    gam
    akima
    mvtnorm
    rcompanion
    scatterplot3d
    Rtsne
    tidyverse
    deldir
    tree
    tsne
    mclust
    cluster
    dbscan
    NMI
    knitr
    elasticnet
    interp
    fastDummies
    FNN
  ];
  rstudio-server = pkgs.rstudioServerWrapper.override { packages = rPackages; };
in {
  services.rstudio-server = {
    enable = true;
    package = rstudio-server;
  };
}
