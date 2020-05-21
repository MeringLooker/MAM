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

  join: mam_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${mam_dcm_ga_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: many_to_one
  }

  join: mam_ga_userinfo {
    view_label: "Google Analytics - User Info"
    type: left_outer
    sql_on: ${mam_dcm_ga_view.comp_key} = ${mam_ga_userinfo.join_id} ;;
    relationship: many_to_one
  }

  join: mam_ga_pageinfo {
    view_label: "Google Analytics - Page Info"
    type: left_outer
    sql_on: ${mam_dcm_ga_view.comp_key} = ${mam_ga_pageinfo.join_id} ;;
    relationship: many_to_one
  }

  join: mam_ga_events {
    view_label: "Google Analytics - Events"
    type: left_outer
    sql_on: ${mam_dcm_ga_view.comp_key} = ${mam_ga_events.join_id} ;;
    relationship: many_to_one
  }

  join: mam_ga_goals {
    view_label: "Google Analytics - Goals"
    type: left_outer
    sql_on: ${mam_dcm_ga_view.comp_key} = ${mam_ga_goals.join_id} ;;
    relationship: many_to_one
  }
}
