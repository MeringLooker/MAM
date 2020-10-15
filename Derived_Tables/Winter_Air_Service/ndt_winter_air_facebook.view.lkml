view: ndt_winter_air_facebook {
  derived_table: {
    explore_source: mam_fb {
      column: publisher {field: mam_fb_ga_view.publisher}
      column: campaign {field: mam_fb_ga_view.mam_campaign}
      column: region {field: mam_fb_ga_view.mam_region}
      column: placement {field: mam_fb_ga_view.mam_placement}
      column: date {field: mam_fb_ga_view.date_start_date}
      column: week {field: mam_fb_ga_view.date_start_week}
      column: month {field: mam_fb_ga_view.date_start_month}
      column: total_impressions {field: mam_fb_ga_view.total_impressions}
      column: total_clicks {field: mam_fb_ga_view.total_clicks}
      column: total_cost {field: mam_fb_ga_view.total_spend}
      column: total_conversions {field: mam_fb_ga_view.total_search_flights_button}
      column: total_sessions {field: mam_fb_ga_view.total_sessions}
      column: total_session_duration {field: mam_fb_ga_view.total_session_duration}
      filters: {
        field: mam_fb_ga_view.mam_campaign
        value: "Winter Air Service"
      }
      filters: {
        field: mam_fb_ga_view.date_start_date
        value: "2019/09/30 to 2020/03/17"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
