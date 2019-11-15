/* Funções de controle da página e associação de eventos */
var debug = true;
var descricaoSelecionadaServico = -1;
const MILISECONDS_PER_YEAR = 1000*60*60*24*365;

/* Evento de fim de carga do documento (onLoad): configura a página e define os eventos dos elementos */
window.addEventListener('load', function () {
    // atribui a função toggleServiceDescription para os serviços
    if (debug) console.log('Trabalhando eventos de serviços');
    let servicos = document.getElementsByClassName('lr-servico');
    if (servicos.length) {
        for(let index = 0; index < servicos.length; index++){
            if (debug)
                console.log('Adicionando evento de click para '+servicos[index].innerText)

            servicos[index].addEventListener('click', function() {
                toggleServiceDescription(servicos[index].nextElementSibling);
            });
        }
    }

    /* Tratamento do menu de navegação para rolagem da página */
    if (debug) console.log('Trabalhando evento de rolagem');
    window.addEventListener('scroll', toggleNavbarTopFix);

    /* Configuração dos links do menu mobile e do menu desktop */
    configuraLinksMenu();

    /* abertura e fechamento do menu mobile */
    this.document.getElementById('btnAbrirMenuMobile').addEventListener('click', toggleMenuMobile);
    this.document.getElementById('btnFecharMenuMobile').addEventListener('click', toggleMenuMobile);

    /* Calcula o ano atual e quantos anos de existência a oficina tem */
    let dataAtual = new Date();
    let dataInicio = new Date('09/26/2009');
    let anosExistencia = parseInt((dataAtual.getTime() - dataInicio.getTime())/MILISECONDS_PER_YEAR);
    this.document.getElementById('idadeOficina').innerText = anosExistencia;
    this.document.getElementById('anoAtual').innerText = dataAtual.getFullYear();
});


/* Função auxiliar para tratamento do click nas descrições dos serviços */
function toggleServiceDescription(elemento)
{
    if (debug) console.log('toggleServiceDescription: '+elemento.innerText);

    // exibe apenas uma descrição por vez
    let Servicos = Array.from(document.getElementsByClassName('lr-servico'));
    if (descricaoSelecionadaServico != Servicos.indexOf(elemento.previousElementSibling) && descricaoSelecionadaServico != -1)
        Servicos[descricaoSelecionadaServico].nextElementSibling.classList.add('w3-hide');

    descricaoSelecionadaServico = Servicos.indexOf(elemento.previousElementSibling);

    if(elemento != null && elemento.tagName == 'SECTION') {
        elemento.classList.toggle('w3-hide');
    }
}

/* Função que trata da fixação do menu quando a barra de rolagem começa a descer
e a desfixação quando ela sobe inteira */
function toggleNavbarTopFix()
{
    let navbar = document.querySelector('header');
    if (!navbar.classList.contains('w3-top') && window.scrollY > 0)
        navbar.classList.add('w3-top');
    else if (window.scrollY == 0 && navbar.classList.contains('w3-top'))
        navbar.classList.remove('w3-top');
}

/* abre e fecha o menu mobile */
function toggleMenuMobile()
{
    document.querySelector('div').classList.toggle('w3-show');
}

/* configura os links dos menus mobile e desktop */
function configuraLinksMenu()
{
    let menuLinks = document.getElementsByClassName('lr-menu-item');
    if(menuLinks.length) {
        for(let index = 0; index < menuLinks.length; index++) {
            if(menuLinks[index].parentElement.tagName == 'LI')
                menuLinks[index].addEventListener('click', function() {mobileMenuClick(menuLinks[index])});
            else
                menuLinks[index].addEventListener('click', function() {menuClick(menuLinks[index])});
        }
    }
}

function mobileMenuClick(section)
{
    toggleMenuMobile();
    moveScrollTo(section.getAttribute('secao'), true)
}

function menuClick(section) {
    moveScrollTo(section.getAttribute('secao'));
}

function moveScrollTo(elementID, mobile = false)
{
    let elemento = document.getElementById(elementID);
    let navegacao = document.querySelector('header');
    if (elemento) {
        let yNewPosition = 0;

        if(window.innerHeight < elemento.offsetTop) {
            mobile ? yNewPosition = Math.abs(elemento.offsetTop - navegacao.offsetHeight) : yNewPosition = elemento.offsetTop - 120;
        } else {
            if (mobile)
                yNewPosition = Math.abs(elemento.offsetTop - navegacao.offsetHeight);
            else
                yNewPosition = elemento.offsetTop - elemento.offsetHeight/2;
        }

        /* window.scrollTo(window.scrollX, yNewPosition); */
        window.scroll({
            top: yNewPosition,
            left: window.scrollX,
            behavior: 'smooth'
        })
    }
}