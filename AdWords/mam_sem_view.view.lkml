view: mam_sem_view{
sql_table_name: mam_sem_view;;
drill_fields: [id]

#### Primary Key ####

 dimension: id {
  hidden: yes
  primary_key: yes
  type: string
  sql: ${TABLE}.id ;;
}

###### Join ID #######

dimension: join_id {
  hidden: no
  type: string
  sql: ${ad_group_id}||'_'||${day_date}
    ;;
}

dimension: compkey {
  type: string
  hidden: yes
  group_label: "AdWords Dimensions"
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
  sql: 'Search';;
}
  dimension: publisher {
    type:  string
    group_label: "AdWords Dimensions"
    sql: 'Google Search';;
  }

dimension: mam_campaign {
  type: string
  label: "Campaign Name"
  group_label: "Client Dimensions"
  sql:
      CASE
      when ${account} = 'MAM SEM - Air Service - Denver' and ${day_date} BETWEEN '2019-10-14' AND '2020-04-05' then 'Winter Air Service'
      when ${account} = 'MAM SEM - Air Service - SF' and ${day_date} BETWEEN '2019-10-14' AND '2020-04-05' then 'Winter Air Service'
      when ${account} = 'MAM SEM - Air Service - Northeast' and ${day_date} BETWEEN '2019-10-14' AND '2020-04-05' then 'Winter Air Service'
      when ${account} = 'MAM SEM - Air Service - SoCal' and ${day_date} BETWEEN '2019-10-14' AND '2020-04-05' then 'Winter Air Service'
      when ${account} = 'MAM SEM - Denver' and ${day_date} BETWEEN '2019-09-28' AND '2020-04-05' then 'Winter Seasonal'
      when ${account} = 'MAM SEM - SF' and ${day_date} BETWEEN '2019-09-28' AND '2020-04-05' then 'Winter Seasonal'
      when ${account} = 'MAM SEM - Northeast' and ${day_date} BETWEEN '2019-09-28' AND '2020-04-05' then 'Winter Seasonal'
      when ${account} = 'MAM SEM - CA/NV' and ${day_date} BETWEEN '2019-09-28' AND '2020-04-05' then 'Winter Seasonal'
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
        when ${account} = 'MAM SEM - Air Service - Denver' then 'Denver'
        when ${account} = 'MAM SEM - Air Service - Northeast' then 'Northeast'
        when ${account} = 'MAM SEM - Air Service - SF' then 'San Francisco'


        WHEN  ${campaign} ILIKE '%SF' then 'San Francisco'
        WHEN  ${campaign} ILIKE '%DEN' then 'Denver'
        WHEN  ${campaign} ILIKE 'Air Service - Denver' then 'Denver'
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

###### All Dimensions go Below #######

dimension_group: __senttime {
  hidden:yes
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

dimension_group: __updatetime {
  hidden: yes
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
  group_label: "AdWords Dimensions"
  type: number
  sql: ${TABLE}."ad group id" ;;
}

dimension: ad_group_state {
  hidden: yes
  type: string
  sql: ${TABLE}."ad group state" ;;
}

dimension: avg__position {
  hidden: yes
  type: string
  sql: ${TABLE}."avg. position" ;;
}

dimension: campaign {
  type: string
  group_label: "AdWords Dimensions"
  sql: ${TABLE}.campaign ;;
}

dimension: campaign_id {
  group_label: "AdWords Dimensions"
  type: number
  sql: ${TABLE}."campaign id" ;;
}

dimension: campaign_state {
  hidden: yes
  type: string
  sql: ${TABLE}."campaign state" ;;
}

dimension: clicks {
  hidden:  yes
  type: number
  sql: ${TABLE}.clicks ;;
}

dimension: conversions {
  hidden: yes
  type: number
  sql: ${TABLE}.conversions ;;
}

dimension: cost {
  hidden: yes
  type: number
  sql: ${TABLE}.cost ;;
}

dimension_group: day {
  group_label: "Date Periods"
  label: ""
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
  sql: ${TABLE}.day ;;
}

dimension: device {
  type: string
  group_label: "AdWords Dimensions"
  sql: ${TABLE}.device ;;
}

dimension: device_formatted {
  type: string
  hidden: yes
  group_label: "AdWords Dimensions"
  sql: ${TABLE}.device_formatted ;;
}

dimension: impressions {
  hidden: yes
  type: number
  sql: ${TABLE}.impressions ;;
}

dimension: reportname {
  hidden: yes
  type: string
  sql: ${TABLE}.reportname ;;
}

dimension: search_impr__share {
  hidden: yes
  type: string
  sql: ${TABLE}."search impr. share" ;;
}

dimension: search_lost_is_rank {
  hidden: yes
  type: string
  sql: ${TABLE}."search lost is (rank)" ;;
}

dimension: total_conv__value {
  hidden: yes
  type: number
  sql: ${TABLE}."total conv. value" ;;
}

dimension: views {
  hidden: yes
  type: number
  sql: '0' ;;
}

###### All Measures go Below #######

measure: total_impressions {
  type: sum_distinct
  group_label: "AdWords Reporting"
  sql_distinct_key: ${id} ;;
  sql: ${impressions} ;;
}

measure: total_clicks {
  type: sum_distinct
  group_label: "AdWords Reporting"
  sql_distinct_key: ${id} ;;
  sql: ${clicks} ;;
}

measure: total_cost {
  type:  sum_distinct
  group_label: "AdWords Reporting"
  sql_distinct_key: ${id} ;;
  sql:${cost}/1000000.00  ;;
  value_format_name: usd
}

measure: total_conversions {
  type: sum_distinct
  group_label: "AdWords Reporting"
  sql_distinct_key: ${id} ;;
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
  group_label: "AdWords Reporting"
  sql_distinct_key: ${id} ;;
  sql: ${views} ;;
}

######## Joined measures from GA #######

measure: ga_sessions {
  group_label: "GA Reporting"
  type: sum_distinct
  label: "Sessions"
  sql_distinct_key: ${mam_ga_onsite.id} ;;
  sql: ${mam_ga_onsite.sessions} ;;
}

measure: cost_per_session {
  group_label: "GA Reporting"
  type: number
  label: "CPS"
  sql: ${total_cost}/nullif(${ga_sessions}, 0) ;;
  value_format_name: usd
}

measure: ga_total_session_duration {
  type: sum_distinct
  label: "Total Session Duration"
  sql_distinct_key: ${mam_ga_onsite.id};;
  sql: ${mam_ga_onsite.sessionduration};;
}

measure: avg_time_on_site {
  group_label: "GA Reporting"
  label: "Avg. TOS"
  type: number
  sql:  (${mam_ga_onsite.total_session_duration}/nullif(${mam_ga_onsite.total_sessions}, 0))::float/86400  ;;
  value_format: "m:ss"
}

measure: ga_total_users {
  group_label: "GA Reporting"
  label: "Users"
  type: sum_distinct
  sql_distinct_key: ${mam_ga_onsite.id};;
  sql: ${mam_ga_onsite.users} ;;
}

measure: ga_new_users {
  group_label: "GA Reporting"
  label: "New Users"
  type: sum_distinct
  sql_distinct_key: ${mam_ga_onsite.id};;
  sql: ${mam_ga_onsite.newusers} ;;
}

measure: percent_new_users {
  group_label: "GA Reporting"
  label: "% New Users"
  type: number
  sql: ${mam_ga_onsite.new_users}/nullif(${mam_ga_onsite.total_users}, 0) ;;
  value_format_name: percent_0
}

measure: ga_total_pageviews {
  group_label: "GA Reporting"
  label: "Pageviews"
  type: sum_distinct
  sql_distinct_key: ${mam_ga_onsite.id};;
  sql: ${mam_ga_onsite.pageviews} ;;
}

measure: pages_per_session {
  group_label: "GA Reporting"
  label: "Pgs/Session"
  type: number
  sql: ${mam_ga_onsite.total_pageviews}/nullif(${mam_ga_onsite.total_sessions}, 0) ;;
  value_format: "#.0"
}


measure: count {
  type: count
  drill_fields: [id, reportname]
}
}
