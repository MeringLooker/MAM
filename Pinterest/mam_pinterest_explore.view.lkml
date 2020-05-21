include: "/Pinterest/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: mam_pinterest {
  view_name: mam_pinterest_ga_view
  hidden: yes
  label: "Pinterest"
  view_label: "Pinterest"
  group_label: "Mammoth Lakes Tourism"

#   join: mam_ga_onsite {
#     view_label: "Google Analytics"
#     type: left_outer
#     fields: []
#     sql_on: ${mam_pinterest.pinterest_ga_join} = ${mam_ga_onsite.join_id} ;;
#     relationship: one_to_many
#   }

}
