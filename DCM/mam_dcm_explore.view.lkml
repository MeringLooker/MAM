include: "/DCM/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: mam_dcm {
  view_name: mam_dcm_ga_view
  hidden: yes
  label: "DoubleClick"
  view_label: "DoubleClick"
  group_label: "Mammoth Lakes Tourism"

  join: mam_fy20_winter_seasonal_dcm_view {
    view_label: "Publisher Passback - FY20 Winter Seasonal"
    type: inner
    sql_on: ${mam_fy20_winter_seasonal_dcm_view.passback_join} = ${mam_dcm_ga_view.passback_join} ;;
    relationship: one_to_many
  }

  join: mam_fy20_winter_air_amobee {
    view_label: "Publisher Passback - FY20 Winter Air"
    type: inner
    sql_on: ${mam_fy20_winter_air_amobee.passback_join} = ${mam_dcm_ga_view.passback_join} ;;
    relationship: one_to_many
  }

  join: mam_fy21_winter_dcm_view_v2 {
    view_label: "FY21 Winter - AdTheorent Video"
    type: inner
    sql_on: ${mam_dcm_ga_view.passback_join_ad} = ${mam_fy21_winter_dcm_view_v2.dcm_join_id} ;;
    relationship: many_to_one
  }

  join: mam_fy21_springsummer_dcm_view {
    view_label: "FY21 Spring/Summer - AdTheorent Video"
    type: inner
    sql_on: ${mam_dcm_ga_view.passback_join_ad} = ${mam_fy21_springsummer_dcm_view.dcm_join_id} ;;
    relationship: many_to_one
  }
}
