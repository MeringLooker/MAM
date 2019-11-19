view: mam_trueview {
  sql_table_name: public.mam_trueview ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: ad_group_state {
    type: string
    sql: ${TABLE}."ad group state" ;;
  }

  dimension: ad_type {
    type: string
    sql: ${TABLE}."ad type" ;;
  }

  dimension: all_conv_ {
    type: number
    sql: ${TABLE}."all conv." ;;
  }

  dimension: all_conv__rate {
    type: string
    sql: ${TABLE}."all conv. rate" ;;
  }

  dimension: all_conv__value {
    type: number
    sql: ${TABLE}."all conv. value" ;;
  }

  dimension: avg__cost {
    type: number
    sql: ${TABLE}."avg. cost" ;;
  }

  dimension: avg__cpc {
    type: number
    sql: ${TABLE}."avg. cpc" ;;
  }

  dimension: avg__cpm {
    type: number
    sql: ${TABLE}."avg. cpm" ;;
  }

  dimension: avg__cpv {
    type: number
    sql: ${TABLE}."avg. cpv" ;;
  }

  dimension: avg__position {
    type: number
    sql: ${TABLE}."avg. position" ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: campaign_state {
    type: string
    sql: ${TABLE}."campaign state" ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}."client name" ;;
  }

  dimension: conv__rate {
    type: string
    sql: ${TABLE}."conv. rate" ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension: cost__all_conv_ {
    type: number
    sql: ${TABLE}."cost / all conv." ;;
  }

  dimension: cost__conv_ {
    type: number
    sql: ${TABLE}."cost / conv." ;;
  }

  dimension: countryterritory {
    type: number
    sql: ${TABLE}."country/territory" ;;
  }

  dimension: crossdevice_conv_ {
    type: string
    sql: ${TABLE}."cross-device conv." ;;
  }

  dimension: ctr {
    type: string
    sql: ${TABLE}.ctr ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}."customer id" ;;
  }

  dimension_group: day {
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
    sql: ${TABLE}.device ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: interaction_rate {
    type: string
    sql: ${TABLE}."interaction rate" ;;
  }

  dimension: interaction_types {
    type: string
    sql: ${TABLE}."interaction types" ;;
  }

  dimension: interactions {
    type: number
    sql: ${TABLE}.interactions ;;
  }

  dimension: is_targetable {
    type: string
    sql: ${TABLE}."is targetable" ;;
  }

  dimension: location_type {
    type: string
    sql: ${TABLE}."location type" ;;
  }

  dimension: metro_area {
    type: string
    sql: ${TABLE}."metro area" ;;
  }

  dimension: most_specific_location {
    type: number
    sql: ${TABLE}."most specific location" ;;
  }

  dimension: network {
    type: string
    sql: ${TABLE}.network ;;
  }

  dimension: network_with_search_partners {
    type: string
    sql: ${TABLE}."network (with search partners)" ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: reportname {
    type: string
    sql: ${TABLE}.reportname ;;
  }

  dimension: time_zone {
    type: string
    sql: ${TABLE}."time zone" ;;
  }

  dimension: total_conv__value {
    type: number
    sql: ${TABLE}."total conv. value" ;;
  }

  dimension: value__all_conv_ {
    type: number
    sql: ${TABLE}."value / all conv." ;;
  }

  dimension: value__conv_ {
    type: number
    sql: ${TABLE}."value / conv." ;;
  }

  dimension: view_rate {
    type: string
    sql: ${TABLE}."view rate" ;;
  }

  dimension: views {
    type: number
    sql: ${TABLE}.views ;;
  }

  dimension: viewthrough_conv_ {
    type: number
    sql: ${TABLE}."view-through conv." ;;
  }

  measure: count {
    type: count
    drill_fields: [id, client_name, reportname]
  }
}
