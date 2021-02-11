view: pdt_fy21_winter_sem {
  derived_table: {
    explore_source: mam_sem {
      column: publisher {field: mam_sem_ga_view.publisher}
      column: campaign {field: mam_sem_ga_view.mam_campaign}
      column: layer {field: mam_sem_ga_view.mam_campaign_layer}
      column: region {field: mam_sem_ga_view.region}
      column: placement {field: mam_sem_ga_view.mam_placement}
      column: creative_name {field: mam_sem_ga_view.creative_name}
      column: ad_size {field: mam_sem_ga_view.ad_size}
      column: date {field: mam_sem_ga_view.day_date}
      column: week {field: mam_sem_ga_view.day_week}
      column: month {field: mam_sem_ga_view.day_month}
      column: total_impressions {field: mam_sem_ga_view.total_impressions}
      column: total_clicks {field: mam_sem_ga_view.total_clicks}
      column: total_cost {field: mam_sem_ga_view.total_cost}
      column: total_views {field: mam_sem_ga_view.total_views}
      column: total_completes {field: mam_sem_ga_view.total_completes}
      column: total_sessions {field: mam_sem_ga_view.total_sessions}
      column: total_session_duration {field: mam_sem_ga_view.total_session_duration}
      column: total_flight_searches {field: mam_sem_ga_view.total_search_flights_button}
      filters: {
        field: mam_sem_ga_view.mam_campaign
        value: "FY21 Winter"
      }
      filters: {
        field: mam_sem_ga_view.day_date
        value: "2020/11/02 to 2020/12/06,2021/02/03 to 2021/04/12"
      }
      filters: {
        field: mam_sem_ga_view.total_impressions
        value: ">0"
      }
    }
    datagroup_trigger: mam_default_datagroup
    distribution_style: all
  }
}
