var introTl = anime.timeline({
    easing: 'easeOutQuart',
    loop: false,
  });
  introTl
  .add({
    begin: function(){
      const IntroLogo = document.getElementById('intro-logo');
      IntroLogo.classList.add('active');
    }
  })
  .add({
    targets: '#intro, #intro .intro-logo',
    duration: 1000,
    opacity:0,
    delay: 2000,
    complete: function() {
      const IntroSection = document.getElementById('intro');
      IntroSection.classList.add('off');
    }
  });