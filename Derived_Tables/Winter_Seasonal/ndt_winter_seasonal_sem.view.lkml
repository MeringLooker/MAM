view: ndt_winter_seasonal_sem {
    derived_table: {
      explore_source: mam_sem {
        column: publisher {field:mam_sem_view.publisher}
        column: campaign {field:mam_sem_view.mam_campaign}
        column: region {field:mam_sem_view.region}
        column: placement {field:mam_sem_view.campaign}
        column: date {field: mam_sem_view.day_date}
        column: week {field: mam_sem_view.day_week}
        column: month {field: mam_sem_view.day_month}
        column: total_impressions {field:mam_sem_view.total_impressions}
        column: total_clicks {field:mam_sem_view.total_clicks}
        column: total_cost {field:mam_sem_view.total_cost}
        column: total_sessions {field:mam_sem_view.ga_sessions}
        column: total_session_duration {field:mam_sem_view.ga_total_session_duration}
        column: total_views {field: mam_sem_view.total_views}
        filters: {
          field: mam_sem_view.mam_campaign
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
