include: "/MAM/*"
view: publisher_ndt {
  derived_table: {
    sql:
    select * from ${ndt_dcm_publisher.SQL_TABLE_NAME}
      union
      select * from ${ndt_facebook_publisher.SQL_TABLE_NAME}
      union
      select * from ${ndt_sem_publisher.SQL_TABLE_NAME}
      union
      select * from  ${ndt_gdn_publisher.SQL_TABLE_NAME}
      ;;
    }

dimension: publisher {
  type:  string
  sql:  ${TABLE}.publisher ;;
}

dimension: campaign {
  type: string
  sql: ${TABLE}.campaign ;;
}

  dimension: test_date_string  {
    type: string
    sql: ${TABLE}.test_date_string ;;
  }

  dimension: fiscal_year {
    label: "Fiscal"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${test_date_string} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${test_date_string} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${test_date_string} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${test_date_string} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${test_date_string} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension_group: Test {
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
    sql: ${TABLE}.test_date_string;;
  }
# dimension_group: date {
#     type: time
#   timeframes: [
#     raw,
#     time,
#     date,
#     week,
#     month,
#     quarter,
#     year
#   ]
#     sql: ${TABLE}.date ;;
# }

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

dimension: media_spend{
  hidden: yes
  type: number
  sql: ${TABLE}.total_media_cost ;;
}

dimension: sessions {
  hidden: yes
  type: number
  sql: ${TABLE}.ga_sessions ;;
}

dimension: session_duration {
  hidden: yes
  type: number
  sql: ${TABLE}.ga_total_session_duration ;;
}

dimension: region {
  type:  string
  sql: ${TABLE}.dcm_region ;;
}

dimension: campaign_layer {
  type: string
  sql: ${TABLE}.ndt_mam_campaign;;
}

  dimension: season {
    type: string
    sql: ${TABLE}.ndt_mam_season ;;
  }



#####Measures#####
measure: total_impressions {
  type: sum
  sql: ${impressions} ;;
}

measure:total_clicks  {
  type: sum
  sql: ${clicks} ;;
}
measure:total_spend  {
  type: sum
  sql: ${media_spend};;
  value_format_name: usd
}

measure:total_sessions  {
  type: sum
  sql: ${sessions} ;;
}
measure:total_session_duration  {
  type: sum
  sql: ${session_duration} ;;
  value_format_name: decimal_0
}

  }
