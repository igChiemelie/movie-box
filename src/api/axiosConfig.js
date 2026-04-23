import axios from 'axios';

export default axios.create({
    baseURL:'http://3.233.222.9:8080',
    headers: {
        'Content-Type': 'application/json',
    },
});