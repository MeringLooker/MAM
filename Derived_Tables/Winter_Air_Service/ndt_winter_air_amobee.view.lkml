view: ndt_winter_air_amobee {
  derived_table: {
    explore_source: mam_dcm {
      column: publisher {field: mam_dcm_view.publisher}
      column: campaign {field: mam_dcm_view.mam_campaign}
      column: region {field: mam_dcm_view.mam_region}
      column: placement {field: mam_dcm_view.mam_package}
      column: date {field: mam_dcm_view.date_date}
      column: week {field: mam_dcm_view.date_week}
      column: month {field: mam_dcm_view.date_month}
      column: total_impressions {field: mam_dcm_view.total_impressions}
      column: total_clicks {field: mam_dcm_view.total_clicks}
      column: total_cost {field: mam_dcm_view.total_media_cost}
      column: total_conversions {field: mam_ga_goals.total_goal13completions}
      column: total_sessions {field: mam_dcm_view.ga_sessions}
      column: total_session_duration {field: mam_dcm_view.ga_total_session_duration}
      filters: {
        field: mam_dcm_view.mam_campaign
        value: "Winter Air Service"
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
    value_format_name: usd
  }

  dimension: total_conversions {
    type: number
  }

  dimension: total_sessions {
    type: number
  }

  dimension: total_session_duration {
    type: number
  }
}
