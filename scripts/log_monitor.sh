#!/bin/bash

LOG_FILE="logs/application.log"
REPORT_FILE="reports/log_report.txt"

echo "starting log monitoring.."
mkdir -p reports

if [ ! -f "$LOG_FILE" ]; then
  echo "Log file not found."
  exit 1

fi
ERROR_COUNT=$(grep  -ic  "ERROR" "$LOG_FILE"  || true)
WARNING_COUNT=$(grep -ic "WARNING" "$LOG_FILE" || true)

echo "Log Monitoring Report"> "$REPORT_FILE"
echo "============">> "$REPORT_FILE"
echo "Errors detected: $ERROR_COUNT">> "$REPORT_FILE"
echo "Warnings detected: $WARNING_COUNT">> "$REPORT_FILE"

if [ "$ERROR_COUNT"  -gt 0 ]; then
    echo "ERRORS FOUND"
    exit 1
else
   echo "No errors found."
fi
