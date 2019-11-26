view: mam_dcm_view {
  sql_table_name: public.mam_dcm_view ;;
  drill_fields: [id]

######## Primary Key ########

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

######### All Dimensions go Below #########

  dimension: __id {
    type: string
    hidden: yes
    sql: ${TABLE}.__id ;;
  }

  dimension: __report {
    type: number
    hidden: yes
    sql: ${TABLE}.__report ;;
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

  dimension: __state {
    type: string
    hidden: yes
    sql: ${TABLE}.__state ;;
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

  dimension: active_view__measurable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: % measurable impressions"
      ;;
  }

  dimension: active_view__viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: % viewable impressions"
      ;;
  }

  dimension: active_view_eligible_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: eligible impressions"
      ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: measurable impressions"
      ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."active view: viewable impressions"
      ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ad id" ;;
  }

  dimension: advertiser {
    type: string
    hidden: yes
    sql: ${TABLE}.advertiser ;;
  }

  dimension: booked_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}."booked clicks" ;;
  }

  dimension: booked_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."booked impressions" ;;
  }

  dimension: booked_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}."booked viewable impressions" ;;
  }

  dimension: campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}."campaign id" ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: clickthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through conversions" ;;
  }

  dimension: clickthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."click-through revenue" ;;
  }

  dimension: comp_key {
    type: string
    hidden: yes
    sql: ${TABLE}.comp_key ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    hidden: yes
    sql: ${TABLE}."creative id" ;;
  }

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension: fiscal_year {
    type: string
    group_label: "Client Dimensions"
    label: "Fiscal Year"
    sql:
      CASE
        WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
        WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
        WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}."media cost" ;;
  }

  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    hidden: yes
    sql: ${TABLE}."placement id" ;;
  }

  dimension: advertising_channel {
    type: string
    group_label: "DCM Dimensions"
    label: "Channel"
    sql: ${TABLE}."placement strategy" ;;
  }

  dimension: planned_media_cost {
    type: number
    hidden: yes
    sql: ${TABLE}."planned media cost" ;;
  }

  dimension: platform_type {
    type: string
    hidden: yes
    sql: ${TABLE}."platform type" ;;
  }

  dimension: site_dcm {
    type: string
    label: "Site"
    sql: ${TABLE}."site (dcm)" ;;
  }

  dimension: total_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."total conversions" ;;
  }

  dimension: total_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."total revenue" ;;
  }

  dimension: viewthrough_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through conversions" ;;
  }

  dimension: viewthrough_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}."view-through revenue" ;;
  }

############ All Measures go Below #########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.impressions ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Clicks"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}.clicks ;;
  }

  measure: click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_active_view_measureable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Active View Measureable Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."active view: measurable impressions";;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Active View Viewable Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."active view: viewable impressions" ;;
  }

  measure: total_viewability {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewability"
    sql: ${total_active_view_viewable_impressions}/nullif(${total_active_view_measureable_impressions}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_media_cost {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Media Spend"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${TABLE}."media cost" ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_media_cost}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: viewable_click_through_rate {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CTR"
    sql: ${total_clicks}/nullif(${total_active_view_viewable_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: viewable_cpm {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewable CPM"
    sql: 1.0*${total_media_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

######## Joined measures from GA #######

  measure: ga_sessions {
    group_label: "GA Reporting"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${mam_ga_onsite.id};;
    sql: ${mam_ga_onsite.sessions};;
  }

  measure: cost_per_session {
    group_label: "GA Reporting"
    type: number
    label: "CPS"
    sql: ${total_media_cost}/nullif(${ga_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: ga_total_session_duration {
    hidden: yes
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
    drill_fields: [id]
  }
}
