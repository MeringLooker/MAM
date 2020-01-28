include: "/MAM.model"

view: ndt_dcm_publisher{
  derived_table: {
    explore_source: mam_dcm_view {
      column:publisher{}
      column: mam_campaign {}
      column: date {field:mam_dcm_view.date_date}
      column: week {field:mam_dcm_view.date_week}
      column: month {field:mam_dcm_view.date_month}
      column: quarter {field:mam_dcm_view.date_quarter}
      column: year {field:mam_dcm_view.date_year}
      column: total_impressions{}
      column: total_clicks {}
      column: total_media_cost {}
      column: ga_sessions {}
      column: ga_total_session_duration{}
      column: dcm_region {}
      column: ndt_mam_campaign {}
      column: ndt_mam_season {}
      filters: {
        field: mam_dcm_view.mam_campaign_layer
        value: "Air Service"
      }

    }

  }
  dimension: publisher {
    primary_key: yes
    label: "DCM Publisher"
    type: string
  }

  dimension: mam_campaign {
    label: "DCM Campaign"
    type: string
  }
  dimension: date {
    label: "DCM Date"
    type: date_time
  }
  dimension: week {
    label: "DCM Week"
    type: date_time
  }
  dimension: month {
    label: "DCM Month"
    type: date_time
  }
  dimension: quarter {
    label: "DCM Quarter"
    type: date_time
  }
  dimension: year {
    label: "DCM Year"
    type: date_time
  }

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

  dimension: ndt_mam_campaign {
    label: "DCM Season"
  }

  dimension: ndt_mam_season {
    label: " DCM Season"
  }





}
