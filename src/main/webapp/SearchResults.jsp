<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if(session.getAttribute("loggedInUser") == null) {
        response.sendRedirect("Login.jsp"); return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search - AIMS</title>
<link rel="stylesheet" href="css/style.css">
<!-- jQuery + jqGrid -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/css/ui.jqgrid.min.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.5/jquery.jqgrid.min.js"></script>
</head>
<body>

<div class="page-wrapper">
  <div class="nav-bar">
    <span class="nav-brand">AIMS — Asset Inventory Management System</span>
    <span class="nav-user">Welcome, <%= session.getAttribute("fullName") %></span>
    <a href="EntryformController" class="nav-link">Add Asset</a>
    <a href="LogoutController" class="nav-link">Logout</a>
  </div>

  <div class="form-container wide">
    <h2 class="form-title">Search Data</h2>

    <div class="search-grid">
      <div class="form-group">
        <label>Asset Type</label>
        <select id="s_assetType">
          <option value="">Option one</option>
          <option>Laptop</option>
          <option>Desktop</option>
          <option>Server</option>
          <option>Printer</option>
          <option>Network Switch</option>
        </select>
      </div>
      <div class="form-group">
        <label>Memory Details</label>
        <input type="text" id="s_memoryDetails" placeholder="Memory  Details">
      </div>
      <div class="form-group">
        <label>Hardware Asset ID</label>
        <input type="text" id="s_hwAssetId" placeholder="Hardware Asset ID">
      </div>
      <div class="form-group">
        <label>Operating System</label>
        <select id="s_operatingSystem">
          <option value="">Option one</option>
          <option>Windows</option>
          <option>RedHat Linux</option>
          <option>Ubuntu</option>
          <option>macOS</option>
        </select>
      </div>
      <div class="form-group">
        <label>Serial Number</label>
        <input type="text" id="s_serialNumber" placeholder="Serial Number">
      </div>
      <div class="form-group">
        <label>Assigned To</label>
        <input type="text" id="s_assignedTo" placeholder="Assigned To">
      </div>
      <div class="form-group">
        <label>Spares Asset ID</label>
        <input type="text" id="s_sparesAssetId" placeholder="Spares Asset ID">
      </div>
      <div class="form-group">
        <label>Current Status</label>
        <select id="s_currentStatus">
          <option value="">Option one</option>
          <option>In Use</option>
          <option>Available</option>
          <option>Under Repair</option>
          <option>Retired</option>
        </select>
      </div>
      <div class="form-group">
        <label>Asset Location</label>
        <select id="s_assetLocation">
          <option value="">Option one</option>
          <option>Head Office</option>
          <option>Branch - Mumbai</option>
          <option>Branch - Delhi</option>
          <option>Data Center</option>
        </select>
      </div>
      <div class="form-group">
        <label>Remarks</label>
        <input type="text" id="s_remarks" placeholder="Remarks">
      </div>
    </div>

    <div class="form-actions">
      <button type="button" id="btnSearch" class="btn-primary">Search</button>
      <button type="button" id="btnClear"  class="btn-secondary">Clear</button>
    </div>
  </div>

  <!-- Search Results Grid -->
  <div class="results-container">
    <h2 class="form-title">Search Results</h2>
    <table id="assetGrid"></table>
    <div id="assetGridPager"></div>
  </div>
</div>

<script>
$(document).ready(function () {

    // Initialize jqGrid
    $("#assetGrid").jqGrid({
        datatype: "local",
        colNames: ['Asset Type','Make','Processor Details','Memory Details',
                   'Storage Details','Other HW Details','Operating System',
                   'Serial Number','Invoice Number','Invoice Date',
                   'Invoice Storage Path','Warranty Expiry Date'],
        colModel: [
            {name:'assetType',       width:90},
            {name:'make',            width:80},
            {name:'processorDetails',width:110},
            {name:'memoryDetails',   width:100},
            {name:'storageDetails',  width:100},
            {name:'otherHwDetails',  width:110},
            {name:'operatingSystem', width:110},
            {name:'serialNumber',    width:110},
            {name:'invoiceNumber',   width:110},
            {name:'invoiceDate',     width:100},
            {name:'invoiceStoragePath', width:130},
            {name:'warrantyExpiryDate', width:130}
        ],
        rowNum: 20,
        pager: '#assetGridPager',
        sortname: 'assetType',
        viewrecords: true,
        sortorder: "asc",
        caption: "Asset Inventory Search Results",
        height: 'auto',
        width: '100%',
        autowidth: true
    });

    // Search button
    $('#btnSearch').click(function () {
        var params = {
            ajax: 'true',
            assetType:       $('#s_assetType').val(),
            memoryDetails:   $('#s_memoryDetails').val(),
            hwAssetId:       $('#s_hwAssetId').val(),
            operatingSystem: $('#s_operatingSystem').val(),
            serialNumber:    $('#s_serialNumber').val(),
            assignedTo:      $('#s_assignedTo').val(),
            sparesAssetId:   $('#s_sparesAssetId').val(),
            currentStatus:   $('#s_currentStatus').val(),
            assetLocation:   $('#s_assetLocation').val(),
            remarks:         $('#s_remarks').val()
        };

        $('#btnSearch').prop('disabled', true).text('Searching...');

        $.ajax({
            url: 'SearchResultsController',
            type: 'GET',
            data: params,
            dataType: 'json',
            success: function (resp) {
                var gridData = [];
                if (resp.rows) {
                    $.each(resp.rows, function (i, row) {
                        gridData.push({
                            assetType:          row.cell[0],
                            make:               row.cell[1],
                            processorDetails:   row.cell[2],
                            memoryDetails:      row.cell[3],
                            storageDetails:     row.cell[4],
                            otherHwDetails:     row.cell[5],
                            operatingSystem:    row.cell[6],
                            serialNumber:       row.cell[7],
                            invoiceNumber:      row.cell[8],
                            invoiceDate:        row.cell[9],
                            invoiceStoragePath: row.cell[10],
                            warrantyExpiryDate: row.cell[11]
                        });
                    });
                }
                $("#assetGrid").clearGridData().setGridParam({data: gridData}).trigger("reloadGrid");
                $('#btnSearch').prop('disabled', false).text('Search');
            },
            error: function () {
                alert('Search failed. Please try again.');
                $('#btnSearch').prop('disabled', false).text('Search');
            }
        });
    });

    // Clear button
    $('#btnClear').click(function () {
        $('#s_assetType, #s_operatingSystem, #s_currentStatus, #s_assetLocation').val('');
        $('#s_memoryDetails, #s_hwAssetId, #s_serialNumber').val('');
        $('#s_assignedTo, #s_sparesAssetId, #s_remarks').val('');
        $("#assetGrid").clearGridData();
    });
});
</script>
</body>
</html>