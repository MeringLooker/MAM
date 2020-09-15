view: mam_yt_ga_view {
  sql_table_name: public.mam_yt_ga_view ;;

#### Primary Key ####

  dimension: ga_join_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
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
    sql: 'Video' ;;
  }

  dimension: ad_size {
    type: string
    hidden: yes
    label: "Ad Size"
    group_label: "TrueView Dimensions"
    sql: 'Video' ;;
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
        when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery%' then 'FY21 Summer Recovery'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: mam_layer {
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
        CASE
        WHEN ${campaign} ilike '%Retargeting%' THEN 'Retargeting'
        WHEN ${campaign} ilike '%Prospecting%' THEN 'Prospecting'
        WHEN ${campaign_id} = '6542201483' then 'Prospecting'
        WHEN ${campaign_id} = '6542201492' then 'Prospecting'
        WHEN ${campaign_id} = '6542201486' then 'Prospecting'
        WHEN ${campaign_id} = '6542201474' then 'Prospecting'

        when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery' then 'Phase 1 - Awareness'
        when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery - Territory' then 'Phase 1 - Awareness'
        when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery - Locals' then 'Phase 2'

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

          when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery' then 'YouTube Skippable Pre-Roll Video'
          when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery - Territory' then 'YouTube Skippable Pre-Roll Video'
          when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery - Locals' then 'YouTube Skippable Pre-Roll Video'

          ELSE 'Uncategorized'
          END
        ;;
  }

  dimension: mam_audience {
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
        WHEN ${ad_group} ilike '%Travel + Fitness Buffs%' then 'Brand'
        WHEN ${ad_group} ilike '%Luxury Travelers%' then 'Brand'
        WHEN ${ad_group} ilike '%Custom%' then 'Custom'

        when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery' then 'Brand'

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

  dimension: creative_name {
    label: "Creative Name"
    type: string
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery' THEN 'Territory (:30)'
        WHEN ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery - Territory' THEN 'Territory (:30)'
        when ${campaign} ilike 'MAM - FY20/21 - Summer - Recovery - Locals' then 'Locals Welcome (:30)'

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

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
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

  dimension: newsletter_signup {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_signup ;;
  }

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
  }

  dimension: search_flights_button {
    type: number
    hidden: yes
    sql: ${TABLE}.search_flights_button ;;
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

  dimension: tos_above_30s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_30s ;;
  }

  dimension: united_airlines_referral {
    type: number
    hidden: yes
    sql: ${TABLE}.united_airlines_referral ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
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

  dimension: visitor_guide_order {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_order ;;
  }

  ###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type:  sum_distinct
    group_label: "Trueview Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "Conversion Reporting"
    sql_distinct_key: ${ga_join_id} ;;
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
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views} ;;
  }

  measure: total_views_to_q25 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 25%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_to_q25} ;;
  }

  measure: total_views_to_q50 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 50%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_to_q50} ;;
  }

  measure: total_views_to_q75 {
    type: sum_distinct
    group_label: "Quartile Reporting"
    label: "Views To 75%"
    value_format_name: decimal_0
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${views_to_q75} ;;
  }

  measure: total_video_completes {
    type: sum_distinct
    value_format_name: decimal_0
    label: "Video Completes"
    group_label: "Trueview Reporting"
    hidden: no
    sql_distinct_key: ${ga_join_id} ;;
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
    group_label: "GA Reporting"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    label: "Sessions"
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
    sql_distinct_key: ${ga_join_id} ;;
    label: "Total Session Duration"
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
    sql_distinct_key: ${ga_join_id} ;;
    label: "Pageviews"
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
    sql_distinct_key: ${ga_join_id} ;;
    label: "Bounces"
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "GA Reporting"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }


## MAM Google Analytics Goals ##
  measure: total_newsletter_signup {
    group_label: "GA Goals Reporting"
    type:sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${newsletter_signup} ;;
  }

  measure: total_search_flights_button {
    group_label: "GA Goals Reporting"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${search_flights_button};;
  }

  measure: total_tos_above_30s {
    type: sum_distinct
    group_label: "GA Goals Reporting"
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${tos_above_30s} ;;
  }

  measure: total_united_airlines_referral {
    group_label: "GA Goals Reporting"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${united_airlines_referral} ;;
  }

  measure: total_visitor_guide_order {
    group_label: "GA Goals Reporting"
    type: sum_distinct
    sql_distinct_key: ${ga_join_id} ;;
    sql: ${visitor_guide_order} ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [id, client_name, reportname]
#   }
}
