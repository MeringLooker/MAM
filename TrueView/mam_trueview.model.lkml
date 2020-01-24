 connection: "mc_panoply"

include: "/TrueView/**/*.view"

datagroup: mam_trueview_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: mam_trueview_extended {
  extends: [mam_yt]
  hidden: no
}
