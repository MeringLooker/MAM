include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: mam_fb {
  view_name: mam_fb_ga_view
  hidden: yes
  label: "Facebook"
  view_label: "Facebook"
  group_label: "Mammoth Lakes Tourism"

#   join: facebookads__visit_mammoth_actions {
#     view_label: "Facebook Actions"
#     type: left_outer
#     fields: []
#     sql_on: ${facebookads__visit_mammoth_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
#     relationship: many_to_one
#   }
#
#   join: facebookads__visit_mammoth_video_p100_watched_actions {
#     view_label: "Vid Completes"
#     type: left_outer
#     fields: []
#     sql_on: ${facebookads__visit_mammoth_video_p100_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
#     relationship: many_to_one
#   }
#
#   join: facebookads__visit_mammoth_video_p75_watched_actions {
#     view_label: "Vid Completes"
#     type: left_outer
#     fields: []
#     sql_on: ${facebookads__visit_mammoth_video_p75_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
#     relationship: many_to_one
#   }
#
#   join: facebookads__visit_mammoth_video_p50_watched_actions {
#     view_label: "Vid Completes"
#     type: left_outer
#     fields: []
#     sql_on: ${facebookads__visit_mammoth_video_p50_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
#     relationship: many_to_one
#   }
#
#   join: facebookads__visit_mammoth_video_p25_watched_actions {
#     view_label: "Vid Completes"
#     type: left_outer
#     fields: []
#     sql_on: ${facebookads__visit_mammoth_video_p25_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
#     relationship: many_to_one
#   }
#
#   join: mam_fb_thruplays {
#     type: left_outer
#     fields: []
#     sql_on: ${mam_fb_view.thruplay_join_id} = ${mam_fb_thruplays.thruplay_join} ;;
#     relationship: one_to_many
#   }
#
#   join: mam_ga_onsite {
#     view_label: "Google Analytics"
#     type: left_outer
#     fields: []
#     sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
#     relationship: one_to_many
#   }
#
#   join: mam_ga_userinfo {
#     view_label: "Google Analytics - User Info"
#     type: left_outer
#     sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
#     relationship: one_to_many
#   }
#
#   join: mam_ga_pageinfo {
#     view_label: "Google Analytics - Page Info"
#     type: left_outer
#     sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
#     relationship: one_to_many
#   }
#
#   join: mam_ga_events {
#     view_label: "Google Analytics - Events"
#     type: left_outer
#     sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
#     relationship: one_to_many
#   }
#
#   join: mam_ga_goals {
#     view_label: "Google Analytics - Goals"
#     type: left_outer
#     sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
#     relationship: one_to_many
#   }
}
