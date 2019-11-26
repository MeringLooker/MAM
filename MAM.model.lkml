connection: "mc_panoply"

# include all the views
include: "/AdWords/**/*.view"
include: "/DCM/**/*.view"
include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"
include: "/TrueView/**/*.view"

datagroup: mam_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

label: "Mammoth Lakes Tourism"

persist_with: mam_default_datagroup




#### Exploring AdWords Test Data #####

explore: mam_sem_gdn {
  label: "AdWords"
  view_label: "AdWords Test"
  group_label: "Mammoth Lakes Tourism"
}

#### Exploring Facebook Data #####

explore: mam_fb_view {
  label: "Facebook"
  view_label: "Facebook"
  group_label: "Mammoth Lakes Tourism"

  join: facebookads__visit_mammoth_actions {
    view_label: "Facebook Actions"
    type: left_outer
    fields: []
    sql_on: ${facebookads__visit_mammoth_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
    relationship: many_to_one
  }

  join: facebookads__visit_mammoth_video_p100_watched_actions {
    view_label: "Vid Completes"
    type: left_outer
    fields: []
    sql_on: ${facebookads__visit_mammoth_video_p100_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
    relationship: many_to_one
  }

  join: facebookads__visit_mammoth_video_p75_watched_actions {
    view_label: "Vid Completes"
    type: left_outer
    fields: []
    sql_on: ${facebookads__visit_mammoth_video_p75_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
    relationship: many_to_one
  }

  join: facebookads__visit_mammoth_video_p50_watched_actions {
    view_label: "Vid Completes"
    type: left_outer
    fields: []
    sql_on: ${facebookads__visit_mammoth_video_p50_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
    relationship: many_to_one
  }

  join: facebookads__visit_mammoth_video_p25_watched_actions {
    view_label: "Vid Completes"
    type: left_outer
    fields: []
    sql_on: ${facebookads__visit_mammoth_video_p25_watched_actions.facebookads__visit_mammoth_id} = ${mam_fb_view.id} ;;
    relationship: many_to_one
  }

  join: mam_ga_onsite {
    view_label: "Google Analytics"
    type: left_outer
    fields: []
    sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_userinfo {
    view_label: "Google Analytics - User Info"
    type: left_outer
    sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_pageinfo {
    view_label: "Google Analytics - Page Info"
    type: left_outer
    sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_events {
    view_label: "Google Analytics - Events"
    type: left_outer
    sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }

  join: mam_ga_goals {
    view_label: "Google Analytics - Goals"
    type: left_outer
    sql_on: ${mam_fb_view.comp_key} = ${mam_ga_onsite.join_id} ;;
    relationship: one_to_many
  }
}

######## Exploring DCM Data #########

explore: mam_dcm_view {
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


# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }
