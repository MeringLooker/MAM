view: mam_fy21_winter_dcm_view {
  sql_table_name: public.mam_fy21_winter_dcm_view ;;

#### Primary Key ####

  dimension: passback_join {
    type: string
    hidden: yes
    primary_key:  yes
    sql: ${ad_id}||'_'||${date_date} ;;
  }

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
  #### Mesures go below ####

  measure: total_impressions {
    label: "Total Impressions"
    type: sum_distinct
    sql_distinct_key: ${passback_join} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    label: "Total Clicks"
    type: sum_distinct
    sql_distinct_key: ${passback_join} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    label: "CTR"
    type: number
    value_format_name: percent_2
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
  }

  measure: total_media_cost {
    label: "Total Media Cost"
    type: sum_distinct
    sql_distinct_key: ${passback_join} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_video_views {
    label: "Total Video Views"
    type: sum_distinct
    sql_distinct_key: ${passback_join} ;;
    sql: ${video_views} ;;
  }

  measure: total_video_completes {
    label: "Total Video Completes"
    type: sum_distinct
    sql_distinct_key: ${passback_join} ;;
    sql: ${video_completions} ;;
  }

  measure: view_rate {
    label: "View Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_views}/nullif(${total_impressions}, 0) ;;
  }

  measure: completion_rate {
    label: "Completion Rate"
    type: number
    value_format_name: percent_0
    sql: ${total_video_completes}/nullif(${total_impressions}, 0) ;;
  }

  measure: cost_per_view {
    label: "Cost per View"
    type: number
    value_format_name: usd
    sql: ${total_media_cost}/nullif(${total_video_completes}, 0) ;;
  }

  measure: cost_per_thousand {
    label: "CPM"
    type: number
    value_format_name: usd
    sql: ${total_media_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
