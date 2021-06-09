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

  dimension: passback_join_ad {
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
        WHEN ${date_date} BETWEEN '2020-07-01' AND '2021-06-30' THEN 'FY 20/21'
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
        when ${ad} = '(not set)' then 'Uncategorized'
        when ${ad} = 'Tracking Ad-AdTheorent_SummerRecovery_Phase2_PredictiveAudienceContextual_CA+NV_SeptemberVideo_0:15_1x1' then 'Uncategorized'
        WHEN ${campaign_id} = '24922116' then 'FY21 Winter'
        WHEN ${campaign_id} = '23182329' then 'Winter Seasonal'
        WHEN ${campaign_id} = '23188164' then 'Winter Air Service'
        WHEN ${campaign_id} = '22311158' then 'Winter'
        WHEN ${campaign_id} = '22439071' then 'Summer'
        WHEN ${campaign_id} = '23018327' then 'Fall'
        WHEN ${campaign_id} = '24464016' THEN 'FY21 Summer Recovery'
        when ${campaign_id} = '25702236' then 'FY21 Spring/Summer'

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
        WHEN ${placement} ilike 'AdTheorent_Winter_ConsiderationTD%' then 'Consideration - Traffic-Driving'
        WHEN ${placement} ilike 'SNowBrains_Winter_Awareness%' then 'Awareness'
        WHEN ${placement} ilike 'AdTheorent_Winter_Awareness%' then 'Awareness'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness%' then 'Awareness'
        WHEN ${campaign_id} = '23182329' then 'Seasonal'
        WHEN ${campaign_id} = '23188164' then 'Air Service'
        WHEN ${campaign_id} = '22311158' then 'Seasonal'
        WHEN ${campaign_id} = '22439071' then 'Seasonal'
        WHEN ${campaign_id} = '24464016' THEN 'Phase 2'
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
        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_StandardDisplay%' then 'Cross-Device Display'
        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_AVStandardDisplay%' then 'Cross-Device Display (AV)'
        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_RM%_1x1%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_Cross Device_Video:30_1x1%' then 'Cross-Device Video'

        WHEN ${placement_id} = '286278057' then 'In-Email Promotion Display (2/10)'
        WHEN ${placement_id} = '295140241' then 'Awareness Video'
        WHEN ${placement_id} = '286278075' then 'In-Forecast Promotion Display'
        WHEN ${placement_id} = '286167734' then 'In-Forecast Promotion Display'

        WHEN ${placement} ilike 'SnowBrains_Winter_Awareness_SkiVacation_%_CrossDeviceDisplay_Nov-Feb21_Display%' then 'Cross-Device Display'
        WHEN ${placement} ilike 'SnowBrains_Winter_Awareness_SkiVacation_NE_CrossDeviceDisplay_Nov-Feb21_Display%' then 'Cross-Device Display'
        WHEN ${placement} ilike 'SnowBrains_Winter_Awareness_SkiTrippers_%_CrossDeviceDisplay_%_Display%' then 'Cross-Device Display'

        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_TahoeDailyShow_CA/NV_In-ForecastPromo_11-2_Display%' then 'In-Forecast Promotion Display (11/2)'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_NewEnglandDailyShow_NE_In-ForecastPromo_12-7_Display%' then 'In-Forecast Promotion Display (12/7)'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_In-EmailPromo_11-9_Display%' then 'In-Email Promotion Display (11/9)'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_In-EmailPromo_11-20_Display%' then 'In-Email Promotion Display (11/20)'

        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_In-EmailPromo_2-19_Display%' then 'In-Email Promotion Display (2/19)'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_In-EmailPromo_3-1_Display%' then 'In-Email Promotion Display (3/1)'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiVacation_CA_In-EmailPromo_3-10_Display%' then 'In-Email Promotion Display (3/10)'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiVacation_CA_In-EmailPromo_3-15_Display%' then 'In-Email Promotion Display (3/15)'

        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_DesktopSite_%_Display%' then 'Desktop Display'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeMobileSite_%_Display%' then 'Mobile Website Marquee'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeDesktop_%_Display%' then 'Desktop Site Marquee'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeMobileApp_%_Display%' then 'Mobile App Marquee'

        when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_NYDMA_CrossDeviceDisplay%' then 'Cross-Device Display'
        when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_NE_CrossDeviceDisplay_Nov-Mar21_AVDisplay%' then 'Cross-Device Display (AV)'
        when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_BostonDMA_CrossDeviceDisplay%' then 'Cross-Device Display'
        when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_DEN_CrossDeviceDisplay%' then 'Cross-Device Display'
        when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_CA+NV_CrossDeviceDisplay%' then 'Cross-Device Display'
        when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_CA_CrossDeviceDisplay_Feb-Apr21_Display%' then 'Cross-Device Display'
        when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_CA_CrossDeviceDisplay_Feb-Apr21_AVDisplay%' then 'Cross-Device Display (AV)'

        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_DEN_Video%' then 'Awareness Video'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA+NV_Video%' then 'Awareness Video'

        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_DEN_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_BostonDMA_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_NYDMA_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA+NV_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA_MobileRichMedia_Feb-Apr21_RichMedia%' then 'Mobile Rich Media'

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

        when ${placement} ilike 'AdTheorent_SummerRecovery_Phase2_PredictiveAudienceContextual_CA+NV_SeptemberStandardDisplay%' then 'Standard Display'
        when ${placement} ilike 'AdTheorent_SummerRecovery_Phase2_PredictiveAudienceContextual_CA+NV_AVStandardDisplay%' then 'AV - Standard Display'
        when ${placement} ilike 'AdTheorent_SummerRecovery_Phase2_PredictiveAudienceContextual_CA+NV_SeptemberVideo_0:15%' then ':15 Video'

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

    WHEN ${placement} ilike '%NYDMA%' then 'New York'
    WHEN ${placement} ilike '%BostonDMA%' then 'Boston'
    WHEN ${placement} ilike '%\\_SF\\_%' then 'San Francisco'
    WHEN ${placement} ilike '%\\_NE\\_%' then 'Northeast'
    WHEN ${placement} ilike '%\\_DEN\\_%' then 'Denver'
    WHEN ${placement} ilike '%\\_CA+NV\_%' then 'California/Nevada'
    when ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_CA_CrossDeviceDisplay_Feb-Apr21_Display%' then 'California'
    when ${placement} ilike 'SnowBrains_Winter_Awareness_SkiTrippers_CA_CrossDeviceDisplay_Nov-Mar21_Display%' then 'California'
    when ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_MarqueeMobileApp_Feb-Apr21_Display%' then 'California'
    when ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_In-EmailPromo_2-19_Display%' then 'California'
    when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA_MobileRichMedia_Feb-Apr21_RichMedia%' then 'California'
    when ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_MarqueeMobileSite_Feb-Apr21_Display%' then 'California'
    when ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_MarqueeDesktop_Feb-Apr21_Display%' then 'California'
    WHEN ${placement} ilike '%\\_SF' then 'San Francisco'
    WHEN ${placement} ilike '%\\_ SF' then 'San Francisco'
    WHEN ${placement} ilike '%\\_NE' then 'Northeast'
    WHEN ${placement} ilike '%\\_DEN' then 'Denver'
    WHEN ${placement} ilike '%\\_CA+NV' then 'California/Nevada'
    when ${placement} ilike '%CA/NV%' then 'California/Nevada'
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
    WHEN ${placement_id} = '286278057' then 'California'
    WHEN ${placement_id} = '295140241' then 'California'
    WHEN ${placement_id} = '286278075' then 'California'
    WHEN ${placement_id} = '286167734' then 'California'
    WHEN ${mam_placement} = 'Matador Experience Distribution' then 'National'
    WHEN ${mam_placement} = 'ROS Big Box' then 'National'
    WHEN ${placement} ilike '%Native Display\\_ San Diego%' then 'San Diego'
    WHEN ${placement} ilike '%Native Display\\_ Los Angeles%' then 'Los Angeles'
    WHEN ${placement} ilike '%Native Display\\_ San Francisco%' then 'San Francisco'
    WHEN ${placement} ilike '%Native Display\\_ Fresno%' then 'Fresno'
    WHEN ${placement} ilike '%Native Display\\_ Sacramento%' then 'Sacramento'
    WHEN ${placement} ilike '%Native Display\\_ California & Nevada%' then 'San Diego'
    WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_In-EmailPromo%' then 'California'
    WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiVacation_CA_In-EmailPromo%' then 'California'
    WHEN ${placement} ilike 'AdTheorent_Winter_ConsiderationTD_TravelEnthusiasts_CA_CrossDeviceDisplay_Feb-Apr21_AVDisplay_160x600%' then 'California'
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
        WHEN ${site_dcm} = 'snowbrains.com' then 'Snowbrains.com'
        WHEN ${site_dcm} = 'Adtheorant' then 'AdTheorent'
        ELSE ${site_dcm}
        END
        ;;
  }

  dimension: creative_name {
    type: string
    label: "Creative Name"
    group_label: "Client Dimensions"
    sql:
      CASE
        when ${creative} = 'MAM_Summer_Bigfoot_160x600_STATIC' then 'Summer_Bigfoot_160x600'
        when ${creative} = 'MAM_Summer_Bigfoot_728x90_STATIC' then 'Summer_Bigfoot_728x90'
        when ${creative} = 'MAM_Summer_Bigfoot_300x600_STATIC' then 'Summer_Bigfoot_300x600'
        when ${creative} = 'MAM_Summer_Bigfoot_300x250_STATIC' then 'Summer_Bigfoot_300x250'
        when ${creative} = 'MAM_Summer_Bigfoot_320x50_STATIC' then 'Summer_Bigfoot_320x50'

        when ${creative} = 'MAM_Summer_Dragon_160x600_STATIC' then 'Summer_Dragon_160x600'
        when ${creative} = 'MAM_Summer_Dragon_728x90_STATIC' then 'Summer_Dragon_728x90'
        when ${creative} = 'MAM_Summer_Dragon_300x600_STATIC' then 'Summer_Dragon_300x600'
        when ${creative} = 'MAM_Summer_Dragon_300x250_STATIC' then 'Summer_Dragon_300x250'
        when ${creative} = 'MAM_Summer_Dragon_320x50_STATIC' then 'Summer_Dragon_320x50'

        when ${creative} = 'MAM_Summer_Ogre_160x600_STATIC' then 'Summer_Ogre_160x600'
        when ${creative} = 'MAM_Summer_Ogre_728x90_STATIC' then 'Summer_Ogre_728x90'
        when ${creative} = 'MAM_Summer_Ogre_300x600_STATIC' then 'Summer_Ogre_300x600'
        when ${creative} = 'MAM_Summer_Ogre_300x250_STATIC' then 'Summer_Ogre_300x250'
        when ${creative} = 'MAM_Summer_Ogre_320x50_STATIC' then 'Summer_Ogre_320x50'

        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_RM%_1x1%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_Cross Device_Video:30_1x1' then 'Territory (:30)'


        WHEN ${placement_id} = '286278075' then 'Uncategorized_Forecast Display'
        WHEN ${placement_id} = '286167734' then 'Uncategorized_Forecast Display'
        WHEN ${placement_id} = '286353049' then 'Uncategorized_Forecast Display'
        WHEN ${placement_id} = '286278342' then 'Uncategorized_Forecast Display'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiTrippers_CA_In-EmailPromo%' then 'Uncategorized_Email Display'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_SkiVacation_CA_In-EmailPromo%' then 'Uncategorized_Email Display'

        when ${creative} = 'MAM_Winter_Unicorns_728x90_STATIC' then 'Unicorns_728x90'
        when ${creative} = 'MAM_Winter_Unicorns_300x250_STATIC' then 'Unicorns_300x250'
        when ${creative} = 'MAM_Winter_Unicorns_160x600_STATIC' then 'Unicorns_160x600'
        when ${creative} = 'MAM_Winter_Unicorns_300x600_STATIC' then 'Unicorns_300x600'

        when ${creative} = 'MAM_Winter_Unicorns_REFRESHED_728x90_STATIC' then 'Unicorns_728x90'
        when ${creative} = 'MAM_Winter_Unicorns_REFRESHED_300x250_STATIC' then 'Unicorns_300x250'
        when ${creative} = 'MAM_Winter_Unicorns_REFRESHED_160x600_STATIC' then 'Unicorns_160x600'
        when ${creative} = 'MAM_Winter_Unicorns_REFRESHED_300x600_STATIC' then 'Unicorns_300x600'

        when ${creative} = 'MAM_Winter_Yeti_REFRESHED_728x90_STATIC' then 'Yeti_728x90'
        when ${creative} = 'MAM_Winter_Yeti_REFRESHED_300x250_STATIC' then 'Yeti_300x250'
        when ${creative} = 'MAM_Winter_Yeti_REFRESHED_160x600_STATIC' then 'Yeti_160x600'
        when ${creative} = 'MAM_Winter_Yeti_REFRESHED_300x600_STATIC' then 'Yeti_300x600'

        when ${creative} = 'MAM_AirService_CA-NV-DEN_300x600' then 'AirService_300x600'
        when ${creative} = 'MAM_AirService_CA-NV-DEN_728x90' then 'AirService_728x90'
        when ${creative} = 'MAM_AirService_CA-NV-DEN_320x50' then 'AirService_320x50'
        when ${creative} = 'MAM_AirService_CA-NV-DEN_300x250' then 'AirService_300x250'
        when ${creative} = 'MAM_AirService_CA-NV-DEN_160x600' then 'AirService_160x600'

        when ${creative} = 'MAM_AirService_NE_300x600' then 'AirService_300x600'
        when ${creative} = 'MAM_AirService_NE_728x90' then 'AirService_728x90'
        when ${creative} = 'MAM_AirService_NE_320x50' then 'AirService_320x50'
        when ${creative} = 'MAM_AirService_NE_300x250' then 'AirService_300x250'
        when ${creative} = 'MAM_AirService_NE_160x600' then 'AirService_160x600'

        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeMobileSite_%_Display%' then 'Yeti_Mobile Site Marquee'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeDesktop_%_Display%' then 'Unicorns_Desktop Site Marquee'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeMobileApp_%_Display%' then 'Unicorns_Mobile App Marquee'

        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_In-EmailPromo_%_Display%' then 'Uncategorized_Email Display'

        WHEN ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_%_Video%' THEN 'Find Flights Now (:30)'

        when ${creative} = 'MAM_Winter_Yeti_728x90_STATIC' then 'Yeti_728x90'
        when ${creative} = 'MAM_Winter_Yeti_300x250_STATIC' then 'Yeti_300x250'
        when ${creative} = 'MAM_Winter_Yeti_160x600_STATIC' then 'Yeti_160x600'
        when ${creative} = 'MAM_Winter_Yeti_300x600_STATIC' then 'Yeti_300x600'
        when ${creative} = 'MAM_Winter_Yeti_320x50_STATIC' then 'Yeti_320x50'

        when ${creative} = 'MAM_Winter_Mammoths_728x90_STATIC' then 'Mammoths_728x90'
        when ${creative} = 'MAM_Winter_Mammoths_300x250_STATIC' then 'Mammoths_300x250'
        when ${creative} = 'MAM_Winter_Mammoths_160x600_STATIC' then 'Mammoths_160x600'
        when ${creative} = 'MAM_Winter_Mammoths_320x50_STATIC' then 'Mammoths_320x50'

        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_DEN_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_BostonDMA_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_NYDMA_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA+NV_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA_MobileRichMedia_Feb-Apr21_RichMedia%' then 'Mobile Rich Media'

        when ${creative} ilike '%P2_728x90_YourAdventure' then 'YourAdventure_728x90'
        when ${creative} ilike '%P2_728x90_ReleaseYourself' then 'ReleaseYourself_728x90'
        when ${creative} ilike '%P2_728x90_ComeBack' then 'ComeBack_728x90'

        when ${creative} ilike '%P2_320x50_ReleaseYourself_Yeti' then 'ReleaseYourself_Yeti_320x50'
        when ${creative} ilike '%P2_320x50_ReleaseYourself_Ogre' then 'ReleaseYourself_Ogre_320x50'

        when ${creative} ilike '%P2_300x600_YourAdventure' then 'YourAdventure_300x600'
        when ${creative} ilike '%P2_300x600_ReleaseYourself' then 'ReleaseYourself_300x600'
        when ${creative} ilike '%P2_300x600_ComeBack' then 'ComeBack_300x600'

        when ${creative} ilike '%P2_160x600_YourAdventure' then 'YourAdventure_160x600'
        when ${creative} ilike '%P2_160x600_ReleaseYourself' then 'ReleaseYourself_160x600'
        when ${creative} ilike '%P2_160x600_ComeBack' then 'ComeBack_160x600'

        when ${creative} ilike '%P2_300x250_YourAdventure' then 'YourAdventure_300x250'
        when ${creative} ilike '%P2_300x250_ReleaseYourself' then 'ReleaseYourself_300x250'
        when ${creative} ilike '%P2_300x250_ComeBack' then 'ComeBack_300x250'

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
        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_RM%_1x1%' then 'Rich Media'
        when ${placement} ilike 'AdTheorent_MAMFY21SpringSummer_Predictive-Targeting-RTS_CA+NV_Cross Device_Video:30_1x1' then 'Video'
        WHEN ${placement_id} = '286278075' then 'Forecast Display'
        WHEN ${placement_id} = '286167734' then 'Forecast Display'
        WHEN ${placement_id} = '286353049' then 'Forecast Display'
        WHEN ${placement_id} = '286278342' then 'Forecast Display'

        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_DEN_Video%' then 'Video'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_BostonDMA_Video%' then 'Video'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_NYDMA_Video%' then 'Video'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA+NV_Video%' then 'Video'

        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_DEN_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_BostonDMA_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_NYDMA_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA+NV_MobileRichMedia%' then 'Mobile Rich Media'
        when ${placement} ilike 'AdTheorent_Winter_Awareness_TravelEnthusiasts_CA_MobileRichMedia_Feb-Apr21_RichMedia%' then 'Mobile Rich Media'

        when ${creative} ILIKE '%728x90%' then '728x90'
        when ${creative} ILIKE '%300x250%' then '300x250'
        when ${creative} ILIKE '%300x600%' then '300x600'
        when ${creative} ILIKE '%320x50%' then '320x50'
        when ${creative} ILIKE '%160x600%' then '160x600'
        when ${creative} ILIKE '%970x250%' then '970x250'
        when ${creative} ILIKE '%300x50%' then '300x50'
        WHEN ${placement_id} = '295140241' then 'Video'
        when ${placement} = 'AdTheorent_SummerRecovery_Phase2_PredictiveAudienceContextual_CA+NV_SeptemberVideo_0:15_1x1' then 'Video'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeMobileSite_%_Display%' then 'Mobile Site Marquee'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeDesktop_%_Display%' then 'Desktop Site Marquee'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_MarqueeMobileApp_%_Display%' then 'Mobile App Marquee'
        WHEN ${placement} ilike 'OpenSnow_Winter_Awareness_%_In-EmailPromo_%_Display%' then 'Email Display'

      ELSE 'Uncategorized'
      END;;
  }

  dimension: mam_audience {
    type: string
    group_label: "Client Dimensions"
    label: "Audience"
    sql:
      CASE
        WHEN  ${placement} ILIKE '%PredictiveAudienceContextual%' then 'Predictive Audience Contextual'
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

  dimension: video_views {
    type: number
    hidden: yes
    sql: ${TABLE}.video_views ;;
  }

  dimension: video_plays {
    type: number
    hidden: yes
    sql: ${TABLE}.video_plays ;;
  }

  dimension: video_completes {
    type: number
    hidden: yes
    sql: ${TABLE}.video_completes ;;
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
    sql: ${video_views} ;;
  }

  measure: total_plays {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Video Plays"
    sql: ${video_plays} ;;
  }

  measure: total_completes {
    group_label: "3rd Party Measures"
    type: sum_distinct
    sql_distinct_key: ${comp_key} ;;
    label: "Video Completes"
    sql: ${video_completes} ;;
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
