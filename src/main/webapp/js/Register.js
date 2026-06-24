$(document).ready(function () {

    $("#btnRegister").click(function () {

        $(".error-msg").text("");
        $("#registerMessage").text("");

        var valid = true;

        var fullName = $.trim($("#fullName").val());
        var userName = $.trim($("#userName").val());
        var email = $.trim($("#email").val());
        var password = $("#password").val();
        var confirmPassword = $("#confirmPassword").val();
        var gender = $("input[name='gender']:checked").val();

        if (fullName === "") {
            $("#err-fullName").text("Full Name is required.");
            valid = false;
        }

        if (userName === "") {
            $("#err-userName").text("Username is required.");
            valid = false;
        }

        if (
            email === "" ||
            !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)
        ) {
            $("#err-email").text("Valid Email is required.");
            valid = false;
        }

        if (password.length < 8) {
            $("#err-password")
                .text("Password must be at least 8 characters.");
            valid = false;
        }
        else if (
            !/[0-9]/.test(password) ||
            !/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)
        ) {
            $("#err-password")
                .text("Password must contain a number and special character.");
            valid = false;
        }

        if (confirmPassword === "") {
            $("#err-confirmPassword")
                .text("Confirm Password is required.");
            valid = false;
        }
        else if (password !== confirmPassword) {
            $("#err-confirmPassword")
                .text("Passwords do not match.");
            valid = false;
        }

        if (!valid) {
            return;
        }

        $("#btnRegister")
            .prop("disabled", true)
            .text("Registering...");

        $.ajax({
            url: "RegisterController",
            type: "POST",
            data: {
                fullName: fullName,
                userName: userName,
                email: email,
                password: password,
                gender: gender
            },
            dataType: "json",

            success: function (resp) {

                if (resp.status === "SUCCESS") {

                    $("#registerMessage")
                        .removeClass("msg-error")
                        .addClass("msg-success")
                        .text(resp.message +
                              " Redirecting to Login...");

                    setTimeout(function () {
                        window.location.href = "Login.jsp";
                    }, 2000);

                } else {

                    $("#registerMessage")
                        .removeClass("msg-success")
                        .addClass("msg-error")
                        .text(resp.message);

                    $("#btnRegister")
                        .prop("disabled", false)
                        .text("Register");
                }
            },

            error: function () {

                $("#registerMessage")
                    .removeClass("msg-success")
                    .addClass("msg-error")
                    .text("Server error. Please try again.");

                $("#btnRegister")
                    .prop("disabled", false)
                    .text("Register");
            }
        });

    });

});