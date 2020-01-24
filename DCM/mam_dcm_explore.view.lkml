include: "/DCM/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: mam_dcm {
  view_name: mam_dcm_view
  hidden: yes
  label: "DoubleClick"
  view_label: "DoubleClick"
  group_label: "Mammoth Lakes Tourism"

  join: mam_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${mam_dcm_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_userinfo {
    view_label: "Google Analytics - User Info"
    type: left_outer
    sql_on: ${mam_dcm_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_pageinfo {
    view_label: "Google Analytics - Page Info"
    type: left_outer
    sql_on: ${mam_dcm_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_events {
    view_label: "Google Analytics - Events"
    type: left_outer
    sql_on: ${mam_dcm_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_goals {
    view_label: "Google Analytics - Goals"
    type: left_outer
    sql_on: ${mam_dcm_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }
}
