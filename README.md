# raimbow-whaleRisk

<!-- badges: start -->
<!-- badges: end -->

This repository contains code for the RAIMBOW (Risk Assessment Integration for Mitigating Bycatch of Whales) project. Code for various pieces of the project are divided into folders:

* JS_OceanVisions: Code used to create plots of Jameal's April 2019 OceanVisions presentation

* humpback_risk: Files and code used to determine the risk of entanglement for humpbacks in the Dungeness Crab fishery off the US west coast.

* tradeoffs: Tradeoff analyses for humpback and blue whale entanglement risk and Dungeness Crab fishery activity

* whalepreds_aggregate: Functions to summarize whale predictions by specified time interval. DO NOT EDIT; any edits should be done in [the whale-model-prep repository](https://github.com/smwoodman/whale-model-prep) and copied over

Other files include:

* User_script_local.R: Script for determining whom is running the code (user info used to set appropriate file paths); sourced in relevant files


<!-- humpback_risk files -->
## "humpback_risk" file descriptions

Note that these files are numbered according to files dependencies. For instance, "3_" files depend on output from "2_" files, etc.

<!-- section break -->
#### Analysis files (markdown files)

* 2_Whale_risk.Rmd: Calculates (humpback) whale risk of entanglement for each grid cell as: humpback density * fishing measure. This file then saves the humpback (density), fishing (total sum), and risk (density) values as an RDATA file for use in subsequent files.

* 3_Entanglement_report_mnpred.Rmd: Compare entnglement report locations with humpback predictions for Karin.

* 3_Whale_risk_maps.Rmd: Generates heat maps of data saved in Whale_risk.Rmd.

* 3_Whale_risk_timeseries.Rmd: Using RDATA file generated by Whale_risk.Rmd, summarizes and plots humpback whale risk of entanglement by region over time. Note that file has been updated to use 'long' data to make future adaptations/code adjustments easier

* 4_Entanglement_gridID.Rmd: Determine grid cell values, for report location and gear set county, for CA DC humpback entanglements with known gear set/time

* 4_Entanglements_risk.Rmd: Examine relationship between risk values and entanglement reports, including using lookback window

* 4_Whale_risk_management.Rmd: Examine the change in humpback entanglement risk under different management scenarios, e.g. early or late season closures

* 4_Whale_risk_management_displacement.Rmd: Examine the change in humpback entanglement risk under different management scenarios, e.g. early or late season closures, while accounting for effort displacement

* 4_Whale_risk_timeseries_base.Rmd: A look at how risk would change if all humpback or fishing values were 'baseline' values, meaning the average of the values for the 2009-2010 to 2012-2013 fishing seasons

* 5_Whale_risk_timeseries_presentation.Rmd: Starting point of JVR presentation on Mn risk assessment for TriState call

* \_county_: Analyses (described above) but using CA counties instead of CA regions

<!-- section break -->
#### Analysis files (other)

* Timeseries_forJVR.R: Output various humpback risk data to CSV files for JVR

* VMS_nonconfidential_duplicates.R: Identify duplicate rows in CA-only, non-confidential data

<!-- section break -->
#### Helper files - functions

* plot_raimbow.R: Functions for plotting objects (specifically maps) from humpback_risk raimbow analyses

* Funcs_whale_risk_mgmt.R: Functions for running and plotting output from management scenarios

* Funcs_whale_risk_timeseries.R: Functions for creating time series plots
