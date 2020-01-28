include: "/MAM.model"

view: ndt_winter_seasonal_sem {
  derived_table: {
    explore_source: mam_sem {
      column: publisher {field:mam_sem_gdn.publisher}
      column: campaign {field:mam_sem_gdn.mam_campaign}
      column: region {field:mam_sem_gdn.region}
      column: date {field: mam_sem_gdn.day_date}
      column: week {field: mam_sem_gdn.day_week}
      column: month {field: mam_sem_gdn.day_month}
      column: total_impressions {field:mam_sem_gdn.total_impressions}
      column: total_clicks {field:mam_sem_gdn.total_clicks}
      column: total_cost {field:mam_sem_gdn.total_cost}
      column: ga_sessions {field:mam_sem_gdn.ga_sessions}
      column: ga_total_session_duration {field:mam_sem_gdn.ga_total_session_duration}
      filters: {
        field: mam_sem_gdn.mam_campaign
        value: "Winter Seasonal"
      }
    }
  }

  dimension: publisher {
    label: "SEM Publisher"
    type: string
  }

  dimension: campaign {
    label: "SEM Campaign"
    type: string
  }

  dimension: region {
    label: "SEM Region"
    type: string
  }

  dimension: date {
    label: "SEM Date"
    type: date_time
  }

  dimension: week {
    label: "SEM Week"
    type: date_time
  }

  dimension: month {
    label: "SEM Month"
    type: date_time
  }

  dimension: total_impressions {
    label: "SEM Total Impressions"
    type: number
  }

  dimension: total_clicks {
    label: "SEM Total Clicks"
    type: number
  }

  dimension: total_cost {
    label: "SEM Total Cost"
    type: number
    value_format: "$0.000"
  }

  dimension: ga_sessions {
    label: "SEM Total Sessions"
    type: number
  }

  dimension: ga_total_session_duration {
    label: "SEM Total Session Duration"
    type: number
  }
}
