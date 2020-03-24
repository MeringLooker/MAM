include: "/AdWords/*.view"
include: "/Google_Analytics/**/*.view"

explore: mam_sem {
  hidden: yes
  view_name: mam_sem_view
#   always_filter: {
#     filters: {
#       field: advertising_channel
#       value: "Search"
#     }
#   }
  label: "AdWords Search"
  view_label: "AdWords Search"
  group_label: "Mammoth Lakes Tourism"

  join: mam_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${mam_sem_view.join_id} = ${mam_ga_onsite.adwords_join_id};;
    relationship: many_to_one
  }
}

explore: mam_gdn {
  hidden: yes
  view_name: mam_gdn_view
#   always_filter: {
#     filters: {
#       field: advertising_channel
#       value: "Display"
#     }
#   }
  label: "AdWords Display"
  view_label: "AdWords Display"
  group_label: "Mammoth Lakes Tourism"

  join: mam_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${mam_gdn_view.join_id} = ${mam_ga_onsite.adwords_join_id}  ;;
    relationship: one_to_many
  }
}
