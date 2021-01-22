# view: pdt_summer_recovery_gdn {
#   derived_table: {
#     explore_source: mam_gdn {
#       column: publisher {field: mam_gdn_ga_view.publisher}
#       column: campaign {field: mam_gdn_ga_view.mam_campaign}
#       column: phase {field: mam_gdn_ga_view.mam_layer}
#       column: placement {field: mam_gdn_ga_view.mam_placement}
#       column: audience {field: mam_gdn_ga_view.mam_audience}
#       column: ad_size {field: mam_gdn_ga_view.ad_size}
#       column: creative_name {field: mam_gdn_ga_view.creative_name}
#       column: date {field: mam_gdn_ga_view.day_date}
#       column: week {field: mam_gdn_ga_view.day_week}
#       column: month {field: mam_gdn_ga_view.day_month}
#       column: total_impressions {field: mam_gdn_ga_view.total_impressions}
#       column: total_clicks {field: mam_gdn_ga_view.total_clicks}
#       column: total_cost {field: mam_gdn_ga_view.total_cost}
#       column: total_sessions {field: mam_gdn_ga_view.total_sessions}
#       column: total_session_duration {field: mam_gdn_ga_view.total_session_duration}
#       column: total_views {field: mam_gdn_ga_view.total_views}
#       column: total_completes {field: mam_gdn_ga_view.total_completes}
#       filters: {
#         field: mam_gdn_ga_view.mam_campaign
#         value: "FY21 Summer Recovery"
#       }
#       filters: {
#         field: mam_gdn_ga_view.day_date
#         value: "after 2020/06/22"
#       }
#     }
#     datagroup_trigger: mam_default_datagroup
#     distribution_style: all
#   }
# }
