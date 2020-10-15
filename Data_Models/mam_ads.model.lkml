connection: "mc_panoply"

include: "/AdWords/*.view"
include: "/Google_Analytics/**/*.view"
include: "/TrueView/**/*.view"
include: "/DCM/**/*.view"
include: "/Pinterest/**/*.view"
include: "/Publisher_Passback/**/*.view"
include: "/Facebook/**/*.view"

## Google Search ##

explore: mam_sem_extended {
  extends: [mam_sem]
  hidden: no
}

## Google Display ##

explore: mam_gdn_extended {
  extends: [mam_gdn]
  hidden: no
}

## DoubleClick ##

explore: mam_dcm_extended {
  extends: [mam_dcm]
  hidden: no
}

## Facebook ##

explore: mam_fb_view_extended {
  extends: [mam_fb]
  hidden: no
}

## Google Analytics ##

explore: mam_ga_extended {
  hidden: no
  extends: [mam_ga]
}

## Pinterest Ads ##

explore: mam_pinterest_extended {
  extends: [mam_pinterest]
  hidden: no
}

## YouTube Trueview ##

explore: mam_yt_extended {
  extends: [mam_yt]
  hidden: no
  label: "YouTube"
  view_label: "YouTube"
  group_label: "Mammoth Lakes Tourism"
}
