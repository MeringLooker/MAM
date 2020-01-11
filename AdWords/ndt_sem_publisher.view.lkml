include: "/MAM.model"

view: ndt_sem_publisher {
 derived_table: {
   explore_source: mam_sem {
      column:adwords_publisher{field:mam_sem_gdn.adwords_publisher}
      column: campaign {field:mam_sem_gdn.campaign}
      column:  test_date_string {field:mam_sem_gdn.test_date_string}
    # column: day {field: mam_sem_gdn.day_date}
      column: total_impressions{field:mam_sem_gdn.total_impressions}
      column: total_clicks {field:mam_sem_gdn.total_clicks}
      column: total_cost {field:mam_sem_gdn.total_cost}
      column: ga_sessions {field:mam_sem_gdn.ga_sessions}
      column: ga_total_session_duration {field:mam_sem_gdn.ga_total_session_duration}
      column: region {field: mam_sem_gdn.region}
      column: mam_campaign_layer {field:mam_sem_gdn.mam_campaign_layer}
      column: mam_campaign {field:mam_sem_gdn.mam_campaign}
      filters: {
        field: mam_sem_gdn.account
        value: "MAM SEM - Air Service"
      }

   }
 }
  dimension: Adword_publisher {
    primary_key: yes
    label: "SEM Publisher"
    type: string
  }

  dimension: campaign {
    label: "SEM Campaign"
    type: string
  }

  dimension: test_date_string  {
    type: string
  }
#   dimension_group: day {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#   }

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

  dimension: region{
    label: "SEM Region"
    type: string
  }

  dimension: mam_campaign_layer {
    label: "GDN Campaign Layer"
    type: string
  }

  dimension: mam_campaign {
    label: "GDN Season"
    type: string
  }

}
