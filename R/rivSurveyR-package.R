#' rivSurveyR-package
#'
#' rivSurveyR: A Package to Process Water Velocities Collected With SonTek Acoustic Doppler Current Profilers
#'
#' The \code{rivSurveyR} package accepts acoustic Doppler current profiler (ADCP) data exported from SonTek's RiverSurveyor Live  program as MATLAB files and allows quick summarization and plotting of water velocities.  It is capable of projecting replicate transects to a mean transect line and averaging measured values that overlap in geographic space.  Planform and secondary velocities from multiple ADCP transects can be processed at once and multiple rotation methods can be used to determine secondary velocities.  Planform flow data can be plotted in geographic space and cross-section plots of secondary velocities can easily be constructed.
#' @details
#' \strong{Primary functions:}
#'
#' \link{process.planform} summarizes replicated ADCP data, calculates water speeds, flow headings, transect direction (from river right), distance along transect, shear velocities, and conducts spatial averaging.
#'
#' \link{process.secondary} summarizes ADCP cell data exported from SonTek RiverSurveyor, calculates primary and secondary velocities, and conducts spatial averaging.
#'
#' \link{plot.planform} plots spatial data from an object of class "adcp.planform".
#'
#' \link{plot.xSec} plots cross-section velocities given an object of class "adcp.secondary".
#'
#' \strong{Secondary functions:}
#'
#' \link{xSec.planform} compiles planform ADCP data exported from SonTek RiverSurveyor as Matlab file into an object of class "adcp.planform" which inherits from \link[data.table]{data.table}.
#'
#' \link{average.planform} applies a function summarizing replicated ADCP data and calculates water speeds, flow headings, transect direction (from river right), and distance along transect.
#'
#' \link{shearVel} calculates shear velocity from ADCP measurements.
#'
#' \link{spatialAverage} averages spatially referenced data using a moving window.
#'
#' \link{spatialSD} computes the standard deviation of spatially referenced data using a moving window
#'
#' \link{xSec.secondary} compiles ADCP cell data exported from SonTek RiverSurveyor as MatLab file into an object of class "adcp.secondary" which inherits from \link[data.table]{data.table}.
#'
#' \link{average.secondary} applies a function summarizing replicated ADCP data and calculates transect direction (from river right) and distance along transect.
#'
#' \link{xSec} rotates velocities to be parallel and perpendicular to a cross-section.
#'
#' \link{zeroSecQ} uses the zero secondary discharge method of rotation to calculate secondary velocities within a cross-section.
#'
#' \link{rozovskii} uses the Rozovskii method of rotation to calculate secondary velocities within a cross-section.
#'
#' \link{plot.xSec.default} plots cross-section velocities given an object of class "adcp.secondary".
#'
#' \strong{Other functions:}
#'
#' \link{ortho.proj} calculates the x and y coordinates along an orthogonal plane, given the linear regression coefficients of y~x.
#'
#' \link{project.transect} orthogonally projects x and y coordinates of replicated ADCP transects to a mean transect line.
#'
#' \link{transectHeading} determines the compass heading of a cross-section transect, assuming transect starts at river right.
#'
#' \link{heading} calculates the degree heading of two velocity vectors.
#'
#' \link{layerAvg} calculates the integrated mean of y within the defined bounds of x.
#'
#' \link{jet.colors} create a vector of n continuous colors from blue to red.
#'
#' \link{black.white} create a vector of n continuous colors from black to white.
#'
#' \link{white.black} create a vector of n continuous colors from white to black.
#'
#' \strong{Example data:}
#'
#' \link{mNine} is a dataset of SonTek ADCP transects exported from RiverSurveyor Live as Matlab files.
#'
#' \link{vels} is a dataset of processed planform data collected with a SonTek m9 ADCP.
#'
#' \link{cellVels} is a dataset of processed cross-section data collected with a SonTek m9 ADCP.
#'
#' @author	Jason L. Fischer
#'
#' @references
#' Cheng-Lung, 1991 "Unified Theory on Power Laws for Flow Resistance." Journal of Hydraulic Engineering, \bold{117}, 371--389. 
#'
#' Czuba, J.A., Best, J.L., Oberg, K.A., Parsons, D.R., Jackson, P.R., Garcia, M.H., Ashmore, P., 2011 Bed morphology, flow structure, and sediment transport at the outlet of Lake Huron and in the upper St. Clair River. Journal of Great Lakes Research \bold{37}, 480--493. 
#'
#' Garcia, M.H., 2008 Sediment transport and morphodynamics, chap. 2. In: Garcia, M.H. (Ed.), \emph{Sedimentation Engineering: Processes, Measurements, Modeling, and Practice No. 110}. American Society of Civil Engineers, Reston, Virginia, pp. 21--163.
#'
#' Keulegan, G.H., 1938 Laws of turbulent flow in open channels. Journal of Research of the National Bureau Standards \bold{21}, 707--741.
#'
#' Lane, S.N., Bradbrook, K.F., Richards, K.S., Biron, P.M., Roy, A.G., 2000 Secondary circulation cells in river channel confluences: Measurement artefacts or coherent flow structures? Hydrological Processes \bold{14}, 2047--2071.
#'
#' Mueller, D.S., Wagner, C.R., Rehmel, M.S., Oberg, K.A,, Rainville, F., 2013 \emph{Measuring discharge with acoustic Doppler current profilers from a moving boat (ver. 2.0, December 2013): U.S. Geological Survey Techniques and Methods}, book 3, chap. A22, 95p.
#'
#' Parsons, D.R., Jackson, P.R., Czuba, J.A., Engel, F.L., Rhoads, B.L., Oberg, K.A., Best, J.L., Mueller, D.S., Johnson, K.K., Riley, J.D., 2013 Velocity mapping toolbox (VMT): A processing and visualization suite for moving-vessel ADCP measurements. Earth Surface Processes and Landforms \bold{38}, 1244--1260.
#'
#' Rhoads, B.L., Kenworthy, S.T., 1998 Time-averaged flow structure in the central region of a stream confluence. Earth Surface Processes and Landforms \bold{23}, 171--191.
#'
#' Simpson, M.R., Oltmann, R.N., 1990 "An Acoustic Doppler Discharge Measurement System." Proceedings of the 1990 National Conference on Hydraulic Engineering, \bold{2}, 903--908. 
#'
#' Szupiany, R.N., Amsler, M.L., Best, J.L., Parsons, D.R., 2007 Comparison of fixed- and moving-vessel flow measurements with aDp in large a river. Journal of Hydraulic Engineering \bold{133}, 1299--1309.
#'
#' @section Disclaimer:
#' Although this program has been used by the USGS, no warranty, expressed or implied, is made by the USGS or the United States Government as to the accuracy and functioning of the program and related program material nor shall the fact of distribution constitute any such warranty, and no responsibility is assumed by the USGS in connection therewith.
#'
#' @section Additional Information:
#' U.S. Geological Survey (USGS) Computer Program \pkg{rivSurveyR} version 2.1-0
#'
#' Written by Jason L. Fischer, USGS - Great Lakes Science Center; \href{http://www.glsc.usgs.gov/}{glsc.usgs.gov}; Ann Arbor, Michigan, USA.
#'
#' Written in programming language R (R Core Team, 2015, \href{http://www.R-project.org}{R-project.org}), version 3.3.0 (2016-05-03).
#'
#' Run on a PC with Intel(R) Core(TM) i5 CPU, M 520 at 2.40 GHz processor, 8.0 GB RAM, and Microsoft Windows 7 Enterprise operating system 2009 Service Pack 1.
#'
#' Source code is available from Jason L. Fischer on GitHub \href{https://github.com/jasonfischer/rivSurveyR}{github.com/jasonfischer/rivSurveyR}, \emph{jfischer (at) usgs (dot) gov}.
#'
#' @docType	package
#' @name	rivSurveyR
#'
NULL