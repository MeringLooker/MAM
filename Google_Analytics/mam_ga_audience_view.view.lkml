view: mam_ga_audience_view {
  sql_table_name: public.mam_ga_audience_view ;;

  ## Primary Key ##

  dimension: audience_join_id {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${TABLE}.audience_join_id ;;
  }

  ## Dimensions joined from Ads Lookup File ##

  ## None Yet ##

  ## Dimensions added to this Table ##

  dimension: traffic_type {
    type: string
    hidden: no
    group_label: "Google Analytics Dimensions"
    description: "This is determined by the medium of traffic. Includes campaign, cpc, ppc, and email traffic."
    sql:
      case
        when ${sourcemedium} ilike '%campaign%' then 'Paid'
        when ${sourcemedium} ilike '%cpc%' then 'Paid'
        when ${sourcemedium} ilike '%ppc%' then 'Paid'
        when ${sourcemedium} ilike '%email%' then 'Paid'
        else 'Not Paid'
        end
        ;;
  }

  dimension: is_paid_traffic {
    type: yesno
    group_label: "Paid Traffic Info"
    description: "This is determined by the medium of traffic. Includes campaign, cpc, ppc, and email traffic."
    sql: ${traffic_type} = 'Paid' ;;
  }

  ## Dimensions Native to this Table ##

  dimension: acq_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.acq_join_id ;;
  }

  dimension: adwordsadgroupid {
    type: string
    hidden: yes
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: city {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.city ;;
  }

  dimension_group: date {
    label: ""
    group_label: "Date Periods"
    type: time
    timeframes: [
      date,
      week,
      month,
      quarter,
      year,
      day_of_week,
      day_of_month,
      month_name,
      month_num,
      week_of_year,
      day_of_year,
    ]
    sql: ${TABLE}.date ;;
  }

  dimension: devicecategory {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Device Category"
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: ga_ads_lookup_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ga_ads_lookup_id ;;
  }

  dimension: keyword {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.keyword ;;
  }

  dimension: medium {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.medium ;;
  }

  dimension: newsletter_sign_ups {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_sign_ups ;;
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

  dimension: source {
    type: string
    group_label: "Google Analytics Dimensions"
    sql: ${TABLE}.source ;;
  }

  dimension: sourcemedium {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "Source / Medium"
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: tos_above_30s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_30s ;;
  }

  dimension: united_airlines_referrals {
    type: number
    hidden: yes
    sql: ${TABLE}.united_airlines_referrals ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: usertype {
    type: string
    group_label: "Google Analytics Dimensions"
    label: "User Type"
    sql: ${TABLE}.usertype ;;
  }

  dimension: visitor_guide_orders {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_orders ;;
  }

  ### All Measures go Below ###

  measure: total_sessions {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${sessions} ;;
    label: "Sessions"
    group_label: "Traffic Metrics"
  }

  measure: total_session_duration {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    hidden: yes
    sql: ${sessionduration} ;;
    group_label: "Traffic Metrics"
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    type: number
    sql: (${total_session_duration}/nullif(${total_sessions},0))::float/86400 ;;
    value_format: "m:ss"
    group_label: "Traffic Metrics"
  }

  measure: total_users {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${users} ;;
    label: "Users"
    group_label: "Traffic Metrics"
  }

  measure: total_new_users {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${newusers} ;;
    label: "New Users"
    group_label: "Traffic Metrics"
  }

  measure: percent_new_users {
    label: "New User Rate"
    group_label: "Traffic Metrics"
    type: number
    sql: 1.0*${total_new_users}/nullif(${total_users}, 0);;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    group_label: "Traffic Metrics"
    sql: ${pageviews} ;;
    label: "Pageviews"
  }

  measure: pages_per_session {
    label: "Pages per Session"
    group_label: "Traffic Metrics"
    type: number
    sql: ${total_pageviews}/nullif(${total_sessions}, 0);;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    group_label: "Traffic Metrics"
    sql: ${bounces} ;;
    label: "Bounces"
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    group_label: "Traffic Metrics"
    type: number
    sql: 1.0*${total_bounces}/nullif(${total_sessions}, 0);;
    value_format_name: percent_0
  }

### Google Analytics  Goals ###

  measure: total_newsletter_sign_ups {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${newsletter_sign_ups} ;;
    label: "Newsletter Sign Ups"
    group_label: "Website Goals"
  }

  measure: total_united_airlines_referrals {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${united_airlines_referrals} ;;
    label: "United Airlines Referrals"
    group_label: "Website Goals"
  }

  measure: total_visitor_guide_orders {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${visitor_guide_orders} ;;
    label: "Vistor Guide Orders"
    group_label: "Website Goals"
  }

  measure: total_tos_above_30s {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${tos_above_30s} ;;
    label: "TOS > 30s"
    group_label: "Website Goals"
  }

  measure: total_search_flights_button {
    type: sum_distinct
    sql_distinct_key: ${audience_join_id} ;;
    sql: ${search_flights_button} ;;
    label: "Search Flights Button"
    group_label: "Website Goals"
  }
}
