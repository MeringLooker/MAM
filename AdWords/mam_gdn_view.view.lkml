view: mam_gdn_view{
  sql_table_name: mam_gdn_ga_view;;

###### Primary Key #######

  dimension: comp_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

######## Dimensions added to this table via LookML ########

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
    label: "Channel"
    group_label: "AdWords Dimensions"
    sql: 'Display'  ;;
  }

  dimension: mam_campaign {
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ILIKE '%FY20 Winter - Traffic%' THEN 'Winter Seasonal'
        WHEN ${campaign} ILIKE '%FY20 Winter - Conversion%' THEN 'Winter Seasonal'
        WHEN ${campaign} ILIKE '%FY20 Winter - Air Service%' THEN 'Winter Air Service'
        WHEN ${campaign} ILIKE '%FY19/20 Fall - Traffic%' THEN 'Fall'
        WHEN ${campaign} ILIKE '%FY19/20 Fall - Conversion%' THEN 'Fall'

        ELSE 'Uncategorized'
        END
    ;;
  }

  dimension: mam_campaign_layer { # this may no longer be used 1/14 - JJ
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ILIKE '%FY20 Winter - Traffic%' THEN 'Seasonal'
        WHEN ${campaign} ILIKE '%FY20 Winter - Conversion%' THEN 'Seasonal'
        WHEN ${campaign} ILIKE '%FY20 Winter - Air Service%' THEN 'Air Service'
        WHEN ${campaign} ILIKE '%FY19/20 Fall - Traffic%' THEN 'Seasonal'
        WHEN ${campaign} ILIKE '%FY19/20 Fall - Conversion%' THEN 'Seasonal'
        ELSE 'Uncategorized'
        END
    ;;
  }

  dimension: region {
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN  ${campaign} ILIKE '%SF' then 'San Francisco'
        WHEN  ${campaign} ILIKE '%DEN' then 'Denver'
        WHEN  ${campaign} ILIKE '%NE' then 'Northeast'
        WHEN  ${campaign} ILIKE '%CA/NV' then 'California/Nevada'
        WHEN  ${campaign} ILIKE '%SoCal' then 'Los Angeles'
        WHEN  ${campaign} ILIKE '%Fresno' then 'Fresno'
        WHEN  ${campaign} ILIKE '%Sac' then 'Sacramento'
        WHEN  ${campaign} ILIKE '%SD' then 'San Diego'
        WHEN  ${campaign} ILIKE '%LA' then 'Los Angeles'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: mam_placement {
    type:  string
    label: "Placement"
    group_label: "AdWords Dimensions"
    sql:
      case
        when ${ad_group} ilike '%AirService - site Visitor lookalike%' then 'Responsive Display - Site Visitor Lookalikes'
        when ${ad_group} ilike '%AirService - retargeting%' then 'Responsive Display - Retargeting'
        when ${ad_group} ilike '%AirService - Competitive Destinations%' then 'Responsive Display - Competitive Destinations'
        when ${campaign} ilike '%FY20 WINTER - TRAFFIC%' then 'Responsive Display - Click-Driving'
        when ${campaign} ilike '%FY20 WINTER - Conversion%' then 'Responsive Display - Time On Site Driving'
        else  'Uncategorized'
        end;;
  }

  dimension: strategy {
    type: string
    group_label: "AdWords Dimensions"
    sql:
      CASE
        WHEN  ${ad_group} ILIKE 'traffic%' then 'Traffic'
        WHEN  ${ad_group} ILIKE 'conversion%' then 'Conversion'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: audience {
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN  ${ad_group} ILIKE '%Competitive Destinations' then 'Competitive Conquesting'
        WHEN  ${ad_group} ILIKE '%Competitive Destinations%' then 'Competitive Conquesting'
        WHEN  ${ad_group} ILIKE '%Site Visitor Lookalike' then 'Site Visitor Lookalike'
        WHEN  ${ad_group} ILIKE '%Site Visitor Lookalike%' then 'Site Visitor Lookalike'
        WHEN  ${ad_group} ILIKE '%Ski Topics' then 'Ski Topics'
        WHEN  ${ad_group} ILIKE '%Ski Enthusiasts' then 'Ski Enthusiasts'
        WHEN  ${ad_group} ILIKE '%Retargeting' then 'Retargeting'
        WHEN  ${ad_group} ILIKE '%Retargeting%' then 'Retargeting'
        WHEN  ${ad_group} ILIKE '%in-Market Travel'then 'In-Market Travel'
        WHEN  ${ad_group} ILIKE '%inMarket Travel'then 'In-Market Travel'
        WHEN  ${ad_group} ILIKE 'in-Market Travel%'then 'In-Market Travel'
        WHEN  ${ad_group} ILIKE '% Outdoor Enthusiasts' then 'Outdoor Enthusiasts'
        ELSE 'Uncategorized'
        END;;
  }

  dimension: publisher {
    type:  string
    group_label: "AdWords Dimensions"
    sql: 'Google Display' ;;
  }

###### All Dimensions go Below #######

  dimension: account {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.account ;;
  }

  dimension: ad_group {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}."ad group" ;;
  }

  dimension: ad_group_id {
    type: number
    group_label: "AdWords IDs"
    sql: ${TABLE}."ad group id" ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    group_label: "AdWords Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "AdWords IDs"
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

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: sessionduration {
    type: number
    hidden: yes
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    hidden: yes
    sql: ${TABLE}.sessions ;;
  }

  dimension: total_conv_value {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conv_value ;;
  }

  dimension: views {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  dimension: completes {
    type: number
    hidden: yes
    sql: 0 ;;
  }

  ###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "AdWords Reporting"
    sql_distinct_key: ${comp_key} ;;
    sql: ${conversions} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversion_rate  {
    label: "CVR"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_conversions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_conversion {
    label: "CPA"
    group_label: "AdWords Reporting"
    type: number
    sql: ${total_cost}/nullif(${total_conversions} ,0);;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${comp_key} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    hidden: yes
    sql_distinct_key: ${comp_key} ;;
    sql: ${completes} ;;
  }

  measure: total_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${comp_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_session_duration {
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${comp_key};;
    sql: ${sessionduration};;
  }

  measure: avg_time_on_site {
    group_label: "GA Reporting"
    label: "Avg. TOS"
    type: number
    sql:  (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }

  measure: total_pageviews {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Pageviews"
    sql_distinct_key: ${comp_key} ;;
    sql: ${sessions} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    type: number
    label: "Pages/Session"
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Bounces"
    sql_distinct_key: ${comp_key} ;;
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "GA Reporting"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
