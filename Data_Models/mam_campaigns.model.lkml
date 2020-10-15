connection: "mc_panoply"

include: "/Derived_Tables/*/*.view"
include: "/AdWords/*.view"
include: "/Google_Analytics/**/*.view"
include: "/TrueView/**/*.view"
include: "/DCM/**/*.view"
include: "/Pinterest/**/*.view"
include: "/Publisher_Passback/**/*.view"

datagroup: 24hour_cache {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

## FY21 Summer Recovery Campaign ##

explore: pdt_summer_recovery_campaign {
  label: "FY21 Recovery"
  view_label: "FY21 Recovery"
  hidden: no
  group_label: "Mammoth Lakes Tourism"
}

## FY20 Winter Air Service Campaign ##

explore: ndt_winter_air_campaign{
  label: "FY20 Winter Air Service"
  view_label: "FY20  Winter Air Service"
  hidden: yes
  group_label: "Mammoth Lakes Tourism"
}

## FY20 Winter Seasonal Campaign ##

explore: ndt_winter_seasonal_campaign {
  label: "FY20 Winter Seasonal"
  view_label: "Winter Seasonal"
  hidden: yes
  group_label: "Mammoth Lakes Tourism"
}
