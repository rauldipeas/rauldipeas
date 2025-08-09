#!/bin/bash
set -e
amd_support() {
	sudo mkdir -p /etc/apt/keyrings
	wget -q --show-progress -O- https://repo.radeon.com/rocm/rocm.gpg.key|sudo gpg --dearmor --yes -o /etc/apt/keyrings/rocm.gpg
	printf 'deb [arch=amd64 signed-by=/etc/apt/keyrings/rocm.gpg] https://repo.radeon.com/rocm/apt/6.4.1 noble main'|sudo tee /etc/apt/sources.list.d/rocm.list>/dev/null
	printf 'Package: *\nPin: release o=repo.radeon.com\nPin-Priority: 600'|sudo tee /etc/apt/preferences.d/rocm-pin-600 >/dev/null
	sudo apt update
	sudo apt install -y --reinstall\
		amd64-microcode\
		plocate\
		rocm
	# amd-smi-lib comgr composablekernel-dev g++-13-multilib g++-multilib gcc-11-base gcc-13-multilib gcc-multilib gdal-data gdal-plugins half hip-dev hip-doc hip-runtime-amd hip-samples hipblas hipblas-common-dev hipblas-dev hipblaslt hipblaslt-dev hipcc hipcub-dev hipfft hipfft-dev hipfort-dev hipify-clang hiprand hiprand-dev hipsolver hipsolver-dev hipsparse hipsparse-dev hipsparselt hipsparselt-dev hiptensor hiptensor-dev hsa-amd-aqlprofile hsa-rocr hsa-rocr-dev icu-devtools lib32asan8 lib32atomic1 lib32gcc-13-dev lib32gcc-s1 lib32gomp1 lib32itm1 lib32quadmath0 lib32stdc++-13-dev lib32stdc++6 lib32ubsan1 libaec0 libamd-comgr2 libamd3 libamdhip64-5 libarmadillo12 libarpack2t64 libasan6 libavcodec-dev libavformat-dev libavutil-dev libblosc1 libc6-dev-i386 libc6-dev-x32 libc6-i386 libc6-x32 libcamd3 libccolamd3 libcfitsio10t64 libcharls2 libcholmod5 libcolamd3 libdc1394-dev libdeflate-dev libdrm-dev libevent-core-2.1-7t64 libevent-pthreads-2.1-7t64 libexif-dev libexif-doc libexpat1-dev libfabric1 libfile-copy-recursive-perl libfile-which-perl libfreexl1 libfyba0t64 libgcc-11-dev libgdal34t64 libgdcm-dev libgdcm3.0t64 libgeos-c1t64 libgeos3.12.1t64 libgeotiff5 libgl2ps1.4 libglew2.2 libgphoto2-dev libhdf4-0-alt libhdf5-103-1t64 libhdf5-hl-100t64 libhsa-runtime64-1 libhsakmt1 libhwloc-plugins libhwloc15 libicu-dev libimath-dev libjbig-dev libjpeg-dev libjpeg-turbo8-dev libjpeg8-dev libjs-sphinxdoc libjsoncpp25 libkmlbase1t64 libkmldom1t64 libkmlengine1t64 liblept5 liblerc-dev libllvm17t64 liblzma-dev libmunge2 libmysqlclient21  libncurses-dev libnetcdf19t64 libnuma-dev libodbcinst2 libogdi4.1 libopencv-calib3d-dev libopencv-calib3d406t64 libopencv-contrib-dev libopencv-contrib406t64 libopencv-core-dev libopencv-core406t64 libopencv-dev libopencv-dnn-dev libopencv-dnn406t64 libopencv-features2d-dev libopencv-features2d406t64 libopencv-flann-dev libopencv-flann406t64 libopencv-highgui-dev libopencv-highgui406t64 libopencv-imgcodecs-dev libopencv-imgcodecs406t64 libopencv-imgproc-dev libopencv-imgproc406t64 libopencv-java libopencv-ml-dev libopencv-ml406t64 libopencv-objdetect-dev libopencv-objdetect406t64 libopencv-photo-dev libopencv-photo406t64 libopencv-shape-dev libopencv-shape406t64 libopencv-stitching-dev libopencv-stitching406t64 libopencv-superres-dev libopencv-superres406t64 libopencv-video-dev libopencv-video406t64 libopencv-videoio-dev libopencv-videoio406t64 libopencv-videostab-dev libopencv-videostab406t64 libopencv-viz-dev libopencv-viz406t64 libopencv406-jni libopenexr-dev libopenmpi3t64 libpciaccess-dev libpkgconf3 libpmix2t64 libpng-dev libpng-tools libpq5 libproj25 libprotobuf32t64 libpsm-infinipath1 libpsm2-2 libpython3-dev libpython3.12-dev libqhull-r8.0 libqt5opengl5t64 libqt5test5t64 libraw1394-dev libraw1394-tools librdmacm1t64 librttopo1 libsharpyuv-dev libsocket++1 libspatialite8t64 libstdc++-11-dev libsuitesparseconfig7 libsuperlu6 libswresample-dev libswscale-dev libsz2 libtbb-dev libtbb12 libtbbbind-2-5 libtbbmalloc2 libtesseract5 libtiff-dev libtiffxx6 libtsan0 libucx0 liburiparser1 libvtk9.1t64 libwebp-dev libwebpdecoder3 libx32asan8 libx32atomic1 libx32gcc-13-dev libx32gcc-s1 libx32gomp1 libx32itm1 libx32quadmath0 libx32stdc++-13-dev libx32stdc++6 libx32ubsan1 libxerces-c3.2t64 libxml2-dev libxnvctrl0 mesa-common-dev migraphx migraphx-dev miopen-hip miopen-hip-dev mivisionx mivisionx-dev mysql-common opencv-data openmp-extras-dev openmp-extras-runtime pkg-config pkgconf pkgconf-bin proj-bin proj-data python3-dev python3.12-dev rccl rccl-dev rocalution rocalution-dev rocblas rocblas-dev rocfft rocfft-dev rocm rocm-cmake rocm-core rocm-dbgapi rocm-debug-agent rocm-developer-tools rocm-device-libs rocm-gdb rocm-hip-libraries rocm-hip-runtime rocm-hip-runtime-dev rocm-hip-sdk rocm-language-runtime rocm-llvm rocm-ml-libraries rocm-ml-sdk rocm-opencl rocm-opencl-dev rocm-opencl-runtime rocm-opencl-sdk rocm-openmp-sdk rocm-smi-lib rocm-utils rocminfo rocprim-dev rocprofiler rocprofiler-compute rocprofiler-dev rocprofiler-plugins rocprofiler-register rocprofiler-sdk rocprofiler-sdk-roctx rocprofiler-systems rocrand rocrand-dev rocsolver rocsolver-dev rocsparse rocsparse-dev rocthrust-dev roctracer roctracer-dev rocwmma-dev rpp rpp-dev unixodbc-common
}

nvidia_support() {
	printf '#TODO'
}

install_resolve() {
	sudo apt install -y --reinstall\
		libapr1\
		libaprutil1\
		libasound2t64\
		libgl1\
		libglib2.0-0\
		libglu1-mesa\
	    libxcb-cursor0\
		mesa-opencl-icd\
		ocl-icd-opencl-dev
	# libapr1t64 libaprutil1t64 libclc-19 libclc-19-dev libgl-dev libglx-dev libllvmspirvlib19.1 libpthread-stubs0-dev libx11-dev libxau-dev libxcb-cursor0 libxcb1-dev libxdmcp-dev mesa-opencl-icd ocl-icd-opencl-dev opencl-c-headers opencl-clhpp-headers x11proto-dev xorg-sgml-doctools xtrans-dev
	sudo usermod -aG render,video "$USER"
	cd /tmp
	unzip -o "$HOME"/Downloads/DaVinci_Resolve_*_Linux.zip
	sudo SKIP_PACKAGE_CHECK=1 "$PWD"/DaVinci_Resolve_*_Linux.run -i -y
}

fix_pango() {
	rm -f /tmp/*.deb
	for pkg in libpango-1.0-0 libpangoft2-1.0-0 libpangocairo-1.0-0;do
	wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/"$(curl -s http://archive.ubuntu.com/ubuntu/pool/main/p/pango1.0/|grep -oP "${pkg}_[^\"']+?amd64\.deb"|sort -V|tail -n1)"
	done
	wget -q --show-progress http://archive.ubuntu.com/ubuntu/pool/main/g/gdk-pixbuf/"$(curl -s http://archive.ubuntu.com/ubuntu/pool/main/g/gdk-pixbuf/|grep -oP 'libgdk-pixbuf-2.0-0_[^"]+?amd64\.deb'|sort -V|tail -n1)"
	dpkg-deb -x libpangocairo-1.0-0_1.50.6+ds-2ubuntu1_amd64.deb "$PWD"/pango
	dpkg-deb -x libpango-1.0-0_1.50.6+ds-2ubuntu1_amd64.deb "$PWD"/pango
	dpkg-deb -x libpangoft2-1.0-0_1.50.6+ds-2ubuntu1_amd64.deb "$PWD"/pango
	dpkg-deb -x libgdk-pixbuf-2.0-0_2.42.8+dfsg-1ubuntu0.3_amd64.deb "$PWD"/pango
	sudo cp "$PWD"/pango/usr/lib/x86_64-linux-gnu/lib* /opt/resolve/libs/
}

link_ocl_libs() {
	sudo ln -fs "$(locate libamdocl64.so | head -n1)" /opt/resolve/libs/
	sudo ln -fs /usr/lib/x86_64-linux-gnu/libOpenCL.so /opt/resolve/libs/
}

fix_launcher() {
	sudo ln -sf /opt/resolve/graphics/DV_Resolve.png /usr/share/icons/hicolor/128x128/apps/resolve.png
	sudo sed -i 's|Icon=/opt/resolve/graphics/DV_Resolve.png|Icon=resolve|g' /usr/share/applications/com.blackmagicdesign.resolve.desktop
	printf '\nStartupWMClass=resolve'|sudo tee -a /usr/share/applications/com.blackmagicdesign.resolve.desktop>/dev/null
}

if [ -f "$HOME"/Downloads/DaVinci_Resolve_*_Linux.zip ];then
	gpu_info="$(lspci|grep -E "VGA|3D")"
	if printf "$gpu_info"|grep -q NVIDIA>/dev/null;then
  		nvidia_support
  		install_resolve
  		fix_pango
  		fix_launcher

	elif printf "$gpu_info"|grep -q AMD>/dev/null;then
		amd_support
		install_resolve
		link_ocl_libs
		fix_pango
		fix_launcher
		
	elif printf "$gpu_info"|grep -q Intel>/dev/null;then
  		printf 'Intel'
  		printf 'Sua GPU não é compatível com o DaVinci Resolve'
	fi
	else
	printf 'Você precisa baixar o instalador do Resolve antes de rodar este script'
	xdg-open https://www.blackmagicdesign.com/products/davinciresolve
fi