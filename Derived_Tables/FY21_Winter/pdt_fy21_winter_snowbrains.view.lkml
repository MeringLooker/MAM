view: pdt_fy21_winter_snowbrains {
  derived_table: {
    explore_source: mam_dcm {
      column: publisher {field: mam_dcm_ga_view.publisher}
      column: campaign {field: mam_dcm_ga_view.mam_campaign}
      column: layer {field: mam_dcm_ga_view.mam_campaign_layer}
      column: region {field: mam_dcm_ga_view.mam_region}
      column: placement {field: mam_dcm_ga_view.mam_placement}
      column: creative_name {field: mam_dcm_ga_view.creative_name}
      column: ad_size {field: mam_dcm_ga_view.ad_size}
      column: date {field: mam_dcm_ga_view.date_date}
      column: week {field: mam_dcm_ga_view.date_week}
      column: month {field: mam_dcm_ga_view.date_month}
      column: total_impressions {field: mam_dcm_ga_view.total_impressions}
      column: total_clicks {field: mam_dcm_ga_view.total_clicks}
      column: total_cost {field: mam_dcm_ga_view.total_cost}
      column: total_views {field: mam_dcm_ga_view.total_views}
      column: total_completes {field: mam_dcm_ga_view.total_completes}
      column: total_sessions {field: mam_dcm_ga_view.total_sessions}
      column: total_session_duration {field: mam_dcm_ga_view.total_session_duration}
      column: total_flight_searches {field: mam_dcm_ga_view.total_search_flights_button}
      filters: {
        field: mam_dcm_ga_view.mam_campaign
        value: "FY21 Winter"
      }
      filters: {
        field: mam_dcm_ga_view.publisher
        value: "Snowbrains.com"
      }
      filters: {
        field: mam_dcm_ga_view.ad
        value: "-(not set)"
      }
      filters: {
        field: mam_dcm_ga_view.date_date
        value: "after 2020/11/09"
      }
    }
    datagroup_trigger: mam_dcm_datagroup
    distribution_style: all
  }
}
