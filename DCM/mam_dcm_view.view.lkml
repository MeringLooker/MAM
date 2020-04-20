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


  dimension: ga_join_id {
    hidden: yes
    type: string
    sql: ${ad_id}||'_'||${date_date} ;;
  }

##### Dimensions added to this table via LookML ######

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

  dimension: mam_campaign {
    type: string
    label: "Campaign"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign_id} = '23182329' then 'Winter Seasonal'
        WHEN ${campaign_id} = '23188164' then 'Winter Air Service'
        WHEN ${campaign_id} = '22311158' then 'Winter'
        WHEN ${campaign_id} = '22439071' then 'Summer'
        WHEN ${campaign_id} = '23018327' then 'Fall'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: mam_campaign_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign_id} = '23182329' then 'Seasonal'
        WHEN ${campaign_id} = '23188164' then 'Air Service'
        WHEN ${campaign_id} = '22311158' then 'Seasonal'
        WHEN ${campaign_id} = '22439071' then 'Seasonal'
        WHEN ${campaign_id} = '23018327' then 'Seasonal'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: mam_placement {
    type: string
    label: "Placement Name"
    group_label: "Client Dimensions"
    sql:
      CASE

        WHEN ${placement} ilike '%\\_4ScreenVideoPackage\\_Smartphone%' then '4 Screen Video - Smartphone'
        WHEN ${placement} ilike '%\\_4ScreenVideoPackage\\_Desktop%' then '4 Screen Video - Desktop'
        WHEN ${placement} ilike '%\\_4ScreenVideoPackage\\_Tablet%' then '4 Screen Video - Tablet'
        WHEN ${placement} ilike '%\\_4ScreenVideoPackage\\_CTV%' then '4 Screen Video - CTV'
        WHEN ${placement} ilike '%\\_AV3ScreenVideoPackage\\_Smartphone%' then 'AV - 3 Screen Video Package - Smartphone'
        WHEN ${placement} ilike '%\\_AV3ScreenVideoPackage\\_Desktop%' then 'AV - 3 Screen Video Package - Desktop'
        WHEN ${placement} ilike '%\\_AV3ScreenVideoPackage\\_Tablet%' then 'AV - 3 Screen Video Package - Tablet'
        WHEN ${placement} ilike '%\\_CDDisplay\\_%' and ${placement} ilike '%Tablet%' then 'Cross-Device Display - Tablet'
        WHEN ${placement} ilike '%\\_CDDisplay\\_%' and ${placement} ilike '%Smartphone%' then 'Cross-Device Display - Smartphone'
        WHEN ${placement} ilike '%\\_CDDisplay\\_%' and ${placement} ilike '%Desktop%' then 'Cross-Device Display - Desktop'
        WHEN ${placement} ilike '%\\_CCDisplay\\_%' and ${placement} ilike '%Tablet%' then 'Cross-Device Display - Tablet'
        WHEN ${placement} ilike '%\\_CCDisplay\\_%' and ${placement} ilike '%Smartphone%' then 'Cross-Device Display - Smartphone'
        WHEN ${placement} ilike '%\\_CCDisplay\\_%' and ${placement} ilike '%Desktop%' then 'Cross-Device Display - Desktop'
        WHEN ${placement} ilike '%\\_NativeDisplayPackage\\_%' and ${placement} ilike '%Tablet%' then 'Native Display - Tablet'
        WHEN ${placement} ilike '%\\_NativeDisplayPackage\\_%' and ${placement} ilike '%Smartphone%' then 'Native Display - Smartphone'
        WHEN ${placement} ilike '%\\_NativeDisplayPackage\\_%' and ${placement} ilike '%Desktop%' then 'Native Display - Desktop'
        WHEN ${placement} ilike '%AV Big Box%' then 'AV Big Box Display'
        WHEN ${placement} ilike '%AV Half Page Sticky%' then 'Half Page Sticky'
        WHEN ${placement} ilike '%AVStandard Display Banners%' then 'AV Standard Banners ROS'
        WHEN ${placement} ilike '%\\_Standard Display Banners%' then 'Standard Banners ROS'
        WHEN ${placement} ilike '%\\_Video\\_Preroll/Outstream%' then 'Video/PreRoll/Outstream'
        WHEN ${placement} ilike '%\\_Custom Mobile Unit\\_Expandable Video%' then 'Custom Mobile Unit - Expandable Video'
        WHEN ${placement} ilike '%\\_Custom Mobile Unit\\_Scroller%' then 'Custom Mobile Unit - Scroller'
        WHEN ${placement} ilike '%\\_Display\\_Roller%' then 'Roller Display'
        WHEN ${placement} ilike '%\\_Rich Media\\_300x600expands%' then 'Expandable Rich Media Display'
        WHEN ${placement} ilike '%\\_Video In-read%' then 'In-Read Video'
        WHEN ${placement} ilike '%\\_AV Display\\_%' then 'AV Standard Display'
        WHEN ${placement} ilike '%\\_Standard\\_Video Billboard\\_%' then 'Standard/Video Billboard'
        WHEN ${placement} ilike '%\\_Standard Display\\_Roadblock%' then 'Standard Display Roadblock'
        WHEN ${placement} ilike 'Opensnow.com\\_Display\\_Desktop%' then 'Standard Display - Desktop Site'
        WHEN ${placement} ilike 'Opensnow.com\\_Display\\_Mobile%' then 'Standard Display - Mobile Site'
        WHEN ${placement} ilike 'Opensnow.com\\_Display\\_App%' then 'Standard Display - App'
        WHEN ${placement} ilike 'Opensnow.com\\_Display\\_Marquee App%' then 'Marquee Display - App'
        WHEN ${placement} ilike 'Opensnow.com\\_Display\\_Marquee Desktop%' then 'Marquee Display - Desktop'
        WHEN ${placement} ilike 'Opensnow.com\\_Display\\_Marquee Mobile%' then 'Marquee Display - Mobile Site'
        WHEN ${placement} ilike '%Repromo Matador Content%' then 'Matador Content Distribution'
        WHEN ${placement} ilike '%Matador Experience%' then 'Matador Experience Distribution'
        WHEN ${placement} ilike 'Amobee\\_NativeDisplay\\_%' and ${placement} ilike '%Tablet%' then 'Native Display - Tablet'
        WHEN ${placement} ilike 'Amobee\\_NativeDisplay\\_%' and ${placement} ilike '%Smartphone%' then 'Native Display - Smartphone'
        WHEN ${placement} ilike 'Amobee\\_NativeDisplay\\_%' and ${placement} ilike '%Desktop%' then 'Native Display - Desktop'
        WHEN ${placement} ilike 'Amobee\\_AV3ScreenDisplay\\_%' and ${placement} ilike '%Tablet%' then 'AV 3 Screen Video - Tablet'
        WHEN ${placement} ilike 'Amobee\\_AV3ScreenDisplay\\_%' and ${placement} ilike '%Smartphone%' then 'AV 3 Screen Video - Smartphone'
        WHEN ${placement} ilike 'Amobee\\_AV3ScreenDisplay\\_%' and ${placement} ilike '%Desktop%' then 'AV 3 Screen Video - Desktop'
        WHEN ${placement} ilike 'Sharethrough\\_Native Display\\_%' then 'Native Display'
        WHEN ${placement} ilike 'Sharethrough\\_Native Display Added Value\\_%' then 'AV Native Display'
        WHEN ${placement} ilike '\\_Pre-Roll :30\\_' then '4-Screen Video'
        WHEN ${placement} ilike 'Amobee\\_RON\\_%' then '3-Screen Display'
        WHEN ${placement} ilike 'Amobee\\_R0N%' then '3-Screen Display'
        WHEN ${placement} ilike 'ROS Big Box%' then 'ROS Big Box'
        WHEN ${placement} ilike 'Matador Experience-%' then 'Matador Experience Distribution'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: mam_region {
    type: string
    label: "Region"
    group_label: "Client Dimensions"
    sql:
    CASE

    WHEN ${placement} ilike '%\\_SF\\_%' then 'San Francisco'
    WHEN ${placement} ilike '%\\_NE\\_%' then 'Northeast'
    WHEN ${placement} ilike '%\\_DEN\\_%' then 'Denver'
    WHEN ${placement} ilike '%\\_CA+NV\_%' then 'California/Nevada'
    WHEN ${placement} ilike '%\\_SF' then 'San Francisco'
    WHEN ${placement} ilike '%\\_ SF' then 'San Francisco'
    WHEN ${placement} ilike '%\\_NE' then 'Northeast'
    WHEN ${placement} ilike '%\\_DEN' then 'Denver'
    WHEN ${placement} ilike '%\\_CA+NV' then 'California/Nevada'
    WHEN ${placement} ilike '%\\_NTL\\_%' then 'National'
    WHEN ${placement} = 'Matador_Repromo Matador Content_Distribution_1x1' then 'National'
    WHEN ${placement} ilike '%Northeast%' then 'Northeast'
    WHEN ${placement} ilike '%Denver%' then 'Denver'
    WHEN ${placement} ilike '%AV3ScreenVideoPackage%' then 'National'
    WHEN ${placement} ilike '%Native Display\\_San Francisco DMA' then 'San Francisco'
    WHEN ${placement} ilike '%\\_San Francisco DMA' then 'San Francisco'
    WHEN ${placement} ilike '%Native Display\\_CA & NV%' then 'California/Nevada'
    WHEN ${placement} ilike '%Native Display Added Value\\_CA & NV%' then 'California/Nevada'
    WHEN ${placement} ilike '%CA & NV%' then 'California/Nevada'
    WHEN ${placement_id} = '252643239' then 'California/Nevada'
    WHEN ${mam_placement} = 'Matador Experience Distribution' then 'National'
    WHEN ${mam_placement} = 'ROS Big Box' then 'National'
    WHEN ${placement} ilike '%Native Display\\_ San Diego%' then 'San Diego'
    WHEN ${placement} ilike '%Native Display\\_ Los Angeles%' then 'Los Angeles'
    WHEN ${placement} ilike '%Native Display\\_ San Francisco%' then 'San Francisco'
    WHEN ${placement} ilike '%Native Display\\_ Fresno%' then 'Fresno'
    WHEN ${placement} ilike '%Native Display\\_ Sacramento%' then 'Sacramento'
    WHEN ${placement} ilike '%Native Display\\_ California & Nevada%' then 'San Diego'
        ELSE 'Uncategorized'
    END;;
}

  dimension: publisher {
    type: string
    label: "Publisher"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${site_dcm} ilike 'Matador%' then 'Matador'
        WHEN ${site_dcm} = 'Media Rhythm' then 'Snowboarder.com'
        ELSE ${site_dcm}
        END
        ;;
  }

  dimension: dcm_creative {
    type: string
    label: "Creative Name"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${creative} ilike '%Yeti%' then 'Yeti'
        WHEN ${creative} ilike '%Eagles%' then 'Eagles'
        WHEN ${creative} ilike '%Fairy%' then 'Fairy'
        WHEN ${creative} ilike '%Bigfoot%' then 'Bigfoot'
        ELSE ${creative}
        END
        ;;
  }

  dimension: ad_size {
    type: string
    group_label: "DCM Dimensions"
    label: "Ad Size"
    sql:
      CASE
        when ${creative} ILIKE '%728x90%' then '728x90'
        when ${creative} ILIKE '%300x250%' then '300x250'
        when ${creative} ILIKE '%300x600%' then '300x600'
        when ${creative} ILIKE '%320x50%' then '320x50'
        when ${creative} ILIKE '%160x600%' then '160x600'
        when ${creative} ILIKE '%970x250%' then '970x250'
        when ${creative} ILIKE '%300x50%' then '300x50'
      ELSE 'Uncategorized'
      END;;
  }

  dimension: ndt_mam_season {   ### for ndt_dcm
    hidden: yes
    type: string
    label: "Season/Campaign"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN ${campaign_id} = '23182329' then 'Winter'
        WHEN ${campaign_id} = '22311158' then 'Winter'
        WHEN ${campaign_id} = '22439071' then 'Summer'
        WHEN ${campaign_id} = '23018327' then 'Fall'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: ndt_mam_campaign {
    hidden: yes
    type: string
    sql:
      CASE
        WHEN ${campaign_id} = '23182329' then 'Seasonal'
        WHEN ${campaign_id} = '23188164' then 'Air Service'
        WHEN ${campaign_id} = '22311158' then 'Seasonal'
        WHEN ${campaign_id} = '22439071' then 'Seasonal'
        WHEN ${campaign_id} = '23018327' then 'Seasonal'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: test_date_string  {
    hidden: yes
    type: string
    sql: to_char(${TABLE}.date,'YYYY-MM-DD') ;;
  }

  dimension: views {
    hidden: yes
    type:  number
    sql: 0 ;;
  }

  dimension: completes {
    hidden: yes
    type:  number
    sql: 0 ;;
  }

######### All Dimensions Native to Source Table Below #########

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
    hidden: yes
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
    sql: ${TABLE}."platform type" ;;
  }

  dimension: site_dcm {
    type: string
    label: "Site"
    group_label: "DCM Dimensions"
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

  dimension: flight_search {
    hidden: yes
    type: number
    sql: 0 ;;

  }

############ All Measures go Below #########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Clicks"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${clicks} ;;
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
    sql: ${active_view__measurable_impressions};;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    label: "Active View Viewable Impressions"
    sql_distinct_key: ${TABLE}.id ;;
    sql: ${active_view__viewable_impressions} ;;
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
    sql: ${media_cost} ;;
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
    sql: 1.0*${total_media_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_views {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${completes} ;;
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

  measure: total_flight_searches {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${flight_search} ;;
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
