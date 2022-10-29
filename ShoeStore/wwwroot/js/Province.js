$(document).ready(function () {
    SetupCity();
});

$("#city").change(function () {
    SetupDistrict();
});

$("#district").change(function () {
    SetupWards();
});

function SetupCity() {
    const selectCity = $("#city");
    const selectedCity = selectCity.val();
    
    // alert(selectedCity)
    
    selectCity.empty()
        .append(`<option selected disabled>Select City...</option>`);

    $.ajax({
        type: "get",
        url: "https://provinces.open-api.vn/api/?depth=2",
        success: function (data) {
            const cities = data.sort((a, b) => a.name.localeCompare(b.name));
            $.each(cities, function (index, value) {
                var cityName = value.name.replace(/^Tỉnh\s*|^Thành phố\s*/i, "");
                if (cityName == selectedCity) {
                    selectCity.append(
                        `<option data-code="${value.code}" selected>${cityName}</option>`
                    );
                } else {
                    selectCity.append(
                        `<option data-code="${value.code}">${cityName}</option>`
                    );
                }
            });
            // selectCity.children("[data-code=1]").attr("selected", "selected");
            SetupDistrict();
        },
    });
}

function SetupDistrict() {
    let cityCode = $("#city option:selected").attr("data-code");

    const selectDistrict = $("#district");
    const selectedDistrict = selectDistrict.val();

    selectDistrict.empty()
        .append(`<option selected disabled>Select District...</option>`);
    
    if (cityCode != null) {
        $.ajax({
            type: "get",
            url: `https://provinces.open-api.vn/api/p/${cityCode}?depth=2`,
            success: function (data) {
                const districts = data.districts.sort((a, b) =>
                    a.name.localeCompare(b.name)
                );
                // console.log({districts});
                $.each(districts, function (index, value) {
                    if(value.name == selectedDistrict) {
                        selectDistrict.append(
                            `<option data-code="${value.code}" selected>${value.name}</option>`
                        );
                    }
                    else {
                        selectDistrict.append(
                            `<option data-code="${value.code}">${value.name}</option>`
                        );
                    }
                });
                SetupWards();
            },
        });
    } else {
        SetupWards();
    }
}

function SetupWards() {
    let districtCode = $("#district option:selected").attr("data-code");

    const selectWard = $("#ward");
    const selectedWard = selectWard.val();
    
    selectWard.empty()
        .append(`<option selected disabled>Select Ward...</option>`);
    
    if (districtCode != null) {
        $.ajax({
            type: "get",
            url: `https://provinces.open-api.vn/api/d/${districtCode}?depth=2`,
            success: function (data) {
                const wards = data.wards.sort((a, b) =>
                    a.name.localeCompare(b.name)
                );
                console.log({wards});
                $.each(wards, function (index, value) {
                    if(value.name == selectedWard) {
                        selectWard.append(
                            `<option data-code="${value.code}" selected>${value.name}</option>`
                        );
                    }
                    else {
                        selectWard.append(
                            `<option data-code="${value.code}">${value.name}</option>`
                        );
                    }
                });
            },
        });
    }
}