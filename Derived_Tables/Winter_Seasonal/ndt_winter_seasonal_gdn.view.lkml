view: ndt_winter_seasonal_gdn {
  derived_table: {
    explore_source: mam_gdn {
      column: publisher {field:mam_sem_gdn.publisher}
      column: campaign {field:mam_sem_gdn.mam_campaign}
      column: region {field:mam_sem_gdn.region}
      column: placement {field:mam_sem_gdn.campaign}
      column: date {field: mam_sem_gdn.day_date}
      column: week {field: mam_sem_gdn.day_week}
      column: month {field: mam_sem_gdn.day_month}
      column: total_impressions {field:mam_sem_gdn.total_impressions}
      column: total_clicks {field:mam_sem_gdn.total_clicks}
      column: total_cost {field:mam_sem_gdn.total_cost}
      column: total_views {field:mam_sem_gdn.total_views}
      column: total_sessions {field:mam_sem_gdn.ga_sessions}
      column: total_session_duration {field:mam_sem_gdn.ga_total_session_duration}
      filters: {
        field: mam_sem_gdn.mam_campaign
        value: "Winter Seasonal"
      }
    }
    datagroup_trigger: mam_winter_air_datagroup
    distribution_style: all
  }

  dimension: publisher {
    type: string
  }

  dimension: campaign {
    type: string
  }

  dimension: region {
    type: string
  }

  dimension: placement {
    type: string
  }

  dimension: date {
    type: date
  }

  dimension: week {
    type: date
  }

  dimension: month {
    type: date
  }

  dimension: total_impressions {
    type: number
  }

  dimension: total_clicks {
    type: number
  }

  dimension: total_cost {
    type: number
  }

  dimension: total_views {
    type: number
  }

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }
}
