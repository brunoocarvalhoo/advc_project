// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

document.addEventListener("DOMContentLoaded", function () {
    const themeToggle = document.getElementById("bd-theme");
    const themeDropdown = document.querySelector(".dropdown-menu");

    // Função para alternar o tema
    function toggleTheme(theme) {
        document.body.dataset.bsTheme = theme;
        // Você pode adicionar outras ações relacionadas ao tema aqui, se necessário.
    }

    // Manipula os cliques nos itens do dropdown
    themeDropdown.addEventListener("click", (event) => {
        if (event.target.dataset.bsThemeValue) {
            const selectedTheme = event.target.dataset.bsThemeValue;
            toggleTheme(selectedTheme);

            // Atualiza o ícone do botão do dropdown
            const themeIconActive = document.querySelector(".theme-icon-active");
            themeIconActive.innerHTML = event.target.querySelector("svg").outerHTML;

            // Fecha o dropdown
            themeToggle.setAttribute("aria-expanded", "false");
            themeToggle.blur();
        }
    });
});
