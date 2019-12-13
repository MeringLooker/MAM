view: mam_trueview {
  sql_table_name: public.mam_trueview ;;
  drill_fields: [id]

###### Primary Key #######

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

##### Dimensions added to this table via LookML ######

  dimension: fiscal_year {
    label: "Fiscal"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${Date_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${Date_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${Date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${Date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${Date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: season {
    label: "Season/Campaign"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike '%FY19/20 Fall%' THEN 'Fall'
        WHEN ${campaign} ilike '%FY19/20 Winter%' THEN 'Winter'
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

###### All dimensions go below #######

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

  dimension: account {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    hidden: yes
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    type: string
    hidden: yes
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: ad_type {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}."ad type" ;;
  }

  dimension: all_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."all conv." ;;
  }

  dimension: all_conv__rate {
    type: string
    hidden: yes
    sql: ${TABLE}."all conv. rate" ;;
  }

  dimension: all_conv__value {
    type: number
    hidden: yes
    sql: ${TABLE}."all conv. value" ;;
  }

  dimension: avg__cost {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cost" ;;
  }

  dimension: avg__cpc {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cpc" ;;
  }

  dimension: avg__cpm {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cpm" ;;
  }

  dimension: avg__cpv {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. cpv" ;;
  }

  dimension: avg__position {
    type: number
    hidden: yes
    sql: ${TABLE}."avg. position" ;;
  }

  dimension: campaign {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    type: string
    hidden: yes
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: city {
    type: string
    hidden: yes
    group_label: "Geo Dimensions"
    sql: ${TABLE}.city ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_name {
    type: string
    hidden: yes
    sql: ${TABLE}."client name" ;;
  }

  dimension: conv__rate {
    type: string
    hidden: yes
    sql: ${TABLE}."conv. rate" ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: cost__all_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."cost / all conv." ;;
  }

  dimension: cost__conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."cost / conv." ;;
  }

  dimension: countryterritory {
    type: number
    hidden: yes
    group_label: "Geo Dimensions"
    sql: ${TABLE}."country/territory" ;;
  }

  dimension: crossdevice_conv_ {
    type: string
    hidden: yes
    sql: ${TABLE}."cross-device conv." ;;
  }

  dimension: ctr {
    type: string
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension: currency {
    type: string
    hidden: yes
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}."customer id" ;;
  }

  dimension_group: Date {
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

  dimension: device {
    type: string
    hidden: yes
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: interaction_rate {
    type: string
    hidden: yes
    sql: ${TABLE}."interaction rate" ;;
  }

  dimension: interaction_types {
    type: string
    hidden: yes
    sql: ${TABLE}."interaction types" ;;
  }

  dimension: interactions {
    type: number
    hidden: yes
    sql: ${TABLE}.interactions ;;
  }

  dimension: is_targetable {
    type: string
    hidden: yes
    sql: ${TABLE}."is targetable" ;;
  }

  dimension: location_type {
    type: string
    hidden: yes
    group_label: "Geo Dimensions"
    sql: ${TABLE}."location type" ;;
  }

  dimension: metro_area {
    type: string
    hidden: yes
    group_label: "Geo Dimensions"
    sql: ${TABLE}."metro area" ;;
  }

  dimension: most_specific_location {
    type: number
    hidden: yes
    group_label: "Geo Dimensions"
    sql: ${TABLE}."most specific location" ;;
  }

  dimension: network {
    type: string
    group_label: "TrueView Dimensions"
    sql: ${TABLE}.network ;;
  }

  dimension: network_with_search_partners {
    type: string
    hidden: yes
    sql: ${TABLE}."network (with search partners)" ;;
  }

  dimension: region {
    type: string
    hidden: yes
    group_label: "Geo Dimensions"
    sql: ${TABLE}.region ;;
  }

  dimension: reportname {
    type: string
    hidden: yes
    sql: ${TABLE}.reportname ;;
  }

  dimension: time_zone {
    type: string
    hidden: yes
    sql: ${TABLE}."time zone" ;;
  }

  dimension: total_conv__value {
    type: number
    hidden: yes
    sql: ${TABLE}."total conv. value" ;;
  }

  dimension: value__all_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."value / all conv." ;;
  }

  dimension: value__conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."value / conv." ;;
  }

  dimension: view_rate {
    type: string
    hidden: yes
    sql: ${TABLE}."view rate" ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  dimension: viewthrough_conv_ {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through conv." ;;
  }

###### All Measures Go Below ######

  measure: total_cost {
    type: sum
    sql: (${cost}/1000000.00) ;;
    value_format_name: usd
  }

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_views {
    type: sum
    sql: ${views} ;;
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
    drill_fields: [id, client_name, reportname]
  }
}
