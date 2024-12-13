
$(document).ready(function() {

    window.addEventListener('message', function(event) {
        let action = event.data.action;

        if (action === 'updateHud') {
            updateStats('.health', event.data.health)
            updateStats('.hunger', event.data.hunger)
            updateStats('.thirst', event.data.thirst)
            if (event.data.talking === true){
              updateStats('.voice', event.data.voice, "#c26da5")
            }else{
              updateStats('.voice', event.data.voice)
            }

        }else if (action === 'toggleProgbar'){
            startProgressBar(event.data.duration, event.data.title)
        }else if (action === 'toggleHud'){
            toogleHud(event.data.toggle)
        }
    });

  function updateStats(stats, value, color = "#E582C4"){
    $(stats).css('background', `linear-gradient(180deg, #191C21 0%, #120D14  ${100 - value}%, ${color} ${100 - value}%, ${color} 100%)`);
  }

  function startProgressBar(duration, title) {
    $(".progbar-container").animate({right: '0vw'}, 500);
    $(".title").text(title)
    let progressBar = document.querySelector(".fill");
    let progress = 100;
    let interval = 10;
  
    progressBarTimer = setInterval(function() {
      if (progress <= 0) {
        clearInterval(progressBarTimer);
        $(".progbar-container").animate({right: '-20vw'}, 500);
      } else {
        progress -= (interval / duration) * 100;
        progressBar.style.width = Math.max(progress, 0) + "%";
    
      }
    }, interval);
  }

  function toogleHud(toggle) {
    if(toggle == true){
        $(".container").animate({right: '0vw'}, 500);
    }else{
        $(".container").animate({right: '-20vw'}, 500);
    }

  }

});

