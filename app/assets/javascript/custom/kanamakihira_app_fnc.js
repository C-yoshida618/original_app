// モジュールのインポート
import { anotherFunction } from "./another_file.js";

// タイムラインアニメーションの設定
window.addEventListener("turbo:load", function() {
  var introTl = anime.timeline({
    easing: 'easeOutQuart',
    loop: false,
  });

  introTl
    .add({
      begin: function() {
        const IntroLogo = document.getElementById('intro-logo');
        IntroLogo.classList.add('active');
      }
    })
    .add({
      targets: '#intro, #intro .intro-logo',
      duration: 1000,
      opacity: 0,
      delay: 2000,
      complete: function() {
        const IntroSection = document.getElementById('intro');
        IntroSection.classList.add('off');
      }
    });

  var logoAnimC1 = anime.timeline({
    duration: 500,
    loop: true
  });
  logoAnimC1
    .add({
      targets: '#c1-1',
      fill: '#ff9316',
    })
    .add({
      targets: '#c1-2',
      fill: '#e0da92',
    })
    .add({
      targets: '#c1-1',
      fill: '#788fac',
    })
    .add({
      targets: '#c1-2',
      fill: '#a37b4d',
    })
    .add({
      targets: '#c1-1',
      fill: '#788fac',
    })
    .add({
      targets: '#c1-2',
      fill: '#ff5117',
    });

  var logoAnimY = anime.timeline({
    duration: 500,
    delay: 100,
    loop: true
  });
  logoAnimY
    .add({
      targets: '#y-4',
      fill: '#ff9316',
    })
    .add({
      targets: '#y-3',
      fill: '#e0da92',
    })
    .add({
      targets: '#y-2',
      fill: '#788fac',
    })
    .add({
      targets: '#y-1',
      fill: '#a37b4d',
    })
    .add({
      targets: '#y-4',
      fill: '#788fac',
    })
    .add({
      targets: '#y-3',
      fill: '#ff5117',
    })
    .add({
      targets: '#y-2',
      fill: '#58f195',
    })
    .add({
      targets: '#y-1',
      fill: '#788fac',
    })
    .add({
      targets: '#y-1',
      fill: '#a37b4d',
    })
    .add({
      targets: '#y-4',
      fill: '#e0da92',
    })
    .add({
      targets: '#y-3',
      fill: '#58f195',
    })
    .add({
      targets: '#y-2',
      fill: '#e0da92',
    })
    .add({
      targets: '#y-1',
      fill: '#a37b4d',
    });

  var logoAnimC2 = anime.timeline({
    duration: 500,
    loop: true
  });
  logoAnimC2
    .add({
      targets: '#c2-1',
      fill: '#ff9316',
    }, '-=600')
    .add({
      targets: '#c2-2',
      fill: '#e0da92',
    })
    .add({
      targets: '#c2-1',
      fill: '#788fac',
    }, '-=400')
    .add({
      targets: '#c2-2',
      fill: '#a37b4d',
    })
    .add({
      targets: '#c2-1',
      fill: '#e0da92',
    })
    .add({
      targets: '#c2-2',
      fill: '#e0da92',
    }, 400);

  var logoAnimP1 = anime.timeline({
    duration: 500,
    delay: 100,
    loop: true
  });
  logoAnimP1
    .add({
      targets: '#p1-1',
      fill: '#e0da92',
    })
    .add({
      targets: '#p1-2',
      fill: '#e0da92',
    })
    .add({
      targets: '#p1-1',
      fill: '#788fac',
    })
    .add({
      targets: '#p1-2',
      fill: '#ff5117',
    })
    .add({
      targets: '#p1-1',
      fill: '#ff9316',
    }, '-=200')
    .add({
      targets: '#p1-2',
      fill: '#788fac',
    });

  var logoAnimP2 = anime.timeline({
    duration: 500,
    loop: true
  });
  logoAnimP2
    .add({
      targets: '#p2-1',
      fill: '#ff9316',
    }, '-=300')
    .add({
      targets: '#p2-2',
      fill: '#e0da92',
    })
    .add({
      targets: '#p2-1',
      fill: '#788fac',
    })
    .add({
      targets: '#p2-2',
      fill: '#a37b4d',
    })
    .add({
      targets: '#p2-1',
      fill: '#a37b4d',
    })
    .add({
      targets: '#p2-2',
      fill: '#58f195',
    }, '-=600');

  // モジュールの使用
  anotherFunction();
});
