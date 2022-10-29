$(document).ready(function () {

    addEvent();
    addShoeSizeEvent();

    $("#btn-add-size-quantity").click(function () {
        const shoeColorId = $("#Id").val();
        const sizeId = $("#size-select").val();
        const quantity = $("#size-quantity").val();
        const data = {
            Id: 0,
            Quantity: quantity,
            ShoeColorId: shoeColorId,
            SizeId: sizeId
        };
        console.log(data)
        
        if (sizeId == null) {
            // alert('No more size to add!')
            return;
        }
        
        $.ajax({
            url: "/api/ShoeSizesApi",
            type: "post",
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (data) {
                loadShoeSizesList(data);
                addShoeSizeEvent();
            }
        });
    });

    //done
    $("input#upload-images").change(function () {
        var input = this;
        var placeToInsertImagePreview = $("div.gallery").empty();
        if (input.files) {
            var filesAmount = input.files.length;

            if (filesAmount === 0) {
                $("#model-upload-image .modal-footer").addClass("d-none");
            } else {
                $("#model-upload-image .modal-footer").removeClass("d-none");
            }

            for (i = 0; i < filesAmount; i++) {
                var reader = new FileReader();

                reader.onload = function (event) {
                    $($.parseHTML('<img>'))
                        .attr('src', event.target.result)
                        .appendTo(placeToInsertImagePreview);
                }

                reader.readAsDataURL(input.files[i]);
            }
        }
    });

    //done
    $('#uploadImagesButton').on('click', function () {
        $("div.gallery").empty();
        $("#model-upload-image .modal-footer").addClass("d-none");
        var files = $('#upload-images').prop('files');
        var formData = new FormData();
        for (let i = 0; i < files.length; i++) {
            formData.append(`files`, files[i]);
        }

        let id = $("#Id").val();
        $.ajax({
            url: `/api/Images?shoeColorId=${id}`,
            cache: false,
            contentType: false,
            processData: false,
            data: formData,
            type: 'post',
            success: function (data) {
                $('#upload-images').val('');
                loadThumbnailList(data);
                addEvent();
            }
        });
    });

});

//done
function loadThumbnailList(imageList, index = undefined) {
    const carouselMain = $("[class^='carousel carousel-main']").flickity('destroy');
    const carouselNav = $("[class^='carousel carousel-nav']").flickity('destroy');
    carouselMain.empty();
    carouselNav.empty();

    let count = 0;

    for (image of imageList) {
        count++;

        carouselMain.append(`
            <div class="carousel-cell" data-id="${image.id}">
                <img src="${image.path}" data-id="${image.id}" alt="thumbnail-small" />
            </div>
        `)

        carouselNav.append(`
            <div class="carousel-cell thumbnail-small " data-id="${image.id}" data-sortOrder="${count}">
                <img src="${image.path}" data-id=${image.id}" class="img-fluid" alt="thumbnail-small" />
                <div class="screen-blur"></div>
                <div class="sort-options">
                    <div class="delete">
                        <i class="fa-solid fa-trash"></i>
                    </div>
                    <div class="sort-order">
                        <select name="SortOrder"></select>
                    </div>
                </div>
            </div>
        `)
    }

    carouselMain.flickity(
        {"prevNextButtons": true, "pageDots": false}
    );

    console.log(index)


    if (index !== undefined) {
        index = Number.parseInt(index);
    }

    if (!isNaN(index) && index > 0 && index < count)
        carouselMain.flickity('selectCell', index);
    else
        carouselMain.flickity('selectCell', count - 1);

    carouselNav.flickity(
        {"asNavFor": ".carousel-main", "contain": true, "pageDots": false, "prevNextButtons": false}
    );

}

function addEvent() {

    $("#add-size").click(function (e) {
        $("#size-select").empty();
        var shoeColorId = $("#Id").val();
        $.ajax({
            type: "get",
            url: `/api/SizesApi/insertSize?shoeColorId=${shoeColorId}`,
            success: function (sizes) {
                for (const size of sizes) {
                    $("#size-select").append(`<option value="${size.id}">${size.unit} ${size.value}</option>`);
                }
            }
        });
    });

    $("div.thumbnail-small .sort-order select")
        .click(function (event) {
            $(this).empty();
            var length = $(".thumbnail-small").length;
            var index = $(this).closest(".thumbnail-small").index();

            for (var i = 0; i < length; i++) {
                let option;
                var num = i + 1;
                if (i === index) {
                    option = $(`<option selected value="${num}">${num}</option>`);
                } else {
                    option = $(`<option value="${num}">${num}</option>`);
                }
                $(this).append(option);
            }
        })
        .change(function () {
            var parent = $(this).closest("[class^='carousel-cell thumbnail-small']");
            var id = parent.attr("data-id");
            var sortOrderNew = $(this).val();
            var data = {
                // Id: id,
                // Path: "ok",
                // SortOrder: sortOrderNew,
                // p: 9
            };

            console.log({id, sortOrderNew})

            $.ajax({
                url: `/api/Images/sortOrder/${id}?sortOrder=${sortOrderNew}`,
                type: "PUT",
                contentType: 'application/json',
                // data: JSON.stringify(data),
                success: function (data) {
                    console.log(data);
                    loadThumbnailList(data, sortOrderNew - 1);
                    addEvent();
                },
            });
        });

    $(".thumbnail-small .delete")
        .css({cursor: 'pointer', color: 'red'})
        .click(function (event) {
            event.stopPropagation();
            const thumbnail = $(this).closest("[class^='carousel-cell thumbnail-small']");
            const currentOrder = thumbnail.attr("data-sortorder");
            const id = thumbnail.attr("data-id");
            $.ajax({
                url: `/api/Images/${id}`,
                type: "delete",
                success: function (data) {
                    loadThumbnailList(data, currentOrder - 1);
                    addEvent();
                }
            });
        });

}

// Edit Size


function loadShoeSizesList(data) {
    const sizeList = $(".size-list tbody");
    sizeList.empty();
    for (const shoeSize of data) {
        sizeList.append(`
          <tr data-id="${shoeSize.id}">
              <td class="col-auto">${shoeSize.size.value}</td>
              <td class="col-auto">${shoeSize.quantity}</td>
              <td>
                  <button class="btn-option edit-size" data-bs-toggle="modal"
                                data-bs-target="#modal-shoeSize-update">
                    <i class="fa-regular fa-pen-to-square"></i>
                  </button>
                  <button class="btn-option delete-size">
                    <i class="fa-solid fa-trash"></i>
                  </button>
              </td>
          </tr>
      `)
    }
}


function addShoeSizeEvent() {

    $(".delete-size").click(function () {
        const shoeSizeId = $(this).parent().parent().attr("data-id");
        $.ajax({
            url: `/api/ShoeSizesApi/${shoeSizeId}`,
            type: "delete",
            success: function (data) {
                loadShoeSizesList(data)
                addShoeSizeEvent();
            }
        });
    });

    $(".edit-size").click(function () {
        const shoeSize = $(this).parent().parent();
        const shoeSizeId = shoeSize.attr("data-id");
        const shoeSizeValue = shoeSize.children("td").eq(0).text();
        const shoeSizeQuantity = shoeSize.children("td").eq(1).text();

        $("#size-select-update").empty()
            .attr("data-shoeSize-id", shoeSizeId)
            .append(`<option selected>${shoeSizeValue}</option>`);
        $("#size-quantity-update").val(shoeSizeQuantity);
    });

    $("#btn-update-size-quantity").click(function () {
        const shoeSizeId = $("#size-select-update").attr("data-shoeSize-id");
        const quantity = $("#size-quantity-update").val();
        const data = {
            Id: shoeSizeId,
            Quantity: quantity,
            ShoeColorId: 0,
            SizeId: 0
        };
        $.ajax({
            url: `/api/ShoeSizesApi/${shoeSizeId}`,
            type: "put",
            contentType: 'application/json',
            data: JSON.stringify(data),
            success: function (data) {
                loadShoeSizesList(data);
                addShoeSizeEvent();
            }
        });
    });
}