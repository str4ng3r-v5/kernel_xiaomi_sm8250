DTS=$(pwd)/out/arch/arm64/boot/dts/vendor/qcom

EXPORTED_DTB=$(pwd)/out/arch/arm64/boot/dtb

make_dtb() {
    echo -e "$cyan************************************************"
    echo    "                  MAKE DTB                     "
    echo -e "***********************************************$nocol"

    find $DTS -name '*.dtb' -exec cat {} + > $EXPORTED_DTB
}

make_dtb
