document.querySelector('.roulette').addEventListener('click', function() {
    const roulette = this;
    const degrees = Math.floor(Math.random() * 360) + 360 * 5; 
    roulette.style.transition = 'transform 5s ease-out';
    roulette.style.transform = `rotate(${degrees}deg)`;

 
    setTimeout(() => {
        roulette.style.transition = 'none';
        roulette.style.transform = `rotate(${degrees % 360}deg)`; 
    }, 5000);
});

