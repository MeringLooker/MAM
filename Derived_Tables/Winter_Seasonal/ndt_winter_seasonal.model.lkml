connection: "mc_panoply"

include: "*.view.lkml"
include: "/AdWords/*.view"
include: "/Google_Analytics/**/*.view"
include: "/Facebook/**/*.view"
include: "/DCM/**/*.view"
include: "/TrueView/**/*.view"
include: "/Pinterest/**/*.view"

datagroup: mam_winter_air_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: ndt_winter_seasonal_campaign {
 label: "Winter Seasonal Service"
  view_label: "Winter Seasonal Service"
  hidden: yes
  group_label: "Mammoth Lakes Tourism"}

explore: ndt_winter_seasonal_trueview {
  label: "Winter Seasonal Youtube"
  view_label: "Winter Seasonal Service"
  hidden: yes
  group_label: "Mammoth Lakes Tourism"}
