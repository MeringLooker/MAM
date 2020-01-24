view: ndt_winter_air_facebook {
  derived_table: {
    explore_source: mam_fb {
      column: publisher {field: mam_fb_view.publisher}
      column: campaign {field: mam_fb_view.mam_campaign}
      column: region {field: mam_fb_view.mam_region}
      column: placement {field: mam_fb_view.ad_name}
      column: date {field: mam_fb_view.date_start_date}
      column: week {field: mam_fb_view.date_start_week}
      column: month {field: mam_fb_view.date_start_month}
      column: total_impressions {field: mam_fb_view.total_impressions}
      column: total_clicks {field: mam_fb_view.total_clicks}
      column: total_cost {field: mam_fb_view.total_spend}
      column: total_conversions {field: mam_fb_view.flight_checkouts}
      column: total_sessions {field: mam_fb_view.ga_sessions}
      column: total_session_duration {field: mam_fb_view.ga_total_session_duration}
      filters: {
        field: mam_fb_view.mam_campaign
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
