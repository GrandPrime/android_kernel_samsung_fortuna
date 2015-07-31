START_TIME=$SECONDS

rm -fr out
export ARCH=arm
mkdir $(pwd)/out

echo Preparing
make -j$(cat /proc/cpuinfo | grep processor | wc -l) -C $(pwd) O=$(pwd)/out msm8916_sec_defconfig VARIANT_DEFCONFIG=msm8916_sec_fortuna_aio_defconfig DEBUG_DEFCONFIG= SELINUX_DEFCONFIG=selinux_defconfig SELINUX_LOG_DEFCONFIG= TIMA_DEFCONFIG=
echo Building
make -j$(cat /proc/cpuinfo | grep processor | wc -l) -C $(pwd) O=$(pwd)/out

# echo Preparing
# make -j1 -C $(pwd) O=$(pwd)/out msm8916_sec_defconfig VARIANT_DEFCONFIG=msm8916_sec_fortuna_aio_defconfig DEBUG_DEFCONFIG= SELINUX_DEFCONFIG=selinux_defconfig SELINUX_LOG_DEFCONFIG= TIMA_DEFCONFIG= 
# echo Building
# make -j1 -C $(pwd) O=$(pwd)/out

cp $(pwd)/out/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage

ELAPSED_TIME=$(($SECONDS - $START_TIME))

echo -e "\t$(($ELAPSED_TIME/60)) min $(($ELAPSED_TIME%60)) sec"
