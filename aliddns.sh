#!/bin/bash
# 定义日志文件的路径
LOG_FILE="/opt/yzl/aliddns/aliddns.log"
# 定义一个二维数组
declare -a domains=(
    "storage yzltech.com"
    "storage yzltech.com"
    "dev yzltech.com"
    "gitlab yzltech.com"
    "vpn yzltech.com"
    "lsh yzltech.com"
    "sk yzltech.com"
    "seoms cloudlism.com"
)
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "${LOG_FILE}"
}
log "==========================================="
log "start domains task"
echo ""
cd /opt/yzl/aliddns
# 循环遍历数组
for domain in "${domains[@]}"; do
    # 分割字符串为数组
    IFS=' ' read -ra ADDR <<< "$domain"
    log "Extracted subdomain: ${ADDR[0]}"
    log "Extracted domain: ${ADDR[1]}"
    python3 ./aliddns.py ${ADDR[0]} ${ADDR[1]} A 2>&1 | tee -a "${LOG_FILE}"
    log "Python script executed for ${full_domain}"
done
log "All domains have been processed."
