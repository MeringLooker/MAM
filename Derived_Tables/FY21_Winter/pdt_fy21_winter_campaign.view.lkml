view: pdt_fy21_winter_campaign {
  derived_table: {
    sql:
    select * from ${pdt_fy21_winter_fb.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_yt.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_gdn.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_sem.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_adtheorent.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_adtheorent_1p_video.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_opensnow.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_snowbrains.SQL_TABLE_NAME}
      union
    select * from ${pdt_fy21_winter_pinterest.SQL_TABLE_NAME}
    ;;
    sql_trigger_value: SELECT FLOOR((EXTRACT(epoch from GETDATE()) - 60*60*8)/(60*60*24)) ;;
    distribution_style: all
  }

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${publisher}||'_'||${campaign}||'_'||${region}||'_'||${layer}||'_'||${placement}||'_'||${ad_size}||'_'||${creative_name}||'_'||${date} ;;
  }

#### Pacing Key Added ####

  dimension: pacing_key {
    type: string
    hidden: yes
    sql: ${publisher}||'_'||${region} ;;
  }

#### Dimensions below ####

  dimension: publisher {
    drill_fields: [placement,region_clean,creative_name]
    type:  string
    sql:  ${TABLE}.publisher ;;
  }

  dimension: campaign {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign ;;
  }

  dimension: region {
    hidden: yes
    drill_fields: [publisher,placement,creative_name]
    type:  string
    sql:  ${TABLE}.region ;;
  }

  dimension: region_clean {
    label: "Region"
    drill_fields: [publisher,placement,creative_name]
    type:  string
    sql:
        case
          when ${region} ilike 'Boston' then 'Northeast'
          when ${region} ilike 'New York' then 'Northeast'
          else ${region}
          end ;;
  }

  dimension: layer {
    drill_fields: [publisher]
    type:  string
    sql:  ${TABLE}.layer ;;
  }

  dimension: placement {
    drill_fields: [creative_name,ad_size,region_clean]
    type:  string
    label: "Placement Name"
    sql:  ${TABLE}.placement ;;
  }

  dimension: ad_size {
    type:  string
    label: "Ad Size"
    sql:  ${TABLE}.ad_size ;;
  }

  dimension: creative_name {
    type:  string
    label: "Creative Name"
    sql:  ${TABLE}.creative_name ;;
  }

  dimension: date {
    type:  date
    group_label: "Date Periods"
    sql:  ${TABLE}.date ;;
  }

  dimension: fiscal_year {
    type:  string
    hidden: yes
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
    type:  date_week
    group_label: "Date Periods"
    sql:  ${TABLE}.week ;;
  }

  dimension: month {
    type:  date_month
    group_label: "Date Periods"
    sql:  ${TABLE}.month ;;
  }

  dimension: impressions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: clicks {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_clicks;;
  }

  dimension: cost {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: flight_searches {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_flight_searches ;;
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
    type:  number
    sql: ${TABLE}.total_views ;;
  }

  dimension: completes {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_completes ;;
  }

  ### All measures go below ###

  measure: total_impressions {
    type: sum
    label: "Impressions"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    label: "Clicks"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views {
    type: sum
    label: "Video Views"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum
    label: "Video Completes"
    value_format_name: decimal_0
    # sql_distinct_key: ${primary_key} ;;
    sql: ${completes} ;;
  }

  measure: total_cost {
    type: sum
    label: "Gross Cost"
    # sql_distinct_key: ${primary_key} ;;
    value_format_name: usd
    sql: ${cost}*1.17647 ;;
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
  }

  measure: total_sessions {
    type: sum
    label: "Sessions"
    # sql_distinct_key: ${primary_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
  }

  measure: total_session_duration {
    type: sum
    hidden: yes
    # sql_distinct_key: ${primary_key} ;;
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
    type: number
    sql: (floor((${total_session_duration}::numeric(19,6))/nullif(${total_sessions}, 0)))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: total_flight_searches {
    label: "Flight Searches"
    type: sum
    hidden: no
    # sql_distinct_key: ${primary_key} ;;
    sql: ${flight_searches} ;;
  }

  measure: video_impressions {
    type: sum
    hidden: yes
    # sql_distinct_key: ${primary_key} ;;
    sql:
      case
        when ${views} > 0 then ${impressions}
        else null
        end
        ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    sql: 1.0*${total_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: video_cost {
    type: sum
    hidden: yes
    # sql_distinct_key: ${primary_key} ;;
    sql:
      case
        when ${views} > 0 then (${cost}*1.17647)
        else null
        end
        ;;
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_views}, 0) ;;
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_completes}, 0) ;;
  }
}
