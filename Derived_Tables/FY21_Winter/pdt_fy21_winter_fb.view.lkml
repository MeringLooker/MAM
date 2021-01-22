view: pdt_fy21_winter_fb {
  derived_table: {
    explore_source: mam_fb {
      column: publisher {field: mam_fb_ga_view.publisher}
      column: campaign {field: mam_fb_ga_view.mam_campaign}
      column: layer {field: mam_fb_ga_view.mam_layer}
      column: region {field: mam_fb_ga_view.mam_region}
      column: placement {field: mam_fb_ga_view.mam_placement}
      column: creative_name {field: mam_fb_ga_view.creative_name}
      column: ad_size {field: mam_fb_ga_view.ad_size}
      column: date {field: mam_fb_ga_view.date_start_date}
      column: week {field: mam_fb_ga_view.date_start_week}
      column: month {field: mam_fb_ga_view.date_start_month}
      column: total_impressions {field: mam_fb_ga_view.total_impressions}
      column: total_clicks {field: mam_fb_ga_view.total_clicks}
      column: total_cost {field: mam_fb_ga_view.total_spend}
      column: total_views {field: mam_fb_ga_view.total_thruplays}
      column: total_completes {field: mam_fb_ga_view.total_video_completes}
      column: total_sessions {field: mam_fb_ga_view.total_sessions}
      column: total_session_duration {field: mam_fb_ga_view.total_session_duration}
      column: total_flight_searches {field: mam_fb_ga_view.total_search_flights_button}
      filters: {
        field: mam_fb_ga_view.mam_campaign
        value: "FY21 Winter"
      }
      filters: {
        field: mam_fb_ga_view.date_start_date
        value: "after 2020/11/02"
      }
    }
    datagroup_trigger: mam_default_datagroup
    distribution_style: all
  }
}
