#!/bin/bash

REPORT="automation_report.txt"

echo "====================================" > "$REPORT"
echo "       AUTOMATION REPORT" >> "$REPORT"
echo "====================================" >> "$REPORT"
echo "Generated: $(date)" >> "$REPORT"
echo "" >> "$REPORT"

echo "JOB STATUS" >> "$REPORT"
echo "----------" >> "$REPORT"

if [ -f log.txt ]; then
    echo "Log generation: SUCCESS" >> "$REPORT"
else
    echo "Log generation: FAILED" >> "$REPORT"
fi

if [ -f backup_log.txt ]; then
    echo "Backup operation: SUCCESS" >> "$REPORT"
else
    echo "Backup operation: FAILED" >> "$REPORT"
fi

echo "" >> "$REPORT"

echo "ERROR DETECTION" >> "$REPORT"
echo "---------------" >> "$REPORT"

if grep -qiE "error|failed" log.txt 2>/dev/null; then
    echo "ERROR: Failure detected in log." >> "$REPORT"
    echo "ACTION: Investigate the failed scheduled job." >> "$REPORT"
else
    echo "No errors detected." >> "$REPORT"
    echo "ACTION: Continue normal monitoring." >> "$REPORT"
fi

echo "" >> "$REPORT"

echo "RECOMMENDATION" >> "$REPORT"
echo "--------------" >> "$REPORT"
echo "Monitor scheduled jobs and verify log and backup files regularly." >> "$REPORT"

echo "Report generated successfully."
