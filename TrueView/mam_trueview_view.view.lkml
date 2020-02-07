view: mam_trueview_view {
  sql_table_name: public.mam_trueview_view;;
  drill_fields: [id]

  dimension: id{
  primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

##### Dimensions added to this table via LookML ######

  dimension: fiscal_year {
    label: "Fiscal Year"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${date_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: mam_campaign {
    label: "Season/Campaign Name"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike '%FY19/20 Fall%' THEN 'Fall'
        WHEN ${campaign} ilike '%FY19/20 Winter%' THEN 'Winter Seasonal'
        WHEN ${campaign} ilike '%FY19/20 Summer%' THEN 'Summer'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: layer {
    label: "TrueView Layer"
    group_label: "TrueView Dimensions"
    sql:
        CASE
        WHEN ${campaign} ilike '%Retargeting%' THEN 'Retargeting'
        WHEN ${campaign} ilike '%Prospecting%' THEN 'Prospecting'
        WHEN ${campaign_id} = '6542201483' then 'Prospecting'
        WHEN ${campaign_id} = '6542201492' then 'Prospecting'
        WHEN ${campaign_id} = '6542201486' then 'Prospecting'
        WHEN ${campaign_id} = '6542201474' then 'Prospecting'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: audience {
    label: "Target Audience"
    group_label: "Client Dimensions"
    sql:
        CASE
        WHEN ${ad_group} ilike '%InMarket Travel%' THEN 'In-Market Travel'
        WHEN ${ad_group} ilike '%Retargeting%' THEN 'Retargeting'
        WHEN ${ad_group} ilike '%Competitive Destinations%' then 'Competitive Destinations'
        WHEN ${ad_group} ilike '%Skiing Enthusiasts' then 'Brand'
        WHEN ${ad_group} ilike '%Running Enthusiasts%' then 'Brand'
        WHEN ${ad_group} ilike '%Outdoor Enthusiasts%' then 'Brand'
        WHEN ${ad_group} ilike '%Cycling Enthusiasts%' then 'Brand'
        WHEN ${ad_group} ilike '%Custom%' then 'Custom'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: mam_region {
    label: "Region"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike '%SF' THEN 'San Francisco'
        WHEN ${campaign} ilike '%NE' THEN 'Northeast'
        WHEN ${campaign} ilike '%DEN' THEN 'Denver'
        WHEN ${campaign} ilike '%CA/NV' THEN 'California/Nevada'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: publisher {
    type: string
    group_label: "TrueView Dimensions"
    sql: 'YouTube' ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql:  '0' ;;
  }

  dimension: session_duration {
    type: number
    hidden: yes
    sql:  '0' ;;
  }

###### All dimensions go below #######

  dimension_group: __updatetime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: reportname {
    type: string
    hidden: yes
    sql: ${TABLE}.reportname ;;
  }

  dimension: account {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: campaign {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: ad_group_state {
    type: string
    hidden: yes
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."campaign id" ;;
  }

  dimension_group: date {
    group_label: "Date Periods"
    label: ""
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.day ;;
  }

  dimension: ad_group_id {
    type: number
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: device {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.device ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: total_conv__value {
    type: number
    hidden: yes
    sql: ${TABLE}."total conv. value" ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions;;
  }

  dimension: ad_group {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: campaign_state {
    type: string
    hidden: yes
    sql: ${TABLE}."campaign state" ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.__senttime ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.conversions ;;
  }

  dimension: avg__position {
    type: string
    hidden: yes
    sql: ${TABLE}."avg. position" ;;
  }

  dimension: interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.interactions ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  dimension: device_formatted {
    type: string
    hidden: yes
  }

  dimension: comp_key {
    type: string
    hidden: yes
  }


###### All Measures Go Below ######

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: (${cost}/1000000.00) ;;
    value_format_name: usd
  }

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions} ;;
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${views} ;;
  }

  measure:total_clicks {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${clicks};;
  }

  measure:total_conversions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql:${conversions} ;;
    hidden: yes
  }

  measure: total_sessions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    hidden: yes
    sql:${sessions} ;;
  }
  measure: total_session_duration {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    hidden: yes
    sql:${session_duration};;
  }

  measure: total_view_rate {
    type: number
    sql: 1.0*${total_views}/nullif(${total_impressions}, 0);;
    value_format_name: percent_0
  }

  measure: cost_per_thousand {
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000,0) ;;
    value_format: "$0.00"
  }

  measure: cost_per_view {
    type: number
    sql: ${total_cost}/nullif(${total_views},0) ;;
    value_format: "$0.000"
  }

  measure: count {
    type: count
    drill_fields: [id, reportname]
  }


}
