view: mam_dcm_ga_view {
  sql_table_name: public.mam_dcm_ga_view ;;

  ######## Primary Key ########

  dimension: comp_key {
    type: string
    primary_key: yes
    group_label: "DCM IDs"
    sql: ${TABLE}.ga_join_id ;;
  }

  ### Passback Join ###

  dimension: passback_join {
    hidden: yes
    type: string
    sql: ${placement_id}||'_'||${date_date} ;;
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

  dimension: active_view_eligible_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.active_view_eligible_impressions ;;
  }

  dimension: active_view_measurable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.active_view_measurable_impressions ;;
  }

  dimension: active_view_viewable_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.active_view_viewable_impressions ;;
  }

  dimension: ad {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.ad ;;
  }

  dimension: ad_id {
    type: string
    group_label: "DCM IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: advertiser {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.advertiser ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_id {
    type: number
    group_label: "DCM IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: click_through_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.click_through_conversions ;;
  }

  dimension: click_through_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.click_through_revenue ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
  }

  dimension: creative {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.creative ;;
  }

  dimension: creative_id {
    type: string
    group_label: "DCM IDs"
    sql: ${TABLE}.creative_id ;;
  }

  dimension_group: date {
    label: ""
    group_label: "Date Periods"
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

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: newsletter_signup {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_sign_up ;;
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

  dimension: placement {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement ;;
  }

  dimension: placement_id {
    type: number
    group_label: "DCM IDs"
    sql: ${TABLE}.placement_id ;;
  }

  dimension: placement_strategy {
    type: string
    group_label: "DCM Dimensions"
    sql: ${TABLE}.placement_strategy ;;
  }

  dimension: report {
    type: number
    group_label: "DCM IDs"
    hidden: yes
    sql: ${TABLE}.report ;;
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

  dimension: site_dcm {
    type: string
    label: "Site (DCM)"
    group_label: "DCM Dimensions"
    sql: ${TABLE}.site_dcm ;;
  }

  dimension: tos_above_30s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_30s ;;
  }

  dimension: total_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.total_conversions ;;
  }

  dimension: total_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.total_revenue ;;
  }

  dimension: united_airlines_referral {
    type: number
    hidden: yes
    sql: ${TABLE}.united_airlines_referral ;;
  }

  dimension: users {
    type: number
    hidden: yes
    sql: ${TABLE}.users ;;
  }

  dimension: view_through_conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.view_through_conversions ;;
  }

  dimension: view_through_revenue {
    type: number
    hidden: yes
    sql: ${TABLE}.view_through_revenue ;;
  }

  dimension: visitor_guide_order {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_order ;;
  }

######### All measures go below ########

  measure: total_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Clicks"
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
    sql_distinct_key: ${comp_key} ;;
    label: "Active View Measureable Impressions"
    sql: ${active_view_measurable_impressions} ;;
  }

  measure: total_active_view_viewable_impressions {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Active View Viewable Impressions"
    sql: ${active_view_viewable_impressions} ;;
  }

  measure: total_viewability {
    group_label: "3rd Party Measures"
    type: number
    label: "Viewability"
    sql: ${total_active_view_viewable_impressions}/nullif(${total_active_view_measureable_impressions}, 0) ;;
    value_format_name: percent_0
  }

  measure: total_cost {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Media Spend"
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: cost_per_click {
    group_label: "3rd Party Measures"
    type: number
    label: "CPC"
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
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
    sql: 1.0*${total_cost}/nullif(${total_active_view_viewable_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    group_label: "3rd Party Measures"
    type: number
    label: "CPM"
    sql: 1.0*${total_cost}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_views {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Video Views"
    sql: 0 ;;
  }

  measure: total_completes {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Video Completes"
    sql: 0 ;;
  }

  ### GA Measures ###

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${comp_key} ;;
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "CPS"
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
    value_format_name: usd
  }

  measure: total_session_duration {
    hidden: yes
    type: sum_distinct
    label: "Total Session Duration"
    sql_distinct_key: ${comp_key};;
    sql: ${sessionduration};;
  }

  measure: avg_time_on_site {
    group_label: "Google Analytics Metrics"
    label: "Avg. TOS"
    type: number
    sql:  (${total_session_duration}/nullif(${total_sessions}, 0))::float/86400  ;;
    value_format: "m:ss"
  }

  measure: total_pageviews {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Pageviews"
    sql_distinct_key: ${comp_key} ;;
    sql: ${sessions} ;;
  }

  measure: pages_per_session {
    group_label: "Google Analytics Metrics"
    type: number
    label: "Pages/Session"
    sql: ${total_pageviews}/nullif(${total_sessions}, 0) ;;
    value_format_name: decimal_2
  }

  measure: total_bounces {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Bounces"
    sql_distinct_key: ${comp_key} ;;
    sql: ${bounces} ;;
  }

  measure: total_bounce_rate  {
    label: "Bounce Rate"
    group_label: "Google Analytics Metrics"
    type: number
    sql: ${total_bounces}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  ## MAM Google Analytics Goals ##

  measure: total_newsletter_signups {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Newsletter Sign-Ups"
    sql_distinct_key: ${comp_key} ;;
    sql: ${newsletter_signup} ;;
  }

  measure: newsletter_signup_rate  {
    label: "Newsletter Sign-Up Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_newsletter_signups}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_visitor_guide_orders {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Visitor Guide Orders"
    sql_distinct_key: ${comp_key} ;;
    sql: ${visitor_guide_order} ;;
  }

  measure: visitor_guide_order_rate  {
    label: "Visitor Guide Order Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_visitor_guide_orders}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_united_airlines_referrals {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "United Airline Referrals"
    sql_distinct_key: ${comp_key} ;;
    sql: ${united_airlines_referral} ;;
  }

  measure: united_airlines_referral_rate  {
    label: "United Airline Referral Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_united_airlines_referrals}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_tos_above_30s {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "TOS Above :30"
    sql_distinct_key: ${comp_key} ;;
    sql: ${tos_above_30s} ;;
  }

  measure: tos_above_30s_rate  {
    label: "TOS Above :30 Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_tos_above_30s}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_search_flights_button {
    group_label: "Google Analytics Goals"
    type: sum_distinct
    label: "Search Flights Button"
    sql_distinct_key: ${comp_key} ;;
    sql: ${search_flights_button} ;;
  }

  measure: search_flight_button_rate  {
    label: "Search Flights Button Rate"
    group_label: "Google Analytics Goals"
    type: number
    sql: ${total_search_flights_button}/nullif(${total_sessions}, 0) ;;
    value_format_name: percent_2
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
