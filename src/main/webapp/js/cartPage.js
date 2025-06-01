$(document).ready(function () {

    $(".custom_input--btn-group__btn").on("click", function () {
        const couponCode = $(".couponValue").val();
        const cartReceived = $("#cart_received").text()
        $(".custom_insert").remove(".custom_alert")
        if (couponCode === "") {
            $(".custom_insert").append("<p class='text-danger custom_alert w-100'>Chưa nhập coupon</p>")
            return;
        } else if (cartReceived === "0") {
            $(".custom_insert").append("<p class='text-danger custom_alert w-100'>Chưa có sản phẩm</p>")
            return;

        } else {
            $.ajax({
                url: `/coupon?code=${couponCode}`,
                type: "GET",
                data: {
                    couponCode: couponCode,
                    message: `getCoupon`,
                },
                success(responseData) {
                    const data = responseData;
                    $(".totalCostDisplay").text((data.grandTotal) + " VNĐ");
                },
                error(responseData) {
                    $(".custom_input_group").append("<p class='text-danger custom_alert w-100'>Coupon không tồn tại</p>")

                }
            })
        }
    })
    $(".remove_button").on("click", function () {
        const $this = $(this);
        const beltId = $(this).closest(".custom_remove").find(".beltId").val();
        $.ajax({
            url: `/Cart`,
            method: "POST",
            data: {
                message: `remove`,
                beltId: beltId,
            },
            success(responseData) {
                const data = responseData;
                $this.closest(".custom_remove").fadeOut(300, function () {
                    $(this).remove();
                });
                $(".totalOrdersCountDisplay").text(`Tổng [${data.cartSize} đơn hàng]`);
                $(".totalOrdersDisplayBelts").text(`${data.cartSize} sản phẩm`);
                $(".totalPriceDisplay").text((data.totalPrice)+" VNĐ");
                $(".shipmentDisplay").text((data.shipmentPrice)+"VNĐ");
                $(".totalCostDisplay").text((data.grandTotal)+" VNĐ");
                const cartCount = parseInt($("#cart_received").text(), 10) - 1
                $("#cart_received").text(cartCount)
            },
            error(responseData) {
                console.log(responseData);
            }
        })
    })


    $(".quantitySelectCart").on("change", function () {
        const selectedQuantity = $(this).val();

        const beltId = $(this).closest(".custom_remove").find(".beltId").val();
        $.ajax({
            url: '/Cart',
            type: 'POST',
            data: {
                message: "update",
                beltId: beltId,
                quantity: selectedQuantity,
            },
            success: function (response) {
                console.log("Quantity updated successfully!");
                const data = response;
                $(".totalOrdersCountDisplay").text(`Tổng [${data.cartSize} đơn hàng]`);
                $(".totalOrdersDisplayBelts").text(`${data.cartSize} sản phẩm`);
                $(".totalPriceDisplay").text((data.totalPrice) + " VNĐ");
                $(".shipmentDisplay").text((data.shipmentPrice) + " VNĐ");
                $(".totalCostDisplay").text((data.grandTotal) + " VNĐ");
            },

            error: function (xhr, status, error) {
                console.error("Error while updating quantity:", error);
            }
        });
    });
});
