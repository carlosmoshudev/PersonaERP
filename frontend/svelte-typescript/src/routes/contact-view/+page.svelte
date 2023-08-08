<script lang="ts">
	import { onMount } from "svelte";
    import { AxiosJson } from "$lib/instances";
    import type { Person } from "$lib/types";

    const api_url = "https://your-api-url.com/"

    let people: Person[] = [];
    onMount(async () => {
        const { data } = await AxiosJson.get(api_url + "people")
        people = data;
    });
</script>

<article id="contact-view">
    <h1>Ver Contactos</h1>
    <p>Esta es la página de ver contactos</p>
    <ul>
        {#each people as person}
            <li>
                <p>{person.name + " " + person.lastname}</p>
            </li>
        {/each}
    </ul>
</article>

<style lang="css" scoped>
    
        article {
            padding: 1em;
        }
    
        article#contact-view {
            background-image: linear-gradient(to right, #d79e5dd7, #b53765d7);
            color: #a7d129;
            border-radius: 0.5em;
            filter: drop-shadow(0em 0.4em 0.3em #312f075b);
            min-height: 75vh;
        }
    
        article#contact-view h1 {
            font-family: 'Roboto', sans-serif;
            font-size: 2.5em;
            color: #391313;
        }
    
        article#contact-view p {
            font-family: 'Roboto', sans-serif;
            font-size: 1.5em;
            color: #2d0606ee;
        }
</style>
