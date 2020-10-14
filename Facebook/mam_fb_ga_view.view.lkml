view: mam_fb_ga_view {
  sql_table_name: public.mam_fb_ga_view ;;
  drill_fields: [id]

###### Primary Key #######

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}.id ;;
  }

####### Join ID ########

  dimension: ga_join_id {
    type: string
    hidden: yes
    sql: ${TABLE}.ga_join_id ;;
  }

##### Dimensions added to this table via LookML #####

  dimension: mam_campaign {
    label: "Campaign"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ilike '%Fall%' THEN 'Fall'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_VideoViews_SF_Flight2' THEN 'Winter Seasonal'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_VideoViews_NE_Flight2' THEN 'Winter Seasonal'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_VideoViews_Denver_Flight2' THEN 'Winter Seasonal'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_VideoViews_CA/NV_Flight2' THEN 'Winter Seasonal'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_SF_Flight2' THEN 'Winter Seasonal'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_NE_Flight2' THEN 'Winter Seasonal'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_Denver_Flight2' THEN 'Winter Seasonal'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_CA/NV_Flight2' THEN 'Winter Seasonal'

        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_AirService_FareSale' THEN 'Winter Air Service'
        WHEN ${campaign_name} ilike 'MAM_Winter_FY20_Conversion_Widget_AirService%' THEN 'Winter Air Service'
        WHEN ${campaign_name} ilike 'MAM_Winter_FY20_Conversion_AirService%' THEN 'Winter Air Service'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_AirService_FareSale' THEN 'Winter Air Service'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_AirService_FareSale' THEN 'Winter Air Service'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_AirService_FareSale' THEN 'Winter Air Service'
        WHEN ${campaign_name} = 'MAM_Winter_FY20_Conversions_AirService_FareSale' THEN 'Winter Air Service'

        WHEN ${campaign_name} ilike 'MAM_SummerRecovery_FY21%' THEN 'FY21 Summer Recovery'

        WHEN ${campaign_name} ilike '%Summer%' THEN 'Summer'
        WHEN ${campaign_name} ilike '%Spring%' THEN 'Spring'
        ELSE 'Uncategorized'
        END
        ;;
  }

  dimension: mam_layer {
    label: "Campaign Layer"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ilike '%AirService%' THEN 'Air Service'
        when ${campaign_name} ilike 'MAM_SummerRecovery_FY21%' and ${date_start_date} between '2020-06-22' and '2020-08-23' then 'Phase 1'
        when ${campaign_name} ilike 'MAM_SummerRecovery_FY21%' and ${date_start_date} between '2020-08-24' and '2020-10-05' then 'Phase 2'
        when ${campaign_name} ilike 'MAM_SummerRecovery_FY21%' and ${date_start_date} between '2020-10-06' and '2020-10-23' then 'Phase 2.5'
        ELSE 'Seasonal'
        END
        ;;
  }

  dimension: mam_audience {
    label: "Audience"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${adset_name} ilike '%SiteVisitors%' THEN 'Site Visitors'
        WHEN ${adset_name} ilike '%LandingPage%' THEN 'Landing Page'
        WHEN ${adset_name} ilike '%FareSale%' THEN 'Fare Sale'

        WHEN ${adset_name} ilike '%\\_LAL\\_%' THEN 'Lookalike'
        WHEN ${adset_name} ilike '%\\_Brand\\_%' THEN 'Brand'
        WHEN ${adset_name} ilike '%\\_RT\\_%' THEN 'Retargeting'
        WHEN ${adset_name} ilike '%\\_RTNonSkippable\\_%' THEN 'Retargeting'
        WHEN ${adset_name} ilike '%\\_Competitive\\_%' THEN 'Competitive'
        WHEN ${adset_name} ilike '%\\_RTSkippable\\_%' THEN 'Retargeting'
        WHEN ${adset_name} ilike '%\\_LakeTahoeCompetitive\\_%' THEN 'Competitive'

        WHEN ${adset_name} ilike '%\\_LAL' THEN 'Lookalike'
        WHEN ${adset_name} ilike '%\\_Brand' THEN 'Brand'
        WHEN ${adset_name} ilike '%\\_RT' THEN 'Retargeting'

        ELSE 'Uncateorized'
        END
        ;;
  }

  dimension: mam_placement {
    label: "Placement Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      case
        when ${campaign_name} ilike 'MAM_Winter_FY20_Conversion_AirService%' then 'Single Image - Brand Audience'
        when ${campaign_name} ilike 'MAM_Winter_FY20_Conversion_Widget_AirService%' then 'Single Image - Retargeting/Site Lookalikes'
        when ${campaign_name} ilike 'MAM_Winter_FY20_Conversions_AirService_FareSale%' then 'Single Image - Fare Sale'

        when ${campaign_name} ilike '%Winter_FY20_Conversions_SF%' and ${ad_name} ilike '%SingleImage%' then 'Traffic-Driving Single Image'
        when ${campaign_name} ilike '%Winter_FY20_Conversions_SF%' and ${ad_name} ilike '%Carousel%' then 'Traffic-Driving Carousel'

        when ${campaign_name} ilike '%Winter_FY20_Conversions_NE%' and ${ad_name} ilike '%SingleImage%' then 'Traffic-Driving Single Image'
        when ${campaign_name} ilike '%Winter_FY20_Conversions_NE%' and ${ad_name} ilike '%Carousel%' then 'Traffic-Driving Carousel'

        when ${campaign_name} ilike '%Winter_FY20_Conversions_Denver%' and ${ad_name} ilike '%SingleImage%' then 'Traffic-Driving Single Image'
        when ${campaign_name} ilike '%Winter_FY20_Conversions_Denver%' and ${ad_name} ilike '%Carousel%' then 'Traffic-Driving Carousel'

        when ${campaign_name} ilike '%Winter_FY20_Conversions_CA/NV%' and ${ad_name} ilike '%SingleImage%' then 'Traffic-Driving Single Image'
        when ${campaign_name} ilike '%Winter_FY20_Conversions_CA/NV%' and ${ad_name} ilike '%Carousel%' then 'Traffic-Driving Carousel'

        when ${campaign_name} ilike '%Winter_FY20_VideoViews%' and ${adset_name} ilike '%Maladies%' then 'Unskippable In-Feed and In-Stream Video'
        when ${campaign_name} ilike '%Winter_FY20_VideoViews%' then 'Skippable In-Feed and In-Stream Video'

        when ${campaign_name} ilike 'MAM_SummerRecovery_FY21_Conversions%' and ${ad_name} ilike '%SingleImage%' then 'Traffic-Driving Single Image'
        when ${campaign_name} ilike 'MAM_SummerRecovery_FY21_VideoViews%' then 'Skippable In-Feed and In-Stream Video'

        else 'Uncategorized'
        end;;
  }

  dimension: fb_airline {
    label: "Airline"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${ad_name} ilike '%\\_United\\_%' THEN 'United'
        WHEN ${ad_name} ilike '%\\_jsx\\_%' THEN 'JetSuiteX'
        else null
        END
        ;;
  }

  dimension: creative_name {
    label: "Creative Name"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${ad_name} ilike '%\\_HighPlaces' THEN 'No Small Backyard: High Places (:30)'
        WHEN ${ad_name} ilike '%\\_GetLost' THEN 'No Small Backyard: Get Lost (:30)'
        WHEN ${ad_name} ilike '%\\_AboveAverage' THEN 'No Small Backyard: Above Average (:30)'
        WHEN ${ad_name} ilike '%\\_UphillBattles' THEN 'Maladies: Uphill Battles (:15)'
        WHEN ${ad_name} ilike '%\\_MorningCommute' THEN 'Maladies: Morning Commute (:15)'
        WHEN ${ad_name} ilike '%\\_Mondays' THEN 'Maladies: Mondays (:15)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_LAL_NE_Brand' then 'No Small Adventure (:30)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_LAL_Denver_Brand' then 'No Small Adventure (:30)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_Brand_NE_BrandVid' then 'No Small Adventure (:30)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_Brand_Denver_BrandVid' then 'No Small Adventure (:30)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_LAL_NE_Flights' then 'No Small Adventure (:30)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_LAL_Denver_Flights' then 'No Small Adventure (:30)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_Brand_NE_Flights' then 'No Small Adventure (:30)'
        when ${ad_name} = 'MAM_Winter_FY20_Video_Brand_Denver_Flights' then 'No Small Adventure (:30)'

        when ${ad_name} = 'MAM_SummerRecovery_FY21_Video_LAL_Territory' then 'Territory (:30)'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_Video_Brand_Territory' then 'Territory (:30)'
        when ${ad_name} ilike '%_Locals' then 'Locals Welcome (:30)'

        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_ReleaseYourself' then 'Release Yourself Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_Escape' then 'Escape Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_EndlessSupply' then 'Endless Supply Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_EnjoyInfiniteMoments' then 'Enjoy Infinite Moments Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_EnjoyInfiniteMoments' then 'Enjoy Infinite Moments Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_ReleaseYourself' then 'Release Yourself Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_Escape' then 'Escape Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_EndlessSupply' then 'Endless Supply Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_EnjoyInfiniteMoments' then 'Enjoy Infinite Moments Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_ReleaseYourself' then 'Release Yourself Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_Escape' then 'Escape Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_EndlessSupply' then 'Endless Supply Single Image'

        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_Fall_MotherNature' then 'Mother Nature Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_Fall_LocalsKnow' then 'Locals Know Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_Fall_HikeBikePaddle' then 'Hike, Bike, Paddle Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_RT_Fall_AmazingAutumn' then 'Amazing Autumn Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_Fall_MotherNature' then 'Mother Nature Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_Fall_LocalsKnow' then 'Locals Know Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_Fall_HikeBikePaddle' then 'Hike, Bike, Paddle Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_LAL_Fall_AmazingAutumn' then 'Amazing Autumn Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_Fall_MotherNature' then 'Mother Nature Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_Fall_LocalsKnow' then 'Locals Know Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_Fall_HikeBikePaddle' then 'Hike, Bike, Paddle Single Image'
        when ${ad_name} = 'MAM_SummerRecovery_FY21_SingleImage_Brand_Fall_AmazingAutumn' then 'Amazing Autumn Single Image'

        else 'Uncategorized'
        END
        ;;
  }

  dimension: ad_type {
    label: "Ad Type"
    group_label: "Facebook Dimensions"
    type: string
    sql:
      CASE
        WHEN ${ad_name} ilike '%\\_Video\\_%' THEN 'Video'
        WHEN ${ad_name} ilike '%\\_SingleImage\\_%' THEN 'Single Image'
        WHEN ${ad_name} ilike '%\\_Carousel\\_%' THEN 'Carousel'

        else 'Uncategorized'
        END
        ;;
  }

  dimension: ad_size {
    label: "Ad Size"
    group_label: "Facebook Dimensions"
    type: string
    sql:
      CASE
        WHEN ${ad_name} ilike '%\\_Video\\_%' THEN 'Video'
        WHEN ${ad_name} ilike '%\\_SingleImage\\_%' THEN 'Single Image'
        WHEN ${ad_name} ilike '%\\_Carousel\\_%' THEN 'Carousel'

        when ${ad_name} ilike 'MAM_SummerRecovery_FY21_SingleImage%' then 'Landscape Single Image'
        when ${ad_name} ilike 'MAM_SummerRecovery_FY21_Video%' then 'Landscape Video'

        END
        ;;
  }

  dimension: mam_region {
    label: "Region"
    group_label: "Client Dimensions"
    type: string
    sql:
      CASE
        WHEN ${campaign_name} ilike '%\\_SF\\_%' THEN 'San Francisco'
        WHEN ${campaign_name} ilike '%\\_NE\\_%' THEN 'Northeast'
        WHEN ${campaign_name} ilike '%\\_Denver\\_%' THEN 'Denver'
        WHEN ${campaign_name} ilike '%\\_Den\\_%' THEN 'Denver'
        WHEN ${campaign_name} ilike '%\\_CA/NV\\_%' THEN 'California/Nevada'
        WHEN ${campaign_name} ilike '%\\_SF' THEN 'San Francisco'
        WHEN ${campaign_name} ilike '%\\_NE' THEN 'Northeast'
        WHEN ${campaign_name} ilike '%\\_Denver' THEN 'Denver'
        WHEN ${campaign_name} ilike '%\\_Den' THEN 'Denver'
        WHEN ${campaign_name} ilike '%\\_CA/NV' THEN 'California/Nevada'
        WHEN ${adset_name} ilike '%\\_SF' THEN 'San Francisco'
        WHEN ${adset_name} ilike '%\\_DENver' THEN 'Denver'
        ELSE 'Uncategorized'
        END
        ;;
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
        WHEN ${date_start_date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 19/20'
        ELSE 'Uncategorized'
        END
        ;;
    drill_fields: [campaign_name]
  }

  dimension: publisher {
    type: string
    group_label: "Facebook Dimensions"
    sql: 'Facebook' ;;
  }

  ##### All Dimensions go below #####

  dimension: account_id {
    type: string
    group_label: "Facebook IDs"
    sql: ${TABLE}.account_id ;;
  }

  dimension: account_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.account_name ;;
  }

  dimension: ad_id {
    type: string
    group_label: "Facebook IDs"
    sql: ${TABLE}.ad_id ;;
  }

  dimension: ad_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.ad_name ;;
  }

  dimension: adset_id {
    type: string
    group_label: "Facebook IDs"
    sql: ${TABLE}.adset_id ;;
  }

  dimension: adset_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.adset_name ;;
  }

  dimension: bounces {
    type: number
    hidden: yes
    sql: ${TABLE}.bounces ;;
  }

  dimension: buying_type {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.buying_type ;;
  }

  dimension: campaign_id {
    type: string
    group_label: "Facebook IDs"
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: clicks {
    type: number
    hidden: yes
    sql: ${TABLE}.clicks ;;
  }

  dimension: country {
    type: string
    group_label: "Facebook Dimensions"
    hidden: yes
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: date_start {
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

  dimension: objective {
    type: string
    group_label: "Facebook Dimensions"
    sql: ${TABLE}.objective ;;
  }

  dimension: pageviews {
    type: number
    hidden: yes
    sql: ${TABLE}.pageviews ;;
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

  dimension: spend {
    type: number
    hidden: yes
    sql: ${TABLE}.spend ;;
  }

  dimension: thruplays {
    type: number
    hidden: yes
    sql: ${TABLE}.thruplays ;;
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

  dimension: views_to_100 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_100 ;;
  }

  dimension: views_to_25 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_25 ;;
  }

  dimension: views_to_50 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_50 ;;
  }

  dimension: views_to_75 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_75 ;;
  }

  dimension: views_to_95 {
    type: number
    hidden: yes
    sql: ${TABLE}.views_to_95 ;;
  }

  dimension: visitor_guide_order {
    type: number
    hidden: yes
    sql: ${TABLE}.visitor_guide_order ;;
  }

####### Meausures go below ######

  measure: total_impressions {
    type: sum_distinct
    group_label: "Facebook Delivery"
    sql_distinct_key: ${id} ;;
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum_distinct
    group_label: "Facebook Delivery"
    sql_distinct_key: ${id} ;;
    label: "Clicks"
    sql: ${inline_link_clicks} ;;
  }

  measure: click_through_rate {
    type: number
    group_label: "Facebook Delivery"
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_spend {
    type: sum_distinct
    group_label: "Facebook Delivery"
    sql_distinct_key: ${id} ;;
    label: "Media Spend"
    sql: ${spend};;
    value_format_name: usd
  }

  measure: cost_per_click {
    type: number
    group_label: "Facebook Delivery"
    label: "CPC"
    sql: ${total_spend}/nullif(${total_clicks}, 0) ;;
    value_format_name: usd
  }

  measure: cost_per_thousand {
    type: number
    group_label: "Facebook Delivery"
    label: "CPM"
    sql: ${total_spend}/nullif(${total_impressions}/1000, 0) ;;
    value_format_name: usd
  }

#### Video Measures #####

  measure: video_impressions {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: video_spend {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql:
        case
        when ${views_to_25} > 0 then ${impressions}
        else null
        end;;
    hidden: yes
  }

  measure: total_views_to_25 {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Views to 25%"
    group_label: "Video Metrics"
    sql: ${views_to_25};;
  }

  measure: view_to_25_rate {
    type: number
    label: "% Viewed to 25%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_25}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_50 {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Views to 50%"
    group_label: "Video Metrics"
    sql: ${views_to_50};;
  }

  measure: view_to_50_rate {
    type: number
    label: "% Viewed to 50%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_50}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_75 {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Views to 75%"
    group_label: "Video Metrics"
  }

  measure: view_to_75_rate {
    type: number
    label: "% Viewed to 75%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_75}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views_to_95 {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Views to 95%"
    group_label: "Video Metrics"
  }

  measure: view_to_95_rate {
    type: number
    label: "% Viewed to 95%"
    group_label: "Video Metrics"
    sql: 1.0*${total_views_to_95}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_video_completes {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "Views to 100%"
    group_label: "Video Metrics"
    sql: ${views_to_100};;
  }

  measure: video_completion_rate {
    type: number
    label: "Completion Rate"
    group_label: "Video Metrics"
    sql: 1.0*${total_video_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    group_label: "Video Metrics"
    sql: 1.0*${video_spend}/nullif(${total_video_completes}, 0) ;;
    value_format_name: usd
  }

  measure: total_thruplays {
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    label: "ThruPlays"
    group_label: "Video Metrics"
    sql: ${thruplays};;
  }

  measure: thruplay_rate {
    type: number
    label: "ThruPlay Rate"
    group_label: "Video Metrics"
    sql: 1.0*${total_thruplays}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thruplay {
    type: number
    label: "Cost/ThruPlay"
    group_label: "Video Metrics"
    sql: 1.0*${video_spend}/nullif(${total_thruplays}, 0) ;;
    value_format_name: usd
  }

####### Google Analytics Measures #######

  measure: total_sessions {
    group_label: "Google Analytics Metrics"
    type: sum_distinct
    label: "Sessions"
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id};;
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
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id} ;;
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
    sql_distinct_key: ${id} ;;
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
    drill_fields: [id, ad_name, adset_name, campaign_name, account_name]
  }
}
