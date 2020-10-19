view: ndt_winter_air_gdn {
  derived_table: {
    explore_source: mam_gdn {
      column: publisher {field:mam_gdn_ga_view.publisher}
      column: campaign {field:mam_gdn_ga_view.mam_campaign}
      column: region {field:mam_gdn_ga_view.region}
      column: placement {field:mam_gdn_ga_view.mam_placement}
      column: date {field: mam_gdn_ga_view.day_date}
      column: week {field: mam_gdn_ga_view.day_week}
      column: month {field: mam_gdn_ga_view.day_month}
      column: total_impressions {field:mam_gdn_ga_view.total_impressions}
      column: total_clicks {field:mam_gdn_ga_view.total_clicks}
      column: total_cost {field:mam_gdn_ga_view.total_cost}
      column: total_conversions {field:mam_gdn_ga_view.total_conversions}
      column: total_sessions {field:mam_gdn_ga_view.total_sessions}
      column: total_session_duration {field:mam_gdn_ga_view.total_session_duration}
      filters: {
        field: mam_gdn_ga_view.mam_campaign
        value: "Winter Air Service"
      }
      filters: {
        field: mam_gdn_ga_view.day_date
        value: "2019/09/30 to 2020/03/17"
      }
    }
    datagroup_trigger: mam_default_datagroup
    distribution_style: all
  }
}
