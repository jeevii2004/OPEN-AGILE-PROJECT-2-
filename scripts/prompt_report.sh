#!/bin/bash

REPORT_FILE="reports/log_report.txt"

echo "Generating prompt-based automation report..."

if [ ! -f "$REPORT_FILE" ]; then
    echo "Log report not found."
    exit 1
fi

ERRORS=$(grep "Errors detected:" "$REPORT_FILE" | awk '{print $3}')
WARNINGS=$(grep "Warnings detected:" "$REPORT_FILE" | awk '{print $3}')

echo ""
echo "======================================"
echo "       PROMPT-BASED REPORT"
echo "======================================"

echo ""
echo "Prompt:"
echo "Analyze the automated log monitoring results."
echo "Errors detected: $ERRORS"
echo "Warnings detected: $WARNINGS"
echo "Provide a summary and recommended action."

echo ""
echo "Automated Summary:"
echo "The monitoring job detected $ERRORS error(s) and $WARNINGS warning(s)."

echo ""
if [ "$ERRORS" -gt 0 ]; then
    echo "Recommended Action:"
    echo "Investigate the detected errors immediately."
else
    echo "Recommended Action:"
    echo "No immediate action required."
fi

echo ""
echo "======================================"
echo "Report generation completed."
echo "======================================"
# Final integration test
