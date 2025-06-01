$(document).ready(function () {
    var ctx = document.getElementById("myPieChart");
    var myPieChart = new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: [],
            datasets: [{
                data: [],
                backgroundColor: ['#333333', '#555555', '#777777', '#999999', '#BBBBBB'],
                hoverBackgroundColor: ['#444444', '#666666', '#888888', '#AAAAAA', '#CCCCCC'],
                hoverBorderColor: "rgba(255, 255, 255, 1)",
            }],
        },
        options: {
            maintainAspectRatio: false,
            tooltips: {
                backgroundColor: "rgb(255,255,255)",
                bodyFontColor: "#333333",
                borderColor: '#dddfeb',
                borderWidth: 1,
                xPadding: 15,
                yPadding: 15,
                displayColors: false,
                caretPadding: 10,
            },
            legend: {
                display: false
            },
            cutoutPercentage: 80,
        },
    });

    $.ajax({
        url: '/chart-pie',
        method: 'GET',
        dataType: 'json',
        success: function (response) {
            const labels = response.labels;
            const chartData = response.data;
            myPieChart.data.labels = labels;
            myPieChart.data.datasets[0].data = chartData;
            myPieChart.update();
            let legendHTML = '';
            labels.forEach((label, index) => {
                legendHTML += `
            <span class="mr-2">
                ${label}
            </span>
        `;
            });
            document.querySelector('.mt-4.text-center.small').innerHTML = legendHTML;
        },
        error: function (xhr, status, error) {
            console.error("Có lỗi xảy ra khi lấy dữ liệu: ", error);
        }
    });
});
