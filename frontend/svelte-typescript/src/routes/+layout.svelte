<script lang="ts">
    const pages = [
        { name: 'Inicio', path: '/' },
        { name: 'Ver Contactos', path: '/contact-view' },
        { name: 'Añadir Contacto', path: '/add-contact' }
    ];
</script>

<nav>
    <ul>
        {#each pages as page}
            <li>
                <a href="{page.path}">{page.name}</a>
            </li>
        {/each}
    </ul>
</nav>

<main>
    <slot></slot>
</main>

<style lang="css" scoped>
    nav {
        background-image: linear-gradient(to right, #3a1f00, #390719);
        color: #fff;
        padding: 1em;
        border-radius: 0.5em;
        filter: drop-shadow(0em 0.4em 0.3em #33333385);
    }

    nav ul {
        display: flex;
        justify-content: space-between;
        list-style: none;
        padding: 0 1em;
        margin: 0;
    }

    nav ul li {
        padding: 0.2em 0.5em;
    }

    nav ul li a {
        font-family: 'Roboto', sans-serif;
        font-size: 1em;
        color: #ffd9d9ee;
        text-decoration: none;
    }

    nav ul li a:hover {
        text-decoration: underline;
    }

    main {
        padding: 1em;
    }
</style>
