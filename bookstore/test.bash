mysql --login-path=local DatabaseManagement < clearTables.sql > output.tab
echo "Cleared Tables"
mysql --login-path=local DatabaseManagement < createTables.sql > output.tab
echo "Created Tables"
mysql --login-path=local DatabaseManagement < addData.sql > output.tab
echo "Filled Table Data"
