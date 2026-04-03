import axios from 'axios';

export default axios.create({
    baseURL:'http://3.210.198.79:8080',
    headers: {
        'Content-Type': 'application/json',
    },
});