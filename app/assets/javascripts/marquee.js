 $(document).ready(function(){
    var div = document.getElementById('log');
    var texto = 'Encontre o seu coach.....';

    function escrever(str, el) {
        var char = str.split('').reverse();
        var typer = setInterval(function () {
            if (!char.length) return clearInterval(typer);
            var next = char.pop();
            el.innerHTML += next;
        }, 100);
    }
    escrever(texto, div);
 });
