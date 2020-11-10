view: mam_pinterest_ga_view {
  sql_table_name: public.mam_pinterest_ga_view ;;

  #### Primary Key ####

  dimension: comp_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.ga_join_id ;;
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

  dimension: ad_size {
    type: string
    group_label: "Pinterest Dimensions"
    sql: 'Standard Pin' ;;
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
        when ${campaign_name} ilike 'MAM_FY21_Winter_%' then 'FY21 Winter'
        when ${campaign_name} ilike 'MAM_FY20Fall_%' then 'Fall Seasonal'
        when ${campaign_name} ilike 'MAM_FY21_SummerRecovery%' then 'FY21 Summer Recovery'
        else 'Uncategorized'
        end;;
  }

  dimension: mam_layer {
    type: string
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    sql:
      case
        when ${campaign_name} ilike 'MAM_FY21_Winter_%' then 'Awareness'
        when ${campaign_name} ilike 'MAM_FY21_SummerRecovery%' and ${date_date} between '2020-08-24' and '2020-10-05' then 'Phase 2'
        when ${campaign_name} ilike 'MAM_FY21_SummerRecovery%' and ${date_date} between '2020-10-06' and '2020-10-23' then 'Phase 2.5'
        else 'Uncategorized'
        end;;
  }

  dimension: mam_region {
    type: string
    label: "Region"
    group_label: "Client Dimensions"
    sql:
      CASE
        WHEN  ${campaign_name} ILIKE 'MAM_FY21_Winter_Traffic_Boston' then 'Boston'
        WHEN  ${campaign_name} ILIKE 'MAM_FY21_Winter_Traffic_NewYork' then 'New York'
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
    sql:
        CASE
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_Interests%' then 'Traffic Driving Pins - Interest Targeted'
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_Keywords%' then 'Traffic Driving Pins - Keyword Targeted'
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_SiteLAL%' then 'Traffic Driving Pins - Site Lookalikes'
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_SiteRT%' then 'Traffic Driving Pins - Site Retargeting'


          WHEN  ${ad_group_name} ILIKE '%Traffic_InterestTargeting%' then 'Traffic Driving Pins - Interest Targeted'
          WHEN  ${ad_group_name} ILIKE '%Traffic_KeywordTargeting%' then 'Traffic Driving Pins - Keyword Targeted'
          WHEN  ${ad_group_name} ILIKE '%Traffic_RT%' then 'Traffic Driving Pins - Retargeting'
          WHEN  ${ad_group_name} ILIKE '%Traffic_SiteLAL%' then 'Traffic Driving Pins - Site Lookalikes'

          WHEN  ${ad_group_name} ILIKE '%FY20_Winter_Awareness_InterestTargeting%' then 'Awareness Pins - Interest Targeted'
          WHEN  ${ad_group_name} ILIKE '%FY20_Winter_Awareness_KeywordTargeting%' then 'Awareness Pins - Keyword Targeted'
          WHEN  ${ad_group_name} ILIKE '%FY20_Winter_Awareness_SiteLookalikeAudience%' then 'Awareness Pins - Site Lookalikes'

          WHEN  ${ad_group_name} ILIKE 'MAM_FY21_Winter_Traffic_%_BrandAudience' then 'Traffic Driving Pins - Brand Audience'


          ELSE 'Uncategorized'
        END;;
  }

  dimension: mam_audience {
    type: string
    label: "Campaign Audience"
    group_label: "Client Dimensions"
    sql:
        CASE
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_Interests%' then 'Interest Targeted'
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_Keywords%' then 'Keyword Targeted'
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_SiteLAL%' then 'Site Lookalikes'
          WHEN  ${ad_group_name} ILIKE '%MAM_FY21_SummerRecovery_Traffic_SiteRT%' then 'Site Retargeting'
          WHEN  ${ad_group_name} ILIKE '%Traffic_InterestTargeting%' then 'Interest Targeted'
          WHEN  ${ad_group_name} ILIKE '%Traffic_KeywordTargeting%' then 'Keyword Targeted'
          WHEN  ${ad_group_name} ILIKE '%Traffic_RT%' then 'Retargeting'
          WHEN  ${ad_group_name} ILIKE '%Traffic_SiteLAL%' then 'Site Lookalikes'
          WHEN  ${ad_group_name} ILIKE '%FY20_Winter_Awareness_InterestTargeting%' then 'Interest Targeted'
          WHEN  ${ad_group_name} ILIKE '%FY20_Winter_Awareness_KeywordTargeting%' then 'Keyword Targeted'
          WHEN  ${ad_group_name} ILIKE '%FY20_Winter_Awareness_SiteLookalikeAudience%' then 'Site Lookalikes'


          ELSE 'Uncategorized'
        END;;
  }

  dimension: creative_name {
    type: string
    label: "Creative Name"
    group_label: "Client Dimensions"
    sql:
        CASE
          WHEN  ${promoted_pin_name} ILIKE '%Your Guide to Fall in Mammoth%' then 'Your Guide to Fall in Mammoth'
          WHEN  ${promoted_pin_name} ILIKE '%Top 7 Hikes for Leaf-Peepe%' then 'Top 7 Hikes for Leaf-Peepers'
          WHEN  ${promoted_pin_name} ILIKE '%Fall Locals Guide%' then 'Fall Locals Guide'
          WHEN  ${promoted_pin_name} ILIKE '%Fall Lakes%' then 'Fall Lakes'
          WHEN  ${promoted_pin_name} ILIKE '%Fall Hikes%' then 'Fall Hikes'
          WHEN  ${promoted_pin_name} ILIKE '%Fall Activities_Guide%' then 'Fall Activities Guide'
          WHEN  ${promoted_pin_name} ILIKE '%A Local''s Guide to the Ultimat%' then 'A Local''s Guide to the Ultimat'
          WHEN  ${promoted_pin_name} ILIKE '%5 Must-See Lakes in Mammoth La%' then '5 Must-See Lakes in Mammoth Lakes'

          WHEN  ${promoted_pin_name} ILIKE '%ElevateYourAttitude' then 'Elevate Your Attitude'
          WHEN  ${promoted_pin_name} ILIKE '%BrandUnicorns' then 'Brand Unicorns'
          WHEN  ${promoted_pin_name} ILIKE '%SnowPilesHigher' then 'Snow Piles Higher'
          WHEN  ${promoted_pin_name} ILIKE '%DiscoverMidweek' then 'Discover Mid-week'
          WHEN  ${promoted_pin_name} ILIKE '%Maladies' then 'Maladies'
          WHEN  ${promoted_pin_name} ILIKE '%BrandYeti' then 'Yeti'


          ELSE 'Uncategorized'
        END;;
  }

### Dimensions native to this table ###

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

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
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

  dimension: campaign_objective {
    type: string
    group_label: "Pinterest Dimensions"
    sql: ${TABLE}.campaign_objective ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    hidden: yes
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    hidden: yes
    sql: ${TABLE}.cost ;;
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

  dimension: earned_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_clicks ;;
  }

  dimension: earned_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_impressions ;;
  }

  dimension: earned_saves {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_saves ;;
  }

  dimension: earned_video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_video_views ;;
  }

  dimension: earned_views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.earned_views_at_100 ;;
  }

  dimension: impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.impressions ;;
  }

  dimension: newsletter_signup {
    type: number
    hidden: yes
    sql: ${TABLE}.newsletter_signup ;;
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

  dimension: paid_clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_clicks ;;
  }

  dimension: paid_impressions {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_impressions ;;
  }

  dimension: paid_saves {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_saves ;;
  }

  dimension: paid_video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_video_views ;;
  }

  dimension: paid_views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.paid_views_at_100 ;;
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

  dimension: saves {
    type: number
    hidden: yes
    sql: ${TABLE}.saves ;;
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

  dimension: tos_above_30s {
    type: number
    hidden: yes
    sql: ${TABLE}.tos_above_30s ;;
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

  dimension: video_starts {
    type: number
    hidden: yes
    sql: ${TABLE}.video_starts ;;
  }

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
  }

  dimension: views_at_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_100 ;;
  }

  dimension: views_at_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_25 ;;
  }

  dimension: views_at_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_50 ;;
  }

  dimension: views_at_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_75 ;;
  }

  dimension: views_at_95 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_at_95 ;;
  }

  dimension: visitor_guide_order {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_order ;;
  }

#### All Measures go Below ###

  measure: total_spend {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${comp_key} ;;
    sql: ${cost} ;;
    value_format_name: usd
  }

  measure: total_impressions {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${comp_key} ;;
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${comp_key} ;;
    sql: ${clicks} ;;
  }

  measure: click_through_rate  {
    label: "CTR"
    type: number
    group_label: "Total Delivery"
    sql: ${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_click {
    label: "CPC"
    type: number
    group_label: "Total Delivery"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand  {
    label: "CPM"
    type: number
    group_label: "Total Delivery"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_conversions {
    type: sum_distinct
    group_label: "Total Delivery"
    sql_distinct_key: ${comp_key} ;;
    sql: ${conversions} ;;
  }

  measure: total_saves {
    group_label: "Total Delivery"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    sql: ${saves} ;;
  }

  measure: total_video_starts {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${video_starts} ;;
  }

  measure: total_video_views {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${video_views} ;;
  }

  measure: total_view_rate  {
    label: "View Rate"
    type: number
    group_label: "Total Video Metrics"
    sql: ${total_video_views}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_completion_rate  {
    label: "VCR"
    type: number
    group_label: "Total Video Metrics"
    sql: ${total_views_at_100}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_at_100 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_100} ;;
  }

  measure: total_views_at_25 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_25} ;;
  }

  measure: total_views_at_50 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_50} ;;
  }

  measure: total_views_at_75 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_75} ;;
  }

  measure: total_views_at_95 {
    type: sum_distinct
    group_label: "Total Video Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${views_at_95} ;;
  }

  ### Paid Measures ###

  measure: total_paid_impressions {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${paid_impressions} ;;
  }

  measure: total_paid_clicks {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${paid_clicks} ;;
  }

  measure: paid_ctr  {
    label: "Paid CTR"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_paid_clicks}/nullif(${total_paid_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_paid_saves {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${paid_saves} ;;
  }

  measure: total_paid_views_at_100 {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${paid_views_at_100} ;;
  }

  measure: total_paid_video_views {
    type: sum_distinct
    group_label: "Paid Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${paid_video_views} ;;
  }

  measure: paid_cpc {
    label: "Paid CPC"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_spend}/nullif(${total_paid_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: paid_cpm  {
    label: "Paid CPM"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_spend}/nullif(${total_paid_impressions}/1000, 0) ;;
    value_format_name: usd
  }

  measure: total_paid_view_rate  {
    type: number
    group_label: "Paid Metrics"
    sql: ${total_paid_video_views}/nullif(${total_paid_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_paid_completion_rate  {
    label: "Paid VCR"
    type: number
    group_label: "Paid Metrics"
    sql: ${total_earned_video_views}/nullif(${total_paid_impressions}, 0) ;;
    value_format_name: percent_2
  }

  ### Earned Measures ###

  measure: total_earned_impressions {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${earned_impressions} ;;
  }

  measure: total_earned_clicks {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${earned_clicks} ;;
  }

  measure: earned_ctr  {
    label: "Earned CTR"
    type: number
    group_label: "Earned Metrics"
    sql: ${total_earned_clicks}/nullif(${total_earned_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_earned_saves {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${earned_saves} ;;
  }

  measure: total_earned_views_at_100 {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${earned_views_at_100} ;;
  }

  measure: total_earned_video_views {
    type: sum_distinct
    group_label: "Earned Metrics"
    sql_distinct_key: ${comp_key} ;;
    sql: ${earned_video_views} ;;
  }

  measure: total_earned_view_rate  {
    type: number
    group_label: "Earned Metrics"
    sql: ${total_earned_video_views}/nullif(${total_earned_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_earned_completion_rate  {
    label: "Earned VCR"
    type: number
    group_label: "Earned Metrics"
    sql: ${total_earned_video_views}/nullif(${total_earned_impressions}, 0) ;;
    value_format_name: percent_2
  }

####### Google Analytics Measures #######

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
    sql: ${total_spend}/nullif(${total_sessions}, 0) ;;
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
    sql: ${pageviews} ;;
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
    drill_fields: [promoted_pin_name, ad_group_name, campaign_name]
  }
}
