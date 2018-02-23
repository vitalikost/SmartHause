document.addEventListener("turbolinks:load", function() {
    // ...

var labels = $('#chart-data').data('labels');
var values1 = $('#chart-data').data('values1');
var label1 = $('#chart-data').data('label1');
var values2 = $('#chart-data').data('values2');
var label2 = $('#chart-data').data('label2');

$('#sensor_values').paginate({ limit: 10 });

if (labels != null) {


    setInterval(function() {location.reload()}, 1000*60*5);

    new Chart(document.getElementById("line-chart1"), {
        type: 'line',
        data: {
            // labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
            labels: labels,
            datasets: [{
                // data: [1,2,3],
                data: values1,
                // label: "Africa",
                label: label1,

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

    new Chart(document.getElementById("line-chart2"), {
        type: 'line',
        data: {
            // labels: [1500,1600,1700,1750,1800,1850,1900,1950,1999,2050],
            labels: labels,
            datasets: [{
                // data: [1,2,3],
                data: values2,
                // label: "Africa",
                label: label2,

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