connection: "mc_panoply"

include: "/Pinterest/**/*.view"
include: "/Google_Analytics/**/*.view"

explore: mam_pinterest_extended {
  extends: [mam_pinterest_ads]
  hidden: no
}
