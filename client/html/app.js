let charSex = null

$(document).ready(function() {
	window.addEventListener('message', function(event) {
		var YourRolePlay = event.data;
		if (YourRolePlay.flap_open == true) {
            flap_openCharCreatorNUI(true)
		} else if (YourRolePlay.flap_open == false) {
            flap_openCharCreatorNUI(false)
        }

	});

    $(".flap_rotation_left").click(function() {
        $.post('http://flap_character_creation/character_rotation', JSON.stringify({
            rotationType: "left"
        }));
    });

    $(".flap_rotation_right").click(function() {
        $.post('http://flap_character_creation/character_rotation', JSON.stringify({
            rotationType: "right"
        }));
    });

    $("#create-button").click(function() {
        let firstName = $(".first_name").val()
        let lastNameName = $(".last_name").val()
        let birthday = $("#date").val()

        if (firstName !== "") {
            if (lastNameName !== "") {
                $.post('http://flap_character_creation/saveAndClose', JSON.stringify({
                    firstName: firstName,
                    lastName: lastNameName,
                    birthday: birthday,
                    sex: charSex
                }));
            }
        }
    });
})

function flap_openCharCreatorNUI(enable) {
	if (enable) {
	    $('body').css('display', 'block');
	} else {
	    $('body').css('display', 'none');
	}
}

// cards and rotating
const cards = document.querySelector(".cards");
const images = document.querySelectorAll(".card__img");
const backgrounds = document.querySelectorAll(".card__bg");
const range = 6;

const calcValue = (a, b) => (a/b*range-range/2).toFixed(1) 

let timeout;
document.addEventListener('mousemove', ({x, y}) => {
  if (timeout) {
    window.cancelAnimationFrame(timeout);
  }
  	
  timeout = window.requestAnimationFrame(() => {
    const yValue = calcValue(y, window.innerHeight);
    const xValue = calcValue(x, window.innerWidth);

    cards.style.transform = `rotateX(${yValue}deg) rotateY(${xValue}deg)`;

    [].forEach.call(images, (image) => {
      image.style.transform = `translateX(${-xValue}px) translateY(${yValue}px)`;
    });

    [].forEach.call(backgrounds, (background) => {
      background.style.backgroundPosition = `${xValue*.45}px ${-yValue*.45}px`;
    })
	})
}, false);



// sliders 
function rangeSlider() {
  let slider = document.querySelectorAll(".range-slider");
  let range = document.querySelectorAll(".range-slider__range");
  let value = document.querySelectorAll(".range-slider__value");

  slider.forEach((currentSlider) => {
    value.forEach((currentValue) => {
      let val = currentValue.previousElementSibling.getAttribute("value");
      currentValue.innerText = val;
    });

    range.forEach((elem) => {
      elem.addEventListener("input", (eventArgs) => {
        elem.nextElementSibling.innerText = eventArgs.target.value;
      });
    });
  });
}
rangeSlider();

$(document).ready(function () {

  $('.tablinks').click(function(){
    var index = $(this).attr('data-index');
    $('.page').hide();
    $('section[data-index="'+index+'"]').show();
});

$('.tablinks').click(function() {
  $(".tablinks").removeClass("active");
  $(this).addClass("active");
});

});

$('#date').val(new Date().toJSON().slice(0,10));



// funkce na měnění charakteru

function changeCharacterAppereance(input, name) {
    let inputValue = $("#" + input).val()
    let result = Math.round(inputValue * 10) / 10;

    $.post('http://flap_character_creation/changeCharacterValue', JSON.stringify({
        result: result,
        name: name
    }));
}

function changeColor(color, name) {

    $.post('http://flap_character_creation/changeColor', JSON.stringify({
        color: color,
        name: name
    }));

}

function setSex(sex) {
    charSex = sex
}

// funkce na měnění kamer

function changeCam(type) {
    $.post('http://flap_character_creation/changeCam', JSON.stringify({
        type: type
    }));
}