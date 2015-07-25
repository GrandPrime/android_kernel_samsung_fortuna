mkdir $(pwd)/out
make -C $(pwd) O=$(pwd)/out msm8916_sec_defconfig VARIANT_DEFCONFIG=msm8916_sec_fortuna_aio_defconfig DEBUG_DEFCONFIG= SELINUX_DEFCONFIG=selinux_defconfig SELINUX_LOG_DEFCONFIG= TIMA_DEFCONFIG= 
make -C $(pwd) O=$(pwd)/out
cp $(pwd)/out/arch/arm/boot/zImage $(pwd)/arch/arm/boot/zImage