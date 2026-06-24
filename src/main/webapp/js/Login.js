$(document).ready(function () {

    $("#btnLogin").click(function () {

        $(".error-msg").text("");
        $("#loginMessage").text("");

        var userName = $.trim($("#userName").val());
        var password = $("#password").val();

        var valid = true;

        if (userName === "") {
            $("#err-userName").text("Username is required.");
            valid = false;
        }

        if (password === "") {
            $("#err-password").text("Password is required.");
            valid = false;
        }

        if (!valid) {
            return;
        }

        $("#btnLogin")
            .prop("disabled", true)
            .text("Logging in...");

        $.ajax({
            url: "LoginController",
            type: "POST",
            data: {
                userName: userName,
                password: password
            },
            dataType: "json",

            success: function (resp) {

                if (resp.status === "SUCCESS") {

                    $("#loginMessage")
                        .removeClass("msg-error")
                        .addClass("msg-success")
                        .text(resp.message);

                    setTimeout(function () {
                        window.location.href = "SearchResults.jsp";
                    }, 1500);

                } else {

                    $("#loginMessage")
                        .removeClass("msg-success")
                        .addClass("msg-error")
                        .text(resp.message);

                    $("#btnLogin")
                        .prop("disabled", false)
                        .text("Login");
                }
            },

            error: function () {

                $("#loginMessage")
                    .removeClass("msg-success")
                    .addClass("msg-error")
                    .text("Server error. Please try again.");

                $("#btnLogin")
                    .prop("disabled", false)
                    .text("Login");
            }
        });

    });

});