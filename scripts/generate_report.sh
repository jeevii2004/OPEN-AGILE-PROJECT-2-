#!/bin/bash

REPORT="reports/ci_report.txt"

mkdir -p reports

echo "======================================" > "$REPORT"
echo "       CI/CD AUTOMATED REPORT" >> "$REPORT"
echo "======================================" >> "$REPORT"
echo "" >> "$REPORT"

if [ -f "backup/hello.sh" ]; then

    echo "STATUS: SUCCESS" >> "$REPORT"
    echo "" >> "$REPORT"

    echo "SUMMARY:" >> "$REPORT"
    echo "The automated backup task completed successfully." >> "$REPORT"
    echo "" >> "$REPORT"

    echo "ERROR DETECTION:" >> "$REPORT"
    echo "No errors detected. Backup file exists." >> "$REPORT"
    echo "" >> "$REPORT"

    echo "ACTION:" >> "$REPORT"
    echo "No corrective action is required." >> "$REPORT"

else

    echo "STATUS: FAILURE" >> "$REPORT"
    echo "" >> "$REPORT"

    echo "SUMMARY:" >> "$REPORT"
    echo "The automated backup task failed." >> "$REPORT"
    echo "" >> "$REPORT"

    echo "ERROR DETECTION:" >> "$REPORT"
    echo "Backup file was not created." >> "$REPORT"
    echo "" >> "$REPORT"

    echo "ACTION:" >> "$REPORT"
    echo "Check scripts/backup.sh and run the GitHub Actions pipeline again." >> "$REPORT"

fi

echo "" >> "$REPORT"
echo "======================================" >> "$REPORT"

cat "$REPORT"
