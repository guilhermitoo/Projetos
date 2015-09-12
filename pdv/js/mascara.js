function formataMascara(campo, evt, formato) {
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    var result = "";
    var maskIdx = formato.length - 1;
    var error = false;
    var valor = campo.value;
    var posFinal = false;
    if (campo.setSelectionRange) {
        if (campo.selectionStart == valor.length) posFinal = true;
    }
    valor = valor.replace(/[^0123456789Xx]/g, '');
    for (var valIdx = valor.length - 1; valIdx >= 0 && maskIdx >= 0; --maskIdx) {
        var chr = valor.charAt(valIdx);
        var chrMask = formato.charAt(maskIdx);
        switch (chrMask) {
            case '#':
                if (!(/\d/.test(chr))) error = true;
                result = chr + result;
                --valIdx;
                break;
            case '@':
                result = chr + result;
                --valIdx;
                break;
            default:
                result = chrMask + result;
        }
    }
    campo.value = result;
    campo.style.color = error ? 'red' : '';
    if (posFinal) {
        campo.selectionStart = result.length;
        campo.selectionEnd = result.length;
    }
    return result;
}

function formataValor(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    if (vr.length > 0) {
        vr = parseFloat(vr.toString()).toString();
        tam = vr.length;
        if (tam == 1) campo.value = "0,0" + vr;
        if (tam == 2) campo.value = "0," + vr;
        if ((tam > 2) && (tam <= 5)) {
            campo.value = vr.substr(0, tam - 2) + ',' + vr.substr(tam - 2, tam);
        }
        if ((tam >= 6) && (tam <= 8)) {
            campo.value = vr.substr(0, tam - 5) + '.' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
        if ((tam >= 9) && (tam <= 11)) {
            campo.value = vr.substr(0, tam - 8) + '.' + vr.substr(tam - 8, 3) + '.' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
        if ((tam >= 12) && (tam <= 14)) {
            campo.value = vr.substr(0, tam - 11) + '.' + vr.substr(tam - 11, 3) + '.' + vr.substr(tam - 8, 3) + '.' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
        if ((tam >= 15) && (tam <= 18)) {
            campo.value = vr.substr(0, tam - 14) + '.' + vr.substr(tam - 14, 3) + '.' + vr.substr(tam - 11, 3) + '.' + vr.substr(tam - 8, 3) + '.' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
        }
    }
    MovimentaCursor(campo, xPos);
}

function formataData(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    tam = vr.length;
    if (tam >= 2 && tam < 4) campo.value = vr.substr(0, 2) + '/' + vr.substr(2);
    if (tam == 4) campo.value = vr.substr(0, 2) + '/' + vr.substr(2, 2) + '/';
    if (tam > 4) campo.value = vr.substr(0, 2) + '/' + vr.substr(2, 2) + '/' + vr.substr(4);
    MovimentaCursor(campo, xPos);
}

function PosicaoCursor(textarea) {
    var pos = 0;
    if (typeof(document.selection) != 'undefined') {
        var range = document.selection.createRange();
        var i = 0;
        for (i = textarea.value.length; i > 0; i--) {
            if (range.moveStart('character', 1) == 0) break;
        }
        pos = i;
    }
    if (typeof(textarea.selectionStart) != 'undefined') {
        pos = textarea.selectionStart;
    }
    if (pos == textarea.value.length) return 0;
    else return pos;
}

function MovimentaCursor(textarea, pos) {
    if (pos <= 0) return;
    if (typeof(document.selection) != 'undefined') {
        var oRange = textarea.createTextRange();
        var LENGTH = 1;
        var STARTINDEX = pos;
        oRange.moveStart("character", -textarea.value.length);
        oRange.moveEnd("character", -textarea.value.length);
        oRange.moveStart("character", pos);
        oRange.select();
        textarea.focus();
    }
    if (typeof(textarea.selectionStart) != 'undefined') {
        textarea.selectionStart = pos;
        textarea.selectionEnd = pos;
    }
}

function formataDataeHora(campo, evt) {
    xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    tam = vr.length;
    if (tam >= 2 && tam < 4) campo.value = vr.substr(0, 2) + '/' + vr.substr(2);
    if (tam == 4) campo.value = vr.substr(0, 2) + '/' + vr.substr(2, 2) + '/';
    if (tam > 4) campo.value = vr.substr(0, 2) + '/' + vr.substr(2, 2) + '/' + vr.substr(4);
    if (tam > 8 && tam < 11) campo.value = vr.substr(0, 2) + '/' + vr.substr(2, 2) + '/' + vr.substr(4, 4) + ' ' + vr.substr(8, 2);
    if (tam >= 11) campo.value = vr.substr(0, 2) + '/' + vr.substr(2, 2) + '/' + vr.substr(4, 4) + ' ' + vr.substr(8, 2) + ':' + vr.substr(10);
    campo.value = campo.value.substr(0, 16);
    MovimentaCursor(campo, xPos);
}

function formataInteiro(campo, evt) {
    xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    campo.value = filtraNumeros(filtraCampo(campo));
    MovimentaCursor(campo, xPos);
}

function formataHora(campo, evt) {
    xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    if (tam == 2) campo.value = vr.substr(0, 2) + ':';
    if (tam > 2 && tam < 5) campo.value = vr.substr(0, 2) + ':' + vr.substr(2);
    MovimentaCursor(campo, xPos);
}

function filtraCampo(campo) {
    var s = "";
    var cp = "";
    vr = campo.value;
    tam = vr.length;
    for (i = 0; i < tam; i++) {
        if (vr.substring(i, i + 1) != "/" && vr.substring(i, i + 1) != "-" && vr.substring(i, i + 1) != "." && vr.substring(i, i + 1) != "(" && vr.substring(i, i + 1) != ")" && vr.substring(i, i + 1) != ":" && vr.substring(i, i + 1) != ",") {
            s = s + vr.substring(i, i + 1);
        }
    }
    return s;
}

function filtraNumeros(campo) {
    var s = "";
    var cp = "";
    vr = campo;
    tam = vr.length;
    for (i = 0; i < tam; i++) {
        if (vr.substring(i, i + 1) == "0" || vr.substring(i, i + 1) == "1" || vr.substring(i, i + 1) == "2" || vr.substring(i, i + 1) == "3" || vr.substring(i, i + 1) == "4" || vr.substring(i, i + 1) == "5" || vr.substring(i, i + 1) == "6" || vr.substring(i, i + 1) == "7" || vr.substring(i, i + 1) == "8" || vr.substring(i, i + 1) == "9") {
            s = s + vr.substring(i, i + 1);
        }
    }
    return s;
}

function filtraCaracteres(campo) {
    vr = campo;
    for (i = 0; i < tam; i++) {
        if (vr.charCodeAt(i) != 32 && vr.charCodeAt(i) != 94 && (vr.charCodeAt(i) < 65 || (vr.charCodeAt(i) > 90 && vr.charCodeAt(i) < 96) || vr.charCodeAt(i) > 122) && vr.charCodeAt(i) < 192) {
            vr = vr.replace(vr.substr(i, 1), "");
        }
    }
    return vr;
}

function filtraNumerosComVirgula(campo) {
    var s = "";
    var cp = "";
    vr = campo;
    tam = vr.length;
    var complemento = 0;
    for (i = 0; i < tam; i++) {
        if ((vr.substring(i, i + 1) == "," && complemento == 0 && s != "") || vr.substring(i, i + 1) == "0" || vr.substring(i, i + 1) == "1" || vr.substring(i, i + 1) == "2" || vr.substring(i, i + 1) == "3" || vr.substring(i, i + 1) == "4" || vr.substring(i, i + 1) == "5" || vr.substring(i, i + 1) == "6" || vr.substring(i, i + 1) == "7" || vr.substring(i, i + 1) == "8" || vr.substring(i, i + 1) == "9") {
            if (vr.substring(i, i + 1) == ",") complemento = complemento + 1;
            s = s + vr.substring(i, i + 1);
        }
    }
    return s;
}

function formataMesAno(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    tam = vr.length;
    if (tam >= 2) campo.value = vr.substr(0, 2) + '/' + vr.substr(2);
    MovimentaCursor(campo, xPos);
}

function formataCNPJ(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    tam = vr.length;
    if (tam >= 2 && tam < 5) campo.value = vr.substr(0, 2) + '.' + vr.substr(2);
    else if (tam >= 5 && tam < 8) campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 3) + '.' + vr.substr(5);
    else if (tam >= 8 && tam < 12) campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 3) + '.' + vr.substr(5, 3) + '/' + vr.substr(8);
    else if (tam >= 12) campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 3) + '.' + vr.substr(5, 3) + '/' + vr.substr(8, 4) + '-' + vr.substr(12);
    MovimentaCursor(campo, xPos);
}

function formataCPF(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    tam = vr.length;
    if (tam >= 3 && tam < 6) campo.value = vr.substr(0, 3) + '.' + vr.substr(3);
    else if (tam >= 6 && tam < 9) campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(6);
    else if (tam >= 9) campo.value = vr.substr(0, 3) + '.' + vr.substr(3, 3) + '.' + vr.substr(6, 3) + '-' + vr.substr(9);
    MovimentaCursor(campo, xPos);
}

function formataRG(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraCampo(campo);
    tam = vr.length;
    if (tam >= 2 && tam < 5) campo.value = vr.substr(0, 2) + '.' + vr.substr(2);
    else if (tam >= 5 && tam < 8) campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 3) + '.' + vr.substr(5);
    else if (tam >= 8) campo.value = vr.substr(0, 2) + '.' + vr.substr(2, 3) + '.' + vr.substr(5, 3) + '-' + vr.substr(8);
    MovimentaCursor(campo, xPos);
}

function formataDouble(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    campo.value = filtraNumerosComVirgula(campo.value);
    MovimentaCursor(campo, xPos);
}

function formataTelefone(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    tam = vr.length;
    if (tam == 1) campo.value = '(' + vr;
    else if (tam >= 2 && tam < 6) campo.value = '(' + vr.substr(0, 2) + ') ' + vr.substr(2);
    else if (tam >= 6) campo.value = '(' + vr.substr(0, 2) + ') ' + vr.substr(2, 4) + '-' + vr.substr(6);
    MovimentaCursor(campo, xPos);
}

function formataTexto(campo, evt, sMascara) {
    evt = getEvent(evt);
    xPos = PosicaoCursor(campo);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraCaracteres(filtraCampo(campo));
    tam = vr.length;
    if (sMascara == "Aa" || sMascara == "Xx") {
        var valor = campo.value.toLowerCase();
        var count = campo.value.split(" ").length - 1;
        var i;
        var pos = 0;
        var valorIni;
        var valorMei;
        var valorFim;
        valor = valor.substring(0, 1).toUpperCase() + valor.substring(1, valor.length);
        for (i = 0; i < count; i++) {
            pos = valor.indexOf(" ", pos + 1);
            valorIni = valor.substring(0, valor.indexOf(" ", pos - 1)) + " ";
            valorMei = valor.substring(valor.indexOf(" ", pos) + 1, valor.indexOf(" ", pos) + 2).toUpperCase();
            valorFim = valor.substring(valor.indexOf(" ", pos) + 2, valor.length);
            valor = valorIni + valorMei + valorFim;
        }
        campo.value = valor;
    }
    if (sMascara == "Aaa" || sMascara == "Xxx") {
        var valor = campo.value.toLowerCase();
        var count = campo.value.split(" ").length - 1;
        var i;
        var pos = 0;
        var valorIni;
        var valorMei;
        var valorFim;
        var ligacao = false;
        var chrLigacao = Array("de", "da", "do", "para", "e");
        valor = valor.substring(0, 1).toUpperCase() + valor.substring(1, valor.length);
        for (i = 0; i < count; i++) {
            ligacao = false;
            pos = valor.indexOf(" ", pos + 1);
            valorIni = valor.substring(0, valor.indexOf(" ", pos - 1)) + " ";
            for (var a = 0; a < chrLigacao.length; a++) {
                if (valor.substring(valorIni.length, valor.indexOf(" ", valorIni.length)).toLowerCase() == chrLigacao[a].toLowerCase()) {
                    ligacao = true;
                    break;
                } else if (ligacao == false && valor.indexOf(" ", valorIni.length) == -1) {
                    if (valor.substring(valorIni.length, valor.length).toLowerCase() == chrLigacao[a].toLowerCase()) {
                        ligacao = true;
                        break;
                    }
                }
            }
            if (ligacao == true) {
                valorMei = valor.substring(valor.indexOf(" ", pos) + 1, valor.indexOf(" ", pos) + 2).toLowerCase();
            } else {
                valorMei = valor.substring(valor.indexOf(" ", pos) + 1, valor.indexOf(" ", pos) + 2).toUpperCase();
            }
            valorFim = valor.substring(valor.indexOf(" ", pos) + 2, valor.length);
            valor = valorIni + valorMei + valorFim;
        }
        campo.value = valor;
    }
    MovimentaCursor(campo, xPos);
    return true;
}

function formataCEP(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    vr = campo.value = filtraNumeros(filtraCampo(campo));
    tam = vr.length;
    if (tam < 5) campo.value = vr;
    else if (tam == 5) campo.value = vr + '-';
    else if (tam > 5) campo.value = vr.substr(0, 5) + '-' + vr.substr(5);
    MovimentaCursor(campo, xPos);
}

function formataCartaoCredito(campo, evt) {
    var xPos = PosicaoCursor(campo);
    evt = getEvent(evt);
    var tecla = getKeyCode(evt);
    if (!teclaValida(tecla)) return;
    var vr = campo.value = filtraNumeros(filtraCampo(campo));
    var tammax = 16;
    var tam = vr.length;
    if (tam < tammax && tecla != 8) {
        tam = vr.length + 1;
    }
    if (tam < 5) {
        campo.value = vr;
    }
    if ((tam > 4) && (tam < 9)) {
        campo.value = vr.substr(0, 4) + '.' + vr.substr(4, tam - 4);
    }
    if ((tam > 8) && (tam < 13)) {
        campo.value = vr.substr(0, 4) + '.' + vr.substr(4, 4) + '.' + vr.substr(8, tam - 4);
    }
    if (tam > 12) {
        campo.value = vr.substr(0, 4) + '.' + vr.substr(4, 4) + '.' + vr.substr(8, 4) + '.' + vr.substr(12, tam - 4);
    }
    MovimentaCursor(campo, xPos);
}

function teclaValida(tecla) {
    if (tecla == 8 || tecla == 9 || tecla == 27 || tecla == 16 || tecla == 45 || tecla == 46 || tecla == 35 || tecla == 36 || tecla == 37 || tecla == 38 || tecla == 39 || tecla == 40) return false;
    else return true;
}

function getEvent(evt) {
    if (!evt) evt = window.event;
    return evt;
}

function getKeyCode(evt) {
    var code;
    if (typeof(evt.keyCode) == 'number') code = evt.keyCode;
    else if (typeof(evt.which) == 'number') code = evt.which;
    else if (typeof(evt.charCode) == 'number') code = evt.charCode;
    else return 0;
    return code;
}

// Máscara em ASP.NET com JavaScript http: //www.devmedia.com.br/mascara-em-asp-net-com-javascript/10252#ixzz3ZNvD3XqX