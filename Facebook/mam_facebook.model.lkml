connection: "mc_panoply"

include: "/Facebook/**/*.view"
include: "/Google_Analytics/**/*.view"

datagroup: mam_facebook_datagroup {
  sql_trigger: SELECT current_date;;
  max_cache_age: "24 hours"
}

explore: mam_fb_view_extended {
  extends: [mam_fb]
  hidden: no
  }
