view: mam_ga_goals {
  sql_table_name: public.mam_ga_goals ;;
  drill_fields: [id]

 ######## Primary Key ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######### Join Id ##########

  dimension: join_id {
    type: string
    hidden: yes
    sql: ${keyword}||'_'||${date_date} ;;
  }

####### AdWords Join ID #######

  dimension: adwords_join_id {
    type: string
    hidden: yes
    sql: ${adwordsadgroupid}||'_'||${date_date} ;;
  }

####### Dimensions go Below ########

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

  dimension: goal10completions {
    type: number
    hidden: yes
    label: "30+ seconds on Site"
    sql: ${TABLE}.goal10completions ;;
  }

  dimension: goal11completions {
    type: number
    hidden: yes
    label: "Flight Search"
    sql: ${TABLE}.goal11completions ;;
  }

  dimension: goal12completions {
    type: number
    hidden: yes
    sql: ${TABLE}.goal12completions ;;
  }

  dimension: goal1completions {
    type: number
    hidden: yes
    label: "Ski Vacation"
    sql: ${TABLE}.goal1completions ;;
  }

  dimension: goal2completions {
    type: number
    hidden: yes
    label: "Newsletter Sign-Up"
    sql: ${TABLE}.goal2completions ;;
  }

  dimension: goal5completions {
    type: number
    hidden: yes
    label: "Visitor Guide Order"
    sql: ${TABLE}.goal5completions ;;
  }

  dimension: goal7completions {
    type: number
    hidden: yes
    label: "Ebook Click"
    sql: ${TABLE}.goal7completions ;;
  }

  dimension: goal9completions {
    type: number
    hidden: yes
    label: "United Airlines Referral"
    sql: ${TABLE}.goal9completions ;;
  }

  dimension: keyword {
    type: string
    hidden: yes
    sql: ${TABLE}.keyword ;;
  }

  dimension: sourcemedium {
    type: string
    label: "Source/ Medium"
    sql: ${TABLE}.sourcemedium ;;
  }

######### All measures go below #########

  measure: total_goal10completions {
    label: "30+ Seconds on Site"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${goal10completions} ;;
  }

  measure: total_goal11completions {
    label: "Flight Search"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${goal11completions} ;;
  }

  measure: total_goal1completions {
    label: "Ski Vacation"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${goal1completions} ;;
  }

  measure: total_goal2completions {
    label: "Newsletter Sign-Up"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${goal2completions} ;;
  }

  measure: total_goal5completions {
    label: "Visitor Guide Order"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${goal5completions} ;;
  }

  measure: total_goal7completions {
    label: "Ebook Click"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${goal7completions} ;;
  }

  measure: total_goal9completions {
    label: "United Airlines Referral"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${goal9completions} ;;
  }


  measure: count {
    type: count
    drill_fields: [id]
  }
}
