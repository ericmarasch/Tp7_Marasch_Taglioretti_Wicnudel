document.querySelector('.roulette').addEventListener('click', function() {
    const roulette = this;
    
    // Verifica si la animación ya está en curso para evitar múltiples clics
    if (roulette.classList.contains('spinning')) {
        return;
    }

    // Agrega una clase para evitar clics durante la animación
    roulette.classList.add('spinning');
    roulette.style.pointerEvents = 'none';

    const degrees = Math.floor(Math.random() * 360) + 360 * 5; 
    roulette.style.transition = 'transform 5s ease-out';
    roulette.style.transform = `rotate(${degrees}deg)`;

    // Reactiva los eventos del puntero después de que la animación haya terminado
    setTimeout(() => {
        roulette.style.transition = 'none';
        roulette.style.transform = `rotate(${degrees % 360}deg)`; 
        roulette.style.pointerEvents = 'auto'; // Vuelve a habilitar los eventos del puntero
        roulette.classList.remove('spinning');
    }, 5000); // Ajusta el tiempo si es necesario
});

