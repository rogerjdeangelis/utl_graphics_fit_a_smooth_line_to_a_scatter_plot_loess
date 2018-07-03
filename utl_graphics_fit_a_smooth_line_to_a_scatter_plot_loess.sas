Graphics fit a smooth line to a scatter plot loess

    TWO SOLUTIONS

          1. SAS Proc sgscatter
          2. WPS Proc R ggplot


SAS Graphic
https://tinyurl.com/y8u4mnee
https://github.com/rogerjdeangelis/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess/blob/master/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess_loess.pdf

WPS Proc R graphic
https://tinyurl.com/ybxq3f4o
https://github.com/rogerjdeangelis/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess/blob/master/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess_ggplot.pdf

github
https://tinyurl.com/y987dhzb
https://github.com/rogerjdeangelis/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess

StackOverflow
https://tinyurl.com/y725fzs8
https://stackoverflow.com/questions/51113517/how-to-solve-this-exercise

see O Hong profile
https://stackoverflow.com/users/9320823/0-hong


INPUT
=====

 SD1.HAVE total obs=328

                               REL_
  Obs     CITY       DATE      SALES

    1    Austin    2000.00    -0.207
    2    Austin    2000.08    -0.156
    3    Austin    2000.25    -0.286
    4    Austin    2000.33    -0.172
    5    Austin    2000.42    -0.275
    6    Austin    2000.50    -0.278
  ...
  325    Waco      2015.08     0.319
  326    Waco      2015.17     0.298
  327    Waco      2015.33     0.301
  328    Waco      2015.42     0.356


 EXAMPLE OUTPUT

     |
 0.5 +                                       *
     |                  ^*
     |        *        /\                  /  *
     |  *   * *  *    /**\*  *           */****
     |         * *  */****\ *          **/****
     |  **        **/**  **\**  **   ***/******
     | * **    * **/**    **\ **** ** */* *  *
 0.0 +        ****/*       **\ *** * */ *    *
     |  *  * **  /*    *  * * \* ** */***     *
     |**********/*           **\* * /* *     *
     |* * ***  / *           ** \**/ *
     | *    **/ *             *  \/  *
     |* *** */ **                ***
     |*  ** /      *             **
-0.5 +  *  /                  *
     |    /                        *
     |  */
     |  / *
     | /
     |/*
     |
-1.0 +  *
     -+------------+------------+------------+------------+
    2000         2005         2010         2015        2020



PROCESS
=======

  1. SAS Proc sgscatter

     title;footnote;
     ods pdf file="d:/pdf/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess_loess.pdf";
     proc sgscatter data=sd1.have;
        compare y=rel_sales x=date / markerattrs=(size=3) loess=(clm) spacing=10;
     run;quit;
     ods pdf close;

  2. WPS Proc R ggplot (working code)

     pdf("d:/pdf/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess_ggplot.pdf");
     ggplot(have, aes(DATE,REL_SALES)) +
       geom_point(aes(group = CITY), alpha = 1/5) +
       geom_smooth(method = "lm", formula = y ~ splines::bs(x, df = 15, degree = 3), se = FALSE);

   dev.off();

OUTPUT
======
   SAS
   https://tinyurl.com/y8u4mnee

   WPS Proc R graphic
   https://tinyurl.com/ybxq3f4o

*                _               _       _
 _ __ ___   __ _| | _____     __| | __ _| |_ __ _
| '_ ` _ \ / _` | |/ / _ \   / _` |/ _` | __/ _` |
| | | | | | (_| |   <  __/  | (_| | (_| | || (_| |
|_| |_| |_|\__,_|_|\_\___|   \__,_|\__,_|\__\__,_|

;

data sd1.have;
  input city$ +1  date 7.2 +1 rel_sales 6.3 +1  @@;
cards4;
Austin  2000.00 -0.207 Austin  2000.08 -0.156 Austin  2000.25 -0.286 Austin
2000.33 -0.172 Austin  2000.42 -0.275 Austin  2000.50 -0.278 Austin  2000.58
-0.213 Austin  2000.75 -0.162 Austin  2000.83 -0.247 Austin  2001.00 -0.149
Austin  2001.50 -0.249 Austin  2001.67 -0.325 Austin  2001.83 -0.138 Austin
2002.00 -0.073 Austin  2002.17 -0.237 Austin  2002.42 -0.305 Austin  2002.58
-0.290 Austin  2002.67 -0.306 Austin  2003.67 -0.007 Austin  2003.83 -0.157
Austin  2003.92 -0.027 Austin  2004.17 -0.175 Austin  2004.58  0.003 Austin
2004.75 -0.050 Austin  2005.17  0.098 Austin  2005.75  0.171 Austin  2006.00
 0.295 Austin  2006.33  0.226 Austin  2006.50  0.219 Austin  2006.58  0.288
Austin  2006.67  0.302 Austin  2007.00  0.265 Austin  2007.17  0.281 Austin
2007.25  0.215 Austin  2007.67  0.037 Austin  2007.92 -0.001 Austin  2008.17
 0.042 Austin  2008.33  0.000 Austin  2008.50 -0.046 Austin  2008.92 -0.222
Austin  2009.17 -0.271 Austin  2009.25 -0.202 Austin  2009.83  0.082 Austin
2010.08 -0.178 Austin  2010.25  0.074 Austin  2010.50 -0.381 Austin  2010.67
-0.307 Austin  2010.75 -0.294 Austin  2011.50 -0.104 Austin  2011.75 -0.121
Austin  2012.25  0.027 Austin  2012.33  0.105 Austin  2012.42  0.134 Austin
2012.58  0.129 Austin  2012.75  0.193 Austin  2013.17  0.193 Austin  2013.33
 0.302 Austin  2013.75  0.271 Austin  2015.08  0.282 Austin  2015.25  0.302
Austin  2015.42  0.285 Dallas  2000.25 -0.148 Dallas  2000.58 -0.139 Dallas
2000.75 -0.113 Dallas  2000.83 -0.061 Dallas  2001.67 -0.159 Dallas  2001.83
-0.071 Dallas  2001.92 -0.091 Dallas  2003.25 -0.123 Dallas  2003.42 -0.109
Dallas  2003.50 -0.013 Dallas  2003.58 -0.004 Dallas  2003.83 -0.116 Dallas
2004.08  0.002 Dallas  2004.25  0.082 Dallas  2004.42  0.020 Dallas  2004.50
 0.046 Dallas  2004.58  0.038 Dallas  2004.67  0.065 Dallas  2004.75  0.037
Dallas  2005.00  0.062 Dallas  2005.08  0.101 Dallas  2005.17  0.166 Dallas
2005.33  0.097 Dallas  2005.50  0.120 Dallas  2005.67  0.200 Dallas  2006.17
 0.261 Dallas  2006.75  0.222 Dallas  2006.83  0.236 Dallas  2007.00  0.257
Dallas  2007.08  0.222 Dallas  2007.33  0.167 Dallas  2007.75  0.086 Dallas
2007.92 -0.005 Dallas  2008.08  0.129 Dallas  2008.17 -0.008 Dallas  2008.50
-0.006 Dallas  2009.08 -0.132 Dallas  2009.33 -0.224 Dallas  2009.67 -0.029
Dallas  2009.92 -0.116 Dallas  2010.00 -0.238 Dallas  2011.17 -0.229 Dallas
2011.25 -0.193 Dallas  2011.67 -0.156 Dallas  2011.75 -0.212 Dallas  2012.00
-0.093 Dallas  2012.75  0.044 Dallas  2012.92  0.007 Dallas  2013.33  0.178
Dallas  2013.50  0.204 Dallas  2013.58  0.212 Dallas  2013.92  0.097 Dallas
2014.00  0.117 Dallas  2014.42  0.155 Dallas  2014.50  0.194 Dallas  2014.58
 0.165 Dallas  2014.67  0.210 Dallas  2014.83  0.089 Dallas  2014.92  0.214
Dallas  2015.25  0.150 Dallas  2015.33  0.145 Paris  2000.25  0.091 Paris
2000.67  0.122 Paris  2000.83 -0.061 Paris  2000.92  0.311 Paris  2001.00  0.102
Paris  2001.25  0.139 Paris  2001.50  0.047 Paris  2001.58 -0.154 Paris  2002.17
-0.146 Paris  2002.42  0.266 Paris  2002.50 -0.111 Paris  2002.67 -0.095 Paris
2003.00  0.354 Paris  2003.08  0.291 Paris  2003.17 -0.085 Paris  2003.50  0.184
Paris  2003.58  0.222 Paris  2004.17 -0.146 Paris  2004.25  0.249 Paris  2004.33
 0.260 Paris  2004.67  0.020 Paris  2004.75  0.117 Paris  2004.92 -0.410 Paris
2005.00 -0.011 Paris  2005.17  0.052 Paris  2005.58  0.119 Paris  2005.67  0.259
Paris  2005.75  0.143 Paris  2005.83  0.244 Paris  2006.08  0.238 Paris  2006.42
 0.286 Paris  2006.50  0.866 Paris  2006.58  0.182 Paris  2006.67 -0.036 Paris
2006.92  0.255 Paris  2007.00  0.296 Paris  2007.08  0.411 Paris  2007.17  0.449
Paris  2007.58  0.316 Paris  2008.58  0.052 Paris  2008.92 -0.122 Paris  2009.08
-0.195 Paris  2009.17  0.077 Paris  2009.42 -0.491 Paris  2009.50 -0.083 Paris
2009.75 -0.028 Paris  2009.83  0.008 Paris  2010.25 -0.221 Paris  2010.50 -0.448
Paris  2010.58 -0.451 Paris  2010.83 -0.302 Paris  2011.00 -0.591 Paris  2011.08
-0.328 Paris  2011.33 -0.328 Paris  2011.75 -0.275 Paris  2012.08  0.153 Paris
2012.50 -0.083 Paris  2012.58 -0.126 Paris  2012.67 -0.125 Paris  2012.75 -0.127
Paris  2013.08  0.028 Paris  2013.17 -0.057 Paris  2013.25 -0.067 Paris  2013.67
 0.237 Paris  2014.17  0.126 Paris  2014.83 -0.135 Paris  2014.92  0.101 Paris
2015.00 -0.011 Paris  2015.08 -0.115 Paris  2015.17 -0.001 Paris  2015.25 -0.067
Tyler  2000.00 -0.333 Tyler  2000.58 -0.389 Tyler  2000.67 -0.470 Tyler  2001.00
-0.369 Tyler  2001.67 -0.406 Tyler  2001.75 -0.195 Tyler  2001.83 -0.174 Tyler
2002.08 -0.074 Tyler  2002.25 -0.417 Tyler  2002.33 -0.222 Tyler  2002.42 -0.341
Tyler  2002.83 -0.386 Tyler  2003.25 -0.298 Tyler  2003.33 -0.354 Tyler  2003.75
-0.253 Tyler  2003.83 -0.342 Tyler  2003.92  0.015 Tyler  2004.00 -0.282 Tyler
2004.25 -0.027 Tyler  2004.33  0.038 Tyler  2004.67  0.148 Tyler  2004.83  0.058
Tyler  2005.08  0.037 Tyler  2005.17  0.087 Tyler  2005.42  0.073 Tyler  2005.58
 0.273 Tyler  2005.67  0.075 Tyler  2006.00  0.160 Tyler  2006.17  0.247 Tyler
2006.25  0.127 Tyler  2006.33  0.252 Tyler  2006.67  0.223 Tyler  2007.00  0.238
Tyler  2007.08  0.267 Tyler  2007.50  0.218 Tyler  2007.67  0.190 Tyler  2007.75
 0.147 Tyler  2007.83  0.282 Tyler  2008.00  0.069 Tyler  2008.50  0.065 Tyler
2008.67  0.137 Tyler  2009.33 -0.267 Tyler  2009.58 -0.043 Tyler  2009.83  0.109
Tyler  2009.92 -0.019 Tyler  2010.00  0.014 Tyler  2010.33 -0.001 Tyler  2010.58
-0.205 Tyler  2010.75 -0.154 Tyler  2011.25  0.005 Tyler  2011.42  0.073 Tyler
2011.50 -0.038 Tyler  2011.67  0.059 Tyler  2011.75 -0.038 Tyler  2012.17  0.090
Tyler  2012.25  0.005 Tyler  2012.33  0.024 Tyler  2013.00  0.222 Tyler  2013.08
 0.158 Tyler  2013.33  0.144 Tyler  2013.42  0.141 Tyler  2013.50  0.245 Tyler
2013.58  0.200 Tyler  2013.83  0.235 Tyler  2013.92  0.125 Tyler  2014.17  0.130
Tyler  2014.25  0.249 Tyler  2014.33  0.318 Tyler  2014.58  0.172 Tyler  2015.17
 0.516 Tyler  2015.42  0.372 Waco  2000.08 -0.418 Waco  2000.17 -0.843 Waco
2000.25 -0.851 Waco  2000.33 -1.268 Waco  2000.75 -0.736 Waco  2000.83 -0.998
Waco  2000.92 -0.656 Waco  2001.08 -0.441 Waco  2001.33 -0.362 Waco  2001.58
-0.403 Waco  2001.67 -0.742 Waco  2003.17 -0.022 Waco  2003.33 -0.012 Waco
2003.50  0.079 Waco  2004.17 -0.189 Waco  2004.58  0.024 Waco  2004.75 -0.056
Waco  2004.83  0.138 Waco  2005.25  0.173 Waco  2005.33  0.201 Waco  2005.42
 0.247 Waco  2006.58  0.214 Waco  2007.17  0.238 Waco  2007.50  0.147 Waco
2007.58  0.157 Waco  2007.67 -0.048 Waco  2008.33  0.214 Waco  2008.42  0.142
Waco  2008.67  0.256 Waco  2008.83 -0.213 Waco  2009.17 -0.057 Waco  2009.25
-0.061 Waco  2009.33 -0.060 Waco  2009.42  0.106 Waco  2009.75  0.095 Waco
2010.17  0.071 Waco  2010.33  0.128 Waco  2010.42 -0.064 Waco  2010.58 -0.340
Waco  2010.75 -0.075 Waco  2011.00 -0.012 Waco  2011.25  0.060 Waco  2011.33
 0.033 Waco  2011.42 -0.042 Waco  2011.92 -0.007 Waco  2012.08 -0.079 Waco
2012.17 -0.039 Waco  2012.42 -0.011 Waco  2012.58  0.157 Waco  2013.00  0.013
Waco  2013.08  0.187 Waco  2013.25  0.097 Waco  2013.33  0.193 Waco  2013.83
 0.238 Waco  2014.17  0.112 Waco  2014.33  0.201 Waco  2014.42  0.286 Waco
2014.50  0.139 Waco  2014.75  0.296 Waco  2014.83  0.138 Waco  2015.08  0.319
Waco  2015.17  0.298 Waco  2015.33  0.301 Waco  2015.42  0.356 Waco  2015.50
;;;;
run;quit;

*          _       _   _
 ___  ___ | |_   _| |_(_) ___  _ __
/ __|/ _ \| | | | | __| |/ _ \| '_ \
\__ \ (_) | | |_| | |_| | (_) | | | |
|___/\___/|_|\__,_|\__|_|\___/|_| |_|

;

SAS see process

WPS PROC R

%utl_submit_wps64('
libname sd1 "d:/sd1";
options set=R_HOME "C:/Program Files/R/R-3.3.2";
libname wrk  sas7bdat "%sysfunc(pathname(work))";
proc r;
submit;
source("C:/Program Files/R/R-3.3.2/etc/Rprofile.site", echo=T);
library(haven);
library(tidyverse);
library(ggplot2);
library(dplyr);
have<-read_sas("d:/sd1/have.sas7bdat");
pdf("d:/pdf/utl_graphics_fit_a_smooth_line_to_a_scatter_plot_loess_ggplot.pdf");
ggplot(have, aes(DATE,REL_SALES)) +
  geom_point(aes(group = CITY), alpha = 1/5) +
  geom_smooth(method = "lm", formula = y ~ splines::bs(x, df = 15, degree = 3), se = FALSE);
dev.off();
endsubmit;
run;quit;
');

