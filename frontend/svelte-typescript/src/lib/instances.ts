import axios from 'axios';

export const AxiosJson = axios.create({
    headers: {
        'Content-Type': 'application/json'
    }
});

