$(document).ready(function () {
    $('#wagon_type').change(function () {

        console.log($(this).val());


        if ($(this).val() === "CoupeWagon") {
            $(".up_seats").fadeIn('fast');
            $(".down_seats").fadeIn('fast');
        } else {
            $(".up_seats").fadeOut('fast');
            $(".down_seats").fadeOut('fast');
        }

        if ($(this).val() === "PlackartWagon") {
            $(".up_seats").fadeIn('fast');
            $(".down_seats").fadeIn('fast');
            $(".side_down_seats").fadeIn('fast');
            $(".side_up_seats").fadeIn('fast');
        } else {
            // $(".up_seats").fadeOut('fast');
            // $(".down_seats").fadeOut('fast');
            $(".side_down_seats").fadeOut('fast');
            $(".side_up_seats").fadeOut('fast');
        }

        if ($(this).val() === "SitWagon" || $(this).val() === "SvWagon") {
            $(".sit_seats").fadeIn('fast');
        } else {
            $(".sit_seats").fadeOut('fast');
        }

    });
});