view: mam_fy21_winter_pacing {
  sql_table_name: public.mam_fy21_winter_pacing_test ;;
  drill_fields: [id]

  dimension: id {
    hidden: yes
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

## below used to join to campaign table ##

  dimension: pacing_key {
    type: string
    hidden: yes
    sql: ${publisher}||'_'||${region} ;;
  }

  dimension: impressions_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.impressions_goal ;;
  }

  dimension: start_date {
    label: "Start Date"
    type: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: end_date {
    label: "End Date"
    type: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: publisher {
    type: string
    sql: ${TABLE}.publisher ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: spend_goal {
    hidden: yes
    type: number
    sql: ${TABLE}.spend_goal ;;
  }

  ## Goal Measures ##

  measure: total_spend_goal {
    group_label: "Spend Goals (All Net)"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${spend_goal} ;;
    label: "Spend Goal"
    value_format_name: usd
  }

  measure: delivered_spend {
    group_label: "Spend Goals"
    type: sum_distinct
    sql_distinct_key: ${pdt_fy21_winter_campaign.primary_key} ;;
    sql: ${pdt_fy21_winter_campaign.cost} ;;
    label: "Spend To Date"
    value_format_name: usd
  }

  measure: budget_remaining {
    type: number
    group_label: "Spend Goals"
    label: "Remaining Budget"
    value_format_name: usd
    sql:${total_spend_goal} - ${pdt_fy21_winter_campaign.total_cost} ;;
  }

  measure: pct_budget_remaining {
    type: number
    group_label: "Spend Goals"
    label: "% Budget Remaining"
    value_format_name: percent_0
    sql:${budget_remaining}/nullif(${total_spend_goal},0) ;;
  }

  measure: pct_budget_spent {
    type: number
    group_label: "Spend Goals"
    label: "% Budget Spent"
    value_format_name: percent_0
    sql:${pdt_fy21_winter_campaign.total_cost}/nullif(${total_spend_goal},0) ;;
  }

  measure: total_impressions_goal {
    group_label: "Impression Goals"
    type: sum_distinct
    sql_distinct_key: ${id} ;;
    sql: ${impressions_goal} ;;
    label: "Impressions Goal"
    value_format_name: decimal_0
  }

  measure: impressions_delivered {
    group_label: "Impression Goals"
    type: sum_distinct
    sql_distinct_key: ${pdt_fy21_winter_campaign.primary_key} ;;
    sql: ${pdt_fy21_winter_campaign.impressions} ;;
    label: "Impressions Delivered"
    value_format_name: decimal_0
  }

  measure: impressions_remaining {
    type: number
    group_label: "Impression Goals"
    label: "Remaining Impressions"
    value_format_name: decimal_0
    sql:${total_impressions_goal} - ${pdt_fy21_winter_campaign.total_impressions} ;;
  }

  measure: pct_impressions_remaining {
    type: number
    group_label: "Impression Goals"
    label: "% Impressions Remaining"
    value_format_name: percent_0
    sql:${budget_remaining}/nullif(${total_impressions_goal},0) ;;
  }

  measure: pct_impressions_delivered {
    type: number
    group_label: "Impression Goals"
    label: "% of Impressions Delivered"
    value_format_name: percent_0
    sql:${pdt_fy21_winter_campaign.total_impressions}/nullif(${total_impressions_goal},0) ;;
  }

  ## Running Totals ##

  measure: impressions_running_total {
    group_label: "Impression Goals"
    type: running_total
    sql: ${impressions_delivered} ;;
    label: "Impressions (Running Total)"
    value_format_name: decimal_0
  }

  measure: pct_impressions_delivered_running_total {
    group_label: "Impression Goals"
    type: number
    sql:${impressions_running_total}/nullif(${total_impressions_goal},0) ;;
    label: "% of Impressions Delivered (Running Total)"
    value_format_name: percent_0
  }

  measure: spend_running_total {
    group_label: "Spend Goals"
    type: running_total
    sql: ${delivered_spend} ;;
    label: "Spend (Running Total)"
    value_format_name: usd
  }

  measure: pct_budget_delivered_running_total {
    group_label: "Spend Goals"
    type: number
    sql:${spend_running_total}/nullif(${total_spend_goal},0) ;;
    label: "% of Budget Delivered (Running Total)"
    value_format_name: percent_0
  }

  ## Date Measures ##

  # measure: days_in_flight {
  #   group_label: "Flight Stats"
  #   type: number
  #   sql: diffdays(${end_date},${start_date}) ;;
  # }

  # measure: days_remaining {
  #   group_label: "Flight Stats"
  #   type: number
  #   sql: DATEDIFF(${end_date}, GETDATE()) ;;
  # }

  # measure: days_passed {
  #   group_label: "Flight Stats"
  #   type: number
  #   sql: DATEDIFF(GETDATE(), ${start_date}) ;;
  # }
}
