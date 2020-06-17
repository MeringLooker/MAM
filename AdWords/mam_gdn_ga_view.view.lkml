view: mam_gdn_ga_view{
  sql_table_name: mam_gdn_ga_view;;

###### Primary Key #######

  dimension: comp_key {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
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

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
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

  dimension: newsletter_signup {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_signup ;;
  }

  dimension: search_flights_button {
    type: number
    hidden: yes
    sql: ${TABLE}.search_flights_button ;;
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

  dimension: visitor_guide_order {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_order ;;
  }

  ###### All Measures go Below #######

  measure: total_impressions {
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    group_label: "AdWords Reporting"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    group_label: "AdWords Reporting"
    sql: ${clicks} ;;
  }

  measure: total_cost {
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    group_label: "AdWords Reporting"
    sql:${cost}/1000000.00  ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    group_label: "AdWords Reporting"
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
    sql_distinct_key: ${comp_key} ;;
    hidden: yes
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    hidden: yes
    sql: ${completes} ;;
  }

  measure: total_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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
    sql_distinct_key: ${comp_key} ;;
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

  measure: total_newsletter_signups {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Newsletter Sign-Ups"
    sql_distinct_key: ${comp_key} ;;
    sql: ${newsletter_signup} ;;
  }

  measure: newsletter_signup_rate  {
    label: "Newsletter Sign-Up Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_newsletter_signups}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_visitor_guide_orders {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Visitor Guide Orders"
    sql_distinct_key: ${comp_key} ;;
    sql: ${visitor_guide_order} ;;
  }

  measure: visitor_guide_order_rate  {
    label: "Visitor Guide Order Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_visitor_guide_orders}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_united_airlines_referrals {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "United Airline Referrals"
    sql_distinct_key: ${comp_key} ;;
    sql: ${united_airlines_referral} ;;
  }

  measure: united_airlines_referral_rate  {
    label: "United Airline Referral Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_united_airlines_referrals}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_tos_above_30s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "TOS Above :30"
    sql_distinct_key: ${comp_key} ;;
    sql: ${tos_above_30s} ;;
  }

  measure: tos_above_30s_rate  {
    label: "TOS Above :30 Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_tos_above_30s}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_search_flights_button {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Search Flights Button"
    sql_distinct_key: ${comp_key} ;;
    sql: ${search_flights_button} ;;
  }

  measure: search_flight_button_rate  {
    label: "Search Flights Button Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_search_flights_button}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }


  measure: count {
    type: count
    drill_fields: []
  }
}