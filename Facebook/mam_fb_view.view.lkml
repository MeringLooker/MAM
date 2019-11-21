view: mam_fb_view {
  sql_table_name: public.mam_fb_view ;;
  drill_fields: [id]

####### Primary Key ########

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

####### Join ID ########

  dimension: comp_key {
    type: string
    sql: ${TABLE}.comp_key ;;
  }

dimension: season {
    label: "Season"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ilike '%Fall%' THEN 'Fall'
        WHEN ${campaign_name} ilike '%Winter%' THEN 'Winter'
        WHEN ${campaign_name} ilike '%Summer%' THEN 'Summer'
        ELSE 'Uncategorized'
        END
        ;;
}

  dimension: fb_layer {
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ilike '%AirService%' THEN 'Air Service'
        ELSE 'Seasonal'
        END
        ;;
  }

######## Dimensions go below ########

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

  dimension: account_id {
    type: number
    hidden: yes
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    hidden: yes
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: number
    hidden: yes
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.adset_name ;;
  }

  dimension: buying_type {
    type: string
    hidden: yes
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
    type: number
    hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: fiscal_year {
    label: "Fiscal"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${date_start_date} BETWEEN '2015-07-01' AND '2016-06-30' THEN 'FY 15/16'
        WHEN ${date_start_date} BETWEEN '2016-07-01' AND '2017-06-30' THEN 'FY 16/17'
        WHEN ${date_start_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${date_start_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_start_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
    drill_fields: [campaign_name]
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: comp_key_backup {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key_backup ;;
  }

  dimension: cost_per_inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_inline_post_engagement ;;
  }

  dimension: cost_per_unique_click {
    type: number
    hidden: yes
    sql: ${TABLE}.cost_per_unique_click ;;
  }

  dimension: country {
    type: string
    group_label: "Facebook Dimensions"
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cpm {
    type: number
    hidden: yes
    sql: ${TABLE}.cpm ;;
  }

  dimension: cpp {
    type: number
    hidden: yes
    sql: ${TABLE}.cpp ;;
  }

  dimension: ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.ctr ;;
  }

  dimension_group: date_start {
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
    sql: ${TABLE}.date_start ;;
  }

  dimension_group: date_stop {
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
    sql: ${TABLE}.date_stop ;;
  }

  dimension: frequency {
    type: number
    hidden: yes
    sql: ${TABLE}.frequency ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_link_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_link_clicks ;;
  }

  dimension: inline_post_engagement {
    type: number
    hidden: yes
    sql: ${TABLE}.inline_post_engagement ;;
  }

  dimension: objective {
    type: string
    group_label: "Facebook Dimensions"
    label: "FB Objective"
    sql: ${TABLE}.objective ;;
  }

  dimension: reach {
    type: number
    hidden: yes
    sql: ${TABLE}.reach ;;
  }

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: unique_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_clicks ;;
  }

  dimension: unique_ctr {
    type: number
    hidden: yes
    sql: ${TABLE}.unique_ctr ;;
  }

####### Meausures go below ######

  measure: total_impressions {
    type: sum_distinct
    label: "Impressions"
    group_label: "Facebook Metrics"
    sql_distinct_key: ${mam_fb_view.id};;
    sql: ${TABLE}.impressions ;;
  }

  measure: total_clicks {
    type: sum_distinct
    label: "Link Clicks"
    group_label: "Facebook Metrics"
    sql_distinct_key: ${mam_fb_view.id};;
    sql: ${TABLE}.inline_link_clicks ;;
  }

  measure: total_spend {
    type: sum_distinct
    label: "Media Spend"
    group_label: "Facebook Metrics"
    sql_distinct_key: ${mam_fb_view.id};;
    sql: ${TABLE}.spend ;;
    value_format_name: usd
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    group_label: "Facebook Metrics"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    group_label: "Facebook Metrics"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    group_label: "Facebook Metrics"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

#### Joined FB Action Measures #####

#### STILL NEED TO INCLUDE OTHER ACTIONS SUCH AS WEBSITE PURCHASES, ETC ####

  measure: video_views {
    type: sum_distinct
    sql_distinct_key: ${facebookads__visit_mammoth_actions.id};;
    label: ":03 Video Views"
    group_label: "Facebook Metrics"
    sql:
      CASE
      WHEN ${facebookads__visit_mammoth_actions.action_type} = 'video_view' THEN ${facebookads__visit_mammoth_actions.value}
      END;;
  }

  measure: video_completes {
    type: sum_distinct
    label: "Views to 100%"
    group_label: "Facebook Metrics"
    sql_distinct_key: ${facebookads__visit_mammoth_video_p100_watched_actions.id};;
    sql: ${facebookads__visit_mammoth_video_p100_watched_actions.value} ;;
  }

  measure: video_completion_rate {
    type: number
    label: "Vid. Completion Rate"
    group_label: "Facebook Metrics"
    sql: 1.0*${video_completes}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  ####### Joined GA Measures #######

  measure: ga_sessions {
    type: sum_distinct
    label: "Sessions"
    group_label: "GA Reporting"
    sql_distinct_key: ${mam_ga_onsite.id};;
    sql: ${mam_ga_onsite.sessions};;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    group_label: "GA Reporting"
    sql: ${total_spend}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: click_to_session {
    type: number
    label: "CTS"
    group_label: "GA Reporting"
    description: "Percent of clicks that result in a session."
    sql: 1.0*${ga_sessions}/nullif(${total_clicks}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_session_duration {
    hidden: yes
    type: sum_distinct
    group_label: "GA Reporting"
    label: "Total Session Duration"
    sql_distinct_key: ${mam_ga_onsite.id};;
    sql: ${mam_ga_onsite.sessionduration};;
  }

  measure: avg_time_on_site {
    label: "Avg. TOS"
    group_label: "GA Reporting"
    type: number
    sql: (${mam_ga_onsite.total_session_duration}/nullif(${mam_ga_onsite.total_sessions}, 0))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: ga_total_users {
    type: sum_distinct
    group_label: "GA Reporting"
    label: "Users"
    sql_distinct_key: ${mam_ga_onsite.id};;
    sql: ${mam_ga_onsite.users};;
  }

  measure: ga_new_users {
    type: sum_distinct
    group_label: "GA Reporting"
    label: "New Users"
    sql_distinct_key: ${mam_ga_onsite.id};;
    sql: ${mam_ga_onsite.newusers};;
  }

  measure: percent_new_users {
    group_label: "GA Reporting"
    label: "% New Users"
    type: number
    sql: 1.0*${ga_new_users}/nullif(${ga_total_users}, 0) ;;
    value_format_name: percent_0
  }

  measure: ga_total_pageviews {
    group_label: "GA Reporting"
    label: "Pageviews"
    type: sum
    sql_distinct_key: ${mam_ga_onsite.id};;
    sql: ${mam_ga_onsite.pageviews} ;;
  }

  measure: pages_per_session {
    group_label: "GA Reporting"
    label: "Pgs/Session"
    type: number
    sql: ${ga_total_pageviews}/nullif(${ga_sessions}, 0) ;;
    value_format: "#.0"
  }

  measure: count {
    type: count
    drill_fields: [id, adset_name, ad_name, campaign_name, account_name]
  }
}
