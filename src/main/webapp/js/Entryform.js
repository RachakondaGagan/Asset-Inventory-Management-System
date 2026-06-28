$(document).ready(function () {

    $("#btnSubmit").click(function () {

        $(".error-msg").text("");
        $("#entryMessage")
            .text("")
            .removeClass("msg-success msg-error");

        var valid = true;

        var assetType =
            $("#assetType").val();

        var currentStatus =
            $("#currentStatus").val();

        var hwAssetId =
            $.trim($("#hwAssetId").val());

        var serialNumber =
            $.trim($("#serialNumber").val());

        if (assetType === "") {
            $("#err-assetType")
                .text("Asset Type is required.");
            valid = false;
        }

        if (currentStatus === "") {
            $("#err-currentStatus")
                .text("Current Status is required.");
            valid = false;
        }

        if (hwAssetId === "") {
            $("#err-hwAssetId")
                .text("Hardware Asset ID is required.");
            valid = false;
        }

        if (serialNumber === "") {
            $("#err-serialNumber")
                .text("Serial Number is required.");
            valid = false;
        }

        if (!valid) {
            return;
        }

        $("#btnSubmit")
            .prop("disabled", true)
            .text("Saving...");

        $.ajax({

            url: "EntryformController",
            type: "POST",

            data: {

                assetType:
                    assetType,

                make:
                    $.trim($("#make").val()),

                model:
                    $.trim($("#model").val()),

                otherHwDetails:
                    $.trim($("#otherHwDetails").val()),

                storageDetails:
                    $.trim($("#storageDetails").val()),

                memoryDetails:
                    $.trim($("#memoryDetails").val()),

                processorDetails:
                    $.trim($("#processorDetails").val()),

                currentStatus:
                    currentStatus,

                hwAssetId:
                    hwAssetId,

                invoiceStoragePath:
                    $.trim($("#invoiceStoragePath").val()),

                serialNumber:
                    serialNumber
            },

            dataType: "json",

            success: function (resp) {

                if (resp.status === "SUCCESS") {

                    $("#entryMessage")
                        .addClass("msg-success")
                        .text(resp.message);

                    $("#btnReset").click();
                }
                else {

                    $("#entryMessage")
                        .addClass("msg-error")
                        .text(resp.message);
                }

                $("#btnSubmit")
                    .prop("disabled", false)
                    .text("Submit");
            },

            error: function () {

                $("#entryMessage")
                    .addClass("msg-error")
                    .text("Server error. Please try again.");

                $("#btnSubmit")
                    .prop("disabled", false)
                    .text("Submit");
            }
        });

    });

    $("#btnReset").click(function () {

        $("input[type=text]").val("");
        $("select").val("");

        $(".error-msg").text("");

        $("#entryMessage")
            .text("")
            .removeClass("msg-success msg-error");
    });

});