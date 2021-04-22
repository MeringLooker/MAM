view: mam_fy21_springsummer_dcm_view {
  sql_table_name: public.mam_fy21_springsummer_dcm_view ;;

  ## Primary Key ##

  dimension: dcm_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.dcm_join_id ;;
  }

  ## Dimensions Below ##

  dimension: ad_id {
    type: number
    sql: ${TABLE}.ad_id ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: video_completions {
    type: number
    hidden: yes
    sql: ${TABLE}.video_completions ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
  }

## Measures Below ##

  measure: total_impressions {
    type: sum
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type: sum
    value_format_name: usd
    sql: ${cost} ;;
  }

  measure: total_views {
    type: sum
    sql: ${video_views} ;;
  }

  measure: total_completes {
    type: sum
    sql: ${video_completions} ;;
  }

}
