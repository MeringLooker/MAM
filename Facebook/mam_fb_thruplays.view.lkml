view: mam_fb_thruplays {
  sql_table_name: public.mam_fb_thruplays ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: thruplay_join {
    type: string
    sql: ${facebook_ad_id}||'_'||${date_date} ;;
  }

  dimension_group: __senttime {
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
    sql: ${TABLE}.__senttime ;;
  }

  dimension: __state {
    type: string
    sql: ${TABLE}.__state ;;
  }

  dimension_group: __updatetime {
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
    sql: ${TABLE}.__updatetime ;;
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

  dimension: facebook_ad_id {
    type: number
    sql: ${TABLE}.facebook_ad_id ;;
  }

  dimension: facebook_join_id {
    type: string
    sql: ${TABLE}.facebook_join_id ;;
  }

  dimension: thruplays {
    type: number
    sql: ${TABLE}.thruplays ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
