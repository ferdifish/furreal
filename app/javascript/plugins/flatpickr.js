import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!

flatpickr(".datepicker", {})

var dateToday = new Date();
$(function() {
    $( "#datepicker" ).datepicker({
        numberOfMonths: 3,
        showButtonPanel: true,
        minDate: dateToday
    });
});
