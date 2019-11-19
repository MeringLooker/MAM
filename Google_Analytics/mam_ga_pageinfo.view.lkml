view: mam_ga_pageinfo {
  sql_table_name: public.mam_ga_pageinfo ;;
  drill_fields: [id]

######## Primary Key ########

  dimension: id {
    primary_key: yes
    type: string
    hidden: yes
    sql: ${TABLE}.id ;;
  }

######### Join Id ##########

  dimension: join_id {
    hidden: yes
    type: string
    sql: ${keyword}||'_'||${date_date} ;;
  }

####### AdWords Join ID #######

  dimension: adwords_join_id {
    hidden: yes
    type: string
    sql: ${adwordsadgroupid}||'_'||${date_date} ;;
  }

####### All Dimensions go Below #######

  dimension: __sampled {
    type: yesno
    hidden: yes
    sql: ${TABLE}.__sampled ;;
  }

  dimension_group: __senttime {
    type: time
    hidden: yes
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
    hidden: yes
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

  dimension: adwordsadgroupid {
    type: number
    hidden: yes
    value_format_name: id
    sql: ${TABLE}.adwordsadgroupid ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension_group: date {
    type: time
    group_label: "Date Periods"
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

  dimension: devicecategory {
    type: string
    label: "Device Type"
    sql: ${TABLE}.devicecategory ;;
  }

  dimension: entrances {
    type: number
    hidden: yes
    sql: ${TABLE}.entrances ;;
  }

  dimension: keyword {
    type: string
    hidden: yes
    sql: ${TABLE}.keyword ;;
  }

  dimension: newusers {
    type: number
    hidden: yes
    sql: ${TABLE}.newusers ;;
  }

  dimension: pagepath {
    type: string
    label: "Page Path"
    sql: ${TABLE}.pagepath ;;
  }

  dimension: pagetitle {
    type: string
    label: "Page Title"
    sql: ${TABLE}.pagetitle ;;
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

  dimension: sourcemedium {
    type: string
    label: "Source / Medium"
    sql: ${TABLE}.sourcemedium ;;
  }

  dimension: timeonpage {
    type: number
    hidden: yes
    sql: ${TABLE}.timeonpage ;;
  }

  dimension: totalevents {
    type: number
    hidden: yes
    sql: ${TABLE}.totalevents ;;
  }

  dimension: uniqueevents {
    type: number
    hidden: yes
    sql: ${TABLE}.uniqueevents ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

######### All measures go below #########

  measure: total_sessions {
    label: "Sessions"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessions ;;
  }

  measure: total_session_duration {
    label: "Total Time on Site"
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.sessionduration ;;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS - Unformatted"
    hidden: yes
    description: "Average Length of a User's session"
    type: number
    sql: ${total_session_duration}/nullif(${total_sessions}, 0);;
    value_format: "0.##"
  }

  measure: formatted_tos {
    label: "Avg. TOS"
    type: number
    sql:  ${avg_time_on_site}::float/86400 ;;
    value_format: "m:ss"
  }

  measure: total_entrances {
    label: "Entrances"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.entrances ;;
  }

  measure: total_users {
    label: "Users"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.users ;;
  }

  measure: new_users {
    label: "New Users"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.newusers ;;
  }

  measure: percent_new_users {
    label: "% New Users"
    type: number
    sql: ${new_users}/nullif(${total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_pageviews {
    label: "Pageviews"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.pageviews ;;
  }

  measure: total_time_on_page {
    label: "Total Time on Page"
    hidden: yes
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.timeonpage ;;
  }

  measure: avg_time_on_page {
    label: "Avg. TOS - Unformatted"
    hidden: yes
    description: "Average Length Time on Page"
    type: number
    sql: ${total_time_on_page}/nullif(${total_pageviews}, 0);;
    value_format: "0.##"
  }

  measure: formatted_top {
    label: "Avg. TOP"
    type: number
    sql:  ${avg_time_on_page}::float/86400 ;;
    value_format: "m:ss"
  }

  measure: pages_per_session {
    label: "Pgs/Session"
    type: number
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: total_bounces {
    label: "Bounces"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.bounces ;;
  }

  measure: bounce_rate {
    label: "Bounce Rate"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_events {
    label: "Events"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.totalevents ;;
  }

  measure: total_unique_events {
    label: "Unique Events"
    type: sum_distinct
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.uniqueevents ;;
  }

  measure: events_per_pageview {
    label: "Events/Pageview"
    type: number
    sql: ${total_events}/nullif(${total_pageviews},0) ;;
    value_format: "0.##"
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
