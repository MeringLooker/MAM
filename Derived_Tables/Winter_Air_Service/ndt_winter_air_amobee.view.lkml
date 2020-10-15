view: ndt_winter_air_amobee {
  derived_table: {
    explore_source: mam_dcm {
      column: publisher {field: mam_dcm_ga_view.publisher}
      column: campaign { field: mam_dcm_ga_view.mam_campaign }
      column: region { field: mam_dcm_ga_view.mam_region }
      column: placement { field: mam_dcm_ga_view.mam_placement }
      column: ddate { field: mam_dcm_ga_view.date_date }
      column: week { field: mam_dcm_ga_view.date_week }
      column: month { field: mam_dcm_ga_view.date_month }
      column: total_impressions { field: mam_fy20_winter_air_amobee.total_impressions }
      column: total_clicks { field: mam_fy20_winter_air_amobee.total_clicks }
      column: total_media_cost { field: mam_fy20_winter_air_amobee.total_media_cost }
      column: total_conversions {field: mam_dcm_ga_view.total_search_flights_button}
      column: total_sessions { field: mam_dcm_ga_view.total_sessions }
      column: total_session_duration { field: mam_dcm_ga_view.total_session_duration }
      filters: {
        field: mam_dcm_ga_view.campaign
        value: "MAM: FY20 Winter Air Service"
      }
      filters: {
        field: mam_dcm_ga_view.publisher
        value: "Amobee"
      }
      filters: {
        field: mam_dcm_ga_view.date_date
        value: "2019/09/30 to 2020/03/17"
      }
    }
    datagroup_trigger: 24hour_cache
    distribution_style: all
  }
}
