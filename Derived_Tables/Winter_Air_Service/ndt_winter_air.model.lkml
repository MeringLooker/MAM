connection: "mc_panoply"

include: "*.view.lkml"
include: "/AdWords/*.view"
include: "/Google_Analytics/**/*.view"
include: "/Facebook/**/*.view"
include: "/DCM/**/*.view"

datagroup: mam_winter_air_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: ndt_winter_air_campaign{
  label: "Winter Air Service"
  view_label: "Winter Air Service"
  hidden: yes
  group_label: "Mammoth Lakes Tourism"
}
