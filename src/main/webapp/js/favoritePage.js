$(document).ready(function () {
    $(".remove-btn").on('click', function () {
        const $this = $(this);
        const beltId = $(this).closest(".tr-favorite").find(".beltId").val();
        const userId = $(this).closest(".tr-favorite").find(".userId").val();
        $.ajax({
            url: `/favorite`,
            type: "POST",
            data: {
                userId: userId,
                beltId: beltId,
                message: "removeFavorite"
            },
            success: function () {
                console.log("Favorite added successfully.");
                $this.closest(".tr-favorite").fadeOut(300, function () {
                    $(this).remove();
                });
                const favoriteCount = parseInt($("#favorite_receive").text(), 10) - 1
                $("#favorite_receive").text(favoriteCount)
            },
            error: function (xhr) {
            }
        })
    })
})
