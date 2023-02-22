#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:13219840:d3177f97032499a80966cd335aa768b07528b2a9; then
  applypatch  EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:7809024:2a83d142550f2e5ee53e98e19ccc423a2a9d8350 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery 25874805d1c5b1400713ac5bd0635e991f49c2a8 13217792 2a83d142550f2e5ee53e98e19ccc423a2a9d8350:/system/recovery-from-boot.p && installed=1 && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
  [ -n "$installed" ] && dd if=/system/recovery-sig of=/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery bs=1 seek=13217792 && sync && log -t recovery "Install new recovery signature: succeeded" || log -t recovery "Installing new recovery signature: failed"
else
  log -t recovery "Recovery image already installed"
fi
