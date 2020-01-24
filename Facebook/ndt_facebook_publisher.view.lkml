# include: "/MAM.model"
#
# view: ndt_facebook_publisher{
#   derived_table: {
#     explore_source: mam_fb_view {
#       column:fb_publisher{}
#       column: campaign_name {}
#       column: test_date_string {}
#       #column: date_start_date {}
#       column: total_impressions{}
#       column: total_clicks {}
#       column: total_spend {}
#       column: ga_sessions {}
#       column: ga_total_session_duration{}
#       column: fb_region {}
#       column:fb_campaign {}
#       column:season {}
#       filters: {
#         field: mam_fb_view.fb_campaign
#         value: "Air Service"
#       }
#     }
#
#   }
#   dimension: fb_publisher {
#     primary_key: yes
#     label: "FB Publisher"
#     type: string
#   }
#
#   dimension: campaign_name {
#     label: "FB Campaign"
#     type: string
#   }
#
#
# dimension: test_date_string  {
#   type: string
#   }
#
# #   dimension_group: date_start {
# #     type: time
# #     timeframes: [
# #       raw,
# #       time,
# #       date,
# #       week,
# #       month,
# #       quarter,
# #       year
# #     ]
# #   }
#
#   dimension: total_impressions {
#     label: "FB Total Impressions"
#     type: number
#   }
#
#   dimension: total_clicks {
#     label: "FB Total Clicks"
#     type: number
#   }
#
#   dimension: total_spend {
#     label: "FB Total Cost"
#     type: number
#     value_format: "$0.000"
#   }
#
#   dimension: ga_sessions {
#     label: "FB Total Sessions"
#     type: number
#   }
#
#   dimension: ga_total_session_duration {
#     label: "FB Total Session Duration"
#     type: number
#   }
#
#   dimension: fb_region {
#     label: "FB Region"
#     type: string
#   }
#
#   dimension: fb_campaign {
#     label: "FB Campaign Layer"
#     type: string
#   }
#
#   dimension: season {
#     label: "DCM Season"
#     type: string
#   }
#
#
#
# }
