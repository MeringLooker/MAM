view: pdt_fy21_springsummer_gdn {
  derived_table: {
    explore_source: mam_gdn {
      column: publisher {field: mam_gdn_ga_view.publisher}
      column: campaign {field: mam_gdn_ga_view.mam_campaign}
      column: placement {field: mam_gdn_ga_view.mam_placement}
      column: creative_name {field: mam_gdn_ga_view.creative_name}
      column: ad_size {field: mam_gdn_ga_view.ad_size}
      column: date {field: mam_gdn_ga_view.day_date}
      column: total_impressions {field: mam_gdn_ga_view.total_impressions}
      column: total_clicks {field: mam_gdn_ga_view.total_clicks}
      column: total_cost {field: mam_gdn_ga_view.total_cost}
      column: total_views {field: mam_gdn_ga_view.total_views}
      column: total_completes {field: mam_gdn_ga_view.total_completes}
      column: total_sessions {field: mam_gdn_ga_view.total_sessions}
      column: total_session_duration {field: mam_gdn_ga_view.total_session_duration}
      filters: {
        field: mam_gdn_ga_view.mam_campaign
        value: "FY21 Spring/Summer"
      }
      filters: {
        field: mam_gdn_ga_view.day_date
        value: "2021/04/12 to 2021/09/01"
      }
    }
    datagroup_trigger: mam_default_datagroup
    distribution_style: all
  }
}
