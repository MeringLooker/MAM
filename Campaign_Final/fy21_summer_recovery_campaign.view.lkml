view: mam_fy21_summer_recovery_campaign {
  sql_table_name: public.mam_fy21_summer_recovery_campaign ;;

#### Primary Key Added ####

  dimension: primary_key {
    type: string
    hidden: yes
    primary_key: yes
    sql: ${publisher}||'_'||${campaign}||'_'||${phase}||'_'||${placement}||'_'||${audience}||'_'||${ad_size}||'_'||${creative_name}||'_'||${date} ;;
  }

#### Dimensions below ####

  dimension: publisher {
    type:  string
    sql:  ${TABLE}.publisher ;;
  }

  dimension: campaign {
    type: string
    hidden: yes
    sql: ${TABLE}.campaign ;;
  }

  dimension: phase {
    type:  string
    sql:  ${TABLE}.phase ;;
  }

  dimension: placement {
    type:  string
    label: "Placement Name"
    sql:  ${TABLE}.placement ;;
  }

  dimension: audience {
    type:  string
    label: "Audience"
    sql:  ${TABLE}.audience ;;
  }

  dimension: ad_size {
    type:  string
    label: "Ad Size"
    sql:  ${TABLE}.ad_size ;;
  }

  dimension: creative_name {
    type:  string
    label: "Creative Name"
    sql:  ${TABLE}.creative_name ;;
  }

  dimension: date {
    type:  date
    group_label: "Date Periods"
    sql:  ${TABLE}.date ;;
  }

  dimension: week {
    type:  date_week
    group_label: "Date Periods"
    sql:  ${TABLE}.week ;;
  }

  dimension: month {
    type:  date_month
    group_label: "Date Periods"
    sql:  ${TABLE}.month ;;
  }

  dimension: impressions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_impressions ;;
  }

  dimension: clicks {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_clicks;;
  }

  dimension: cost {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_cost ;;
  }

  dimension: sessions {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_sessions ;;
  }

  dimension: session_duration {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_session_duration ;;
  }

  dimension: views {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_views ;;
  }

  dimension: completes {
    hidden:  yes
    type:  number
    sql: ${TABLE}.total_completes ;;
  }

  ### All measures go below ###

  measure: total_impressions {
    type: sum
    label: "Impressions"
    sql: ${impressions} ;;
  }

  measure: total_clicks {
    type: sum
    label: "Clicks"
    sql: ${clicks} ;;
  }

  measure: click_through_rate {
    type: number
    label: "CTR"
    sql: 1.0*${total_clicks}/nullif(${total_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: total_views {
    type: sum
    label: "Video Views"
    sql: ${views} ;;
  }

  measure: total_completes {
    type: sum
    label: "Video Completes"
    value_format_name: decimal_0
    sql: ${completes} ;;
  }

  measure: total_cost {
    type: sum
    label: "Gross Cost"
    value_format_name: usd
    sql: ${cost}*1.17647 ;;
  }

  measure: cost_per_click {
    type: number
    label: "CPC"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_clicks}, 0) ;;
  }

  measure: total_sessions {
    type: sum
    label: "Sessions"
    sql: ${sessions} ;;
  }

  measure: cost_per_session {
    type: number
    label: "CPS"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_sessions}, 0) ;;
  }

  measure: total_session_duration {
    type: sum
    hidden: yes
    sql: ${session_duration} ;;
  }

  measure: avg_session_duration {
    label: "Avg. TOS"
    type: number
    sql: (floor((${total_session_duration}::numeric(19,6))/nullif(${total_sessions}, 0)))::float/86400 ;;
    value_format: "m:ss"
  }

  measure: video_impressions {
    type: sum
    hidden: yes
    sql:
      case
        when ${views} > 0 then ${impressions}
        else null
        end
        ;;
  }

  measure: view_rate {
    type: number
    label: "View Rate"
    sql: 1.0*${total_views}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: completion_rate {
    type: number
    label: "Completion Rate"
    sql: 1.0*${total_completes}/nullif(${video_impressions}, 0) ;;
    value_format_name: percent_2
  }

  measure: cost_per_thousand {
    type: number
    label: "CPM"
    value_format_name: usd
    sql: ${total_cost}/nullif(${total_impressions}/1000, 0) ;;
  }

  measure: video_cost {
    type: sum
    hidden: yes
    sql:
      case
        when ${views} > 0 then (${cost}*1.17647)
        else null
        end
        ;;
  }

  measure: cost_per_view {
    type: number
    label: "CPV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_views}, 0) ;;
  }

  measure: cost_per_complete {
    type: number
    label: "CPcV"
    value_format_name: usd
    sql: ${video_cost}/nullif(${total_completes}, 0) ;;
  }

  measure: count {
    type: count
  }
}
