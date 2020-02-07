view: mam_pinterest {
  sql_table_name: public.mam_pinterest ;;

  #### Primary Key ####

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

### GA Join Key ###

  dimension: pinterest_ga_join {
    hidden: yes
    type: string
    sql: ${promoted_pin_id}||'_'||${date_date} ;;
  }

#### Dimensions Added to this table via LookML ####

  dimension: publisher {
    type: string
    group_label: "Pinterest Dimensions"
    sql: 'Pinterest' ;;
  }

  dimension: advertising_channel {
    type: string
    group_label: "Pinterest Dimensions"
    sql: 'Social' ;;
  }

  dimension: fiscal_year {
    type:  string
    group_label: "Date Periods"
    sql:
      CASE
      WHEN ${date_date} BETWEEN '2017-07-01' AND '2018-06-30' THEN 'FY 17/18'
      WHEN ${date_date} BETWEEN '2018-07-01' AND '2019-06-30' THEN 'FY 18/19'
      WHEN ${date_date} BETWEEN '2019-07-01' AND '2020-06-30' THEN 'FY 19/20'
      ELSE 'Uncategorized'
      END
    ;;
  }

  dimension: mam_campaign {
    type: string
    label: "Campaign Name"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign_name} ilike 'MAM_FY20_Winter_%' then 'Winter Seasonal'
        when ${campaign_name} ilike 'MAM_FY20Fall_%' then 'Fall Seasonal'
        when ${campaign_name} ilike 'SDT_FY20_FallPromo%' then 'Fall Promos'
        when ${campaign_name} ilike 'SDT_FY20_AlwaysOnContent%' then 'Always On Content'
        else 'Uncategorized'
        end;;
    }

  dimension: mam_region {
    type: string
    label: "Region"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN  ${campaign_name} ILIKE '%Awareness_SF%' then 'San Francisco'
        WHEN  ${campaign_name} ILIKE '%Traffic_SF%' then 'San Francisco'
        WHEN  ${campaign_name} ILIKE '%TrafficDriving_SF%' then 'San Francisco'

        WHEN  ${campaign_name} ILIKE '%Awareness_NE%' then 'Northeast'
        WHEN  ${campaign_name} ILIKE '%Traffic_NE%' then 'Northeast'

        WHEN  ${campaign_name} ILIKE '%Awareness_CA/NV%' then 'California/Nevada'
        WHEN  ${campaign_name} ILIKE '%Traffic_CA/NV%' then 'California/Nevada'
        WHEN  ${campaign_name} ILIKE '%TrafficDriving_CA/NV%' then 'California/Nevada'

        ELSE 'Uncategorized'
        END;;
  }

    dimension: mam_market {
      type: string
      label: "Market"
      group_label: "Client Dimensions"
      sql: 'United States' ;;
    }

    dimension: mam_placement {
      type: string
      label: "Campaign Placement"
      group_label: "Client Dimensions"
    }

### Dimensions native to this table ###

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

    dimension: ad_group_id {
      type: string
      group_label: "Pinterest IDs"
      sql: ${TABLE}.ad_group_id ;;
    }

    dimension: ad_group_name {
      type: string
      group_label: "Pinterest Dimensions"
      sql: ${TABLE}.ad_group_name ;;
    }

    dimension: campaign_id {
      type: string
      group_label: "Pinterest IDs"
      sql: ${TABLE}.campaign_id ;;
    }

    dimension: campaign_name {
      type: string
      group_label: "Pinterest Dimensions"
      sql: ${TABLE}.campaign_name ;;
    }

    dimension_group: date {
      type: time
      label: ""
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

    dimension: pin_description {
      type: string
      group_label: "Pinterest Dimensions"
      sql: ${TABLE}.pin_description ;;
    }

    dimension: pin_id {
      type: string
      group_label: "Pinterest IDs"
      sql: ${TABLE}.pin_id ;;
    }

    dimension: promoted_pin_id {
      type: string
      group_label: "Pinterest IDs"
      sql: ${TABLE}.promoted_pin_id ;;
    }

    dimension: promoted_pin_name {
      type: string
      group_label: "Pinterest Dimensions"
      sql: ${TABLE}.promoted_pin_name ;;
    }

    dimension: spend {
      type: number
      hidden: yes
      sql: ${TABLE}.spend ;;
    }

    dimension: clicks {
      type: number
      hidden: yes
      sql: ${TABLE}.total_clicks ;;
    }

    dimension: conversions {
      type: number
      hidden: yes
      sql: ${TABLE}.total_conversions ;;
    }

    dimension: impressions {
      type: number
      hidden: yes
      sql: ${TABLE}.total_impressions ;;
    }

    dimension: saves {
      type: number
      hidden: yes
      sql: ${TABLE}.total_saves ;;
    }

    dimension: video_starts {
      type: number
      hidden: yes
      sql: ${TABLE}.total_video_starts ;;
    }

    dimension: video_views {
      type: number
      hidden: yes
      sql: ${TABLE}.total_video_views ;;
    }

    dimension: views_at_100 {
      type: number
      hidden: yes
      sql: ${TABLE}.total_views_at_100 ;;
    }

    dimension: views_at_25 {
      type: number
      hidden: yes
      sql: ${TABLE}.total_views_at_25 ;;
    }

    dimension: views_at_50 {
      type: number
      hidden: yes
      sql: ${TABLE}.total_views_at_50 ;;
    }

    dimension: views_at_75 {
      type: number
      hidden: yes
      sql: ${TABLE}.total_views_at_75 ;;
    }

    dimension: views_at_95 {
      type: number
      hidden: yes
      sql: ${TABLE}.total_views_at_95 ;;
    }

### All measures go below ###

    measure: total_spend {
      type: sum_distinct
      group_label: "Pinterest Delivery"
      sql_distinct_key: ${id} ;;
      sql: ${spend} ;;
      value_format_name: usd
    }

    measure: total_impressions {
      type: sum_distinct
      group_label: "Pinterest Delivery"
      sql_distinct_key: ${id} ;;
      sql: ${impressions} ;;
    }

    measure: total_clicks {
      type: sum_distinct
      group_label: "Pinterest Delivery"
      sql_distinct_key: ${id} ;;
      sql: ${clicks} ;;
    }

    measure: click_through_rate  {
      label: "CTR"
      type: number
      group_label: "Pinterest Delivery"
      sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
      value_format_name: percent_2
    }

    measure: cost_per_click {
      label: "CPC"
      type: number
      group_label: "Pinterest Delivery"
      sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
      value_format_name: usd
    }

    measure: cost_per_thousand  {
      label: "CPM"
      type: number
      group_label: "Pinterest Delivery"
      sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
      value_format_name: usd
    }

    measure: total_conversions {
      type: sum_distinct
      group_label: "Pinterest Delivery"
      sql_distinct_key: ${id} ;;
      sql: ${conversions} ;;
    }

    measure: total_saves {
      group_label: "Pinterest Delivery"
      type: sum_distinct
      sql_distinct_key: ${id} ;;
      sql: ${saves} ;;
    }

    measure: total_video_starts {
      type: sum_distinct
      group_label: "Video Metrics"
      sql_distinct_key: ${id} ;;
      sql: ${video_starts} ;;
    }

    measure: total_video_views {
      type: sum_distinct
      group_label: "Video Metrics"
      sql_distinct_key: ${id} ;;
      sql: ${video_views} ;;
    }

    measure: total_views_at_100 {
      type: sum_distinct
      group_label: "Video Metrics"
      sql_distinct_key: ${id} ;;
      sql: ${views_at_100} ;;
    }

    measure: total_views_at_25 {
      type: sum_distinct
      group_label: "Video Metrics"
      sql_distinct_key: ${id} ;;
      sql: ${views_at_25} ;;
    }

    measure: total_views_at_50 {
      type: sum_distinct
      group_label: "Video Metrics"
      sql_distinct_key: ${id} ;;
      sql: ${views_at_50} ;;
    }

    measure: total_views_at_75 {
      type: sum_distinct
      group_label: "Video Metrics"
      sql_distinct_key: ${id} ;;
      sql: ${views_at_75} ;;
    }

    measure: total_views_at_95 {
      type: sum_distinct
      group_label: "Video Metrics"
      sql_distinct_key: ${id} ;;
      sql: ${views_at_95} ;;
    }

    #### Joined GA Measures ####

    measure: ga_sessions {
      group_label: "GA Reporting"
      type: sum_distinct
      label: "Sessions"
      sql_distinct_key: ${mam_ga_onsite.id};;
      sql: ${mam_ga_onsite.sessions} ;;
    }

    measure: cost_per_session {
      group_label: "GA Reporting"
      type: number
      label: "CPS"
      sql: ${total_spend}/nullif(${ga_sessions}, 0) ;;
      value_format_name: usd
    }

    measure: ga_total_session_duration {
      hidden: yes
      group_label: "GA Reporting"
      type: sum_distinct
      sql_distinct_key: ${mam_ga_onsite.id};;
      label: "Total Session Duration"
      sql: ${mam_ga_onsite.sessionduration} ;;
    }

    measure: ga_avg_session_duration {
      type: number
      label: "Avg. TOS"
      group_label: "GA Reporting"
      sql: (${ga_total_session_duration}/nullif(${ga_sessions}, 0))::float/86400 ;;
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
      sql: ${ga_new_users}/nullif(${ga_total_users}, 0) ;;
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
      sql: ${ga_total_pageviews}/nullif(${ga_sessions}, 0) ;;
      value_format: "#.0"
    }

    measure: count {
      type: count
      drill_fields: [id, ad_group_name, campaign_name, promoted_pin_name]
    }
  }
