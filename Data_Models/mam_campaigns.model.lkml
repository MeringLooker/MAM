connection: "mc_panoply"

include: "/Derived_Tables/*/*.view"
include: "/AdWords/*.view"
include: "/Google_Analytics/**/*.view"
include: "/TrueView/**/*.view"
include: "/DCM/**/*.view"
include: "/Pinterest/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Campaign_Final/**/*.view"

datagroup: mam_default_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

## FY21 Winter Campaign ##

explore: pdt_fy21_winter_campaign {
  label: "FY21 Winter"
  view_label: "Campaign Delivery"
  hidden: no
  group_label: "Mammoth Lakes Tourism"

    # join: mam_fy21_winter_pacing {
    # view_label: "Campaign Pacing"
    # type: left_outer
    # sql_on: ${mam_fy21_winter_pacing.pacing_key} = ${pdt_fy21_winter_campaign.pacing_key} ;;
    # relationship: one_to_many
    # }
}

## FY21 Summer Recovery Campaign ##

explore: mam_fy21_summer_recovery_campaign {
  label: "FY21 Recovery"
  view_label: "FY21 Recovery"
  hidden: no
  group_label: "Mammoth Lakes Tourism"
}

## FY20 Winter Air Service Campaign ##

explore: mam_fy20_winter_air_campaign {
  label: "FY20 Winter Air Service"
  view_label: "FY20  Winter Air Service"
  hidden: yes
  group_label: "Mammoth Lakes Tourism"
}

## FY20 Winter Seasonal Campaign ##

explore: mam_fy20_winter_seasonal_campaign {
  label: "FY20 Winter Seasonal"
  view_label: "Winter Seasonal"
  hidden: yes
  group_label: "Mammoth Lakes Tourism"
}
