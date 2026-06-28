<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(session.getAttribute("loggedInUser") == null){
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asset Entry - AIMS</title>

<link rel="stylesheet" href="css/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>

<div class="page-wrapper">

    <div class="nav-bar">
        <span class="nav-brand">
            AIMS - Asset Inventory Management System
        </span>

        <span class="nav-user">
            Welcome,
            <%= session.getAttribute("fullName") %>
        </span>

        <a href="SearchResultsController"
           class="nav-link">
           Search
        </a>

        <a href="LogoutController"
           class="nav-link">
           Logout
        </a>
    </div>

    <div class="form-container wide">

        <h2 class="form-title">
            Asset Inventory Form
        </h2>

        <div class="form-group">
            <label>Asset Type *</label>

            <select id="assetType"
                    name="assetType">
                <option value="">-- Select --</option>
                <option>Laptop</option>
                <option>Desktop</option>
                <option>Server</option>
                <option>Printer</option>
                <option>Network Switch</option>
                <option>Other</option>
            </select>

            <span class="error-msg"
                  id="err-assetType"></span>
        </div>

        <div class="form-group">
            <label>Make</label>

            <input type="text"
                   id="make"
                   name="make"
                   placeholder="Dell, HP, Lenovo">
        </div>

        <div class="form-group">
            <label>Model</label>

            <input type="text"
                   id="model"
                   name="model"
                   placeholder="Model">
        </div>

        <div class="form-group">
            <label>Other Hardware Details</label>

            <input type="text"
                   id="otherHwDetails"
                   name="otherHwDetails"
                   placeholder="Other Hardware Details">
        </div>

        <div class="form-group">
            <label>Storage Details</label>

            <input type="text"
                   id="storageDetails"
                   name="storageDetails"
                   placeholder="512 GB SSD">
        </div>

        <div class="form-group">
            <label>Memory Details</label>

            <input type="text"
                   id="memoryDetails"
                   name="memoryDetails"
                   placeholder="16 GB DDR4">
        </div>

        <div class="form-group">
            <label>Processor Details</label>

            <input type="text"
                   id="processorDetails"
                   name="processorDetails"
                   placeholder="Intel Core i7">
        </div>

        <div class="form-group">
            <label>Current Status *</label>

            <select id="currentStatus"
                    name="currentStatus">
                <option value="">-- Select --</option>
                <option>In Use</option>
                <option>Available</option>
                <option>Under Repair</option>
                <option>Retired</option>
                <option>Spare</option>
            </select>

            <span class="error-msg"
                  id="err-currentStatus"></span>
        </div>

        <div class="form-group">
            <label>Hardware Asset ID *</label>

            <input type="text"
                   id="hwAssetId"
                   name="hwAssetId"
                   placeholder="Hardware Asset ID">

            <span class="error-msg"
                  id="err-hwAssetId"></span>
        </div>

        <div class="form-group">
            <label>Invoice Storage Path</label>

            <input type="text"
                   id="invoiceStoragePath"
                   name="invoiceStoragePath"
                   placeholder="/mnt/invoices/">
        </div>

        <div class="form-group">
            <label>Serial Number *</label>

            <input type="text"
                   id="serialNumber"
                   name="serialNumber"
                   placeholder="Serial Number">

            <span class="error-msg"
                  id="err-serialNumber"></span>
        </div>

        <div class="form-actions">

            <button type="button"
                    id="btnSubmit"
                    class="btn-primary">
                Submit
            </button>

            <button type="button"
                    id="btnReset"
                    class="btn-secondary">
                Reset
            </button>

        </div>

        <div id="entryMessage"
             class="msg-box"></div>

    </div>

</div>

<script src="js/Entryform.js"></script>

</body>
</html>