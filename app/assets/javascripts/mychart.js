document.addEventListener("turbolinks:load", function() {
    // ...

var labels = $('#chart-data').data('labels');
var values = $('#chart-data').data('values');
var label = $('#chart-data').data('label');
if (labels != null) {


    setInterval(function() {location.reload()}, 1000*60*5);

    new Chart(document.getElementById("line-chart"), {
        type: 'line',
        data: {
            // labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
            labels: labels,
            datasets: [{
                // data: [1,2,3],
                data: values,
                // label: "Africa",
                label: label,

                borderColor: "#3e95cd",
                fill: false
            }

            ]
        },
        options: {
            title: {
                display: true,
                text: 'Показники:'
            }
        }
    });

}


})