view: mam_pinterest_ga_view {
  sql_table_name: public.mam_pinterest_ga_view ;;

  dimension: ad_group_id {
    type: string
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: ad_group_name {
    type: string
    sql: ${TABLE}.ad_group_name ;;
  }

  dimension: bounces {
    type: number
    sql: ${TABLE}.bounces ;;
  }

  dimension: campaign_id {
    type: string
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: campaign_objective {
    type: string
    sql: ${TABLE}.campaign_objective ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: conversions {
    type: number
    sql: ${TABLE}.conversions ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  dimension_group: date {
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

  dimension: earned_clicks {
    type: number
    sql: ${TABLE}.earned_clicks ;;
  }

  dimension: earned_impressions {
    type: number
    sql: ${TABLE}.earned_impressions ;;
  }

  dimension: earned_saves {
    type: number
    sql: ${TABLE}.earned_saves ;;
  }

  dimension: earned_video_views {
    type: number
    sql: ${TABLE}.earned_video_views ;;
  }

  dimension: earned_views_at_100 {
    type: number
    sql: ${TABLE}.earned_views_at_100 ;;
  }

  dimension: ga_join_id {
    type: string
    sql: ${TABLE}.ga_join_id ;;
  }

  dimension: impressions {
    type: number
    sql: ${TABLE}.impressions ;;
  }

  dimension: newsletter_signup {
    type: number
    sql: ${TABLE}.newsletter_signup ;;
  }

  dimension: newusers {
    type: number
    sql: ${TABLE}.newusers ;;
  }

  dimension: pageviews {
    type: number
    sql: ${TABLE}.pageviews ;;
  }

  dimension: paid_clicks {
    type: number
    sql: ${TABLE}.paid_clicks ;;
  }

  dimension: paid_impressions {
    type: number
    sql: ${TABLE}.paid_impressions ;;
  }

  dimension: paid_saves {
    type: number
    sql: ${TABLE}.paid_saves ;;
  }

  dimension: paid_video_views {
    type: number
    sql: ${TABLE}.paid_video_views ;;
  }

  dimension: paid_views_at_100 {
    type: number
    sql: ${TABLE}.paid_views_at_100 ;;
  }

  dimension: pin_description {
    type: string
    sql: ${TABLE}.pin_description ;;
  }

  dimension: pin_id {
    type: string
    sql: ${TABLE}.pin_id ;;
  }

  dimension: promoted_pin_id {
    type: string
    sql: ${TABLE}.promoted_pin_id ;;
  }

  dimension: promoted_pin_name {
    type: string
    sql: ${TABLE}.promoted_pin_name ;;
  }

  dimension: saves {
    type: number
    sql: ${TABLE}.saves ;;
  }

  dimension: search_flights_button {
    type: number
    sql: ${TABLE}.search_flights_button ;;
  }

  dimension: sessionduration {
    type: number
    sql: ${TABLE}.sessionduration ;;
  }

  dimension: sessions {
    type: number
    sql: ${TABLE}.sessions ;;
  }

  dimension: tos_above_30s {
    type: number
    sql: ${TABLE}.tos_above_30s ;;
  }

  dimension: united_airlines_referral {
    type: number
    sql: ${TABLE}.united_airlines_referral ;;
  }

  dimension: users {
    type: number
    sql: ${TABLE}.users ;;
  }

  dimension: video_starts {
    type: number
    sql: ${TABLE}.video_starts ;;
  }

  dimension: video_views {
    type: number
    sql: ${TABLE}.video_views ;;
  }

  dimension: views_at_100 {
    type: number
    sql: ${TABLE}.views_at_100 ;;
  }

  dimension: views_at_25 {
    type: number
    sql: ${TABLE}.views_at_25 ;;
  }

  dimension: views_at_50 {
    type: number
    sql: ${TABLE}.views_at_50 ;;
  }

  dimension: views_at_75 {
    type: number
    sql: ${TABLE}.views_at_75 ;;
  }

  dimension: views_at_95 {
    type: number
    sql: ${TABLE}.views_at_95 ;;
  }

  dimension: visitor_guide_order {
    type: number
    sql: ${TABLE}.visitor_guide_order ;;
  }

  measure: count {
    type: count
    drill_fields: [promoted_pin_name, ad_group_name, campaign_name]
  }
}
