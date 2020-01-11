include: "/MAM.model"

view: ndt_dcm_publisher{
  derived_table: {
    explore_source: mam_dcm_view {
      column:publisher{}
      column: campaign {}
      column: test_date_string {}
      #column: date_date {}
      column: total_impressions{}
      column: total_clicks {}
      column: total_media_cost {}
      column: ga_sessions {}
      column: ga_total_session_duration{}
      column: dcm_region {}
      column: ndt_mam_campaign {}
      column: ndt_mam_season {}
      filters: {
        field: mam_dcm_view.mam_campaign
        value: "Air Service"
      }

    }

  }
  dimension: publisher {
    primary_key: yes
    label: "DCM Publisher"
    type: string
  }

  dimension: campaign {
    label: "DCM Campaign"
    type: string
  }

  dimension: test_date_string  {
    type: string
  }

#   dimension_group: date {
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
    label: "DCM Total Impressions"
    type: number
  }

  dimension: total_clicks {
    label: "DCM Total Clicks"
    type: number
  }

  dimension: total_media_cost {
    label: "DCM Total Cost"
    type: number
    value_format: "$0.000"
  }

  dimension: ga_sessions {
    label: "DCM Total Sessions"
    type: number
  }

  dimension: ga_total_session_duration {
    label: "DCM Total Session Duration"
    type: number
  }

  dimension: dcm_region{
    label: "DCM Region"
    type: string
  }

  dimension: mam_campaign {
    label: "DCM Season"
  }

  dimension: mam_season {
    label: " DCM Season"
  }





}
