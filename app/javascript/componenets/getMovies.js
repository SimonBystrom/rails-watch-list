import { API_KEY } from '../../../movieApi'

export async function getSearchResults(searchTarget){


    let results = await fetch(`https://api.themoviedb.org/3/search/movie?api_key=${API_KEY}&language=$EN&query=
    ${searchTarget}&page=1&include_adult=false`).then(res => res.json())


    return results
}
