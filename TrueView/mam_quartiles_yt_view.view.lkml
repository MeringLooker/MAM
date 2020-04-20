view: mam_quartiles_yt_view {
  sql_table_name: public.mam_quartiles_yt_view ;;

#### Primary Key ####

  dimension: comp_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: join_id_onsite {
    type: string
    hidden: yes
    sql: ${ad_group_id}||'_'||${day_date} ;;
  }

  #### Dimensions Added to this Table Via LookML ####

  dimension: fiscal_year {
    label: "Fiscal Year"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${day_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${day_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${day_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${day_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${day_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: advertising_channel {
    type: string
    hidden: yes
    label: "Channel"
    group_label: "TrueView Dimensions"
    sql: 'Video'
      ;;
  }

  dimension: publisher {
    type: string
    hidden: yes
    sql: 'YouTube' ;;
  }

  dimension: mam_campaign {
    label: "Campaign Name"
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

  dimension: mam_layer {
    label: "TrueView Layer"
    group_label: "Trueview Dimensions"
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

  dimension: mam_placement {
    type: string
    label: "Placement Name"
    group_label: "Client Dimensions"
    hidden: no
    sql:
      CASE
          WHEN ${campaign} ilike '%FY19/20 Winter - Retargeting%' THEN 'Skippable Pre-Roll Video - Retargeting'
          WHEN ${campaign} ilike '%FY19/20 Winter%' THEN 'Skippable Pre-Roll Video'


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

  dimension: account {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    #hidden: yes
    group_label: "Trueview IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: campaign {
    type: string
    group_label: "Trueview Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    #hidden: yes
    group_label: "Trueview IDs"
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
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

  dimension_group: day {
    type: time
    group_label: "Date Periods"
    label: ""
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

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: ${TABLE}.views ;;
  }

  dimension: views_to_q25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q25 ;;
  }

  dimension: views_to_q50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q25 ;;
  }

  dimension: views_to_q75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q75 ;;
  }

  dimension: video_completes {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_q100 ;;
  }

  ###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "Conversion Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${conversions} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate  {
    label: "CVR"
    group_label: "Conversion Reporting"
    type: number
    sql: ${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "Conversion Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_conversions} ,0);;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    label: "Video Views"
    group_label: "Trueview Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views} ;;
  }

  measure: total_views_to_q25 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 25%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_to_q25} ;;
  }

  measure: total_views_to_q50 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 50%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_to_q50} ;;
  }

  measure: total_views_to_q75 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 75%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_to_q75} ;;
  }

  measure: total_video_completes {
    type: sum_distinct
    value_format_name: decimal_0
    label: "Video Completes"
    group_label: "Trueview Reporting"
    hidden: no
    sql_distinct_key: ${comp_key} ;;
    sql: ${video_completes} ;;
  }

  measure: view_at_q25_rate  {
    label: "% Played to 25%"
    group_label: "Quartile Reporting"
    type: number
    sql: ${total_views_to_q25}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_at_q50_rate  {
    label: "% Played to 50%"
    group_label: "Quartile Reporting"
    type: number
    sql: ${total_views_to_q50}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_at_q75_rate  {
    label: "% Played to 75%"
    group_label: "Quartile Reporting"
    type: number
    sql: ${total_views_to_q75}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: view_rate  {
    label: "View Rate"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate  {
    label: "Completion Rate"
    group_label: "Trueview Reporting"
    type: number
    sql: ${total_video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_sessions {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${comp_key} ;;
    sql: 0 ;;
  }

  measure: total_session_duration {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${comp_key} ;;
    sql: 0 ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id, client_name, reportname]
#   }
}
