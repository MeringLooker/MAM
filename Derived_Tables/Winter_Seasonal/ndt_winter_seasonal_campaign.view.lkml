view: ndt_winter_seasonal_campaign {

  derived_table: {
    sql:
    select * from ${ndt_winter_seasonal_dcm.SQL_TABLE_NAME}
    union
    select * from ${ndt_winter_seasonal_gdn.SQL_TABLE_NAME}
    union
    select * from ${ndt_winter_seasonal_sem.SQL_TABLE_NAME}
    union
    select * from ${ndt_winter_seasonal_facebook.SQL_TABLE_NAME}
    union
    select * from ${ndt_winter_seasonal_trueview.SQL_TABLE_NAME}
    union
    select * from ${ndt_winter_seasonal_pinterest.SQL_TABLE_NAME}
 ;;

    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*1)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${publisher}||'_'||${campaign}||'_'||${region}||'_'||${placement}||'_'||${date} ;;
  }

#### Dimensions below ####

  dimension: publisher {
    type:  string
    sql:  ${TABLE}.publisher ;;
    drill_fields: [region,placement,date,week]
  }

  dimension: campaign {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign ;;
  }

  dimension: region {
    type:  string
    sql:  ${TABLE}.region ;;
    drill_fields: [publisher,placement,date,week]
  }

  dimension: placement {
    type:  string
    sql:  ${TABLE}.placement ;;
  }

  dimension: date {
    type:  date
    group_label: "Date Periods"
    drill_fields: [region,publisher]
    sql:  ${TABLE}.date ;;
  }

  dimension: fiscal_year {
    type:  string
    sql:
      CASE
      WHEN ${date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
      WHEN ${date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
      WHEN ${date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: week {
    type:  date
    group_label: "Date Periods"
    drill_fields: [region,publisher]
    sql:  ${TABLE}.week ;;
  }

  dimension: month {
    type:  date
    group_label: "Date Periods"
    drill_fields: [region,publisher]
    sql:  ${TABLE}.month ;;
  }

  dimension: impressions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: clicks{
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_clicks;;
  }

  dimension: media_cost {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: sessions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: session_duration {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_session_duration ;;
  }

  dimension: views {
    hidden:  yes
    type: number
    sql: ${TABLE}.total_views ;;
  }

  #### Measures below ####

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks  {
  type: sum_distinct
  sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*(${total_clicks})/nullif(${total_impressions},0) ;;
    value_format_name: percent_2
  }

  measure: total_spend  {
  type: sum_distinct
  sql_distinct_key: ${primary_key} ;;
   sql: ${media_cost};;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    sql: ${total_spend}/nullif(${total_clicks}, 0);;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type:  number
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000,0);;
    value_format_name: usd
  }

  measure: total_sessions {
   type: sum_distinct
    sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    type: number
    label: "Avg. TOS"
    sql: (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    sql: ${total_spend}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }
  measure: total_views  {
    type: sum_distinct
   sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }


}
